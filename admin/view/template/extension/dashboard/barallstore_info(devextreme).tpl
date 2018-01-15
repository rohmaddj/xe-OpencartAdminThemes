<div class="row">
	<div class="col-sm-12">

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Bar Store Order Summary</h3>
				<div class="panel-options">
				<select id="range2" class="form-control input-sm">
		        <option value='{"type": "allstore", "store_id": ""}' selected="selected"><a href="allstore">All Store</a></option>
		        <option value='{"type": "uniquestore", "store_id": "0"}'><a href="allstore">Official store</a></option>
		        <?php foreach($store as $v){?>
		        <option value='{"type": "uniquestore", "store_id": "<?php echo $v['store_id'];?>"}'><a href="uniquestore"><?= $v['name'];?></a></option>
		        <?php }?>
				</select>
				</div>
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
						
						$("#bar-3").dxChart({
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
				<div id="bar-3" style="height: 400px; width: 100%;"></div>
			</div>
		</div>
			
	</div>
</div>
<script type="text/javascript"><!--
  $('#range2').on('change', function(e) {
    e.preventDefault();
    var selectedType = JSON.parse($('#range2').val());
    
    $(this).parent().parent().find('li').removeClass('active');
    
    $(this).parent().addClass('active');
    
    $.ajax({
      type: 'get',
      url: 'index.php?route=extension/dashboard/barallstore/barallstore&token=<?php echo $token; ?>&store_id='+selectedType.store_id+'&range2=' + selectedType.type,
      dataType: 'json',
      success: function(json) {
      	var dataSource = json.report;
						
		$("#bar-3").dxChart({
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
			},
		});
      },
    error: function(xhr, ajaxOptions, thrownError) {
    	alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
    });
  });
  $('#range2 .active a').trigger('click');
</script>