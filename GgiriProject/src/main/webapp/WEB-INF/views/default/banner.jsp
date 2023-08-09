<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>banner</title>
<style>
.mainSlideShow {
   width: 100%;
   height: 100%;
   margin-bottom: 20px;
}


.slides {
    padding: 0;
    width: 100%;
    height: 320px;
    display: block;
    margin: 0 auto;
    position: relative;
}

.slides input { display: none; }

.slide-container { display: block; }

.slide {
    top: 0;
    opacity: 0;
    width: 100%;
    height: 320px;
    display: block;
    position: absolute;
}

.slide img {
    width: 100%;
    height: 100%;
}

input:checked + .slide-container  .slide {
    opacity: 1;
    transition: 0.1s;
}

.nav-dots {
  width: 100%;
  bottom: 9px;
  height: 11px;
  display: block;
  position: absolute;
  text-align: center;
}

.nav-dots .nav-dot {
  top: -5px;
  width: 11px;
  height: 11px;
  margin: 0 4px;
  position: relative;
  border-radius: 100%;
  display: inline-block;
  background-color: rgba(0, 0, 0, 0.6);
}

.nav-dots .nav-dot:hover {
  cursor: pointer;
  background-color: rgba(0, 0, 0, 0.8);
}

.fade {
    animation-name: fade;
    animation-duration: 3s;
}

@keyframes fade {
    from {
        opacity: .4
    }
    to {
        opacity: 1
    }
}
</style>
<script type="text/javascript">

var slideIndex = 0;

window.onload = function(){
    showSlides();
 }

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("slide");
   
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > slides.length) {
        slideIndex = 1
    }
    slides[slideIndex - 1].style.display = "block";

    setTimeout(showSlides, 3000);
}
</script>
</head>
<body>
	<div class="mainSlideShow">
		<div class="slides">
		    <input type="radio" name="radio-btn" id="img-1" checked />
		    <div class="slide-container">
			    <div class="slide fade">
			      <img src="/root/resources/image/banner1.jpg" />
		        </div>
		    </div>
		
		    <input type="radio" name="radio-btn" id="img-2" />
		    <div class="slide-container">
		        <div class="slide fade">
		          <img src="/root/resources/image/banner2.jpg" />
		        </div>
		    </div>
		
		    <input type="radio" name="radio-btn" id="img-3" />
		    <div class="slide-container">
		        <div class="slide fade">
		          <img src="/root/resources/image/banner3.jpg" />
		        </div>
		    </div>
		</div>
	</div>
</body>
</html>