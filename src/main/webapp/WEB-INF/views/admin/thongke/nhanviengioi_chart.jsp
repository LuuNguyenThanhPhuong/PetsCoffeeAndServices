<%@ page pageEncoding="utf-8"%>
<script src="https://www.gstatic.com/charts/loader.js"></script>
  <script>
    google.charts.load("current", {packages:['corechart', 'bar']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["Nhân Viên", "Doanh thu" ],
        <c:forEach var="item" items="${items}">
        	[`${item.group}`, ${item.sum}],
        </c:forEach>
      ]);

      var view = new google.visualization.DataView(data);
      var options = {
        title: "TOP 10 NHÂN VIÊN SIÊNG NĂNG",
      };
      var chart = new google.visualization.BarChart(document.getElementById("chart"));
      chart.draw(view, options);
  }
  </script>
<div id="chart" style="width: 100%; height: 500px;"></div>