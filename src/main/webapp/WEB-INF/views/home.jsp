<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

  <c:import url="./layout/header.jsp"></c:import>
  <c:import url="./layout/top.jsp"></c:import>
   <!-- 신규프로젝트 -->
   
   
  <section class="section" id="new">
    <div class="section__container">
      <h2>신규 프로젝트  <span style="font-size:20px;">New Project</span> </h2>
      
     
      <div class="work__projects">
      <c:forEach items="${newProjList}" varStatus=""  var="newProj"  begin="0" end="3"> 
      	 <a href="${contextPath}/board/boardInfo?bno=${newProj.bno}" class="project"  data-type="front-end">
          <img
            src="${contextPath}/resources/image/${newProj.thumnail}"
            alt="Youtube"
            class="project__img"
          />
          <div class="project__description__content">
            <span>${newProj.content}</span>
          </div>
          <div class="project__description__title">
            <h3>${newProj.title}</h3>
          </div>
        </a>
      
      </c:forEach>
      
      
      </div>
  </section>
  <!-- 신규프로젝트 End -->


  <!-- Section2 -->
  <section class="seperation1" id="seperation1">
  </section>


  <!-- 모집중 프로젝트 리스트 -->
  <section class="section" id="projList">
  <div class="section__container">
    <h2>모집중인 프로젝트  <span style="font-size:20px;">Recruiting Project</span></h2>
    
    <div class="work__projects">
    <c:forEach items="${projList}" varStatus=""  var="proj" begin="0" end="6"> 
   		 <a href="${contextPath}/board/boardInfo?bno=${proj.bno}" class="project"  data-type="front-end">
	        <img
	          src="${contextPath}/resources/image/${proj.thumnail}"
	          alt="Youtube"
	          class="project__img"
	        />
	        <div class="project__description__content">
	          <span>${proj.content }</span>
	        </div>
	        <div class="project__description__title">
	          <h3>${proj.title}</h3>
	          <span class="recruiting">모집:${proj.memCnt}/${proj.totMemCnt}</span>
	        </div>
	      </a>	
   
    </c:forEach>
     
    </div>
    <button class="story__button" onclick="goPage('projectList')">더 많은 프로젝트 보기</button>
   </div>
  </section>
  <!-- 모집중 프로젝트 리스트 End-->
  

  <!-- Section2 -->
  <section class="seperation2" id="seperation2" >
  </section>


  <!-- 스토리 -->
  <section class="section" id="story">
   <div class="section__container">
    <h2>와플 이야기  <span style="font-size:20px;">WAPL Story</span> </h2>
  
    <div class="story__boardList">
     <c:forEach items="${storyList}" varStatus=""  var="story"  begin="1" end="3">
     	 <a href="${contextPath}/story/storyInfo?bno=${story.bno}" class="story"  data-type="front-end">
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
    <button class="story__button" onclick="goPage('storyList')">더 많은 스토리보기</button>
   </div>
  </section>
   <!-- 스토리 End-->


  <!-- Section3 -->
  <section class="seperation3" id="seperation3">
  </section>
  <!-- 와플인 -->
  <section class="section" id="member">
    <div class="section__container">
      <h2>와플인 <span style="font-size:20px;">WAPL Members</span></h2>
      <div class="member__list">
		 <c:forEach items="${memberList}" varStatus=""  var="member"  begin="0" end="10">
		 	<div class="member__description">
          <div class="member__description__top">
            
            <img src="${contextPath}/resources/image/${member.image}" alt="" class="profile">
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
      
      <button class="member__button" onclick="goPage('memberList')">더 많은 와플인보기</button>
  </section>
  <!-- 와플인 End-->


<c:import url="layout/footer.jsp"></c:import>
</html>

