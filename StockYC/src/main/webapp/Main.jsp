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
<c:set var="dataList" value="${cLSPRC_IDX}" />
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      
      function drawChart() {
    	
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Kospi'],
          ['2020',  1000],
          ['2021',  1170],
          ['2022',   660],
          ['2023',  1030]
        ]); 
        
        var options = {
          title: 'Kospi',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart1'));

        chart.draw(data, options);
      }
    </script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Kosdaq'],
          ['2020',  900],
          ['2021',  950],
          ['2022',  1200],
          ['2023',  1100]
        ]);
        
        var options = {
          title: 'Kosdaq',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart2'));

        chart.draw(data, options);
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
    padding: 20px;
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
      <!-- 주요 증시 정보 -->
	<div class="card my-3">
		증권정보
	</div>
      <div style="display: flex; flex-direction: row; border: 1px solid #ccc;">
		<div id="curve_chart1" style="width: 900px; height: 500px"></div>
		<div id="curve_chart2" style="width: 900px; height: 500px"></div> 
      </div>
	<div class="card my-3">
		상세검색 Kospi
	</div>
      <form method="get" action="kospi.do" onsubmit="return validateForm()" style="overflow: auto">
		        <table>
						<tr>
					    	<th>기준일자</th>
					    	<c:forEach items="${basDd}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>계열구분</th>
					    	<c:forEach items="${iDX_CLSS}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
					    <tr>
					    	<th>지수명</th>
					    	<c:forEach items="${iDX_NM}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>종가</th>
					    	<c:forEach items="${cLSPRC_IDX}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>대비</th>
					    	<c:forEach items="${cMPPREVDD_IDX}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>등락률</th>
					    	<c:forEach items="${fLUC_RT}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>시가</th>
					    	<c:forEach items="${oPNPRC_IDX}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>고가</th>
					    	<c:forEach items="${hGPRC_IDX}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>저가</th>
					    	<c:forEach items="${lWPRC_IDX}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>거래량</th>
					    	<c:forEach items="${aCC_TRDVOL}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>거래대금</th>
					    	<c:forEach items="${aCC_TRDVAL}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>상장시가총액</th>
					    	<c:forEach items="${mKTCAP}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
			        </table>
			        <input type="text" id="dayInput1" name="day">
			        <button type="submit">새로고침</button>
			    </form>
			    <div class="card my-3">
					상세검색 Kosdaq
				</div>
			    <form method="get" action="kosdaq.do" onsubmit="return validateForm2()" style="overflow: auto">
		        <table>
						<tr>
					    	<th>기준일자</th>
					    	<c:forEach items="${basDd2}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>계열구분</th>
					    	<c:forEach items="${iDX_CLSS2}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
					    <tr>
					    	<th>지수명</th>
					    	<c:forEach items="${iDX_NM2}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>종가</th>
					    	<c:forEach items="${cLSPRC_IDX2}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>대비</th>
					    	<c:forEach items="${cMPPREVDD_IDX2}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>등락률</th>
					    	<c:forEach items="${fLUC_RT2}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>시가</th>
					    	<c:forEach items="${oPNPRC_IDX2}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>고가</th>
					    	<c:forEach items="${hGPRC_IDX2}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>저가</th>
					    	<c:forEach items="${lWPRC_IDX2}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>거래량</th>
					    	<c:forEach items="${aCC_TRDVOL2}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>거래대금</th>
					    	<c:forEach items="${aCC_TRDVAL2}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
						<tr>
					    	<th>상장시가총액</th>
					    	<c:forEach items="${mKTCAP2}" var="data">
					            <td><c:out value="${data}" /></td>
							</c:forEach>
						</tr>
			        </table>
			        <input type="text" id="dayInput2" name="day">
			        <button type="submit">새로고침</button>
			    </form>
   </main> 
</body>
</html>