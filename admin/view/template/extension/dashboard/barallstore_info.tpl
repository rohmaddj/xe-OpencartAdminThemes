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
			<!-- new bar chart.js -->
			<div id="container" style="width: 100%;">
        		<canvas id="canvas1"></canvas>
			</div>
			<script type="text/javascript">
				var allstoredata = 
					{
			            labels: [
				        	<?php foreach($report as $v) { ?>
				    			"<?php echo $v['state'];?>",
				    		<?php } ?>
				    	],
			            datasets: [{
			            label: 'Sales',
			            yAxisID: 'bs-1',
			            backgroundColor: 'rgba(153, 102, 255, 1)',
			            data: [
				        	<?php foreach($report as $v) { ?>
				    			"<?php echo $v['quantity'];?>",
				    		<?php } ?>
				    	]}, {
			            label:'Amount',
			            yAxisID: 'bs-2',
			            backgroundColor: 'rgba(255, 159, 64, 1)',
			            data: [
				        	<?php foreach($report as $v) { ?>
				    			"<?php echo $v['amount'];?>",
				    		<?php } ?>
				    	]
			        }]
			    };

			</script>
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
      	var qty = [];
      	var label = [];
      	var amount = [];

      	json.report.forEach((value) => {
      		label.push(value.state);
      		qty.push(value.quantity);
      		amount.push(value.amount);
      	});

      	myBar1.data.labels = label;
      	myBar1.data.datasets[0].data = qty;
      	myBar1.data.datasets[1].data = amount;
		myBar1.update();

      },
    error: function(xhr, ajaxOptions, thrownError) {
    	alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
    });
  });
  $('#range2 .active a').trigger('click');
</script>