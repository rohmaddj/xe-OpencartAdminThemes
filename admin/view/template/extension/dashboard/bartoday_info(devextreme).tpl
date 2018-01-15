<div class="row">
	<div class="col-sm-12">

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Today Order</h3>
				<!-- <div class="panel-options">
					<select id="range" class="form-control input-sm">
						        <option value="all" selected="selected"><a href="day">All Order</a></option>
						        <option value="delivery"><a href="week">Delivery</a></option>
						        <option value="pickup" id="pickup"><a href="month">Pickup</a></option>
						        <option value="dinein"><a href="year">Dine-in</a></option>
						        <option value="pos"><a href="year">Point-of-sales</a></option>
				  </select>
				</div> -->
			</div>
			<div class="panel-body">	
				<script type="text/javascript">
					jQuery(document).ready(function($)
					{
						if( ! $.isFunction($.fn.dxChart))
							return;
							
						var dataSource = [
							<?php foreach($report as $v){ ?>

							{quantity: "<?= $v['quantity']?>", state:" <?= $v['state']?>", amount: "<?= $v['amount']?>"},

							<?php } ?>
						];
						
						$("#bar-4").dxChart({
							equalBarWidth: false,
							dataSource: dataSource,
							commonSeriesSettings: {
							    argumentField: "state",
							    type: "bar"
							},
							series: [
							    { valueField: "quantity", name: "Sales Quantity", color: "#5d97f4" },
							    { valueField: "amount", name: "Total Amount", color: "#efab00" }
							],
							legend: {
							    verticalAlignment: "bottom",
							    horizontalAlignment: "center"
							},
							tooltip: {
								enabled: true,
								format: "largeNumber"
							}
							//title: "Percent of Total Energy Production"
						});
					});
				</script>
				<div id="bar-4" style="height: 400px; width: 100%;"></div>
			</div>
		</div>
			
	</div>
</div>