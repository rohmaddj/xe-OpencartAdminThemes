<?php
class ModelReportBarAllOrder extends Model {

	public function getAllOrder() {

		$sql = "SELECT count(oh.order_history_id) as quantity, DATE_FORMAT(oh.date_added, '%M %d') as state, SUM(total) as amount FROM `" . DB_PREFIX . "order` as o INNER JOIN `" . DB_PREFIX . "order_history` as oh ON o.order_id = oh.order_id GROUP BY DATE(oh.date_added)";
		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getAllDelivery() {

		$sql = "SELECT count(oh.order_history_id) as quantity, DATE_FORMAT(oh.date_added, '%M %d') as state, SUM(total) as amount FROM `" . DB_PREFIX . "order` as o INNER JOIN `" . DB_PREFIX . "order_history` as oh ON o.order_id = oh.order_id WHERE oh.order_status_id = 3 GROUP BY DATE(oh.date_added)";
		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getAllPickup() {

		$sql = "SELECT count(oh.order_history_id) as quantity, DATE_FORMAT(oh.date_added, '%M %d') as state, SUM(total) as amount FROM `" . DB_PREFIX . "order` as o INNER JOIN `" . DB_PREFIX . "order_history` as oh ON o.order_id = oh.order_id WHERE oh.order_status_id = 12 GROUP BY DATE(oh.date_added)";
		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getAllDinein() {

		$sql = "SELECT count(oh.order_history_id) as quantity, DATE_FORMAT(oh.date_added, '%M %d') as state, SUM(total) as amount FROM `" . DB_PREFIX . "order` as o INNER JOIN `" . DB_PREFIX . "order_history` as oh ON o.order_id = oh.order_id WHERE oh.order_status_id = 5 GROUP BY DATE(oh.date_added)";
		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getAllPos() {

		$sql = "SELECT count(oh.order_history_id) as quantity, DATE_FORMAT(oh.date_added, '%M %d') as state, SUM(total) as amount FROM `" . DB_PREFIX . "order` as o INNER JOIN `" . DB_PREFIX . "order_history` as oh ON o.order_id = oh.order_id WHERE oh.order_status_id = 2 GROUP BY DATE(oh.date_added)";
		$query = $this->db->query($sql);

		return $query->rows;
	}
}