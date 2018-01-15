<div class="row">
	<div class="col-sm-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Bar Order Summary</h3>
				<div class="panel-options">
				<select id="range1" class="form-control input-sm">
		        <option value="all" selected="selected"><a href="all">All Order</a></option>
		        <option value="delivery"><a href="delivery">Delivery</a></option>
		        <option value="pickup"><a href="pickup">Pickup</a></option>
		        <option value="dinein"><a href="dinein">Dine-in</a></option>
		        <option value="pos"><a href="pos">Point-of-sales</a></option>
				</select>
				</div>
			</div> 
			<!-- new bar chart.js -->
			<div id="container" style="width: 100%;">
        		<canvas id="canvas"></canvas>
			</div>
			<script type="text/javascript">
				var barallorderdata = 
				{
		            datasets: [{
			            label: 'Sales',
			            yAxisID: 'bo-1',
			            backgroundColor: 'rgba(153, 102, 255, 1)',
			            data: [
				        	<?php foreach($report as $v) { ?>
				    			"<?php echo $v['quantity'];?>",
				    		<?php } ?>
			    		]
			    	}, {
			            label:'Amount',
			            yAxisID: 'bo-2',
			            backgroundColor: 'rgba(255, 159, 64, 1)',
			            data: [
				        	<?php foreach($report as $v) { ?>
				    			"<?php echo $v['amount'];?>",
				    		<?php } ?>
			    		]
		        	}],
		        	labels: [
			        	<?php foreach($report as $v) { ?>
			    			"<?php echo $v['state'];?>",
			    		<?php } ?>
			    	],
			    };
			</script>

			<!-- <div class="panel-body">	
				<script type="text/javascript">
					jQuery(document).ready(function($)
					{
						if( ! $.isFunction($.fn.dxChart))
							return;
							
						var dataSource = [
						<?php foreach($report as $v){ ?>
			
							{state:" <?= $v['state']?>", quantity: "<?= $v['quantity']?>", amount: "<?= $v['amount']?>"},
			
						<?php } ?>
			
						];
						console.log(dataSource);
						
						$("#bar-2").dxChart({
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
							/*tooltip: {
								enabled: true,
								customizeText: function () { return '<br/>Sales: <?php foreach($report as $v){ }?>'}
							}*/
							tooltip: {
								enabled: true,
								format: "largeNumber"
							}
							//title: "Percent of Total Energy Production"
						});
					});
				</script>
				<div id="bar-2" style="height: 400px; width: 100%;"></div>
			</div> -->
		</div>
			
	</div>
</div>
<script type="text/javascript"><!--
  $('#range1').on('change', function(e) {
    e.preventDefault();
    
    $(this).parent().parent().find('li').removeClass('active');
    
    $(this).parent().addClass('active');
    
    $.ajax({
      type: 'get',
      url: 'index.php?route=extension/dashboard/barallorder/barallorder&token=<?php echo $token; ?>&range1=' + $('#range1').val(),
      dataType: 'json',
      success: function(json) {

      	var qty = [];
      	var label = [];
      	var amount = [];

      	json.report.forEach((value) => {
      		label.push(value.state);
      		qty.push(value.quantity);
      		amount.push(value.amount);
      	});

      	myBar.data.labels = label;
      	myBar.data.datasets[0].data = qty;
      	myBar.data.datasets[1].data = amount;
		myBar.update();

      },
          error: function(xhr, ajaxOptions, thrownError) {
             alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
    });
  });
  $('#range1 .active a').trigger('click');
</script> 