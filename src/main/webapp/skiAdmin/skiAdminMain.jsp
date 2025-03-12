<%@ page import="adminDto.UsersDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        /* 전체 기본 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            display: flex; 
        }
		
		@font-face {
    	font-family: 'GumiRomanceTTF';
  		src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-1@1.0/GumiRomanceTTF.woff2') format('woff2');
  		font-weight: normal;
   		font-style: normal;
		}
		
		a {
			text-decoration: none;
		}
        /* 상단 헤더 */
        header {
            background-color: #343a40;
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 60px;
            display: flex;
            align-items: center;
            padding: 0 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }
        .header-left {
            display: flex;
            align-items: center;
        }
        .header-left h1 {
			color: #5399f5;
			font-size: 20px;
			font-weight: 700;
			font-family: 'GumiRomanceTTF';
		}

        /* 사이드바 */
        .sidebar {
            display: block;
            width: 250px;
            height: 100vh;
            background-color: #212529;
            position: fixed;
            top: 60px; 
            left: 0;
            padding-top: 20px;
            color: white;
        }
        .sidebar-profile {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px 0;
        }
        .profile-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            margin-bottom: 10px;
        }
        .admin-name {
            font-size: 16px;
            font-weight: bold;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
        }
        .sidebar ul li {
            padding: 15px;
            border-bottom: 1px solid #343a40;
        }
        .sidebar ul li a {
            text-decoration: none;
            color: white;
            display: block;
            font-size: 16px;
        }
        .sidebar ul li a:hover {
            background-color: #495057;
        }

        /* 메인 컨텐츠 */
        .main-content {
            margin-left: 250px;
            padding: 80px 20px 20px;
            width: calc(100% - 250px);
            box-sizing: border-box;
        }
        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            background: white;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: center;
            font-size: 13px;
        }
        th {
            background-color: #0d3765;
            color: white;
        }
        button {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            background-color: #1074df;
            color: white;
            cursor: pointer;
            
        }
        button:hover {
            background-color: #0056b3;
        }
        .chart-cards {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
            margin: 20px 0;
        }
        .chart-card {
            background-color: #fff;
            padding: 15px;
            box-shadow: 1px 2px 6px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            width: 32%;
            min-width: 280px;
            height: 400px;
            overflow: auto;
        }
        .chart-card canvas {
            width: 90% !important;
            height: 85% !important;
        }
        .chart-card h3 {
            text-align: center;
            margin-bottom: 10px;
            font-size: 16px;
        }
        
        /* 리스트 상단 우측의 검색 컨트롤 영역 */
        .list-header {
            display: flex;
            justify-content: flex-end;
            padding: 20px 20px;
            box-sizing: border-box;            
        }
        .list-header h3 {
           margin: 0;
           margin-right:auto;          
        }
        .search-filter-container {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        /* 작은 사이즈를 위해 폰트와 패딩 축소 */
        .search-filter-container select,
        .search-filter-container input {
            font-size: 12px;
            padding: 3px 6px;
        }
        .search-icon {
		    cursor: pointer;
		}
        /* 검색 필드와 아이콘을 감싸는 컨테이너 */
        .search-box {
            position: relative;
        }
        .search-box input {
            min-width: 120px;
            border: 1px solid #000;
            border-radius: 4px;
            padding: 5px 6px;
            padding-right: 25px; /* 아이콘 공간 확보 */
            font-size: 12px;
            box-sizing: border-box;
        }
        .search-box .search-icon {
            position: absolute;
            width: 14px;
            height: 14px;
            right: 6px;
            top: 50%;
            transform: translateY(-50%);
            pointer-events: auto;
        }
        
        .table-container {
		    max-height: 700px; /* 테이블 높이 증가 */
		    overflow-y: auto;
		    padding: 0 20px;
		    box-sizing: border-box;
		    margin-top: 5px;
		    border-radius: 8px;
		    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
		}
		
		table {
		    width: 100%;
		    border-collapse: separate;
		    border-spacing: 0;
		    margin-top: 0;
		    background: white;
		}
		
		th, td {
		    padding: 7px 15px;
		    text-align: left;
		    font-size: 14px;
		    border: none;
		    border-bottom: 1px solid #eee;
		}
		
		th {
		    background-color: #f8f9fa;
		    color: #333;
		    font-weight: 600;
		    position: sticky;
		    top: 0;
		    z-index: 10;
		}
		tr {
		    height: 20px;
		}
		
		
    </style>
    <script>
    
    </script>
</head>
<body>

<!-- 상단 헤더 -->
<header>
    <div class="header-left">
        <a href="${pageContext.request.contextPath}/admin/dashboard">
            <h1>SKI:P</h1>
        </a>
    </div>
    <!-- 우측 정보는 삭제 -->
</header>

<!-- 왼쪽 사이드바 -->
<aside class="sidebar">
    <div class="sidebar-profile">
        <img src="" alt="사진프로필" class="profile-icon">
        <div class="admin-name">관리자님</div>
    </div>
    <ul>
        <li><a href="${pageContext.request.contextPath}/skiAdmin/skiAdminMain.jsp">사업장등록신청</a></li>
	        <li><a href="${pageContext.request.contextPath}/skiAdmin/testservlet2">상품등록/관리</a></li>
	        <li><a href="${pageContext.request.contextPath}/skiAdmin/skiReservation.jsp">예약 관리</a></li>
	        <li><a href="${pageContext.request.contextPath}/skiAdmin/testservlet4">문의 관리</a></li>
	        <li><a href="${pageContext.request.contextPath}/skiAdmin/testservlet5">리뷰 관리</a></li>
	        <li><a href="${pageContext.request.contextPath}/skiAdmin/testservlet6">통계</a></li>
    </ul>
</aside>

<!-- 메인 컨텐츠 영역 -->
<main class="main-content">
        <!-- 테이블 영역 -->
        <div class="table-container">
        <!-- 리스트 상단 우측에 작게 표시되는 검색 컨트롤 영역 -->
        <div class="list-header">
        <h3>예약리스트</h3>
            <div class="search-filter-container">
                <select id="filterSelect">
                    <option value="userName">이름</option>
                    <option value="userId">아이디</option>
                    <option value="userEmail">이메일</option>                    
                </select>
                <div class="search-box">
                  <input type="text" id="searchInput" placeholder="검색어 입력" />
                  <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" alt="검색 아이콘" class="search-icon" onclick="searchList()"/>
                </div>
            </div>
        </div>
            <table>
                <thead>
                    <tr>
                        <th>고유번호</th>
                        <th>이름</th>
                        <th>아이디</th>
                        <th>이메일</th>
                        <th>전화번호</th>
                        <th>가입유형</th>
                        <th>유형</th>
                        <th>가입일</th>
                        <th>활동</th>
                    </tr>
                </thead>
                <tbody id="reservationTableBody">
                    <!-- 백엔드에서 반복문으로 출력할 데이터 -->
                </tbody>
            </table>
        </div>
    </main>

</body>
</html>
