<!-- Xenon Block Counter Widget -->
      <div class="row">
      <div class="col-xs-6"></div>
      <div class="col-xs-2"></div>
      <div class="col-xs-2"></div>
      <div class="col-xs-2" style="margin-bottom: 10px">
      <select id="range" class="form-control input-sm">
        <option value="day"><a href="day">Today</a></option>
        <option value="week" selected="selected"><a href="week">Last 7 Days</a></option>
        <option value="month"><a href="month">Last 30 Days</a></option>
        <option value="this-month"><a href="year">This Month</a></option>
        <option value="last-month"><a href="year">Last Month</a></option>
        <option value="custom"><a href="year">Custom Date</a></option>
      </select>
      </div>

        <div class="col-sm-3">
        
          <div class="xe-widget xe-counter-block" data-count=".num" data-from="0" data-to="<?php echo $report['totaldelivery'];?>" data-suffix="" data-duration="2">
            <div class="xe-upper">
              
              <div class="xe-icon">
                <i class="linecons-truck"></i>
              </div>
              <div class="xe-label">
                <strong class="num" id="totaldelivery"><?php echo $report['totaldelivery'];?></strong>
                <span>Delivery</span>
              </div>
              
            </div>
            <div class="xe-lower">
              <div class="border"></div>
              
              <span>Amount</span>
              <div id="total_amount_delivery">$<?php echo $report['total_amount_delivery'];?></div>
            </div>
          </div>
          
        </div>
        <div class="col-sm-3">
        
          <div class="xe-widget xe-counter-block xe-counter-block-purple" data-count=".num" data-from="0" data-to="<?php echo $report['totalpickup'];?>" data-duration="3">
            <div class="xe-upper">
              
              <div class="xe-icon">
                <i class="linecons-location"></i>
              </div>
              <div class="xe-label">
                <strong class="num" id="totalpickup"><?php echo $report['totalpickup'];?></strong>
                <span>Pickup</span>
              </div>
              
            </div>
            <div class="xe-lower">
              <div class="border"></div>
              
              <span>Amount</span>
              <div id="total_amount_pickup">$<?php echo $report['total_amount_pickup'];?></div>
            </div>
          </div>
          
        </div>
        <div class="col-sm-3">
        
          <div id="count_dinein" class="xe-widget xe-counter-block xe-counter-block-blue" data-suffix="" data-count=".num" data-from="0" data-to="<?php echo $report['totaldinein'];?>" data-duration="4" data-easing="false">
            <div class="xe-upper">
              
              <div class="xe-icon">
                <i class="linecons-food"></i>
              </div>
              <div class="xe-label">
                <strong class="num" id="totaldinein"><?php echo $report['totaldinein'];?></strong>
                <span>Dine-in</span>
              </div>
              
            </div>
            <div class="xe-lower">
              <div class="border"></div>
              
              <span>Amount</span>
              <div id="total_amount_dinein">$<?php echo $report['total_amount_dinein'];?></div>
            </div>
          </div>
          
        </div>
        <div class="col-sm-3">
        
          <div class="xe-widget xe-counter-block xe-counter-block-orange" data-suffix="" data-count=".num" data-from="0" data-to="<?php echo $report['totalpos'];?>" data-duration="4" data-easing="false">
            <div class="xe-upper">
              
              <div class="xe-icon">
                <i class="linecons-shop"></i>
              </div>
              <div class="xe-label">
                <strong class="num" id="totalpos"><?php echo $report['totalpos'];?></strong>
                <span>Point-of-sales</span>
              </div>
              
            </div>
            <div class="xe-lower">
              <div class="border"></div>
              
              <span>Amount</span>
              <div id="total_amount_pos">$<?php echo $report['total_amount_pos'];?></div>
            </div>
          </div>
          
        </div>
      </div>
<script type="text/javascript"><!--
  $('#range').on('change', function(e) {
    e.preventDefault();
    
    $(this).parent().parent().find('li').removeClass('active');
    
    $(this).parent().addClass('active');
    
    $.ajax({
      type: 'get',
      url: 'index.php?route=extension/dashboard/ordersummary/summary&token=<?php echo $token; ?>&range=' + $('#range').val(),
      dataType: 'json',
      success: function(json) {
        var totaldelivery = json.report.totaldelivery ? json.report.totaldelivery : 0;
        var totalpickup = json.report.totalpickup ? json.report.totalpickup : 0;
        var totaldinein = json.report.totaldinein ? json.report.totaldinein : 0;
        var totalpos = json.report.totalpos ? json.report.totalpos : 0;

        var total_amount_delivery = json.report.total_amount_delivery ? json.report.total_amount_delivery : 0;
        var total_amount_pickup = json.report.total_amount_pickup ? json.report.total_amount_pickup : 0;
        var total_amount_dinein = json.report.total_amount_dinein ? json.report.total_amount_dinein : 0;
        var total_amount_pos = json.report.total_amount_pos ?  json.report.total_amount_pos : 0;

        $("#totaldelivery").text(totaldelivery);
        $("#totalpickup").text(totalpickup);
        $("#totaldinein").text(totaldinein);
        $("#totalpos").text(totalpos);
        $("#total_amount_delivery").text('$' + total_amount_delivery);
        $("#total_amount_pickup").text('$' + total_amount_pickup);
        $("#total_amount_dinein").text('$' + total_amount_dinein);
        $("#total_amount_pos").text('$'+ total_amount_pos );

      },
          error: function(xhr, ajaxOptions, thrownError) {
             alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
    });
  });
  $('#range .active a').trigger('click');
</script> 