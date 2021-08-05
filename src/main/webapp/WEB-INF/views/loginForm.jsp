<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  <c:import url="layout/header.jsp"></c:import>
  <c:import url="layout/top.jsp"></c:import>
<script>
window.onload = function(){
	var err_id = "<c:out value='${err_id}'/>";
	var err_pwd = "<c:out value='${err_pwd}'/>";
	if(err_id != ""){
		alert(err_id);
	}else if(err_pwd != ""){
		alert(err_pwd);	
	}
}
 
</script>


  <!-- 로그인-->
  <section class="section" id="new">
    <div class="section__container login">
      <h2>로그인<span style="font-size: large; font-weight:bold;">  login</span></h2>
      <form  method="post"  class="inputForm">
      <div class="login_form-group">
        <label for="login_id">아이디</label>
        <input type="text" name="memId" id="login_id" >
      </div>
      <div class="login_form-group">
        <label for="login_pwd">비밀번호</label>
        <input type="password" name="pwd" id="login_pwd">
      </div>
      <div class="buttons login">
        <button class="submit-btn">로그인</button>
        <button type="button" class="cancel-btn" onclick="goBackPage()">뒤로가기</button>
      </div>
      </form>
     </div>
  </section>




  <c:import url="layout/footer.jsp"></c:import>
</html>
  