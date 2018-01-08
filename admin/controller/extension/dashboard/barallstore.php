<?php
class ControllerExtensionDashboardBarAllStore extends Controller {
	public function index() {

		/*load language */
		$this->load->language('extension/dashboard/barallstore');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('dashboard_barallstore', $this->request->post);

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
		$data['entry_sort_barallstore'] = $this->language->get('entry_sort_barallstore');

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
			'href' => $this->url->link('extension/dashboard/barallstore', 'token=' . $this->session->data['token'], true)
		);


		/* load some URLs */
		$data['action'] = $this->url->link('extension/dashboard/barallstore', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=dashboard', true);

		/* adding key value */
		if (isset($this->request->post['dashboard_barallstore_width'])) {
			$data['dashboard_barallstore_width'] = $this->request->post['dashboard_barallstore_width'];
		} else {
			$data['dashboard_barallstore_width'] = $this->config->get('dashboard_barallstore_width');
		}
		
		$data['columns'] = array();
		
		for ($i = 3; $i <= 12; $i++) {
			$data['columns'][] = $i;
		}
				
		if (isset($this->request->post['dashboard_barallstore_status'])) {
			$data['dashboard_barallstore_status'] = $this->request->post['dashboard_barallstore_status'];
		} else {
			$data['dashboard_barallstore_status'] = $this->config->get('dashboard_barallstore_status');
		}

		if (isset($this->request->post['dashboard_barallstore_sort_order'])) {
			$data['dashboard_barallstore_sort_order'] = $this->request->post['dashboard_barallstore_sort_order'];
		} else {
			$data['dashboard_barallstore_sort_order'] = $this->config->get('dashboard_barallstore_sort_order');
		}

		/* render some output */
		$data['header'] = $this->load->Controller('common/header');
		$data['column_left'] = $this->load->Controller('common/column_left');
		$data['footer'] = $this->load->Controller('common/footer');

		$this->response->setOutput($this->load->view('extension/dashboard/barallstore_form.tpl', $data));

	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/analytics/google_analytics')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function dashboard() {
		$this->load->language('extension/dashboard/barallstore');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['token'] = $this->session->data['token'];
		$data['dummy_data']	= $this->language->get('dummy_data');

		$this->load->model('report/barallstore');

		$data['report']	= $this->model_report_barallstore->getOrderAllStore();
		$data['store'] = $this->model_report_barallstore->getStoreInformation();

		return $this->load->view('extension/dashboard/barallstore_info', $data);
	}

	public function barallstore() {

		$this->load->language('extension/dashboard/barallstore');
		$json = array();
		$this->load->model('report/barallstore');

		if (isset($this->request->get['range2'])) {
			$range = $this->request->get['range2'];
		} else {
			$range = 'allstore';
		}
		if (isset($this->request->get['store_id'])) {
			$store_id = $this->request->get['store_id'];
		} else {
			$store_id = '0';
		}

		switch ($range) {
			default:
			case 'allstore':

				$json['report'] = $this->model_report_barallstore->getOrderAllStore();
			break;

			case 'uniquestore':

				$json['report'] = $this->model_report_barallstore->getOrderUniqueStore($store_id);
			break;

		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

}