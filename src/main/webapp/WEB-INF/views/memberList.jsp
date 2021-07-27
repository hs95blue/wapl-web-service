<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  <c:import url="./layout/header.jsp"></c:import>
  <c:import url="./layout/top.jsp"></c:import>
  <script type="text/javascript">
$(document).ready(function() {
	var result='<c:out value="${result}"/>';
	
	/*등록,수정,삭제 성공시 alert창*/
	alertRegisteredBoardNumber(result);
	
	/*현재 페이지는 alert창을 띄울 필요가 없다고 표시를 해둔다*/
	history.replaceState({}, null, null);
	
	function alertRegisteredBoardNumber(result) {
		/*'/board/list'를 호출했을때 alert창이 나오지 않게*/
		if(result==='' || history.state) {
			return;
		}
		
		if(parseInt(result) > 0) {
			alert("게시글 " + parseInt(result) + "번이 등록되었습니다.");
		}
		
		if(result==="success") {
			alert("처리가 완료되었습니다.");
		}
	}
	  
	/*등록 버튼 클릭시 등록 화면으로 이동*/
	$("#registerButton").on("click", function() {
		self.location = "/board/register";
	});
	
	
	var actionForm = $("#actionForm");
	
	/*페이지 번호 클릭했을때 그 페이지로 이동*/
	$(".paginate_button").on("click", function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
	
	/*조회페이지로 이동.pageNum과 amount도 함꼐 전송한다*/
	$(".move").on("click", function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
		actionForm.attr("action", "/board/get");
		actionForm.submit();
	});
	
	 /*검색 버튼의 이벤트 처리*/
	  var searchForm = $("#searchForm");
	    
	    $("#searchForm button").on("click", function(e){
	      
	      if(!searchForm.find("option:selected").val()) {
	        alert("검색 종류를 선택하세요");
	        return false;
	      }
	      
	      if(!searchForm.find("input[name='keyword']").val()) {
	        alert("키워드를 입력하세요");
	        return false;
	      }
	      
	      /*pageNum을 현재 페이지 번호에서 1로 바꾼다. 즉 검색 후 1페이지로 이동하게 한다*/
	      searchForm.find("input[name='pageNum']").val("1");
	      e.preventDefault();
	      
	      searchForm.submit();
	    });
	
});
</script>
  
  
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
        
        
        <!-- 검색폼 시작 -->
	  <form id = 'searchForm' action="/memberList" method="get">
	   <select name='type'>
	   <!-- 검색 버튼 누르고 페이지 이동 했을때 selected 항목 표시 -->
	     <option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' :''}"/>>--</option>
	     <option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' :''}"/>>제목
	     <option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' :''}"/>>내용</option>
	     <option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected' :''}"/>>작성자</option>
	     <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' :''}"/>>제목 or 내용</option>
	     <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' :''}"/>>제목 or 작성자</option>
	     <option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected' :''}"/>>제목 or 내용 or 작성자</option>
	   </select>
	   <!-- 검색 버튼 누르고 페이지 이동 했을때 keyword표시 -->
	   <input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
     <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>'>
     <input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>'>
	   <button>검색</button>
	  </form>
	<!-- 검색폼 끝 -->
	
	<!-- 페이징 시작 -->
		<c:if test="${pageMaker.prev}">
		  <a class= "paginate_button" href="${pageMaker.startPage-1}">이전</a>
		</c:if>
		
		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		  <a class= "paginate_button"  href="${num}">${num} </a>
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
		  <a class= "paginate_button" href="${pageMaker.endPage+1}">다음</a>
		</c:if>
	<!-- 페이징 끝 -->
		
		<form id="actionForm" action="/memberList" method="get">
		  <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>'>
		  <input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>'>
		        <!-- 페이지 번호를 클릭해서 이동할때도 검색조건, 키워드는 같이 전달 -->
      <input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>'>
      <input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>

		</form>
      </div>
      
     <!--  <button class="member__button">더 많은 와플인보기</button> -->
  </section>
  <!-- 와플인 End-->
  
  
  
  
  <c:import url="layout/footer.jsp"></c:import>
</html>
  