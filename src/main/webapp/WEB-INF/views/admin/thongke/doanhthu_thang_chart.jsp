<%@ page pageEncoding="utf-8"%>
<html>
  <head>
    <script src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['THÁNG', 'DOANH THU'],
          <c:forEach var="item" items="${items}">
          [`Thg ${item.group}`, ${item.sum}],
          </c:forEach>
        ]);

        var options = {
          title: 'DOANH THU THEO THÁNG',
          //curveType: 'function',
          //legend: { position: 'bottom' }
          hAxis: {title: 'Tháng',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart'));
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="chart" style="width: 100%; height: 500px"></div>
  </body>
</html>