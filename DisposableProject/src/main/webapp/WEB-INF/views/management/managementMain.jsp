<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
.managementMContainer{
display: flex;flex-direction: row;height: 100%;align-items: center;justify-content: center;
}
.managementMContainer .innerContainer{
display: flex;justify-content: space-around;align-items: center;height: 30%;min-width: 600px
}
.totalCount{
width: 150px; height: 150px; border: 1px solid black;border-radius: 50%;display: flex;justify-content: center;align-items: center;flex-direction: column;
}

</style>
<div class="managementMContainer">
	<div>
		<canvas id="myChart"  style="height:60vh; width:40vw"></canvas>
	</div>
	<div>
		<canvas id="myChart2"  style="height:60vh; width:40vw"></canvas>
	</div>
</div>

<script>
var shopSalesInfo =JSON.parse('${shopSalesInfo}'); 
console.log(shopSalesInfo)
var dates = []
var sales = []
var orders = []
for(var i=0;i<shopSalesInfo.length;i++){
	dates.push(shopSalesInfo[i].ORDERDATE)
	sales.push(shopSalesInfo[i].TOTAL)
	orders.push(shopSalesInfo[i].ORDERCOUNT)
}
const data = {
		  labels: dates,
		  datasets: [{
		    type: 'bar',
		    label: 'Bar Dataset',
		    data:sales,
		    borderColor: 'rgb(255, 99, 132)',
		    backgroundColor: 'rgba(255, 99, 132, 0.2)'
		  }]
		};
const data2 = {
		  labels: dates,
		  datasets: [ {
		    type: 'line',
		    label: 'Line Dataset',
		    data: orders,
		    fill: false,
		    borderColor: 'rgb(54, 162, 235)'
		  }]
		};		
const config = {
		  type: 'scatter',
		  data: data,
		  options: {
		    scales: {
		      y: {
		        beginAtZero: true
		      }
		    }
		  }
		};
const config2 = {
		  type: 'scatter',
		  data: data2,
		  options: {
		    scales: {
		      y: {
		        beginAtZero: true
		      }
		    }
		  }
		};


  
  
  var ctx = document.getElementById('myChart');
  var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
          labels: dates,
          datasets: [{
              label: '날짜 별 총 매출',
              data: sales,
              backgroundColor: [
                  'rgba(255, 99, 132, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(255, 206, 86, 0.2)',
                  'rgba(75, 192, 192, 0.2)',
                  'rgba(153, 102, 255, 0.2)',
                  'rgba(255, 159, 64, 0.2)'
              ],
              borderColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)'
              ],
              borderWidth: 2
          }]
      },
      options: {
          responsive: false,
          scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero: true
                  }
              }]
          },
      }
  });
  var ctx2 = document.getElementById('myChart2');
  var myChart2 = new Chart(ctx2, {
      type: 'line',
      data: {
          labels: dates,
          datasets: [{
              label: '날짜별 주문 건',
              data: orders,
              backgroundColor: [
                  'rgba(255, 99, 132, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(255, 206, 86, 0.2)',
                  'rgba(75, 192, 192, 0.2)',
                  'rgba(153, 102, 255, 0.2)',
                  'rgba(255, 159, 64, 0.2)'
              ],
              borderColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)'
              ],
              borderWidth: 2
          }]
      },
      options: {
          responsive: false,
          scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero: true
                  }
              }]
          },
      }
  });
  
</script>
