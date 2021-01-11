<%@ page pageEncoding="utf-8"%>
<script src="https://www.gstatic.com/charts/loader.js"></script>
  <script>
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["Khách hàng", "Doanh thu" ],
        <c:forEach var="item" items="${items}">
        	[`${item.group}`, ${item.sum}],
        </c:forEach>
      ]);

      var view = new google.visualization.DataView(data);
      var options = {
        title: "TOP 10 KHÁCH HÀNG THÂN THIẾT",
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("chart"));
      chart.draw(view, options);
  }
  </script>
<div id="chart" style="width: 100%; height: 500px;"></div>