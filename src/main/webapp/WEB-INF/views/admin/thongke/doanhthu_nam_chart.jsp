<%@ page pageEncoding="utf-8"%>
<html>
  <head>
    <script src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['NĂM', 'DOANH THU'],
          <c:forEach var="item" items="${items}">
          [`Năm ${item.group}`, ${item.sum}],
          </c:forEach>
        ]);

        var options = {
          title: 'DOANH THU THEO NĂM',
          //curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart'));
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="chart" style="width: 100%; height: 500px"></div>
  </body>
</html>