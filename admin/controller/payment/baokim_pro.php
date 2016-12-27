<?php
class ControllerPaymentBaoKimPro extends Controller{
	private $error = array();

	public function index(){
		$this->load->language('payment/baokim_pro');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if(($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()){
			$this->model_setting_setting->editSetting('baokim_pro',$this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled']  = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_url_test'] = $this->language->get('text_url_test');
		$data['text_url_real'] = $this->language->get('text_url_real');
		$data['text_safe']     = $this->language->get('text_safe');
		$data['text_immediate'] = $this->language->get('text_immediate');

		$data['url_test'] = $this->language->get('url_test');
		$data['url_real'] = $this->language->get('url_real');
		$data['val_safe'] = $this->language->get('val_safe');
		$data['val_immediate'] = $this->language->get('val_immediate');

		$data['entry_business'] = $this->language->get('entry_business');
		$data['entry_username'] = $this->language->get('entry_username');
		$data['entry_password'] = $this->language->get('entry_password');
		$data['entry_signature'] = $this->language->get('entry_signature');
		$data['entry_server'] = $this->language->get('entry_server');
		$data['entry_transaction'] = $this->language->get('entry_transaction');
		$data['entry_order_status'] = $this->language->get('entry_order_status');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_log_file'] = $this->language->get('entry_log_file');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['business'])) {
			$data['error_business'] = $this->error['business'];
		} else {
			$data['error_business'] = '';
		}

		if (isset($this->error['username'])) {
			$data['error_username'] = $this->error['username'];
		} else {
			$data['error_username'] = '';
		}

		if (isset($this->error['password'])) {
			$data['error_password'] = $this->error['password'];
		} else {
			$data['error_password'] = '';
		}

		if (isset($this->error['signature'])) {
			$data['error_signature'] = $this->error['signature'];
		} else {
			$data['error_signature'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_payment'),
			'href' => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('payment/baokim_pro', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('payment/baokim_pro', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['baokim_pro_business'])) {
			$data['baokim_pro_business'] = $this->request->post['baokim_pro_business'];
		} else {
			$data['baokim_pro_business'] = $this->config->get('baokim_pro_business');
		}

		if (isset($this->request->post['baokim_pro_username'])) {
			$data['baokim_pro_username'] = $this->request->post['baokim_pro_username'];
		} else {
			$data['baokim_pro_username'] = $this->config->get('baokim_pro_username');
		}

		if (isset($this->request->post['baokim_pro_password'])) {
			$data['baokim_pro_password'] = $this->request->post['baokim_pro_password'];
		} else {
			$data['baokim_pro_password'] = $this->config->get('baokim_pro_password');
		}

		if (isset($this->request->post['baokim_pro_signature'])) {
			$data['baokim_pro_signature'] = $this->request->post['baokim_pro_signature'];
		} else {
			$data['baokim_pro_signature'] = $this->config->get('baokim_pro_signature');
		}

		if (isset($this->request->post['baokim_pro_server'])) {
			$data['baokim_pro_server'] = $this->request->post['baokim_pro_server'];
		} else {
			$data['baokim_pro_server'] = $this->config->get('baokim_pro_server');
		}

		if (isset($this->request->post['baokim_pro_transaction'])) {
			$data['baokim_pro_transaction'] = $this->request->post['baokim_pro_transaction'];
		} else {
			$data['baokim_pro_transaction'] = $this->config->get('baokim_pro_transaction');
		}

		if (isset($this->request->post['baokim_pro_order_status_id'])) {
			$data['baokim_pro_order_status_id'] = $this->request->post['baokim_pro_order_status_id'];
		} else {
			$data['baokim_pro_order_status_id'] = $this->config->get('baokim_pro_order_status_id');
		}

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['baokim_pro_status'])) {
			$data['baokim_pro_status'] = $this->request->post['baokim_pro_status'];
		} else {
			$data['baokim_pro_status'] = $this->config->get('baokim_pro_status');
		}

		if (isset($this->request->post['log_file'])) {
			$data['log_file'] = $this->request->post['log_file'];
		} else {
			$data['log_file'] = $this->config->get('log_file');
		}

		if (isset($this->request->post['baokim_pro_sort_order'])) {
			$data['baokim_pro_sort_order'] = $this->request->post['baokim_pro_sort_order'];
		} else {
			$data['baokim_pro_sort_order'] = $this->config->get('baokim_pro_sort_order');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('payment/baokim_pro.tpl', $data));

	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'payment/baokim_pro')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['baokim_pro_business']) {
			$this->error['business'] = $this->language->get('error_business');
		}

		if (!$this->request->post['baokim_pro_username']) {
			$this->error['username'] = $this->language->get('error_username');
		}

		if (!$this->request->post['baokim_pro_password']) {
			$this->error['password'] = $this->language->get('error_password');
		}

		if (!$this->request->post['baokim_pro_signature']) {
			$this->error['signature'] = $this->language->get('error_signature');
		}
		if (!$this->request->post['baokim_pro_business']) {
			$this->error['business'] = $this->language->get('error_business');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>