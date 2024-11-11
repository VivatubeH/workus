<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../common/common.jsp" %>
<title>채팅방</title>

</head>
<body>
	<div id="divWrapper">
		<div id="divContents">
			<%@ include file="../common/header.jsp" %>
			<section class="verticalLayoutFixedSection">
				<%@ include file="../common/nav.jsp" %>
				<main>
					<div class="container-fluid vh-100">
						<div class="row h-100">
							<!-- 채팅방 목록 -->
							<div class="col-4 border-end p-0 overflow-auto">
								<!-- 채팅방 -->
								<div class="border-bottom p-3" role="button">
									<div class="d-flex justify-content-between align-items-start">
										<h6 class="mb-1">채팅방 제목</h6>
										<small class="text-muted">오후 2:30</small>
									</div>
									<p class="mb-1 text-muted">개설자: 홍길동</p>
									<div class="d-flex justify-content-between align-items-center">
										<small class="text-muted text-truncate me-2">마지막 메시지 내용...</small>
										<span class="badge bg-primary rounded-pill">3</span>
									</div>
								</div>
								<!-- 추가 채팅방들... -->
							</div>

							<!-- 채팅 내용 -->
							<div class="col-8 p-0 d-flex flex-column h-100">
								<!-- 채팅방 헤더 -->
								<div class="border-bottom p-3 bg-light d-flex justify-content-between align-items-center">
									<h5 class="mb-0">채팅방 제목</h5>
									<div class="dropdown">
										<button class="btn btn-light" data-bs-toggle="dropdown">
											<i class="fas fa-users"></i>
										</button>
										<!-- 참여자 목록 드롭다운 -->
										<ul class="dropdown-menu dropdown-menu-end p-3" style="width: 250px;">
											<li><h6 class="border-bottom pb-2">참여자 목록</h6></li>
											<li>
												<div class="d-flex align-items-center my-2">
													<img src="" alt="프로필" class="rounded-circle me-2">
													<span role="button" class="participant-name">홍길동</span>
												</div>
											</li>
											<!-- 추가 참여자들... -->
										</ul>
									</div>
								</div>

								<!-- 채팅 내용 영역 -->
								<div class="flex-grow-1 overflow-auto p-3">
									<!-- 날짜 구분선 -->
									<div class="d-flex align-items-center my-4">
										<div class="border-bottom flex-grow-1"></div>
										<span class="mx-3 text-muted">2024년 3월 7일</span>
										<div class="border-bottom flex-grow-1"></div>
									</div>

									<!-- 상대방 메시지 -->
									<div class="mb-3 w-75">
										<div class="d-flex align-items-center mb-1">
											<img src="" alt="프로필" class="rounded-circle me-2">
											<strong>홍길동</strong>
										</div>
										<div class="d-flex">
											<div class="bg-light rounded p-2 mb-1">
												안녕하세요!
											</div>
										</div>
										<small class="text-muted">오전 10:30</small>
									</div>

									<!-- 내 메시지 -->
									<div class="mb-3 w-75 ms-auto">
										<div class="text-end mb-1">
											<strong>나</strong>
										</div>
										<div class="d-flex justify-content-end">
											<div class="bg-primary text-white rounded p-2 mb-1">
												네, 안녕하세요!
											</div>
										</div>
										<div class="text-end">
											<small class="text-muted">오전 10:31</small>
										</div>
									</div>
								</div>

								<!-- 메시지 입력 영역 -->
								<div class="border-top p-3">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="메시지를 입력하세요...">
										<button class="btn btn-primary">전송</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</main>
			</section>
		</div>
	</div>

	<!-- 프로필 모달 -->
	<div class="modal fade" id="testModal" tabindex="-1" aria-labelledby="testModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="testModalLabel">프로필 정보</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<!-- 왼쪽 프로필 사진 영역 -->
						<div class="col-4 text-center">
							<i class="bi bi-person-circle fs-1"></i>
						</div>
						<!-- 오른쪽 정보 영역 -->
						<div class="col-8">
							<div class="mb-3">
								<h5 class="fw-bold">홍길동</h5>
							</div>
							<div class="mb-2">
								<span class="text-muted">직책:</span>
								<span>책임연구원</span>
							</div>
							<div class="mb-2">
								<span class="text-muted">부서:</span>
								<span>AI연구소</span>
							</div>
							<div class="mb-2">
								<span class="text-muted">이메일:</span>
								<span>hong@example.com</span>
							</div>
							<div class="mt-3">
								<span class="text-muted">한 줄 소개:</span>
								<p class="mt-1">AI 기술 연구 및 개발을 담당하고 있습니다. 새로운 기술에 대한 열정이 넘치며 팀워크를 중요시합니다.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btn-warning" data-bs-dismiss="modal">수정</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		// 모달 객체 생성
		const myModal = new bootstrap.Modal('#testModal');

		// 모달 등장
		$(".participant-name").on('click', () => {
			myModal.show();
		});
	</script>
</body>
</html>