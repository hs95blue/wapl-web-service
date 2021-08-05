<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

  <c:import url="./layout/header.jsp"></c:import>
  <c:import url="./layout/top.jsp"></c:import>
  <script>
window.onload = function(){
}
</script>
<script>
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
$(function() {
    // 로딩될때

	$("#mem_id").blur(function() {
		// id = "id_reg" / name = "userId"
		var user_id = $('#mem_id').val();
		$.ajax({
			url :'${pageContext.request.contextPath}/member/idCheck?userId='+ user_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == '1') {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					}else{
						$("#id_check").text("");
						$("#reg_submit").attr("disabled", false);
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
}); 

</script>
   <!-- 회원가입-->
  <section class="section" id="new">
    <div class="section__container mem_join">
       <h2>회원가입<span style="font-size: large; font-weight:bold;">  signup</span></h2>
      <form  method="post" 
      enctype="multipart/form-data" class="inputForm">
      <div class="mem_form-group">

        <div class="member mem_id">
          <label for="mem_id" class="label_id">아이디</label>
          <input type="text" name="memId"  id="mem_id" class="mem_id" placeholder="id를 적어주세요" maxlength="10">
          <div class="check_font" id="id_check"></div>
        </div>
        <div class="member mem_nickname">
          <label for="nickname" class="label_nickname">닉네임</label>
          <input type="text" name="nickname"  id="nickname" class="nickname" placeholder="닉네임을 적어주세요" maxlength="10">
        </div>
      </div>
      <div class="mem_form-group mem_password">

        <div class="member mem_password">
          <label for="pwd" class="label_pwd">패스워드</label>
          <input type="password" name="pwd" id="pwd" class="pwd" placeholder="비밀번호를 적어주세요" maxlength="10">
        </div>
      </div>
      <div class="mem_form-group">


        <div class="member mem_age">
          <label for="age" class="label_age">나이</label>
          <input type="text" name="age" id="age" class="age" placeholder="나이를 적어주세요" maxlength="10">
          
        </div>
        <div class="member mem_gender">
          <label for="gender" class="label_gender">성별</label>
          <input type="radio" name="gender"  value="man">남
          <input type="radio" name="gender" value="woman">여
        </div>
      </div>
      <div class="mem_form-group">

        <div class="member mem_email">
          <label for="email" class="label_email">이메일</label>
          <input type="text" name="email" id="email" class="email" placeholder="이메일을 적어주세요" maxlength="30">
          
        </div>
        <div class="member mem_tel">
          <label for="tel" class="label_tel">전화번호</label>
          <input type="text" name="tel" id="tel" class="tel" placeholder="'-'없이 숫자만 적어주세요" maxlength="11">
        </div>
      </div>
      <div class="mem_form-group">

        <div class="member mem_position">
          <div class="member mem_position1">
            <label for="position1" class="label_position1" >본 포지션</label>
            <input type="text" name="position1" id="position1" class="position1" placeholder="ex)백엔드" maxlength="30">
            <label for="position1Level" class="label_position1Level">수준</label>
            <select name="position1Level"> 
              <option value="초보">초보</option>
              <option value="중수">중수</option>
              <option value="고수"> 고수</option>
            </select>
          
          
          </div>
          <div class="member mem_position2">
            <label for="position2" class="label_position2">부 포지션</label>
            <input type="text" name="position2" id="position2" class="position2" placeholder="ex)프론트엔드" maxlength="30">
            <label for="position2Level" class="label_position2Level">수준</label>
            <select name="position2Level">
              <option value="초보">초보</option>
              <option value="중수">중수</option>
              <option value="고수"> 고수</option>
            </select>
          
          </div>
        </div>
        
        </div>
        <div class="mem_img">
        <div class="form-group filebox">
          <p class="file_title">대표이미지</p>
          <label for="uploadFile" class="label_uploadFile" >파일선택</label>
          <input type="file" name="uploadFile" id="uploadFile" class="inputForm__input__file" multiple>
          <!-- <button type="button" class="inputForm__input__file--btn">파일선택</button> -->
        </div>
        <div class="buttons">
          <button class="submit-btn" id="reg_submit">회원가입</button>
          <button type="button" class="cancel-btn" onclick="goBackPage()">취소</button>
        </div>
      </div>
      </form>
     </div>
  </section>


   
   
   
<c:import url="layout/footer.jsp"></c:import>
</html>

   