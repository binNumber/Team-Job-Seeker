<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="travelDB.dao.LocalCodeDAO"%>
<%@ page import="travelDB.dao.TravelDestinationDAO"%>
<%@ page import="travelDB.dao.ContentTypeDAO"%>
<%@ page import="travelDB.dao.TravelDetailDAO"%>
<%@ page import="travelDB.dao.DisabilityInfoDAO"%>
<%@ page import="userDB.dao.ReviewDAO"%>
<%@ page import="userDB.dao.UserDateDAO"%>

<%@ page import="travelDB.dto.LocalCodeDTO"%>
<%@ page import="travelDB.dto.TravelDestinationDTO"%>
<%@ page import="travelDB.dto.ContentTypeDTO"%>
<%@ page import="travelDB.dto.TravelDetailDTO"%>
<%@ page import="travelDB.dto.DisabilityInfoDTO"%>
<%@ page import="userDB.dto.ReviewDTO"%>
<%@ page import="userDB.dto.UserDateDTO"%>

<%@ page import="travelDB.util.ConvertDateUtil"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel For All</title>
<link rel="stylesheet" type="text/css" href="./css/my_page.css">
</head>
<body>

	<%
	Integer code = (Integer) session.getAttribute("user_code");
	int user_code = code;

	ReviewDAO rvDAO = new ReviewDAO();
	List<ReviewDTO> rvList = rvDAO.findReviewByUserCode(user_code);
	
	%>

	<div>
		<h1>
			<a id="gotoMain" href="index.jsp">Travel<br />For All
			</a> <br /> <br /> <a href="my_page.jsp">MY PAGE</a>
		</h1>
	</div>
	<div class="sidebar">
		<ul>
			<li><a href="my_page_user_data.jsp">회원정보확인</a></li>
			<li><a href="my_page_user_updaet.jsp">회원정보수정</a></li>
			<li><a href="my_page_user_delete.jsp">회원탈퇴</a></li>
			<li><a href="my_page_user_review.jsp">나의 리뷰관리</a></li>
		</ul>
	</div>
	<div id="main-content">
		<div id="frm_manageReviews">
			<h2>나의 리뷰관리</h2>

			<%
			if (rvList == null) {
			%>
			<p>작성된 리뷰가 없습니다. 리뷰를 작성해주세요.</p>

			<%
			} else {

			rvList = rvDAO.findReviewByUserCode(user_code);

			List<Integer> rvContentId = new ArrayList<Integer>();

			for (ReviewDTO rv : rvList) {
				rvContentId.add(rv.getContents_id());
			}

			TravelDestinationDAO tdDAO = new TravelDestinationDAO();
			List<TravelDestinationDTO> tdList = new ArrayList<TravelDestinationDTO>();

			for (int i = 0; i < rvContentId.size(); i++) {
				TravelDestinationDTO dto = tdDAO.findTravelDestinationByContentId(rvContentId.get(i));

				tdList.add(dto);
			}

			for (int i = 0; i < rvList.size(); i++) {
			%>

			<div class="reviewBox" onclick="moveDetail()">
				<input type="hidden" class="content_id"
					value="<%=rvList.get(i).getContents_id()%>">
				<h3><%=tdList.get(i).getTitle()%></h3>
				<p>
					✍<%=rvList.get(i).getReview_text()%></p>
				<%
				//리뷰 평점 100일 때
				if (rvList.get(i).getReview_rating() == 100) {
				%>
				<div class="reviewRating">
					<span class="gold">&#9733;</span> <span class="gold">&#9733;</span>
					<span class="gold">&#9733; </span> <span class="gold">&#9733;</span>
					<span class="gold">&#9733;</span>
				</div>
				<%
				//리뷰 평점 80일 때
				} else if (rvList.get(i).getReview_rating() == 80) {
				%>
				<div class="reviewRating">
					<span class="gold">&#9733;</span> <span class="gold">&#9733;</span>
					<span class="gold">&#9733; </span> <span class="gold">&#9733;</span>
					<span class="gray">&#9733;</span>
				</div>
				<%
				//리뷰 평점 60일 때
				} else if (rvList.get(i).getReview_rating() == 60) {
				%>
				<div class="reviewRating">
					<span class="gold">&#9733;</span> <span class="gold">&#9733;</span>
					<span class="gold">&#9733; </span> <span class="gray">&#9733;</span>
					<span class="gray">&#9733;</span>
				</div>
				<%
				//리뷰 평점 40일 때
				} else if (rvList.get(i).getReview_rating() == 40) {
				%>
				<div class="reviewRating">
					<span class="gold">&#9733;</span> <span class="gold">&#9733;</span>
					<span class="gray">&#9733; </span> <span class="gray">&#9733;</span>
					<span class="gray">&#9733;</span>
				</div>
				<%
				//리뷰 평점 20일 때
				} else {
				%>
				<div class="reviewRating">
					<span class="gold">&#9733;</span> <span class="gray">&#9733;</span>
					<span class="gray">&#9733; </span> <span class="gray">&#9733;</span>
					<span class="gray">&#9733;</span>
				</div>
				<%
				}
				%>
				<span> 작성날짜 : <%=ConvertDateUtil.convertLocalDateTimeToString4(rvList.get(i).getReview_date())%></span>
			</div>

			<%
			}
			%>

			<%
			}
			%>
		</div>
	</div>

	<script>
	
	let reviewBoxes = document.querySelectorAll('.reviewBox');
    
    reviewBoxes.forEach(function(reviewBox) {
        reviewBox.addEventListener('click', function() {
            let contentId = reviewBox.querySelector('.content_id').value;
            location.href = "detail.jsp?contentId=" + contentId;
        });
    });
	</script>

</body>
</html>