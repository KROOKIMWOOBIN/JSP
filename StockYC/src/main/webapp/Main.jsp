<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stock</title>
<script>
	var dayInput1 = document.getElementById("dayInput1");
	var dayInput2 = document.getElementById("dayInput2");
    function validateForm() {
        var input = document.getElementById("dayInput1");
        var day = input.value;
        
        // 원하는 형식에 맞지 않는 경우 입력을 막음
        if (!day.match(/^\d{4}\d{2}\d{2}$/)) {
            alert("올바른 날짜 형식(YYYYMMDD)으로 입력해주세요.");
            return false; // 입력 막음
        }
        
        return true; // 입력 허용
    }
    function validateForm2() {
        var input = document.getElementById("dayInput2");
        var day = input.value;
        
        // 원하는 형식에 맞지 않는 경우 입력을 막음
        if (!day.match(/^\d{4}\d{2}\d{2}$/)) {
            alert("올바른 날짜 형식(YYYYMMDD)으로 입력해주세요.");
            return false; // 입력 막음
        }
        
        return true; // 입력 허용
    }
</script>

<style>
  table {
    width: 100%;
    border: 1px solid #ccc;
  }
  th {
  	white-space: nowrap;
  	text-align: left;
  	padding: 8px;
  }
  td {
    padding: 8px;
    text-align: center;
  }
  .card {
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #f5f5f5;
    padding: 10px;
    margin-bottom: 10px;
  }
  .card-header {
    background-color: #f2f2f2;
    padding: 8px;
    font-weight: bold;
  }
  .container {
    max-width: 800px;
    margin: 0 auto;
  }
  #dayInput1 {
    margin-top: 10px;
    padding: 5px;
    width: 200px;
  }
  #dayInput2 {
    margin-top: 10px;
    padding: 5px;
    width: 200px;
  }
  button[type="submit"] {
    margin-top: 10px;
    padding: 5px 10px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }
</style>
</head>
<body>
<main class="container">
	<div class="row">
		<div class="col card">
		    <form method="get" action="kospi.do" onsubmit="return validateForm()" style="overflow: auto">
		    		<div style="display: flex; align-items: center; justify-content: space-between;">
					    <h4 style="text-align: left;">일자별 코스피 지수</h4>
					    <div style="display: flex; align-items: center;">
					        <input type="text" class="form-control mb-3 me-3" id="dayInput1" placeholder="ex)20231212" name="day">
					        <button class="btn btn-warning mb-1">
					            검색
					            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
					                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
					            </svg>
					        </button>
					    </div>
					</div>
		    	<table class="text-center table">
		    		<thead class="table-dark">
					    <tr>
					        <th>기준일자</th>
					        <th>지수명</th>
					        <th>종가</th>
					        <th>대비</th>
					        <th>등락률</th>
					        <th>거래량</th>
					    </tr>
				    </thead>
				    <c:forEach items="${iDX_NM}" var="data" varStatus="loop" begin="0" end="9">
				        <tr>
				            <td><c:out value="${basDd2}" /></td>
				            <td><c:out value="${iDX_NM[loop.index]}" /></td>
				            <td><c:out value="${cLSPRC_IDX[loop.index]}" /></td>
				            <td id="changeColor" style="color: black;"><c:out value="${cMPPREVDD_IDX[loop.index]}" /></td>
				            <td id="changeColor" style="color: black;"><c:out value="${fLUC_RT[loop.index]}" /></td>
				            <td><c:out value="${aCC_TRDVOL[loop.index]}" /></td>
				        </tr>
				    </c:forEach>
				
				    <script>
				        var cells = document.querySelectorAll('#changeColor');
				
				        cells.forEach(function(cell) {
				            var value = parseFloat(cell.innerHTML);
				
				            if (value > 0) {
				                cell.style.color = 'red';
				            } else if (value < 0) {
				                cell.style.color = 'blue';
				            }
				        });
				    </script>
				</table>
		    </form>
		</div>
		<div class="col card ms-3">
		    <form method="get" action="kosdaqday.do" onsubmit="return validateForm2()" style="overflow: auto">
		    		<div style="display: flex; align-items: center; justify-content: space-between;">
					    <h4 style="text-align: left;">일자별 코스닥 순위</h4>
					    <div style="display: flex; align-items: center;">
					        <input type="text" class="form-control mb-3 me-3" id="dayInput2" placeholder="ex)20231212" name="day">
					        <button class="btn btn-warning mb-1">
					            검색
					            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
					                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
					            </svg>
					        </button>
					    </div>
					</div>
		    	<table class="text-center table">
		    		<thead class="table-dark">
					    <tr>
					        <th>기준일자</th>
					        <th>종목명</th>
					        <th>종가</th>
					        <th>대비</th>
					        <th>등락률</th>
					        <th>시가총액</th>
					    </tr>
				    </thead>
				    <c:forEach items="${iSU_NM2}" var="data" varStatus="loop" begin="0" end="9">
				        <tr>
				            <td><c:out value="${basDd2}" /></td>
				            <td><c:out value="${iSU_NM2[loop.index]}" /></td>
				            <td><c:out value="${tDD_CLSPRC2[loop.index]}" /></td>
				            <td id="changeColor" style="color: black;"><c:out value="${cMPPREVDD_PRC2[loop.index]}" /></td>
				            <td id="changeColor" style="color: black;"><c:out value="${fLUC_RT2[loop.index]}" /></td>
				            <td><c:out value="${mKTCAP2[loop.index]}" /></td>
				        </tr>
				    </c:forEach>
				
				    <script>
				        var cells = document.querySelectorAll('#changeColor');
				
				        cells.forEach(function(cell) {
				            var value = parseFloat(cell.innerHTML);
				
				            if (value > 0) {
				                cell.style.color = 'red';
				            } else if (value < 0) {
				                cell.style.color = 'blue';
				            }
				        });
				    </script>
				</table>
		    </form>
	    </div>
    </div>
</main>
</body>
</html>