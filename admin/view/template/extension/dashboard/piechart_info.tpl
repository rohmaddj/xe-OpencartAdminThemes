<div class="row">
	<div class="col-sm-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<script type="text/javascript">
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
				</script>
				<div style="display: flex; flex-direction: row; justify-content: space-between;">
				<div id="bar-10" style="height: 380px; width: 30%;"></div>
				<div id="bar-11" style="height: 380px; width: 30%;"></div>
				<div id="bar-12" style="height: 380px; width: 30%;"></div>
				</div>
			</div>
			<script>
				var xenonPalette = ['#68b828','#7c38bc','#0e62c7','#fcd036','#4fcdfc','#00b19d','#ff6264','#f7aa47'];
				</script>
		</div>
		
	</div>
</div>