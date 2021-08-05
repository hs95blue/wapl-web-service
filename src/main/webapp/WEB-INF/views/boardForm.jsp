<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  <c:import url="layout/header.jsp"></c:import>
  <c:import url="layout/top.jsp"></c:import>
<script>




</script>
  
  <!-- 입력폼 -->
<section class="section" id="new">
  <div class="section__container">
    <div class="boardForm">
    	<c:if test="${flag eq 'p'}">
        <c:if test="${formMode eq 'update'}">
	        <h2>프로젝트 수정<span style="font-size: large; font-weight:bold;">   project</span></h2>
        </c:if>
        <c:if test="${formMode eq 'insert'}">
	        <h2>프로젝트 생성<span style="font-size: large; font-weight:bold;">   project</span></h2>
        </c:if>
        </c:if>
        <c:if test="${flag eq 's'}">
        <c:if test="${formMode eq 'update'}">
	        <h2>스토리 수정<span style="font-size: large; font-weight:bold;">   story</span></h2>
        </c:if>
        <c:if test="${formMode eq 'insert'}">
	        <h2>스토리 작성<span style="font-size: large; font-weight:bold;">   story</span></h2>
        </c:if>
        </c:if>
         <c:if test="${formMode eq 'update'}">
				<c:if test="${flag eq 's'}">
					<form method="post" action="${contextPath}/story/updateForm"
						enctype="multipart/form-data" class="inputForm">
				</c:if>
				<c:if test="${flag eq 'p'}">
					<form method="post" action="${contextPath}/board/updateForm"
						enctype="multipart/form-data" class="inputForm">
				</c:if>

			</c:if>
         <c:if test="${formMode eq 'insert'}">
       			  <c:if test="${flag eq 's'}">
		         	<form method="post" action="${contextPath}/story/storyForm"
								enctype="multipart/form-data" class="inputForm">
				</c:if>
				<c:if test="${flag eq 'p'}">
		         	<form method="post" action="${contextPath}/board/boardForm"
								enctype="multipart/form-data" class="inputForm">
				</c:if>
         </c:if>
          <c:if test="${flag eq 's'}">
	          <input type="hidden" value="s" name="bType" id="bType">
          </c:if>
          <c:if test="${flag eq 'p'}">
	          <input type="hidden" value="p" name="bType" id="bType">
          </c:if>
          <input type="hidden" value="${boardVO.bno}" name="bno" id="bno">
          <input type="hidden" value="${sessionScope.memId}" name="writer"  id="writer">
          <div class="form-group">
          <c:if test="${flag eq 'p'}">
            <label for="title">프로젝트 명</label>
          </c:if>
          <c:if test="${flag eq 's'}">
            <label for="title">스토리 제목</label>
          </c:if>
            <input type="text" id="title"  name="title"  value="${boardVO.title}" placeholder="제목을 입력하세요" maxlength="50"> 
          </div>
          <div class="form-group content">
            <label for="content">내용</label>
            <textarea id="content" name="content"  placeholder="내용을 입력하세요"  style="overflow:hidden">${boardVO.content} </textarea>
          </div>
          <div class="form-group total">
			<c:if test="${flag eq 'p'}">
				<label for="totMemCnt">모집인원</label>
	            <input id="totMemCnt" name="totMemCnt"  placeholder="모집인원"  value="${boardVO.totMemCnt}"  maxlength="5">
			</c:if>
  	      </div>
          <div class="form-group filebox">
            <p class="file_title">대표이미지</p>
            <label for="uploadFile">파일선택</label>
            <input type="file" name="uploadFile" id="uploadFile" class="inputForm__input__file" multiple>
            <div id="fileInfo"></div>
            <!-- <button type="button" class="inputForm__input__file--btn">파일선택</button> -->
          </div>
          <div class="buttons">
          
            <c:if test="${formMode eq 'insert'}">
	            <c:if test="${flag eq 'p'}">
	    	        <button class="submit-btn">프로젝트 생성</button>
	    	    </c:if>
	            <c:if test="${flag eq 's'}">
	    	        <button class="submit-btn">스토리 작성</button>
	    	    </c:if>
            </c:if>
            <c:if test="${formMode eq 'update'}">
            	<button class="submit-btn">수정</button>
            </c:if>
            
            <button type="button" class="cancel-btn" onclick="goBackPage()">취소</button>
          </div>
        </form>
    </div>
   </div>
    
</section>
    <!-- 입력폼 End-->
  
  
  
  <c:import url="layout/footer.jsp"></c:import>
</html>
  