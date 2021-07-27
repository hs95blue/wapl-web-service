<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  <c:import url="./layout/header.jsp"></c:import>
  <c:import url="./layout/top.jsp"></c:import>
  
  
  
   <!-- 와플인 -->
  <section class="section" id="member">
    <div class="section__container">
      <h2>와플인 <span style="font-size:20px;">WAPL Members</span></h2>
      <div class="member__list">
		 <c:forEach items="${memberList}" varStatus=""  var="member">
		 	<div class="member__description">
          <div class="member__description__top">
            
            <img src="${contextPath}/resources/image/favicon.png" alt="" class="profile">
            <div class="member_id">
              <div class="level">Lv.${member.memLevel}</div>
              <a href="#">${member.nickname}</a>
            </div>
          </div>
          
          <div class="member__description__bottom">
            <ul>
              <li class="position"><span class="main_char">본캐: ${member.position1}</span><span>${member.position1Level}</span></li>
              <li class="position"><span class="sub_char">부캐: ${member.position2}</span><span>${member.position2Level}</span></li>
            </ul>
            <span class="current_proj">진행중인 프로젝트가 ${member.size}개 있습니다.</span>
            <button class="heart">♡</button>
          </div>
        </div>
		 </c:forEach>
        </div>
        
      </div>
      
      <button class="member__button">더 많은 와플인보기</button>
  </section>
  <!-- 와플인 End-->
  
  
  
  
  <c:import url="layout/footer.jsp"></c:import>
</html>
  