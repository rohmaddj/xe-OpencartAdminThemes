<script type="text/javascript">
	window.onload = function() {
		// bar all order
	    var ctx = document.getElementById("canvas").getContext("2d");
	    window.myBar = new Chart(ctx, {
	        type: 'bar',
	        data: barallorderdata,
	        options: {
	            responsive: true,
	            legend: {
	                position: 'top',
	            },
	            title: {
	                display: false,
	                text: 'Bar Chart'
	            },
	            scales: {
		        yAxes: [{
		        	position: 'left',
		        	id: 'bo-1',
		            ticks: {
		                max: 30,
		                min: 0,
		                stepSize: 5
		            }
		        }, {
		        	position: 'right',
		        	id: 'bo-2',
		        	ticks: {
		        		max: 3000,
		        		min: 0,
		        		stepSize: 500
		        	}
		        }]
		    	}

	        }
	    });
/*	    elements: {
	        		line: {
	        			fill: false
	        		}
	        	},
	        	scales: {
	            	xAxes: [{
	            		display:true,
	            		gridLines: {
	            			display: false
	            		},
	            		labels: {
	            			show: true
	            		},
	            	}],
	            	yAxes: [{
	            		type: 'linier',
	            		display: true,
	            		position: 'left',
	            		id: 'y-axis-1',
	            		gridLines: {
	            			display: false
	            		},
	            		labels: {
	            			show: true
	            		}
	            	}, {
	            		type: 'linier',
	            		display: true,
	            		position: 'right',
	            		id: 'y-axis-2',
	            		gridLines: {
	            			display: false
	            		},
	            		labels: {
	            			show: true
	            		}
	            	}]
	            },*/
	    // bar all store
	    var ctx1 = document.getElementById("canvas1").getContext("2d");
	    window.myBar1 = new Chart(ctx1, {
	        type: 'bar',
	        data: allstoredata,
	        options: {
	            responsive: true,
	            legend: {
	                position: 'top',
	            },
	            title: {
	                display: false,
	                text: 'Bar Chart'
	            },
	            scales: {
		        yAxes: [{
		        	position: 'left',
		        	id: 'bs-1',
		            ticks: {
		                max: 50,
		                min: 0,
		                stepSize: 10
		            }
		        }, {
		        	position: 'right',
		        	id: 'bs-2',
		        	ticks: {
		        		max: 5000,
		        		min: 0,
		        		stepSize: 1000
		        	}
		        }]
		    	}
	        },
	    });
	    // bar today
	    var ctx2 = document.getElementById("canvas2").getContext("2d");
	    window.myBar2 = new Chart(ctx2, {
	        type: 'bar',
	        data: bartoday,
	        options: {
	            responsive: true,
	            legend: {
	                position: 'top',
	            },
	            title: {
	                display: false,
	                text: 'Bar Chart'
	            },
	            scales: {
		        yAxes: [{
		        	position: 'left',
		        	id: 'bt-1',
		            ticks: {
		                max: 50,
		                min: 0,
		                stepSize: 10
		            }
		        }, {
		        	position: 'right',
		        	id: 'bt-2',
		        	ticks: {
		        		max: 5000,
		        		min: 0,
		        		stepSize: 1000
		        	}
		        }]
		    	}
	        }
	    });
	    // pie order type
	    var ctx3 = document.getElementById("ordertype").getContext("2d");
        window.myPie = new Chart(ctx3, ordertype);

        // pie receipt breakdown
	    var ctx4 = document.getElementById("receiptbreakdown").getContext("2d");
        window.myPie = new Chart(ctx4, receiptbreakdown);

        // pie payment mode
	    var ctx5 = document.getElementById("paymentmode").getContext("2d");
        window.myPie = new Chart(ctx5, paymentmode);
	};
</script>
<footer class="main-footer sticky footer-type-1">
				
				<div class="footer-inner">
				
					<!-- Add your copyright text here -->
					<div class="footer-text">
					<strong><?php echo $text_footer; ?></strong><?php echo $text_version; ?>
					</div>
				</div>
</footer>
</div>

	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="view/assets/js/datatables/dataTables.bootstrap.css">
	<link rel="stylesheet" href="view/assets/js/daterangepicker/daterangepicker-bs3.css">
	<!-- Bottom Scripts -->
	<script src="view/assets/js/bootstrap.min.js"></script>
	<script src="view/assets/js/TweenMax.min.js"></script>
	<script src="view/assets/js/resizeable.js"></script>
	<script src="view/assets/js/joinable.js"></script>
	<script src="view/assets/js/xenon-api.js"></script>
	<script src="view/assets/js/xenon-toggles.js"></script>
	<script src="view/assets/js/moment.min.js"></script>
	<script src="view/assets/js/datatables/js/jquery.dataTables.min.js"></script>

	<!-- Imported scripts on this page -->
	<script src="view/assets/js/daterangepicker/daterangepicker.js"></script>
	<script src="view/assets/js/datepicker/bootstrap-datepicker.js"></script>
	<script src="view/assets/js/datatables/dataTables.bootstrap.js"></script>
	<script src="view/assets/js/datatables/yadcf/jquery.dataTables.yadcf.js"></script>
	<script src="view/assets/js/datatables/tabletools/dataTables.tableTools.min.js"></script>
	<script src="view/assets/js/xenon-widgets.js"></script>
	<script src="view/assets/js/devexpress-web-14.1/js/globalize.min.js"></script>
	<script src="view/assets/js/devexpress-web-14.1/js/dx.chartjs.js"></script>
	<script src="view/assets/js/toastr/toastr.min.js"></script>

	<!-- new chart js-->
	<script src="view/assets/js/chart/Chart.js"></script>
	<script src="view/assets/js/chart/Chart.min.js"></script>

	<!-- JavaScripts initializations and stuff -->
	<script src="view/assets/js/xenon-custom.js"></script>
</body></html>