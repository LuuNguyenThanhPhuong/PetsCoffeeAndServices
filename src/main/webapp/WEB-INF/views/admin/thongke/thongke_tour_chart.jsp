<%@ page pageEncoding="utf-8"%>
<html>
  <head>
    <script src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Tên Tour', 'Doanh thu'],
          <c:forEach var="item" items="${items}">
          [`${item.group}`, ${item.sum}],
          </c:forEach>
        ]);

        var options = {
          title: 'DOANH THU THEO TOUR',
          legend: 'none',
          pieSliceText: 'label',
          
          slices: {  4: {offset: 0.2},
                    12: {offset: 0.3},
                    14: {offset: 0.4},
                    15: {offset: 0.5},
          },
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