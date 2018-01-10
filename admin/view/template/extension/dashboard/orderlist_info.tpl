<h3>Order List</h3>
<br />

<div class="row">

<div class="col-md-8">

<ul class="nav nav-tabs nav-tabs-justified">
	<li class="active">
		<a href="#home-3"  style="margin: 0px;padding: 10px 5px 10px 5px" data-toggle="tab" >
			<span class="hidden-xs">Pending</span>
		</a>
	</li>
	<li>
		<a href="#tabs2" style="margin: 0px;padding: 10px 5px 10px 5px" data-toggle="tab">
			<span class="hidden-xs">Complete</span>
		</a>
	</li>
	<li>
		<a href="#messages-3" style="margin: 0px;padding: 10px 5px 10px 5px" data-toggle="tab">
			<span class="hidden-xs">Processing</span>
		</a>
	</li>
	<li>
		<a href="#settings-3" style="margin: 0px;padding: 10px 5px 10px 5px" data-toggle="tab">
			<span class="hidden-xs">In-Transit</span>
		</a>
	</li>
	<li>
		<a href="#inbox-3" style="margin: 0px;padding: 10px 5px 10px 5px" data-toggle="tab">
			<span class="visible-xs"><i class="fa-bell-o"></i></span>
			<span class="hidden-xs">Delivered</span>
		</a>
	</li>
	<li>
		<a href="#inbox-3" style="margin: 0px;padding: 10px 5px 10px 5px" data-toggle="tab">
			<span class="visible-xs"><i class="fa-bell-o"></i></span>
			<span class="hidden-xs">Canceled</span>
		</a>
	</li>
	<li>
		<a href="#inbox-3" style="margin: 0px;padding: 10px 5px 10px 5px" data-toggle="tab">
			<span class="visible-xs"><i class="fa-bell-o"></i></span>
			<span class="hidden-xs">All</span>
		</a>
	</li>
</ul>
</div>

<div class="panel-group" id="accordion-test-2">
	<a data-toggle="collapse" data-parent="#accordion-test-2" href="#collapsefilter" class="btn btn-blue btn-icon" style="border-radius: 5px "> 
		<i class="fa-filter"></i> 
		<span>Filter</span>
	</a>
	<div class="col-md-12">
		<div id="collapsefilter" class="panel-collapse collapse" style="background: #FFF">
			<div class="panel-body">
				
				<div class="col-sm-10">
				<label class="radio-inline"> <input type="radio" name="radio1" checked>Today</label>
				<label class="radio-inline"> <input type="radio" name="radio1">Last 7 Days</label>
				<label class="radio-inline"> <input type="radio" name="radio1">Last 30 Days</label>
				<label class="radio-inline"> <input type="radio" name="radio1">This Month</label>
				<label class="radio-inline"> <input type="radio" name="radio1">Last Month</label>
				</div><div class="col-sm-12" style="opacity: 0">.</div>
				<div class="col-sm-3">
				<label class="radio-inline"> <input type="radio" name="radio2">Delivery Date From</label>
				</div>

				<div class="col-sm-4">
					<input type="text" id="ddf" class="form-control daterange" data-format="YYYY-MM-DD" data-start-date="2018-01-01" data-end-date="2018-04-15" data-separator=" to "/>
				</div><div class="col-sm-12" style="opacity: 0">.</div>
			
				<div class="col-sm-3">
				<label class="radio-inline"> <input type="radio" name="radio2">Order Date From</label>
				</div>

				<div class="col-sm-4">
					<input type="text" id="odf" class="form-control daterange" data-format="YYYY-MM-DD" data-start-date="2018-01-01" data-end-date="2018-05-1" data-separator=" to "/>
				</div><div class="col-sm-12" style="opacity: 0">.</div>
				
				<div class="col-xs-3">
					<select id="range1" class="form-control input-sm">
		        <option value="all" selected="selected"><a href="all">All Store</a></option>
		        <option value="delivery"><a href="delivery">Delivery</a></option>
		        <option value="pickup"><a href="pickup">Pickup</a></option>
		        <option value="dinein"><a href="dinein">Dine-in</a></option>
		        <option value="pos"><a href="pos">Point-of-sales</a></option>
				</select>
				</div>

				<div class="col-xs-3">
					<select id="range1" class="form-control input-sm">
		        <option value="all" selected="selected"><a href="all">All Order</a></option>
		        <option value="delivery"><a href="delivery">Delivery</a></option>
		        <option value="pickup"><a href="pickup">Pickup</a></option>
		        <option value="dinein"><a href="dinein">Dine-in</a></option>
		        <option value="pos"><a href="pos">Point-of-sales</a></option>
				</select>
				</div>

				<div class="col-xs-3">
					<select id="range1" class="form-control input-sm">
		        <option value="all" selected="selected"><a href="all">Paid & Unpaid</a></option>
		        <option value="delivery"><a href="delivery">Delivery</a></option>
		        <option value="pickup"><a href="pickup">Pickup</a></option>
		        <option value="dinein"><a href="dinein">Dine-in</a></option>
		        <option value="pos"><a href="pos">Point-of-sales</a></option>
				</select>
				</div><div class="col-sm-12" style="opacity: 0">.</div>
				
				<div class="col-xs-2">By Customer </div>
				<div class="col-md-6"><input type="text" name="search" placeholder="type name, phone or email, order number" class="form-control"></div>
				
				<div class="col-md-4" style="text-align: right;">
					<a href="#"> 
						<button class="btn btn-blue btn-icon" style="border-radius: 5px"> 
							<i class="fa-filter"></i>
							<span>Filter</span>
						</button>
					</a>
				</div>
			
			</div>
		</div>
	</div>

<button class="btn btn-icon btn-info"> <i class="fa-truck"></i> </button>
<button class="btn btn-icon btn-blue"> <i class="fa-print"></i> </button>
<button class="btn btn-icon btn-success"> <i class="fa-plus"></i> </button>
<button class="btn btn-icon btn-red"> <i class="fa-eraser"></i> </button>
<button class="btn btn-icon btn-blue"> <i class="fa-edit"></i> </button>

</div>
</div>

<div class="tab-content">
	<div class="tab-pane active" id="home-3">
		
		<div class="panel panel-default">

		<div class="panel-body">
			
			<script type="text/javascript">
			jQuery(document).ready(function($)
			{
				$("#order-list").dataTable({
					columnDefs: [
						{targets: 'disable', orderable: false}],
					aLengthMenu: [
						[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]
					]
				});
			});
			</script>
			
			<table id="order-list" class="table table-striped table-bordered" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th class="disable"><input type="checkbox" name=""></th>
						<th>No</th>
						<th>Order Date</th>
						<th>Delivery/Pickup Date</th>
						<th>Customer</th>
						<th>Status</th>
						<th class="disable">Payment</th>
						<th class="disable">Amount</th>
						<th>Store</th>
						<th class="disable">Action</th>
					</tr>
				</thead>
				<tbody>
					<?php
					$i = 1;
					foreach($report as $v) { ?>
					<tr>
						<td><input type="checkbox" name="checkbox"></td>
						<td style="text-align: center;"><?php echo $i++;?></td>
						<td><?php echo $v['name'];?></td>
						<td><?php echo $v['name'];?></td>
						<td><?php echo $v['name'];?></td>
						<td><?php echo $v['name'];?></td>
						<td><?php echo $v['name'];?></td>
						<td><?php echo $v['name'];?></td>
						<td><?php echo $v['name'];?></td>
						<td><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
					</tr>
					<?php } ?>
				</tbody>
			</table>
			
		</div>
		</div>
		
	</div>
	<div class="tab-pane" id="tabs2">
	asdasfe
	</div>
</div>
</div>
</div>