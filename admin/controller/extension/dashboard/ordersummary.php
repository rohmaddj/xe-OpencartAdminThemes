<?php
class ControllerExtensionDashboardOrderSummary extends Controller {
	private $error = array();

	public function index() {

		/* load file language */
		$this->load->language('extension/dashboard/ordersummary');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('dashboard_ordersummary', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=dashboard', true));
		}

		/* load language strings */
		$data['text_delivery'] = $this->language->get('text_delivery');
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_ordersummary'] = $this->language->get('entry_sort_ordersummary');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');


		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		/* breadcrumb */
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=dashboard', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/dashboard/ordersummary', 'token=' . $this->session->data['token'], true)
		);


		/* load some URLs */
		$data['action'] = $this->url->link('extension/dashboard/ordersummary', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=dashboard', true);

		/* adding key value */
		if (isset($this->request->post['dashboard_ordersummary_width'])) {
			$data['dashboard_ordersummary_width'] = $this->request->post['dashboard_ordersummary_width'];
		} else {
			$data['dashboard_ordersummary_width'] = $this->config->get('dashboard_ordersummary_width');
		}
		
		$data['columns'] = array();
		
		for ($i = 3; $i <= 12; $i++) {
			$data['columns'][] = $i;
		}
				
		if (isset($this->request->post['dashboard_ordersummary_status'])) {
			$data['dashboard_ordersummary_status'] = $this->request->post['dashboard_ordersummary_status'];
		} else {
			$data['dashboard_ordersummary_status'] = $this->config->get('dashboard_ordersummary_status');
		}

		if (isset($this->request->post['dashboard_ordersummary_sort_order'])) {
			$data['dashboard_ordersummary_sort_order'] = $this->request->post['dashboard_ordersummary_sort_order'];
		} else {
			$data['dashboard_ordersummary_sort_order'] = $this->config->get('dashboard_ordersummary_sort_order');
		}

		/* render some output */
		$data['header'] = $this->load->Controller('common/header');
		$data['column_left'] = $this->load->Controller('common/column_left');
		$data['footer'] = $this->load->Controller('common/footer');

		$this->response->setOutput($this->load->view('extension/dashboard/order_summary_form.tpl', $data));

	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/analytics/google_analytics')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function dashboard() {
		$this->load->language('extension/dashboard/ordersummary');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['token'] = $this->session->data['token'];

		$this->load->model('report/summary');
		$week = date("Y-m-d", strtotime("-7day"));
		$data['report']	= $this->model_report_summary->getTotalSummarysByWeek($week);

		return $this->load->view('extension/dashboard/order_summary_info', $data);
	}

	public function summary() {
		$this->load->language('extension/dashboard/ordersummary');

		$json = array();


		$this->load->model('report/summary');

		if (isset($this->request->get['range'])) {
			$range = $this->request->get['range'];
		} else {
			$range = 'week';
		}

		switch ($range) {
			default:
			case 'day':

				$json['report'] = $this->model_report_summary->getTotalSummarysByDay();
			break;

			case 'week':

				$week = date("Y-m-d", strtotime("-7day"));
				$json['report'] = $this->model_report_summary->getTotalSummarysByWeek($week);
			break;

			case 'month':

				$month = date("Y-m-d", strtotime("-1month"));
				$json['report'] = $this->model_report_summary->getTotalSummarysByMonth($month);
			break;

			case 'this-month':
				$tmonth = date("Y-m"."-01");
				$json['report'] = $this->model_report_summary->getTotalSummarysByThisMonth($tmonth);
			break;
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}