<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="userPath" value="${ pageContext.request.requestURL}"/>
<script type="text/javascript">
function goPage(url){
	if(url == 'member/logout'){
		var isTrue = confirm("로그아웃하시겠습니까?");
		if(isTrue){
			 location.href =window.location.protocol+"//"+window.location.host+"/app/" + url; 
		}
	}else{
	 location.href =window.location.protocol+"//"+window.location.host+"/app/" + url; 
	}
	//alert("!!!");
 }
 function goBackPage(){
	 history.back();
 }
window.onload = function(){
	let pathname = window.location.pathname;
	pathname = pathname.replace("/app/","");
	if(pathname.indexOf('board') != -1){
		document.querySelector('#projectList').className += "active";
	}else if(pathname.indexOf('story') != -1){
		document.querySelector('#storyList').className += "active";
	}else if(pathname.indexOf('member') != -1){
		document.querySelector('#memberList').className += "active";
	}else if(pathname.indexOf('lounge') != -1){
		document.querySelector('#lounge').className += "active";
	}else{
		document.querySelector("#"+pathname).className += "active";
	}
}
</script>
	 <!-- nav bar -->
  <nav id="navbar">
    <div class="navbar__logo">
      <i class="WAPL">
        <img src="${contextPath}/resources/image/logo4.png" onclick="goPage('home')" alt="" id="logo" style="cursor:pointer">
      </i>
    </div>
    <div class="navbar__menu">
      <ul class="navbar__menu">
        <li id="memberList" class="navbar__menu__item " onclick="goPage('memberList')">와플인</li>
        <li id="projectList" class="navbar__menu__item " onclick="goPage('projectList')">프로젝트</li>
        <li id="storyList" class="navbar__menu__item " onclick="goPage('storyList')">스토리</li>
        <li id="lounge" class="navbar__menu__item " onclick="goPage('lounge')">라운지</li>
      </ul>
      <div class="login_logout">
      	<c:if test="${sessionScope.memId eq null}">
	        <button class="login" onclick="goPage('member/login')">login</button>
    	    <button class="join" onclick="goPage('member/join')">join</button>
      	</c:if>
      	<c:if test="${sessionScope.memId ne null}">
	        <button class="logout" onclick="goPage('member/logout')">logout</button>
      	</c:if>
      </div>
      <!-- Toggle button -->
      <button class="navbar__toggle-btn">
        <i class="fas fa-bars"></i>
      </button>

    </div>
  </nav>
  <section class="about" id="about">
    <div class="about__img">
    </div>
  </section>
  <!-- navbar End -->