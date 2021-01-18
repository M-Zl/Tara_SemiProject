<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<section>
	<link rel="stylesheet" property="stylesheet"
		href="/KH_Tara_Semi/css/adminpage.css">
	<div class="main">
		<div class="admin-header">
			<h1 class="admin-header__title">회원 관리</h1>
		</div>
		<div class="admin-main">
			<div class="user-table">
				<table>
					<thead>
						<tr>
							<th>회원번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>생년월일</th>
							<th>이메일</th>
							<th>가입일</th>
							<th>탈퇴여부</th>
							<th>회원탈퇴</th>
						</tr>
					</thead>
					<tbody>
						<tr class="row">
							<td><strong>1</strong></td>
							<td>lws2269</td>
							<td>이원석</td>
							<td>1995/12/12</td>
							<td>asdasv@naver.com</td>
							<td>1995/12/12</td>
							<td><strong>Y</strong></td>
							<td><a href="#"><i
									class="fas fa-user-slash lg"></i></a></td>
						</tr>
						<tr class="row">
							<td><strong>1</strong></td>
							<td>lws2269</td>
							<td>이원석</td>
							<td>1995/12/12</td>
							<td>asdasv@naver.com</td>
							<td>1995/12/12</td>
							<td><strong>Y</strong></td>
							<td><a href="#"><i
									class="fas fa-user-slash lg"></i></a></td>
						</tr>
						<tr class="row">
							<td><strong>1</strong></td>
							<td>lws2269</td>
							<td>이원석</td>
							<td>1995/12/12</td>
							<td>asdasv@naver.com</td>
							<td>1995/12/12</td>
							<td><strong>Y</strong></td>
							<td><a href="#"><i
									class="fas fa-user-slash lg"></i></a></td>
						</tr>
						<tr class="row">
							<td><strong>1</strong></td>
							<td>lws2269</td>
							<td>이원석</td>
							<td>1995/12/12</td>
							<td>asdasv@naver.com</td>
							<td>1995/12/12</td>
							<td><strong>Y</strong></td>
							<td><a href="#"><i
									class="fas fa-user-slash lg"></i></a></td>
						</tr>
						<tr class="row">
							<td><strong>1</strong></td>
							<td>lws2269</td>
							<td>이원석</td>
							<td>1995/12/12</td>
							<td>asdasv@naver.com</td>
							<td>1995/12/12</td>
							<td><strong>Y</strong></td>
							<td><a href="#"><i
									class="fas fa-user-slash lg"></i></a></td>
						</tr>
						<tr class="row">
							<td><strong>1</strong></td>
							<td>lws2269</td>
							<td>이원석</td>
							<td>1995/12/12</td>
							<td>asdasv@naver.com</td>
							<td>1995/12/12</td>
							<td><strong>Y</strong></td>
							<td><a href="#"><i
									class="fas fa-user-slash lg"></i></a></td>
						</tr>
						<tr class="row">
							<td><strong>1</strong></td>
							<td>lws2269</td>
							<td>이원석</td>
							<td>1995/12/12</td>
							<td>asdasv@naver.com</td>
							<td>1995/12/12</td>
							<td><strong>Y</strong></td>
							<td><a href="#"><i
									class="fas fa-user-slash lg"></i></a></td>
						</tr>
						<tr class="row">
							<td><strong>1</strong></td>
							<td>lws2269</td>
							<td>이원석</td>
							<td>1995/12/12</td>
							<td>asdasv@naver.com</td>
							<td>1995/12/12</td>
							<td><strong>Y</strong></td>
							<td><a href="#"><i
									class="fas fa-user-slash lg"></i></a></td>
						</tr>
						<tr class="row">
							<td><strong>1</strong></td>
							<td>lws2269</td>
							<td>이원석</td>
							<td>1995/12/12</td>
							<td>asdasv@naver.com</td>
							<td>1995/12/12</td>
							<td><strong>Y</strong></td>
							<td><a href="#"><i
									class="fas fa-user-slash lg"></i></a></td>
						</tr>
						<tr class="row">
							<td><strong>1</strong></td>
							<td>lws2269</td>
							<td>이원석</td>
							<td>1995/12/12</td>
							<td>asdasv@naver.com</td>
							<td>1995/12/12</td>
							<td><strong>Y</strong></td>
							<td><a href="#"><i
									class="fas fa-user-slash lg"></i></a></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="pagecount">
				<button>&lt;&lt;</button>
				<button>&lt;</button>
				<button>1</button>
				<button>2</button>
				<button>3</button>
				<button>4</button>
				<button>5</button>
				<button>6</button>
				<button>7</button>
				<button>8</button>
				<button>9</button>
				<button>0</button>
				<button>&gt;</button>
				<button>&gt;&gt;</button>
			</div>
			<div class="user-table__search">
				<div class="user__search">
					<form action="">
						<select>
							<option selected>회원번호</option>
							<option>회원ID</option>
							<option>이름</option>
						</select> <input type="text" /> <input type="submit" value="검색" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="https://kit.fontawesome.com/0fe4d45686.js"
		crossorigin="anonymous"></script>
</section>
<%@ include file="/views/common/footer.jsp"%>