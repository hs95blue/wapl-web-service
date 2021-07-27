<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  <c:import url="./layout/header.jsp"></c:import>
  <c:import url="./layout/top.jsp"></c:import>
  
  
  
  <!-- 모집중 프로젝트 리스트 -->
  <section class="section" id="projList">
  <div class="section__container">
    <h2>모집중인 프로젝트  <span style="font-size:20px;">Recruiting Project</span></h2>
    
    <div class="work__projects">
    <c:forEach items="${projList}" varStatus=""  var="proj"> 
   		 <a href="" class="project" target="blank" data-type="front-end">
	        <img
	          src="${contextPath}/resources/image/${proj.thumnail}"
	          alt="Youtube"
	          class="project__img"
	        />
	        <div class="project__description__content">
	          <span>${proj.content }</span>
	        </div>
	        <div class="re_project__description__title">
	          <h3>${proj.title}</h3>
	          <span class="recruiting">${proj.memCnt}/${proj.totMemCnt}</span>
	        </div>
	      </a>	
   
    </c:forEach>
     
    </div>
 <!--    <button class="story__button">더 많은 프로젝트 보기</button> -->
   </div>
  </section>
  <!-- 모집중 프로젝트 리스트 End-->
  
  
  
  <c:import url="layout/footer.jsp"></c:import>
</html>
  