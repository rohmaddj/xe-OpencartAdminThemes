<?php
class ModelReportPieChart extends Model {
	public function getOrderType() {

		/* delivery */
		$sqldelivery = "SELECT count(order_history_id) as totaldelivery FROM oc_order_history as ooh WHERE order_status_id = 3";
		
		$querydelivery = $this->db->query($sqldelivery);
		
		$sql_amount_delivery = "SELECT sum(oo.total) as total_amount_delivery FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 3 ";
		
		$query_amount_delivery = $this->db->query($sql_amount_delivery);

		/* pickup */
		$sqlpickup = "SELECT count(order_history_id) as totalpickup FROM oc_order_history as ooh WHERE order_status_id = 12";
		
		$querypickup = $this->db->query($sqlpickup);
		
		$sql_amount_pickup = "SELECT sum(oo.total) as total_amount_pickup FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 12";
		
		$query_amount_pickup = $this->db->query($sql_amount_pickup);

		/* dinein */
		$sqldinein = "SELECT count(order_history_id) as totaldinein FROM oc_order_history as ooh WHERE order_status_id = 5";
		
		$querydinein = $this->db->query($sqldinein);
		
		$sql_amount_dinein = "SELECT sum(oo.total) as total_amount_dinein FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 5";
		
		$query_amount_dinein = $this->db->query($sql_amount_dinein);

		/* point of sales */
		$sqlpos = "SELECT count(order_history_id) as totalpos FROM oc_order_history as ooh WHERE order_status_id = 2";
		
		$querypos = $this->db->query($sqlpos);
		
		$sql_amount_pos = "SELECT sum(oo.total) as total_amount_pos FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 2";
		
		$query_amount_pos = $this->db->query($sql_amount_pos);

		return ['totaldelivery' => $querydelivery->rows[0]['totaldelivery'], 'total_amount_delivery' => $query_amount_delivery->rows[0]['total_amount_delivery'], 'totalpickup' => $querypickup->rows[0]['totalpickup'], 'total_amount_pickup' => $query_amount_pickup->rows[0]['total_amount_pickup'], 'totaldinein' => $querydinein->rows[0]['totaldinein'], 'total_amount_dinein' => $query_amount_dinein->rows[0]['total_amount_dinein'], 'totalpos' => $querypos->rows[0]['totalpos'], 'total_amount_pos' => $query_amount_pos->rows[0]['total_amount_pos']];
	}
}