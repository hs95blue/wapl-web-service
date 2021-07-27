<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="userPath" value="${request.getRequestURL}"/>
<script type="text/javascript">
function goPage(url){
	 location.href =url; 
	//alert("!!!");
 }

</script>
	 <!-- nav bar -->
  <nav id="navbar">
    <div class="navbar__logo">
      <i class="WAPL">
        <img src="${contextPath}/resources/image/logo4.png" alt="" id="logo">
      </i>
    </div>
    <div class="navbar__menu">
      <ul class="navbar__menu">
        <li class="navbar__menu__item active" onclick="goPage('memberList')">와플인</li>
        <li class="navbar__menu__item" onclick="goPage('projectList')">프로젝트</li>
        <li class="navbar__menu__item" onclick="goPage('storyList')">스토리</li>
        <li class="navbar__menu__item" onclick="goPage('lounge')">라운지</li>
      </ul>
      <div class="login_logout">
        <button class="login">login</button>
        <button class="join">join</button>
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