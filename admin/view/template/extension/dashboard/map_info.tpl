<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><i class="fa-globe"></i> <?php echo $heading_title; ?></h3>
  </div>
  <div class="panel-body">
    <div id="vmap" data-label-orders='<?php echo $text_order; ?>' data-label-sales='<?php echo $text_sale; ?>' style="width: 100%; height: 260px;"></div>
  </div>
</div>
<link type="text/css" href="view/javascript/jquery/jqvmap/jqvmap.css" rel="stylesheet" media="screen" />
<script type="text/javascript" src="view/javascript/jquery/jqvmap/jquery.vmap.js"></script> 
<script type="text/javascript" src="view/javascript/jquery/jqvmap/maps/jquery.vmap.world.js"></script> 
<script type="text/javascript"><!--

$(document).ready(function() {
	$.ajax({
		url: 'index.php?route=extension/dashboard/map/map&token=<?php echo $token; ?>',
		dataType: 'json',
		success: function(json) {
			data = [];
						
			for (i in json) {
				data[i] = json[i]['total'];
			}

			var labelOrders = $('#vmap').data('label-orders');
			var labelSales = $('#vmap').data('label-sales');
					
			$('#vmap').vectorMap({
				map: 'world_en',
				backgroundColor: '#FFFFFF',
				borderColor: '#FFFFFF',
				color: '#00b19d',
				hoverOpacity: 0.7,
				selectedColor: '#666666',
				enableZoom: true,
				showTooltip: true,
				scaleColors: ['#4fc0f9', '#337AB7'],
				values: data,
				normalizeFunction: 'polynomial',
				onLabelShow: function(event, label, code) {
					console.log(labelOrders);
					if (json[code]) {
							label.html('<strong>' + label.text() + '</strong><br />' + labelOrders + ': ' + json[code]['total'] + '<br />' + labelSales + ': '+ json[code]['amount']);
						}else{
							label.html('<strong>' + label.text() + '</strong>');
						}
				}
			});			
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});			
});
 </script>