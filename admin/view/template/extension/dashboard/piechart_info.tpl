<!-- embeded flex responsive css for row-->
<style type="text/css">
	/* Variables
================================== */
@bw: 3px; 


/* Tables
================================== */
.Rtable {
  display: flex;
  flex-wrap: wrap;
  margin: 0 0 3em 0;
  padding: 0;
}
.Rtable-cell {
  box-sizing: border-box;
  flex-grow: 1;
  width: 100%;  
  padding: 0.8em 1.2em;
  overflow: hidden; 
  list-style: none;
  border: solid @bw white;
  background: fade(slategrey,20%);
  > h1, > h2, > h3, > h4, > h5, > h6 { margin: 0; }
}

/* Table column sizing
================================== */
.Rtable--2cols > .Rtable-cell  { width: 50%; }
.Rtable--3cols > .Rtable-cell  { width: 33.33%; }
.Rtable--4cols > .Rtable-cell  { width: 25%; }
.Rtable--5cols > .Rtable-cell  { width: 20%; }
.Rtable--6cols > .Rtable-cell  { width: 16.6%; }
</style>

<div class="row">
	<div class="col-sm-12">
		<div class="panel panel-default">
				<!-- <script type="text/javascript">
					jQuery(document).ready(function($)
					{
						if( ! $.isFunction($.fn.dxChart))
							return;
							
						var orderType = [
							{region: "Delivery", val: <?php echo $report['total_amount_delivery']?>},
							{region: "Pickup", val: <?php echo $report['total_amount_pickup']?>},
							{region: "Dine-in", val: <?php echo $report['total_amount_dinein']?>},
							{region: "Point Of Sales", val: <?php echo $report['total_amount_pos']?>}
						], timer;
				
						var receiptBreakdown = [
							{region: "Sales", val: 4119626293},
							{region: "Discount", val: 1012956064},
							{region: "Tax", val: 344124520},
							{region: "Service Charge", val: 590946440}
						], timer;
				
						var paymentMode = [
							{region: "Cash", val: 4119626293},
							{region: "Credit Card", val: 1012956064},
							{region: "NETS", val: 344124520},
							{region: "Paypal", val: 590946440},
							{region: "Voucher", val: 727082222},
							{region: "Coupon", val: 45104756},
							{region: "Online", val: 35104756},
							{region: "Credits", val: 25104756}
						], timer;
						
						//order type chart
						$("#bar-10").dxPieChart({
							dataSource: orderType,
							title: "Order Type",
							tooltip: {
								enabled: true,
								format:"largeNumber",
								customizeText: function() {
									return this.argumentText + "<br/>" + this.valueText;
								}
							},
							size: {
								height: 380
							},
							pointClick: function(point) {
								point.showTooltip();
								clearTimeout(timer);
								timer = setTimeout(function() { point.hideTooltip(); }, 2000);
								$("select option:contains(" + point.argument + ")").prop("selected", true);
							},
							legend: {
								visible: false
							},
							series: [{
								type: "pie",
								argumentField: "region"
							}],
							palette: xenonPalette
						});
				
						// receipt breakdown
						$("#bar-11").dxPieChart({
							dataSource: receiptBreakdown,
							title: "Receipt Breakdown",
							tooltip: {
								enabled: true,
								format:"millions",
								customizeText: function() {
									return this.argumentText + "<br/>" + this.valueText;
								}
							},
							size: {
								height: 380
							},
							pointClick: function(point) {
								point.showTooltip();
								clearTimeout(timer);
								timer = setTimeout(function() { point.hideTooltip(); }, 2000);
								$("select option:contains(" + point.argument + ")").prop("selected", true);
							},
							legend: {
								visible: false
							},
							series: [{
								type: "pie",
								argumentField: "region"
							}],
							palette: xenonPalette
						});
				
						// payment mode
						$("#bar-12").dxPieChart({
							dataSource: paymentMode,
							title: "Payment Mode",
							tooltip: {
								enabled: true,
								format:"millions",
								customizeText: function() {
									return this.argumentText + "<br/>" + this.valueText;
								}
							},
							size: {
								height: 380
							},
							pointClick: function(point) {
								point.showTooltip();
								clearTimeout(timer);
								timer = setTimeout(function() { point.hideTooltip(); }, 2000);
								$("select option:contains(" + point.argument + ")").prop("selected", true);
							},
							legend: {
								visible: false
							},
							series: [{
								type: "pie",
								argumentField: "region"
							}],
							palette: xenonPalette
						});
						 
					});
				</script> -->

				<div class="Rtable Rtable--4cols">

				  <div class="Rtable-cell">
					<canvas id="ordertype" height="300px"></canvas>
				  </div>
				  <div class="Rtable-cell">
					<canvas id="receiptbreakdown" height="300px"></canvas>
				  </div>
				  <div class="Rtable-cell">
				  	<canvas id="paymentmode" height="300px"></canvas>
				  </div>

				</div>

				<!-- <div style="display: flex; flex-direction: row; ">
				<div id="bar-11" style="height:350px;width: 100%;">
					<canvas id="ordertype" height="300px"></canvas>
				</div>
				<div id="bar-11" style="height:200px;width: 100%;">
					<canvas id="receiptbreakdown" height="300px"></canvas>
				</div>
				<div id="bar-12" style="height:200px;width: 100%;">
					<canvas id="paymentmode" height="300px"></canvas>
				</div>
				</div> -->
			<script type="text/javascript">
				var ordertype = {
			        type: 'pie',
			        data: {
			            datasets: [{
			                data: [<?php echo $report['total_amount_delivery']?>,<?php echo $report['total_amount_pickup']?>,<?php echo $report['total_amount_dinein']?>,<?php echo $report['total_amount_pos']?>],
			                backgroundColor: ['red', 'orange', 'blue', 'green']
			            }],
			            labels: [
			                "Delivery",
			                "Pickup",
			                "Dine-in",
			                "Point of Sales"
			            ]
			        },
			        options: {
			            responsive: true,
			            legend: {
			            	display: false
			            },
			        	title: {
			        		display: true,
			        		position: 'top',
			        		fontSize: 20,
			        		text: 'Order Type'
			        	},
			        	layout: {
			        		padding: {
			        			left: 0,
			        			right: 0
			        		}
			        	}
			        }
			    };

			    var receiptbreakdown = {
			        type: 'pie',
			        data: {
			            datasets: [{
			                data: [<?php echo $report['total_amount_delivery']?>,<?php echo $report['total_amount_pickup']?>,<?php echo $report['total_amount_dinein']?>,<?php echo $report['total_amount_pos']?>],
			                backgroundColor: ['red', 'orange', 'blue', 'green']
			            }],
			            labels: [
			                "Delivery",
			                "Pickup",
			                "Dine-in",
			                "Point of Sales"
			            ]
			        },
			        options: {
			            responsive: true,
			            legend: {
			            	display: false
			            },
			        	title: {
			        		display: true,
			        		position: 'top',
			        		fontSize: 20,
			        		text: 'Receipt Breakdown'
			        	}
			        }
			    };

			    var paymentmode = {
			        type: 'pie',
			        data: {
			            datasets: [{
			                data: [<?php echo $report['total_amount_delivery']?>,<?php echo $report['total_amount_pickup']?>,<?php echo $report['total_amount_dinein']?>,<?php echo $report['total_amount_pos']?>],
			                backgroundColor: ['red', 'orange', 'blue', 'green']
			            }],
			            labels: [
			                "Delivery",
			                "Pickup",
			                "Dine-in",
			                "Point of Sales"
			            ]
			        },
			        options: {
			            responsive: true,
			            legend: {
			            	display: false
			            },
			        	title: {
			        		display: true,
			        		position: 'top',
			        		fontSize: 20,
			        		text: 'Payment Mode'
			        	}
			        }
			    };
			</script>
			<!-- <script>
				var xenonPalette = ['#68b828','#7c38bc','#0e62c7','#fcd036','#4fcdfc','#00b19d','#ff6264','#f7aa47'];
				</script> -->
		</div>
		
	</div>
</div>