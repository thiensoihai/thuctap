<?php
/*****************************************************************************
 *                                                                           *
 *            Module tích hợp thanh toán Bảo Kim                             *
 * Phiên bản : 1.1                                                           *
 * Module được phát triển bởi IT Bảo Kim                                     *
 * Chức năng :                                                               *
 * - Tích hợp thanh toán qua baokim.vn cho các merchant site có đăng ký API. *
 * - Gửi thông tin thanh toán tới baokim.vn để xử lý việc thanh toán.        *
 * - Xác thực tính chính xác của thông tin được gửi về từ baokim.vn          *
 * @author hieunn                                                            *
 *****************************************************************************
 * Xin hãy đọc kĩ tài liệu tích hợp trên trang                               *
 * http://developer.baokim.vn/                                               *
 *                                                                           *
 *****************************************************************************/
class ControllerPaymentBaoKim extends Controller {
	private $error = array(); 

	public function index() {
		$this->load->language('payment/baokim');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->load->model('setting/setting');
			
			$this->model_setting_setting->editSetting('baokim', $this->request->post);				
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_url_test'] = $this->language->get('text_url_test');
		$data['text_url_real'] = $this->language->get('text_url_real');

		$data['url_test'] = $this->language->get('url_test');
		$data['url_real'] = $this->language->get('url_real');

		$data['entry_merchant'] = $this->language->get('entry_merchant');
		$data['entry_security'] = $this->language->get('entry_security');
		$data['entry_business'] = $this->language->get('entry_business');
		$data['entry_server'] = $this->language->get('entry_server');


		$data['entry_order_status'] = $this->language->get('entry_order_status');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');

  		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

 		if (isset($this->error['merchant'])) {
			$data['error_merchant'] = $this->error['merchant'];
		} else {
			$data['error_merchant'] = '';
		}

 		if (isset($this->error['security'])) {
			$data['error_security'] = $this->error['security'];
		} else {
			$data['error_security'] = '';
		}

		if (isset($this->error['business'])) {
			$data['error_business'] = $this->error['business'];
		} else {
			$data['error_business'] = '';
		}

		if (isset($this->error['business'])) {
			$data['error_business'] = $this->error['business'];
		} else {
			$data['error_business'] = '';
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
			'href' => $this->url->link('payment/baokim', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('payment/baokim', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');


		if (isset($this->request->post['baokim_merchant'])) {
			$data['baokim_merchant'] = $this->request->post['baokim_merchant'];
		} else {
			$data['baokim_merchant'] = $this->config->get('baokim_merchant');
		}

		if (isset($this->request->post['baokim_security'])) {
			$data['baokim_security'] = $this->request->post['baokim_security'];
		} else {
			$data['baokim_security'] = $this->config->get('baokim_security');
		}
		
		if (isset($this->request->post['baokim_business'])) {
			$data['baokim_business'] = $this->request->post['baokim_business'];
		} else {
			$data['baokim_business'] = $this->config->get('baokim_business');
		}

		if (isset($this->request->post['baokim_server'])) {
			$data['baokim_server'] = $this->request->post['baokim_server'];
		} else {
			$data['baokim_server'] = $this->config->get('baokim_server');
		}

		if (isset($this->request->post['baokim_order_status_id'])) {
			$data['baokim_order_status_id'] = $this->request->post['baokim_order_status_id'];
		} else {
			$data['baokim_order_status_id'] = $this->config->get('baokim_order_status_id'); 
		} 
		
		$this->load->model('localisation/order_status');
		
		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		if (isset($this->request->post['baokim_status'])) {
			$data['baokim_status'] = $this->request->post['baokim_status'];
		} else {
			$data['baokim_status'] = $this->config->get('baokim_status');
		}
		
		if (isset($this->request->post['baokim_sort_order'])) {
			$data['baokim_sort_order'] = $this->request->post['baokim_sort_order'];
		} else {
			$data['baokim_sort_order'] = $this->config->get('baokim_sort_order');
		}
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$this->template = 'payment/baokim.tpl';
		$this->response->setOutput($this->load->view('payment/baokim.tpl', $data));
		//$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'payment/baokim')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['baokim_merchant']) {
			$this->error['merchant'] = $this->language->get('error_merchant');
		}

		if (!$this->request->post['baokim_security']) {
			$this->error['security'] = $this->language->get('error_security');
		}
		
		if (!$this->request->post['baokim_business']) {
			$this->error['business'] = $this->language->get('error_business');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>