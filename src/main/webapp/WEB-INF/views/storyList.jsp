<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  <c:import url="./layout/header.jsp"></c:import>
  <c:import url="./layout/top.jsp"></c:import>
  
  
  
  <!-- 스토리 -->
  <section class="section" id="story">
   <div class="section__container">
    <h2>와플 이야기  <span style="font-size:20px;">WAPL Story</span> </h2>
  
    <div class="story__boardList">
     <c:forEach items="${storyList}" varStatus=""  var="story">
     	 <a href="" class="story" target="blank" data-type="front-end">
        <img
          src="${contextPath}/resources/image/${story.thumnail}"
          alt="Youtube"
          class="project__img"
        />
        <div class="story__description__title">
          <h3> ${story.title}</h3>
        </div>
        <div class="story__description__content">
          <span>${story.content}</span>
        </div>
      </a>
     </c:forEach>
    </div>
   <!--  <button class="story__button">더 많은 스토리보기</button> -->
   </div>
  </section>
   <!-- 스토리 End-->
  
  
  
  <c:import url="layout/footer.jsp"></c:import>
</html>
  