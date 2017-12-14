/**
 * Base5Builder - Start
 */


/* Get URL Parameters */
var getUrlParameter = function getUrlParameter(sParam) {
	var sPageURL = decodeURIComponent(window.location.search.substring(1)),
	sURLVariables = sPageURL.split('&'),
	sParameterName,
	i;

	for (i = 0; i < sURLVariables.length; i++) {
		sParameterName = sURLVariables[i].split('=');

		if (sParameterName[0] === sParam) {
			return sParameterName[1] === undefined ? true : sParameterName[1];
		}
	}
};

// Token
var token = getUrlParameter('token');

 $(document).ready(function(){


 	/* Flot */
 	if($('#chart-sale').length){
	 	$('#range a').on('click', function(e) {
	 		e.preventDefault();

	 		$(this).parent().parent().find('li').removeClass('active');

	 		$(this).parent().addClass('active');

	 		$.ajax({
	 			type: 'get',
	 			url: 'index.php?route=extension/dashboard/chart/chart&token=' + token + '&range=' + $(this).attr('href'),
	 			dataType: 'json',
	 			success: function(json) {
	 				if(typeof json['order'] == 'undefined'){
	 					return false;
	 				}

	 				var option = {	
						series: {
							lines: { 
								show: true,
								fill: true
							},
							points: {
								show: true
							},
							shadowSize: 0	
						},
						grid: {
							verticalLines: true,
							hoverable: true,
							clickable: true,
							tickColor: "#d5d5d5",
							borderWidth: 1,
							color: '#fff'
						},
						colors: ["rgba(38, 185, 154, 0.38)", "rgba(3, 88, 106, 0.38)"],
						legend: {
							show: true
						},
						xaxis: {
							ticks: json.xaxis
						},
						tooltip: true,
						tooltipOpts: {
							content: "'%s': <b>%y</b>",
							shifts: {
								x: -60,
								y: 25
							}
						}
					}

					$.plot($('#chart-sale'), [json.order, json.customer], option);
	 				

	 			},
	 			error: function(xhr, ajaxOptions, thrownError) {
	 				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	 			}
	 		});
	 	});

	 	$('#range .active a').trigger('click');

 
 	/* Map */
 	if($('#vmap').length){
		$.ajax({
			url: 'index.php?route=extension/dashboard/map/map&token=' + token,
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
					color: 'rgba(38, 185, 154, 0.38)',
					hoverOpacity: 0.7,
					selectedColor: '#666666',
					enableZoom: true,
					showTooltip: true,
					scaleColors: ['#b6d6ff', '#337AB7'],
					values: data,
					normalizeFunction: 'polynomial',
					onLabelShow: function(event, label, code) {

						if (json[code]) {
							label.html('<strong>' + label.text() + '</strong><br />' + 'Orders' + ': ' + json[code]['total'] + '<br />' + 'Sales' + ': '+ json[code]['amount']);
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
 	}

 	/* Sidebar - Donut */
 	if($('#stats-canvas').length){

 		var entryLabel1 = $('#stats-canvas').closest('#stats').attr('data-entry-1-label');
 		var entryValue1 = $('#stats-canvas').closest('#stats').attr('data-entry-1-value');

 		var entryLabel2 = $('#stats-canvas').closest('#stats').attr('data-entry-2-label');
 		var entryValue2 = $('#stats-canvas').closest('#stats').attr('data-entry-2-value');

 		var entryLabel3 = $('#stats-canvas').closest('#stats').attr('data-entry-3-label');
 		var entryValue3 = $('#stats-canvas').closest('#stats').attr('data-entry-3-value');

	 	var options = {
	 		legend: false,
	 		responsive: false
	 	};

	 	new Chart(document.getElementById("stats-canvas"), {
	 		type: 'doughnut',
	 		tooltipFillColor: "rgba(51, 51, 51, 0.55)",
	 		data: {
	 			labels: [
	 			entryLabel1 + '\n(%)',
	 			entryLabel2 + '\n(%)',
	 			entryLabel3 + '\n(%)'
	 			],
	 			datasets: [{
	 				data: [entryValue1, entryValue2, entryValue3],
	 				backgroundColor: [
	 				"#26B99A",
	 				"#F4852F",
	 				"#3498DB"
	 				],
	 				hoverBackgroundColor: [
	 				"#66DFC6",
	 				"#F9BE90",
	 				"#8BC4EA"
	 				],
	 				borderWidth: 2
	 			}]
	 		},
	 		options: options
	 	});
 	}
 });

/**
 * Copied from default OpenCart js file
 */

// Autocomplete
(function($) {
	$.fn.autocomplete = function(option) {
		return this.each(function() {
			var $this = $(this);
			var $dropdown = $('<ul class="dropdown-menu" />');
			
			this.timer = null;
			this.items = [];

			$.extend(this, option);

			$this.attr('autocomplete', 'off');

			// Focus
			$this.on('focus', function() {
				this.request();
			});

			// Blur
			$this.on('blur', function() {
				setTimeout(function(object) {
					object.hide();
				}, 200, this);
			});

			// Keydown
			$this.on('keydown', function(event) {
				switch(event.keyCode) {
					case 27: // escape
						this.hide();
						break;
					default:
						this.request();
						break;
				}
			});

			// Click
			this.click = function(event) {
				event.preventDefault();

				var value = $(event.target).parent().attr('data-value');

				if (value && this.items[value]) {
					this.select(this.items[value]);
				}
			}

			// Show
			this.show = function() {
				var pos = $this.position();

				$dropdown.css({
					top: pos.top + $this.outerHeight(),
					left: pos.left
				});

				$dropdown.show();
			}

			// Hide
			this.hide = function() {
				$dropdown.hide();
			}

			// Request
			this.request = function() {
				clearTimeout(this.timer);

				this.timer = setTimeout(function(object) {
					object.source($(object).val(), $.proxy(object.response, object));
				}, 200, this);
			}

			// Response
			this.response = function(json) {
				var html = '';
				var category = {};
				var name;
				var i = 0, j = 0;

				if (json.length) {
					for (i = 0; i < json.length; i++) {
						// update element items
						this.items[json[i]['value']] = json[i];

						if (!json[i]['category']) {
							// ungrouped items
							html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
						} else {
							// grouped items
							name = json[i]['category'];
							if (!category[name]) {
								category[name] = [];
							}

							category[name].push(json[i]);
						}
					}

					for (name in category) {
						html += '<li class="dropdown-header">' + name + '</li>';

						for (j = 0; j < category[name].length; j++) {
							html += '<li data-value="' + category[name][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[name][j]['label'] + '</a></li>';
						}
					}
				}

				if (html) {
					this.show();
				} else {
					this.hide();
				}

				$dropdown.html(html);
			}

			$dropdown.on('click', '> li > a', $.proxy(this.click, this));
			$this.after($dropdown);
		});
	}
})(window.jQuery);


$(document).ready(function() {
	// Tooltip remove fixed
	$(document).on('click', '[data-toggle=\'tooltip\']', function(e) {
		$('body > .tooltip').remove();
	});

	// Image Manager
	$(document).on('click', 'a[data-toggle=\'image\']', function(e) {
		var $element = $(this);
		var $popover = $element.data('bs.popover'); // element has bs popover?
		
		e.preventDefault();

		// destroy all image popovers
		$('a[data-toggle="image"]').popover('destroy');

		// remove flickering (do not re-add popover when clicking for removal)
		if ($popover) {
			return;
		}

		$element.popover({
			html: true,
			placement: 'right',
			trigger: 'manual',
			content: function() {
				return '<button type="button" id="button-image" class="btn btn-primary"><i class="fa fa-pencil"></i></button> <button type="button" id="button-clear" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>';
			}
		});

		$element.popover('show');

		$('#button-image').on('click', function() {
			var $button = $(this);
			var $icon   = $button.find('> i');
			
			$('#modal-image').remove();

			$.ajax({
				url: 'index.php?route=common/filemanager&token=' + token + '&target=' + $element.parent().find('input').attr('id') + '&thumb=' + $element.attr('id'),
				dataType: 'html',
				beforeSend: function() {
					$button.prop('disabled', true);
					if ($icon.length) {
						$icon.attr('class', 'fa fa-circle-o-notch fa-spin');
					}
				},
				complete: function() {
					$button.prop('disabled', false);
					if ($icon.length) {
						$icon.attr('class', 'fa fa-pencil');
					}
				},
				success: function(html) {
					$('body').append('<div id="modal-image" class="modal">' + html + '</div>');

					$('#modal-image').modal('show');
				}
			});

			$element.popover('destroy');
		});

		$('#button-clear').on('click', function() {
			$element.find('img').attr('src', $element.find('img').attr('data-placeholder'));

			$element.parent().find('input').val('');

			$element.popover('destroy');
		});
	});

	// tooltips on hover
	$('[data-toggle=\'tooltip\']').tooltip({container: 'body', html: true});

	// Makes tooltips work on ajax generated content
	$(document).ajaxStop(function() {
		$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
	});

	// https://github.com/opencart/opencart/issues/2595
	$.event.special.remove = {
		remove: function(o) {
			if (o.handler) {
				o.handler.apply(this, arguments);
			}
		}
	}

	$('[data-toggle=\'tooltip\']').on('remove', function() {
		$(this).tooltip('destroy');
	});
});