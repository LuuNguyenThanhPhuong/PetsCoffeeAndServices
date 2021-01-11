<%@ page pageEncoding="utf-8"%>

<html>
<head>
<script	src="https://www.gstatic.com/charts/loader.js"></script>
<script>
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      var chart_data = [
          ['Loại', 'Tổng giá trị'],
          <c:forEach var="item" items="${items}">
          	[`${item.group}`, ${item.sum}],
          </c:forEach>
        ];
      function drawChart() {

        var data = google.visualization.arrayToDataTable(chart_data);

        var options = {
          title: 'THỐNG KÊ HÀNG TỒN KHO'
        };
        var chart = new google.visualization.PieChart(document.getElementById('chart'));
        chart.draw(data, options);
      }
    </script>
</head>
<body>
	<div id="chart" style="width: 900px; height: 500px;"></div>
</body>
</html>