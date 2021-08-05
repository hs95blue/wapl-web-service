<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  <c:import url="layout/header.jsp"></c:import>
  <c:import url="layout/top.jsp"></c:import>
  <script>
  </script>
<!-- 게시물 상세-->
  <section class="section" id="new">
    <div class="section__container board_info">
    <c:if test="${flag eq 'p'}">
	    <h2>프로젝트<span style="font-size: large; font-weight:bold;">   project</span></h2>
    </c:if>
    <c:if test="${flag eq 's'}">
    	<h2>스토리<span style="font-size: large; font-weight:bold;">   story</span></h2>
    </c:if>
      <div class="board_title"><h2>${boardVO.title}</h2></div>
      <div class="board_content">
       ${boardVO.content}


      </div>
      <c:if test="${type eq 'p'}">
	      <div class="mem_cnt"> <div class="status">모집현황(${boardVO.status}) : </div>${boardVO.memCnt} / ${boardVO.totMemCnt}</div>
      </c:if>
      <div class="buttons">
      	<c:if test="${flag eq 'p'}">
	      	<c:if test="${sessionScope.memId ne boardVO.writer}">
		        <button class="project-join" onclick="joinProj('${sessionScope.memId}',${boardVO.bno})">참가하기</button>
	      	</c:if>
      	</c:if>
      	<c:set value="${boardVO.bno}" var="bno" />
        <c:if test="${sessionScope.memId eq boardVO.writer}">
        	<c:if test="${flag eq 'p'}">
		        <button class="update-btn" onclick="goPageWithBno('board/updateForm')">수정</button>
        	</c:if>
        	<c:if test="${flag eq 's'}">
		        <button class="update-btn" onclick="goPageWithBno('story/updateForm')">수정</button>
        	</c:if>
	        <button class="delete-btn" onclick="deleteBoard('${boardVO.bno}','${flag}')">삭제</button>
        </c:if>
	        <c:if test="${flag eq 'p'}">
		        <button class="update-btn" onclick="goPage('projectList')">목록</button>
        	</c:if>
        	<c:if test="${flag eq 's'}">
		        <button class="update-btn" onclick="goPage('storyList')">목록</button>
        	</c:if>
      </div>
      <script>
      	function goPageWithBno(url){
      		var bno = "<c:out value='${boardVO.bno}'/>";
      		location.href =window.location.protocol+"//"+window.location.host+"/app/" + url+"?bno="+bno; 
      	}
      	function deleteBoard(bno,flag){
      		var isDelete=confirm("삭제하시겠습니까?");
      		if(isDelete){
      			
	      	$.ajax({
				url :'${pageContext.request.contextPath}/board/deleteBoard',
				type : 'post',
				data : { bno: bno },
				success : function(data) {
					if (data == '1') {
						alert("삭제되었습니다");
						if(flag == 'p'){
							window.location.href = '${pageContext.request.contextPath}/projectList';
						}else{
							window.location.href = '${pageContext.request.contextPath}/storyList';
						}
					}else{
						alert("삭제실패");
					}
					
					}, error : function() {
							console.log("실패");
					}
				});
      		}
      	}
      	
    	function joinProj(memId,bno){
      		var isDelete=confirm("참가하시겠습니까?");
      		if(isDelete){
      			
	      	$.ajax({
				url :'${pageContext.request.contextPath}/member/joinProject',
				type : 'post',
				data : { memId: memId,
					bno:bno},
				success : function(data) {
					if (data == '1') {
						alert("참가완료");
						if(flag == 'p'){
							window.location.href = '${pageContext.request.contextPath}/projectList';
						}else{
							window.location.href = '${pageContext.request.contextPath}/storyList';
						}
					}else{
						alert("참가실패");
					}
					
					}, error : function() {
							console.log("실패");
					}
				});
      		}
      	}
      	
      </script>
     </div>
  </section>

   
  <c:import url="layout/footer.jsp"></c:import>
</html>
  