<?php
class ModelReportBestSeller extends Model {

	public function getProductBestseller() {

		$sql = $this->db->query("SELECT DISTINCT(op.name) as name FROM `" . DB_PREFIX . "order_product` AS op INNER JOIN `" . DB_PREFIX . "order_history` as oh ON op.order_id = oh.order_id WHERE op.quantity > 0 order by quantity desc");

		return $sql->rows;
	}
}