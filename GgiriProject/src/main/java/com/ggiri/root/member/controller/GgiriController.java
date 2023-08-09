package com.ggiri.root.member.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ggiri.root.google.service.GoogleService;
import com.ggiri.root.kakao.service.KakaoService;
import com.ggiri.root.member.dto.GgiriFreeInsertDTO;
import com.ggiri.root.member.dto.GgiriMemberDTO;
import com.ggiri.root.member.service.GgiriFreeInsertService;
import com.ggiri.root.member.service.GgiriService;
import com.ggiri.root.member.service.MailSendService;
import com.ggiri.root.member.service.SystemUtil;
import com.ggiri.root.mybatis.member.GgiriFreeInsertMapper;
import com.ggiri.root.naver.service.NaverServiceImpl;
import com.ggiri.root.project.dto.GgiriBoardLikeDTO;
import com.ggiri.root.session.login.GgiriMemberSession;
import com.github.scribejava.core.model.OAuth2AccessToken;


@Controller
@RequestMapping("ggiriMember")
public class GgiriController implements GgiriMemberSession {
	
	//준호
	private NaverServiceImpl naverLogin;
	private String naverApiResult = null;
	@Autowired
	private void setNaverLogin(NaverServiceImpl naverLogin) {
		this.naverLogin = naverLogin;
	}
	
	@Autowired
	private GgiriService gs;
	@Autowired
	private KakaoService kakaoService;
	@Autowired
	private GoogleService googleService;
	@Autowired
	private MailSendService mss;
	
	
	// 안태준
	@Autowired
	private GgiriFreeInsertService gfs;
	@Autowired
	private GgiriFreeInsertMapper gfi;
	
	
	@GetMapping("/indexAdmin")
	public String indexAdmin() {
		return "indexAdmin";
	}
	
	@GetMapping("ggiriLogin")
	public String login() {
		return "ggiriMember/ggiriLogin";
	}
	
	@GetMapping("findIdPwd")
	public String findIdPwd() {
		return "ggiriMember/findIdPwd";
	}
	
	@GetMapping("signup_free")
	public String signupFree() {
		return "ggiriMember/signup_free";
	}
	
	@PostMapping("login_check")
	public String loginCheck(HttpServletRequest request, RedirectAttributes ra) {
		int result = gs.loginCheck(request);
		if(result == 0) {
			ra.addAttribute("id", request.getParameter("id"));
			return "redirect:successLogin";
		} 
		return "redirect:failLogin";
	}
	
	@RequestMapping("failLogin")
	public String failLogin() {
		return "ggiriMember/failLogin";
	}
	
	@RequestMapping("successLogin")
	public String successLogin(@RequestParam("id") String id, HttpSession session) {
		session.setAttribute(LOGIN, id);
		return "ggiriMember/successLogin";
	}
	
	@GetMapping("ggiriLogout")
	public String logout(HttpSession session) {
		if(session.getAttribute("loginUser") != null) {
			session.invalidate();
		}
		return "ggiriMember/ggiriLogout";
	}
	
	@GetMapping("memberWithdraw")
	@ResponseBody
	public String memberWithdraw(@RequestParam("withdrawId") String id, HttpSession session) {
		gs.memberWithdraw(id);
		session.invalidate();
		return "OK";
	}
	
	@RequestMapping("register")
	public String register(GgiriMemberDTO member) {
		int result = gs.register(member);
		if(result == 1)
			return "redirect:ggiriLogin";
		return "redirect:signup_free";
	}
	
	@RequestMapping("kakao_callback")
	public String redirectkakao(@RequestParam("code") String code, HttpSession session) throws IOException{
		System.out.println(code);
		
		String kakaoToken = kakaoService.getReturnAccessToken(code);
		System.out.println("controller access_token : " + kakaoToken);
		
		Map<String, Object> result = kakaoService.getUserInfo(kakaoToken);
		System.out.println("컨트롤러 출력 : " + result.get("id"));
		System.out.println("컨트롤러 출력 : " + result.get("email"));
		System.out.println("컨트롤러 출력 : " + result.get("nickname"));
//		System.out.println("컨트롤러 출력 : " + result.getKakaoEmail());
//		System.out.println("컨트롤러 출력 : " + result.getKakaoNickname());
//		SessionConfigVO configVO = new SessionConfigVO();
		
		GgiriMemberDTO ggiriMember = new GgiriMemberDTO();
		
		String id = (String)result.get("id");
		String email = (String)result.get("email");
		String name = (String)result.get("nickname");
		
//		int index = email.indexOf("@");
//		String id = email.substring(0, index);
		
		
		ggiriMember.setName(name);
		ggiriMember.setId(id);
		ggiriMember.setEmail(email);
		
		
		int findKakao = gs.findKakao(id);
		if(findKakao == 0) {
			gs.kakaoinsert(ggiriMember);
		}
		
		session.setAttribute("kakaoMember", ggiriMember);
		session.setAttribute("kakaoToken", kakaoToken);
		
		return "redirect:/index";
	}
	
	@RequestMapping("kakaoLogout")
	public String kakaoLogout(HttpSession session) throws Exception {
		if(SystemUtil.EmptyCheck((String)session.getAttribute("kakaoToken"))) {
		} else {
			kakaoService.getLogout((String)session.getAttribute("kakaoToken"));
		}
		
		session.setAttribute("kakaoMember", null);
		
		return "ggiriMember/kakaoLogout";
	}
	
	
	@RequestMapping("naver_login")
	public String naverLogin(Model model, HttpSession session) {
		String naverAuthUrl = naverLogin.getAuthorizationUrl(session);
		System.out.println("네이버 : " + naverAuthUrl);
		model.addAttribute("urlNaver", naverAuthUrl);
		return "redirect:" + naverAuthUrl.toString();
		
	}
	
	@RequestMapping("naver_callback")
	public String naverCallback(@RequestParam String code, @RequestParam String state, HttpSession session) throws Exception{
		
		System.out.println("네이버 로그인 성공 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLogin.getAccessToken(session, code, state);
		naverApiResult = naverLogin.getUserProfile(oauthToken);
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject;
		
		jsonObject = (JSONObject)jsonParser.parse(naverApiResult);
		JSONObject responseObj = (JSONObject)jsonObject.get("response");
		
		String id = (String) responseObj.get("id");
		String email = (String) responseObj.get("email");
		String name = (String) responseObj.get("name");
		String gender = (String) responseObj.get("gender");
		String mobile = (String) responseObj.get("mobile");
		String birthday = (String) responseObj.get("birthday");
		
		System.out.println("id : " + id);
		System.out.println("email : " + email);
		System.out.println("name : " + name);
		System.out.println("gender : " + gender);
		System.out.println("mobile : " + mobile);
		System.out.println("birthday : " + birthday);
		System.out.println("naverApiResult : " + (String)naverApiResult);
		
//		int index = email.indexOf("@");
//		String id = email.substring(0, index);
		
		GgiriMemberDTO naverMember = new GgiriMemberDTO();
		naverMember.setName(name);
		naverMember.setId(id);
		naverMember.setEmail(email);
		naverMember.setGender(gender);
		naverMember.setTel(mobile);
		naverMember.setBirth(birthday);
		
		int findNaver = gs.findNaver(id);
		if(findNaver == 0) {
			gs.naverInsert(naverMember);
		}
		
		
		session.setAttribute("signIn", naverApiResult);
		session.setAttribute("naverMember", naverMember);
		
		return "redirect:/index";
	}
	
	@RequestMapping("naverLogout")
	public String naverLogout(HttpSession session) throws Exception {
		if(SystemUtil.EmptyCheck((String)session.getAttribute("signIn"))) {
		} else {
			session.setAttribute("signIn", null);
		}
		
		session.setAttribute("naverMember", null);
		
		return "ggiriMember/naverLogout";
	}
	
	@RequestMapping("google_callback")
	public String googleLogin(@RequestParam("code") String code, HttpSession session) {
		System.out.println(code);
		
    	String googleBaseURL = "https://accounts.google.com/o/oauth2/v2/auth";
		String googleClientId = "15714476982-d6tnk6tv8f7hptqjh6qrhqsm42aglq72.apps.googleusercontent.com";
		String googleClientSecret = "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";
		String googleRedirectURL = "http://localhost:8080/root/ggiriMember/google_callback";
		String googleTokenURL = "https://oauth2.googleapis.com/token";
		String resultTokenURL = "https://oauth2.googleapis.com/tokeninfo";
		
		String access_token = googleService.getReturnAccessToken(code);
		
		Map<String, Object> result = googleService.getUserInfo(access_token);
		System.out.println("컨트롤러 출력 : " + result.get("email"));
		System.out.println("컨트롤러 출력 : " + result.get("name"));
		System.out.println("컨트롤러 출력 : " + result.get("id"));
		
		GgiriMemberDTO ggiriMember = new GgiriMemberDTO();
		
		String name = (String)result.get("name");
		String id = (String)result.get("id");
		String email = (String)result.get("email");
		//String name = (String)result.get("nickname");
		
		String idChk = id.substring(1, id.length()-1);
		String nameChk = name.substring(1, name.length()-1);
		String emailChk = email.substring(1, email.length()-1);
		
		System.out.println(idChk);
		System.out.println(nameChk);
		System.out.println(emailChk);
		ggiriMember.setName(nameChk);
		ggiriMember.setId(idChk);
		ggiriMember.setEmail(emailChk);
		
		int findGoogle = gs.findGoogle(idChk);
		if(findGoogle == 0) {
			gs.googleinsert(ggiriMember);
		}
		
		session.setAttribute("googleMember", ggiriMember);
		session.setAttribute("googleToken", access_token);
		
		return "redirect:/index";

	}
	
	@RequestMapping("googleLogout")
	public String googleLogout(HttpSession session) throws Exception {
		if(SystemUtil.EmptyCheck((String)session.getAttribute("googleToken"))) {
		} else {
			session.setAttribute("googleToken", null);
		}
		
		session.setAttribute("googleMember", null);
		
		return "ggiriMember/googleLogout";
	}
	
	@RequestMapping("myInfo")
	public String ggiriMemberInfo(HttpSession session, Model model) {
			String loginUser = (String)session.getAttribute(LOGIN);
			gs.ggiriMemberInfo(loginUser, model);
		return "ggiriMember/myInfo";
	}
	
	
	@RequestMapping("snsInfo")
	public String ggiriSnsInfo(HttpSession session, Model model) {
		if(session.getAttribute("kakaoMember") != null) {
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("kakaoMember");
			gs.ggiriSnsInfo(dto.getId(), model);
			return "ggiriMember/snsInfo";
		} else if(session.getAttribute("naverMember") != null) {
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("naverMember");
			gs.ggiriSnsInfo(dto.getId(), model);
			return "ggiriMember/snsInfo";
		} else if(session.getAttribute("googleMember") != null) {
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("googleMember");
			String id = dto.getId();
			System.out.println(id);
			gs.ggiriSnsInfo(dto.getId(), model);
			return "ggiriMember/snsInfo";
		}
		return "ggiriMember/snsInfo";
	}
	
	@RequestMapping("modifyMyInfo")
	public String modifyMyInfo(HttpSession session, Model model) {
		String id = (String)session.getAttribute(LOGIN);
		gs.ggiriMemberInfo(id, model);
		return "ggiriMember/modifyMyInfo";
	}
	
	@RequestMapping("modifySnsInfo")
	public String modifySnsInfo(HttpSession session, Model model) {
		if(session.getAttribute("kakaoMember") != null) {
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("kakaoMember");
			gs.ggiriSnsInfo(dto.getId(), model);
			return "ggiriMember/modifySnsInfo";
		} else if(session.getAttribute("naverMember") != null) {
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("naverMember");
			String id = dto.getId();
			System.out.println(id);
			gs.ggiriSnsInfo(dto.getId(), model);
			return "ggiriMember/modifySnsInfo";
		} else if(session.getAttribute("googleMember") != null) {
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("googleMember");
			gs.ggiriSnsInfo(dto.getId(), model);
			return "ggiriMember/modifySnsInfo";
		}
		return "ggiriMember/modifySnsInfo";
	}
	
	@RequestMapping("modifyResult")
	public String modifyResult(GgiriMemberDTO member) {
		int result = gs.modifyResult(member);
		if(result == 1)
			return "redirect:/index";
		return "redirect:modifyMyInfo";
	}
	
	@PostMapping("IdCheck")
	@ResponseBody
	public int nameCheck(@RequestParam("id") String id) {
		return gs.idCheck(id);
	}
	
	@GetMapping("telCheck")
	@ResponseBody
	public int userTelChk(@RequestParam("tel") String userTel) {
		return gs.joinPhone(userTel);
	}
	
	@GetMapping("mailCheck")
	@ResponseBody
	public String mailCheck(@RequestParam("email") String userEmail) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + userEmail);
		return mss.joinEmail(userEmail);
	}

	@GetMapping("ajaxMemberList")
	@ResponseBody
	public List<GgiriFreeInsertDTO> ajaxMemberList(){
		return gfs.ajaxMemberList();
	}
	

	// 안태준 
	@GetMapping("memberList")
	public String AllList(Model model, HttpServletRequest request, HttpSession session) {
//		final int PAGE_ROW_COUNT = 4;
//		
//		int pageNum = 1;
//		
//		String strPageNum = request.getParameter("pageNum");
//		System.out.println(strPageNum);
//		if(strPageNum != null) {
//			pageNum = Integer.parseInt(strPageNum);
//		}
//		
//		int startRowNum = 0 + (pageNum - 1) * PAGE_ROW_COUNT;
//		int endRowNum = pageNum * PAGE_ROW_COUNT;
//		int rowCount = PAGE_ROW_COUNT;
//		
//		GgiriFreeInsertDTO pageDto = new GgiriFreeInsertDTO();
//		pageDto.setStartRowNum(startRowNum);
//		pageDto.setEndRowNum(endRowNum);
//		pageDto.setRowCount(rowCount);
//		
//		int totalRow = gfs.boardCount();
//		
//		int totalPageCount = (int)Math.ceil(totalRow / (double)PAGE_ROW_COUNT);
//		System.out.println(totalPageCount);
//		request.setAttribute("totalPageCount", totalPageCount);
//		request.setAttribute("totalRow", totalRow);
//		gfs.boardGetFirstList(model);
		gfs.boardAllList(model);
		return "ggiriMember/memberList";
	}
	
//	@GetMapping("ajaxMemberList")
//	@ResponseBody
//	public List<GgiriFreeInsertDTO> ajaxMemberList(Model model, HttpServletRequest request, HttpSession session) {
//		final int PAGE_ROW_COUNT = 4;
//		
//		int pageNum = 0;
//		
//		String strPageNum = request.getParameter("pageNum");
//		System.out.println(strPageNum);
//		if(strPageNum != null) {
//			pageNum = Integer.parseInt(strPageNum);
//		}
//		
//		int startRowNum = 0 + (pageNum - 1) * PAGE_ROW_COUNT;
//		int endRowNum = pageNum * PAGE_ROW_COUNT;
//		int rowCount = PAGE_ROW_COUNT;
//		
//		GgiriFreeInsertDTO pageDto = new GgiriFreeInsertDTO();
//		pageDto.setStartRowNum(startRowNum);
//		pageDto.setEndRowNum(endRowNum);
//		pageDto.setRowCount(rowCount);
//		
//		int totalRow = gfs.boardCount();
//		
//		int totalPageCount = (int)Math.ceil(totalRow / (double)PAGE_ROW_COUNT);
//		System.out.println(totalPageCount);
//		request.setAttribute("totalPageCount", totalPageCount);
//		request.setAttribute("pageNum", pageNum);
//		request.setAttribute("totalRow", totalRow);
//		return gfs.boardGetList(pageDto);
//	}
	
	@GetMapping("Info")
	public String MemberList(@RequestParam("id") String userid, Model model) {
		gfs.Info(userid ,model);
		//gfs.projectInfo(userid, model);
		return "ggiriMember/Info";
	}
//	@GetMapping(value="developer/{job}", produces="application/json; charset=utf-8")
	@GetMapping("selectJob")
	@ResponseBody
	public List<GgiriFreeInsertDTO> selectJob(@RequestParam("job") String job) {
//	public List<GgiriFreeInsertDTO> developer(@PathVariable String job, Model model){	

		return gfs.selectJob(job);
	}
	
	@GetMapping("writeFree")
	public String writeFree(HttpSession session, Model model) {
		if(session.getAttribute(LOGIN) != null) {
			String id = (String)session.getAttribute(LOGIN);
			gs.ggiriMemberInfo(id, model);
			return "ggiriMember/writeFree";
		} else if(session.getAttribute("kakaoMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("kakaoMember");
			gs.ggiriSnsInfo(dto.getId(), model);
			return "ggiriMember/writeFree";
		} else if(session.getAttribute("naverMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("naverMember");
			gs.ggiriSnsInfo(dto.getId(), model);
			return "ggiriMember/writeFree";
		} else if(session.getAttribute("googleMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("googleMember");
			gs.ggiriSnsInfo(dto.getId(), model);
			return "ggiriMember/writeFree";
		}
		return "ggiriMember/writeFree";
	}
	
	@GetMapping("writeFreeFail")
	public String writeFail() {
		return "ggiriMember/writeFreeFail";
	}
	
	@GetMapping("writeFreeSuccess")
	public String writeFreeSuccess() {
		return "ggiriMember/writeFreeSuccess";
	}
	
	@PostMapping("writeSave")
	public String writeSave(GgiriFreeInsertDTO dto){
		int result = gfs.writeSave(dto);
		if(result == 1) {
			return "redirect:writeFreeSuccess";
		}
		return "redirect:writeFreeFail";
	}
	
	@GetMapping("writeFreeModifyForm")
	public String writeFreeModifyForm(@RequestParam("id") String userid, Model model) {
		gfs.Info(userid, model);
		return "ggiriMember/writeFreeModifyForm";
	}
	@PostMapping("modify")
	public String modify(GgiriFreeInsertDTO dto) {
		int result = gfs.modify(dto);
		if(result == 1)
			return "redirect:modifySuccess";
		return "redirect:modifyFail";
	}
	@GetMapping("modifyFail")
	public String modifyFail() {
		return "ggiriMember/modifyFail";
	}
	@GetMapping("modifySuccess")
	public String modifySuccess() {
		return "ggiriMember/modifySuccess";
	}
	@GetMapping("writeFreeDelete")
	public String writeFreeDelete(@RequestParam("id") String userid) {
		gfs.writeFreeDelete(userid);
		return "ggiriMember/writeFreeDelete";
	}
	
	
	// 안태준 끝

	@PostMapping("findEmail")
	public String findEmail(@RequestParam("findEmail") String email) {
		GgiriMemberDTO dto = gs.findEmail(email);
		if(dto != null) {
			return mss.findEmail(dto);
		}
		return "ggiriMember/failEmail";
	}
	
	
}
