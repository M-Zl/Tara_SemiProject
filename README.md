# __TARA Project__
## 1.1. 프로젝트 기간
4조 세미프로젝트 '여행지 추천 사이트'를 주제로 기획/제작한 웹 사이트이며 총 5명이 참가하였습니다.  
* 프로젝트 기간 : 2020년 12월 23일 ~ 2021년 1월 25일 
<br>

## 1.2. 프로젝트 컨셉  
여행 갈 때 흔히 '멋 따라 맛 따라' 라고 이야기 하곤 합니다.     
멋 '따라', 맛 '따라'의 경쾌한 느낌을 반영하여 TARA로 선택였습니다.   
<br>
   
## 2. 기획의도
* 코로나로 인한 해외여행이 어려워지면서 국내여행의 증가로 어디를 갈 지 모르는 사람들을 위한 여행지 가이드
* 사용자가 알아 보기 편한 UI로 접근성, 사용성 제고
* 여행에 있어 가장 중요한 맛집, 다양한 숙소와 캠핑장 안내 및 별점
* 여행을 왔지만 무엇을 먹어야할지 결정을 못하는 여행객을 위한 맛집 추천
* 여행객 사진리뷰를 통해 핫한 사진을 보고 인생샷 건지기
* 국내 관광산업과 지역경제 활성화
<br>   
   
## 3. 개발환경

![슬라이드7](https://user-images.githubusercontent.com/76435884/117600677-6057cc00-b187-11eb-877e-32cbff45af3c.PNG)
<br>

* OS : Windows 10
* WAS : Apache Tomcat 9.0
* DB : Oracle Database
* Front-end : HTML5 / CSS / javascript / jQuery
* Back-end : JDK 1.8 / JSP / Servlet
* Developer Tools : Eclipes / SqlDeveloper / VS Code
* GitHub
* Sourcetree
<br>

## 3.1. 사용한 API   

    - CKEditor 4
<br>


## 3.2. 필요한 라이브러리  

    1. cos.jar
    2. gson-2.5.jar
    3. json-simple-1.1.1.jar
    4. ojdbc6.jar
<br>
      
## 4. 화면구성 및 기능 구현 

![슬라이드10](https://user-images.githubusercontent.com/76435884/117600683-6188f900-b187-11eb-8e11-9f1496cea88c.PNG)  

* 첫 메인 화면입니다.    
* 각 지역으로 이동하는 게시판이 존재하며, 로그인/회원가입 서비스를 이용할 수 있습니다.    
<br>

![슬라이드11](https://user-images.githubusercontent.com/76435884/117600685-6188f900-b187-11eb-8509-a0ab0fbad6eb.PNG)

* 로그인/회원가입 페이지입니다. (NAVER, KAKAO REST API 로그인 미구현)
* 아이디 저장을 클릭하면 cookie를 사용하여 마지막으로 로그인한 아이디를 기억합니다.
* 약관동의를 안내하며 미동의 시 회원가입 불가 
* 아이디 중복체크, 비밀번호 유효성 체크를 할 수 있습니다 
<br>

![슬라이드11-2](https://user-images.githubusercontent.com/76435884/117602225-196bd580-b18b-11eb-8c82-3ccc897c5554.png)

* ID/PASSWORD 찾기 페이지입니다.   
* ID찾기는 사용자가 가입시 입력한 이름과 이메일을 통해 찾을 수 있습니다.
* PASSWORD는 사용자의 이름, 가입한 아이디, 가입시 입력한 이메일을 통해 비밀번호를 변경할 수 있습니다.
<br>

![슬라이드12](https://user-images.githubusercontent.com/76435884/117600686-62218f80-b187-11eb-96ff-58d772131f56.PNG)

* 마이페이지입니다.   
* 사용자 프로필 이미지를 변경과 회원탈퇴를 할 수 있습니다.
* 작성한 글 목록을 볼 수 있으며 수정/삭제가 가능합니다.
<br>

![슬라이드13](https://user-images.githubusercontent.com/76435884/117600687-62ba2600-b187-11eb-8ca8-b04b89fb422a.PNG)

* 관리자 페이지입니다.   
* 검색창을 사용하여 회원번호, 회원 ID, 회원 이름으로 회원을 검색할 수 있습니다.
* 회원 회원관리(수정/탈퇴)를 할 수 있습니다.   
<br>

![슬라이드14](https://user-images.githubusercontent.com/76435884/117600689-62ba2600-b187-11eb-9138-eb388dc0ecaa.PNG)

* 각 지역 게시판입니다.    
* 숙박/맛집/포토존 버튼을 클릭하면 주제에 맞는 게시글이 조회되며,    
* 최신순/추천순(좋아요)으로 조회가 가능합니다.   
* 주제(숙박/맛집/포토존)를 선택하여 작성자, 제목, 내용으로 게시글 검색이 가능합니다.
<br>

![슬라이드15](https://user-images.githubusercontent.com/76435884/117600691-6352bc80-b187-11eb-91f5-18ed35eb3383.PNG)

* 게시글 업로드 페이지입니다.   
* 지역과 숙박/맛집/포토존 선택이 가능합니다.
* CKEditor로 게시글을 작성 할 수 있으며 이미지 업로드가 가능합니다.   
* 여행지까지 이동할 때 사용했던 교통수단과 경비, 별점을 입력하여 다른 사용자에게 공유하여 폭넓은 데이터를 제공합니다.    
<br>

![슬라이드17](https://user-images.githubusercontent.com/76435884/117600694-63eb5300-b187-11eb-9a15-23373fafcbed.PNG)

* 게시글 페이지입니다.   
* 해당하는 지역과 주제를 보여주며 자료가 마음에 들면 로그인 한 회원들은 좋아요를 업데이트할 수 있습니다.
<br>

## 5. DB 설계

![슬라이드9](https://user-images.githubusercontent.com/76435884/117600682-60f06280-b187-11eb-8c2a-0f89f2b93a36.PNG)

<br>

*****
<br>
이상 TARA 여행지 추천 사이트였습니다.<br>
끝까지 읽어주셔서 감사합니다.

