<?php
class ModelReportBarAllStore extends Model {

	public function getOrderAllStore() {

		$sql = "SELECT count(oh.order_history_id) as quantity, DATE_FORMAT(oh.date_added, '%M %d') as state, SUM(total) as amount FROM `" . DB_PREFIX . "order_history` as oh INNER JOIN `" . DB_PREFIX . "order` as o ON o.order_id = oh.order_id GROUP BY DATE(oh.date_added)";
		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getOrderUniqueStore($store_id) {
		
		$sql = "SELECT count(oh.order_history_id) as quantity, DATE_FORMAT(oh.date_added, '%M %d') as state, SUM(total) as amount FROM `" . DB_PREFIX . "order_history` as oh INNER JOIN `" . DB_PREFIX . "order` as o ON o.order_id = oh.order_id WHERE o.store_id = ".$store_id." GROUP BY DATE(oh.date_added)";
		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getStoreInformation() {

		$sql = "SELECT * FROM " . DB_PREFIX . "store";
		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalOrderToday() {
		
		$sql = "SELECT count(oh.order_history_id) as quantity, DATE_FORMAT(oh.date_added, '%M %d') as state, SUM(total) as amount FROM `" . DB_PREFIX . "order` as o INNER JOIN `" . DB_PREFIX . "order_history` as oh ON o.order_id = oh.order_id WHERE DATE(oh.date_added) = DATE(NOW()) GROUP BY DATE(oh.date_added)";
		$query = $this->db->query($sql);

		return $query->rows;
	}

}