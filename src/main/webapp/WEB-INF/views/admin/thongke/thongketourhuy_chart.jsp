<%@ page pageEncoding="utf-8"%>
<html>
  <head>
    <script src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['THÁNG', 'TOUR ĐÃ HỦY'],
          <c:forEach var="item" items="${items}">
          [`Thg ${item.group}`, ${item.sum}],
          </c:forEach>
        ]);

        var options = {
          title: 'CÁC TOUR ĐÃ HỦY',
          //curveType: 'function',
          //legend: { position: 'bottom' }
          hAxis: {title: 'Tháng',  titleTextStyle: {color: '#123'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('charthuy'));
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="charthuy" style="width: 100%; height: 500px ; 	fill: '#3396cc'"></div>
  </body>
</html>