<?php
class ControllerModuleHokSharing extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/hok_sharing');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('hok_sharing', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_form'] = $this->language->get('text_form');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_name'] = $this->language->get('entry_name');	
		$data['entry_pos_top'] = $this->language->get('entry_pos_top');	
		$data['entry_pos_bottom'] = $this->language->get('entry_pos_bottom');	
		$data['entry_pos_left'] = $this->language->get('entry_pos_left');	
		$data['entry_pos_right'] = $this->language->get('entry_pos_left');	
		$data['entry_sharing_icon'] = $this->language->get('entry_sharing_icon');	
		$data['entry_sharing_name'] = $this->language->get('entry_sharing_name');	
		$data['entry_sharing_link'] = $this->language->get('entry_sharing_link');	
		$data['entry_sharing_style'] = $this->language->get('entry_sharing_style');	
		$data['entry_size'] = $this->language->get('entry_size');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$data['help_sharing_icon'] = $this->language->get('help_sharing_icon');
		

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
		

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/hok_sharing', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/hok_sharing', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/hok_sharing', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/hok_sharing', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['pos_top'])) {
			$data['pos_top'] = $this->request->post['pos_top'];
		} elseif (!empty($module_info)) {
			$data['pos_top'] = $module_info['pos_top'];
		} else {
			$data['pos_top'] = '';
		}

		if (isset($this->request->post['pos_bottom'])) {
			$data['pos_bottom'] = $this->request->post['pos_bottom'];
		} elseif (!empty($module_info)) {
			$data['pos_bottom'] = $module_info['pos_bottom'];
		} else {
			$data['pos_bottom'] = '';
		}

		if (isset($this->request->post['pos_left'])) {
			$data['pos_left'] = $this->request->post['pos_left'];
		} elseif (!empty($module_info)) {
			$data['pos_left'] = $module_info['pos_left'];
		} else {
			$data['pos_left'] = '';
		}

		if (isset($this->request->post['pos_right'])) {
			$data['pos_right'] = $this->request->post['pos_right'];
		} elseif (!empty($module_info)) {
			$data['pos_right'] = $module_info['pos_right'];
		} else {
			$data['pos_right'] = '';
		}
		
		if (isset($this->request->post['sharing'])) {
			$data['sharings'] = $this->request->post['sharing'];
		} elseif (!empty($module_info)) {
			$data['sharings'] = $module_info['sharing'];
		} else {
			$data['sharings'] = array();
		}
		
		if (isset($this->request->post['size'])) {
			$data['size'] = $this->request->post['size'];
		} elseif (!empty($module_info)) {
			$data['size'] = $module_info['size'];
		} else {
			$data['size'] = '';
		}
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/hok_sharing.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/hok_sharing')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		return !$this->error;
	}
}
