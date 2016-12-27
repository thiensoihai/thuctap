<?php
class ControllerExtensionRegistrations extends Controller {
	private $error = array();
	
	public function index() {
		$this->language->load('extension/registrations');		
		$this->load->model('extension/registrations');		
		$this->document->setTitle($this->language->get('heading_title'));
		
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}

		if (isset($this->request->get['filter_email'])) {
			$filter_email = $this->request->get['filter_email'];
		} else {
			$filter_email = null;
		}

		if (isset($this->request->get['filter_class_group_id'])) {
			$filter_class_group_id = $this->request->get['filter_class_group_id'];
		} else {
			$filter_class_group_id = null;
		}

		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}

		if (isset($this->request->get['filter_approved'])) {
			$filter_approved = $this->request->get['filter_approved'];
		} else {
			$filter_approved = null;
		}
		
		if (isset($this->request->get['filter_date_added'])) {
			$filter_date_added = $this->request->get['filter_date_added'];
		} else {
			$filter_date_added = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL')
		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/registrations', 'token=' . $this->session->data['token'] . $url, 'SSL')
   		);
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->error['warning'])) {
			$data['error'] = $this->error['warning'];
		
			unset($this->error['warning']);
		} else {
			$data['error'] = '';
		}		
		
		$url = '';
		
		$filter_data = array(
			'filter_name'              => $filter_name,
			'filter_email'             => $filter_email,
			'filter_class_group_id'    => $filter_class_group_id,
			'filter_status'            => $filter_status,
			'filter_approved'          => $filter_approved,
			'filter_date_added'        => $filter_date_added,
			'filter_ip'                => $filter_ip,
			'sort'                     => $sort,
			'order'                    => $order,
			'start'                    => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                    => $this->config->get('config_limit_admin')
		);
		
		$total = $this->model_extension_registrations->getTotalRegistrations($filter_data);
		$data['heading_title'] = $this->language->get('heading_title');		
		$data['text_title'] = $this->language->get('text_title');
		$data['text_list'] = $this->language->get('text_list');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_email'] = $this->language->get('column_email');
		$data['column_customer_group'] = $this->language->get('column_customer_group');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_approved'] = $this->language->get('column_approved');
		$data['column_ip'] = $this->language->get('column_ip');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_approved'] = $this->language->get('entry_approved');
		$data['entry_ip'] = $this->language->get('entry_ip');
		$data['entry_date_added'] = $this->language->get('entry_date_added');

		$data['button_approve'] = $this->language->get('button_approve');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_login'] = $this->language->get('button_login');
		$data['button_unlock'] = $this->language->get('button_unlock');
		
		$url = '';
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$data['add'] = $this->url->link('extension/registrations/insert', '&token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('extension/registrations/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		$data['all_registrations'] = array();
		
		$all_registrations = $this->model_extension_registrations->getAllRegistrations($filter_data);
		
		foreach ($all_registrations as $result) {
			$paid = ($result['deposit'] >= $result['amount_fees']) ? FALSE : TRUE;			
			if ($paid) {
				$approve = $this->url->link('extension/registrations/approve', 'token=' . $this->session->data['token'] . '&registration_id=' . $result['reg_id'].'&invoice=1' . $url, 'SSL');				
			} else {
				$approve = '';
			}
			
			$data['all_registrations'][] = array(
				'registration_id'    => $result['reg_id'],
				'name'           => $result['name'],
				'job_title'      => $result['job_title'],
				'experience'     => $result['experience'],
				'telephone'      => $this->formatPhoneNumber($result['telephone']),
				'email'          => $result['email'],				
				'classname'      => $result['title'].' <br />'. $this->formatMoney($result['amount_fees']),			
				'deposit'        => $this->formatMoney($result['deposit']),		
				'remain'         => $this->formatMoney(round($result['amount_fees'] - $result['deposit'],2)),
				'paid'			 => $paid,
				'status'         => ($result['r_status'] ? '<a class="btn btn-success" href="javascript:void(0)"><i class="fa fa-check-square"></i></a>' : '<a class="btn btn-danger" href="javascript:void(0)"><i class="fa fa-times"></i></a>'),				
				'date_added'     => date($this->language->get('date_format_short'), strtotime($result['date_training'])),
				'approve'        => $approve,				
				'edit'           => $this->url->link('extension/registrations/edit', 'token=' . $this->session->data['token'] . '&registration_id=' . $result['reg_id'] . $url, 'SSL')
			);
		}
		
		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_approved'])) {
			$url .= '&filter_approved=' . $this->request->get['filter_approved'];
		}
		
		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
			
		$data['sort_name'] = $this->url->link('extension/registrations', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
		$data['sort_email'] = $this->url->link('extension/registrations', 'token=' . $this->session->data['token'] . '&sort=c.email' . $url, 'SSL');		
		$data['sort_status'] = $this->url->link('extension/registrations', 'token=' . $this->session->data['token'] . '&sort=c.status' . $url, 'SSL');		
		$data['sort_date_added'] = $this->url->link('extension/registrations', 'token=' . $this->session->data['token'] . '&sort=c.date_added' . $url, 'SSL');
		
		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_class_group_id'])) {
			$url .= '&filter_class_group_id=' . $this->request->get['filter_class_group_id'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_approved'])) {
			$url .= '&filter_approved=' . $this->request->get['filter_approved'];
		}


		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		$pagination = new Pagination();
		$pagination->total = $total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
		$data['pagination'] = $pagination->render();
		$data['results'] = sprintf($this->language->get('text_pagination'), ($total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($total - $this->config->get('config_limit_admin'))) ? $total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $total, ceil($total / $this->config->get('config_limit_admin')));
		
		$data['token'] = $this->session->data['token'];
		$data['filter_name'] = $filter_name;
		$data['filter_email'] = $filter_email;
		$data['filter_class_group_id'] = $filter_class_group_id;
		$data['filter_status'] = $filter_status;
		$data['filter_approved'] = $filter_approved;		
		$data['filter_date_added'] = $filter_date_added;
		$data['sort'] = $sort;
		$data['order'] = $order;
		
		$data['class_groups'] = $this->model_extension_registrations->getClassRegistrations();
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/registrations_list.tpl', $data));	
	}
	
	
	
	public function formatPhoneNumber($phoneNumber) 
	{
	    $phoneNumber = preg_replace('/[^0-9]/','',$phoneNumber);
	    if(strlen($phoneNumber) > 10) 
		{
	        $countryCode = substr($phoneNumber, 0, strlen($phoneNumber)-10);
	        $areaCode = substr($phoneNumber, -10, 3);
	        $nextThree = substr($phoneNumber, -7, 3);
	        $lastFour = substr($phoneNumber, -4, 4);

	        $phoneNumber = '+'.$countryCode.' ('.$areaCode.') '.$nextThree.'-'.$lastFour;
	    }
	    else if(strlen($phoneNumber) <= 10) 
		{
	        $areaCode = substr($phoneNumber, 0, 3);
	        $nextThree = substr($phoneNumber, 3, 3);
	        $lastFour = substr($phoneNumber, 6, 4);
			$phoneNumber = '';
			if(!empty($areaCode))
	        	$phoneNumber .= '('.$areaCode.') ';
			if(!empty($nextThree))
				$phoneNumber .= $nextThree;
			if(!empty($lastFour))
				$phoneNumber .= '-'.$lastFour;
	    }	    
	    return $phoneNumber;
	}
	
	public function autocomplete()
	{
		$json = array();

		if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_email'])) {
			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			} else {
				$filter_name = '';
			}

			if (isset($this->request->get['filter_email'])) {
				$filter_email = $this->request->get['filter_email'];
			} else {
				$filter_email = '';
			}

			$this->load->model('extension/registrations');	

			$filter_data = array(
				'filter_name'  => $filter_name,
				'filter_email' => $filter_email,
				'start'        => 0,
				'limit'        => 5
			);

			$results = $this->model_extension_registrations->getAllRegistrations($filter_data);

			foreach ($results as $result) {
				$json[] = array(					
					'name'              => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),					
					'email'             => $result['email'],
					'reg_id'            => $result['reg_id']
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}
		array_multisort($sort_order, SORT_ASC, $json);
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function formatMoney($number, $cents = 0,$round=2)
	{ // 
	  if (is_numeric($number)) { // a number
		if (!$number) { // zero
		  $money = ($cents == 2 ? '0.00' : '0'); // output zero
		} else { // value
		  if (floor($number) == $number) { // whole number
			$money = number_format($number, ($cents == 2 ? 2 : 0)); // format
		  } else { // cents
			$money = number_format(round($number,$round), ($cents == 0 ? 0 : 2)); // format
		  } // integer or decimal
		} // value
		return '<strong>$'.$money.'</strong>';
	  } // numeric
	} // formatMoney
	
	public function edit() {
		$this->language->load('extension/registrations');		
		$this->load->model('extension/registrations');		
		$this->document->setTitle($this->language->get('heading_title'));		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->request->post['date_training'] = DateTime::createFromFormat('m/d/Y',($this->request->post['date_training'] ? $this->request->post['date_training'] : date('m/d/Y')))->format('Y-m-d');						
			$this->model_extension_registrations->editRegistrations($this->request->get['registration_id'], $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');						
			$this->response->redirect($this->url->link('extension/registrations', 'token=' . $this->session->data['token'], 'SSL'));
		}		
		$this->getForm();
	}
	
	public function approve()
	{
		$this->language->load('extension/registrations');		
		$this->load->model('extension/registrations');		
		$this->document->setTitle($this->language->get('heading_title'));		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->request->post['date_training_invoice'] = $this->request->post['date_training'];					
			$this->request->post['date_training'] = DateTime::createFromFormat('m/d/Y',($this->request->post['date_training'] ? $this->request->post['date_training'] : date('m/d/Y')))->format('Y-m-d');						
			$result = $this->model_extension_registrations->editRegistrations($this->request->get['registration_id'], $this->request->post);
			if($result)
			{
				$rs = $this->sendInvoice($this->request->post);			
				if($rs)
				{
					$this->session->data['success'] = $this->language->get('text_invoice_success');						
					$this->response->redirect($this->url->link('extension/registrations', 'token=' . $this->session->data['token'], 'SSL'));
				}				
			}			
		}		
		$this->getForm();
	}
	
	public function insert() {
		$this->language->load('extension/registrations');		
		$this->load->model('extension/registrations');		
		$this->document->setTitle($this->language->get('heading_title'));		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->request->post['customer_id'] = '0';
			$this->request->post['store_id'] = '0';	
			$this->request->post['date_training'] = DateTime::createFromFormat('m/d/Y',($this->request->post['date_training'] ? $this->request->post['date_training'] : date('m/d/Y')))->format('Y-m-d');
			$this->model_extension_registrations->addRegistrations($this->request->post);			
			$this->session->data['success'] = $this->language->get('text_success');						
			$this->response->redirect($this->url->link('extension/registrations', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getForm();
	}
	
	protected function sendInvoice($data)
	{		
		$class_data = $this->model_extension_registrations->getClassRegistrations();
		$data['class_data'] = array();
		$title_invoice_detail = array();
		$data_full = array();
		if(count($class_data) > 0)
		{
			foreach($class_data as $key=>$value)
			{
				if(in_array($value['news_id'],$data['class_id']))
				{
					$title_invoice_detail[] = $value['title'].' (Fees: '.$this->formatMoney($value['amount_fees']).')';
				}
				$value['amount_fees'] = $this->formatMoney($value['amount_fees']);
				$data_full[] = $value;				
			}
		}
		$data['class_data'] = join(', ', $title_invoice_detail);
		$data['class_data_full'] = $data_full;
		$location = $this->model_extension_registrations->getAllLocation();
		$data['location_data'] = '';
		if(count($location) > 0)
		{
			foreach($location as $key=>$value){
				if($value['location_id']===$data['location']) $data['location_data'] = $value['title'];
			}
		}
		
		$data['store_name'] = $this->config->get('config_owner');		
		$data['logo'] = HTTPS_CATALOG.'/image/'.$this->config->get('config_logo');
		$data['store_url'] = HTTPS_CATALOG;
		$text_greeting = $this->config->get('config_address');		
		$text_greeting .= 'Email: '.$this->config->get('config_email');
		$data['text_greeting'] = nl2br($text_greeting);
		$data['InvoiceNumber'] = $this->request->get['registration_id'].'#REGISTRATION';
		$data['deposit'] = $this->formatMoney($data['deposit']);
		$data['text_footer'] = $this->language->get('text_update_footer');
		$html = $this->load->view('extension/registration_invoice.tpl', $data);
		
		if(!empty($data['email']))
		{			
			$subject = '#REG'.$this->request->get['registration_id'].' '.$this->language->get('text_invoice_send_email');
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
			$mail->setTo($data['email']);
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_owner'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
			$mail->setHtml($html);			
			$mail->send();
		}		
		return TRUE;
	}
	
	protected function getForm() {
		
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_form'] = !isset($this->request->get['registration_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_loading'] = $this->language->get('text_loading');

		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_firstname'] = $this->language->get('entry_firstname');
		$data['entry_lastname'] = $this->language->get('entry_lastname');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_fax'] = $this->language->get('entry_fax');
		$data['entry_password'] = $this->language->get('entry_password');
		$data['entry_confirm'] = $this->language->get('entry_confirm');
		$data['entry_newsletter'] = $this->language->get('entry_newsletter');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_approved'] = $this->language->get('entry_approved');
		$data['entry_address_1'] = $this->language->get('entry_address_1');
		$data['entry_address_2'] = $this->language->get('entry_address_2');
		$data['entry_city'] = $this->language->get('entry_city');
		$data['entry_postcode'] = $this->language->get('entry_postcode');
		$data['entry_zone'] = $this->language->get('entry_zone');
		$data['entry_country'] = $this->language->get('entry_country');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_address_add'] = $this->language->get('button_address_add');
		$data['button_history_add'] = $this->language->get('button_history_add');
		$data['button_transaction_add'] = $this->language->get('button_transaction_add');
		$data['button_reward_add'] = $this->language->get('button_reward_add');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_upload'] = $this->language->get('button_upload');
		$data['tab_general'] = $this->language->get('tab_general');	

		$data['token'] = $this->session->data['token'];
	
		if (isset($this->request->get['registration_id'])) {
			$data['registration_id'] = $this->request->get['registration_id'];
		} else {
			$data['registration_id'] = 0;
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['firstname'])) {
			$data['error_firstname'] = $this->error['firstname'];
		} else {
			$data['error_firstname'] = '';
		}

		if (isset($this->error['lastname'])) {
			$data['error_lastname'] = $this->error['lastname'];
		} else {
			$data['error_lastname'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['telephone'])) {
			$data['error_telephone'] = $this->error['telephone'];
		} else {
			$data['error_telephone'] = '';
		}

		if (isset($this->error['address'])) {
			$data['error_address'] = $this->error['address'];
		} else {
			$data['error_address'] = array();
		}

		$url = '';
		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_customer_group_id'])) {
			$url .= '&filter_customer_group_id=' . $this->request->get['filter_customer_group_id'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_approved'])) {
			$url .= '&filter_approved=' . $this->request->get['filter_approved'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();
		$data['error'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/registrations', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		if (!isset($this->request->get['registration_id'])) {
			$data['action'] = $this->url->link('extension/registrations/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			if(isset($this->request->get['invoice']) && $this->request->get['invoice']==1)
				$data['action'] = $this->url->link('extension/registrations/approve', 'token=' . $this->session->data['token'] . '&registration_id=' . $this->request->get['registration_id'].'&invoice=1' . $url, 'SSL');
			else
				$data['action'] = $this->url->link('extension/registrations/edit', 'token=' . $this->session->data['token'] . '&registration_id=' . $this->request->get['registration_id'] . $url, 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/registrations', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['registration_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$registration_info = $this->model_extension_registrations->getRegistrations($this->request->get['registration_id']);
		}

		if (isset($this->request->post['firstname'])) {
			$data['firstname'] = $this->request->post['firstname'];
		} elseif (!empty($registration_info)) {
			$data['firstname'] = $registration_info['firstname'];
		} else {
			$data['firstname'] = '';
		}

		if (isset($this->request->post['lastname'])) {
			$data['lastname'] = $this->request->post['lastname'];
		} elseif (!empty($registration_info)) {
			$data['lastname'] = $registration_info['lastname'];
		} else {
			$data['lastname'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} elseif (!empty($registration_info)) {
			$data['email'] = $registration_info['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['telephone'])) {
			$data['telephone'] = $this->request->post['telephone'];
		} elseif (!empty($registration_info)) {
			$data['telephone'] = $registration_info['telephone'];
		} else {
			$data['telephone'] = '';
		}

		if (isset($this->request->post['fax'])) {
			$data['fax'] = $this->request->post['fax'];
		} elseif (!empty($registration_info)) {
			$data['fax'] = $registration_info['fax'];
		} else {
			$data['fax'] = '';
		}
		
		if (isset($this->request->post['returning_student'])) {
			$data['returning_student'] = $this->request->post['returning_student'];
		} elseif (!empty($registration_info)) {
			$data['returning_student'] = $registration_info['returning_student'];
		} else {
			$data['returning_student'] = '';
		}
		
		if (isset($this->request->post['job_title'])) {
			$data['job_title'] = $this->request->post['job_title'];
		} elseif (!empty($registration_info)) {
			$data['job_title'] = $registration_info['job_title'];
		} else {
			$data['job_title'] = '';
		}
		
		if (isset($this->request->post['experience'])) {
			$data['experience'] = $this->request->post['experience'];
		} elseif (!empty($registration_info)) {
			$data['experience'] = $registration_info['experience'];
		} else {
			$data['experience'] = '';
		}
		
		if (isset($this->request->post['location'])) {
			$data['location'] = $this->request->post['location'];
		} elseif (!empty($registration_info)) {
			$data['location'] = $registration_info['location'];
		} else {
			$data['location'] = '';
		}
		
		if (isset($this->request->post['date_training'])) {
			if($this->request->get['invoice']==1){				
				$data['date_training'] = DateTime::createFromFormat('Y-m-d',($this->request->post['date_training'] ? $this->request->post['date_training'] : date('m/d/Y')))->format('m/d/Y');
			}else{
				$data['date_training'] = $this->request->post['date_training'];
			}			
		} elseif (!empty($registration_info)) {
			$data['date_training'] = DateTime::createFromFormat('Y-m-d',($registration_info['date_training'] ? $registration_info['date_training'] : date('m/d/Y')))->format('m/d/Y');
		} else {
			$data['date_training'] = '';
		}
		$class_data = $this->model_extension_registrations->getClassRegistrations();
		$data['class_data'] = array();
		if(count($class_data) > 0)
		{
			foreach($class_data as $key=>$value)
			{
				$value['amount_fees'] = $this->formatMoney($value['amount_fees']);
				$data['class_data'][] = $value;
			}
		}
		 
		$data['location_data'] = $this->model_extension_registrations->getAllLocation();
		
		if (isset($this->request->post['newsletter'])) {
			$data['newsletter'] = $this->request->post['newsletter'];
		} elseif (!empty($registration_info)) {
			$data['newsletter'] = $registration_info['newsletter'];
		} else {
			$data['newsletter'] = '';
		}
		
		if (isset($this->request->post['class_id'])) {
			$data['class_id'] = $this->request->post['class_id'];
		} elseif (!empty($registration_info)) {
			$data['class_id'] = explode(',',$registration_info['class_id']);
		} else {
			$data['class_id'] = array();
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($registration_info)) {
			$data['status'] = $registration_info['status'];
		} else {
			$data['status'] = true;
		}

		if (isset($this->request->post['approved'])) {
			$data['approved'] = $this->request->post['approved'];
		} elseif (!empty($registration_info)) {
			$data['approved'] = $registration_info['approved'];
		} else {
			$data['approved'] = true;
		}
		
		if (isset($this->request->post['city'])) {
			$data['city'] = $this->request->post['city'];
		} elseif (!empty($registration_info)) {
			$data['city'] = $registration_info['city'];
		} else {
			$data['city'] = '';
		}
		
		if (isset($this->request->post['state'])) {
			$data['state'] = $this->request->post['state'];
		} elseif (!empty($registration_info)) {
			$data['state'] = $registration_info['state'];
		} else {
			$data['state'] = '';
		}
		
		if (isset($this->request->post['zipcode'])) {
			$data['zipcode'] = $this->request->post['zipcode'];
		} elseif (!empty($registration_info)) {
			$data['zipcode'] = $registration_info['zipcode'];
		} else {
			$data['zipcode'] = '';
		}
				
		if (isset($this->request->post['address'])) {
			$data['address'] = $this->request->post['address'];
		} elseif (isset($this->request->get['registration_id'])) {
			$data['address'] = $registration_info['address'];
		} else {
			$data['address'] = '';
		}
		
		if (isset($this->request->post['message'])) {
			$data['message'] = $this->request->post['message'];
		} elseif (isset($this->request->get['registration_id'])) {
			$data['message'] = $registration_info['message'];
		} else {
			$data['message'] = '';
		}
		
		if (isset($this->request->post['deposit'])) {
			$data['deposit'] = $this->request->post['deposit'];
		} elseif (isset($this->request->get['registration_id'])) {
			$data['deposit'] = $registration_info['deposit'];
		} else {
			$data['deposit'] = '';
		}
		
		if (isset($this->request->get['invoice'])) {
			$data['invoice'] = $this->request->get['invoice'];
		} else {
			$data['invoice'] = '';
		}		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/registrations_form.tpl', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'extension/registrations')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
			$this->error['firstname'] = $this->language->get('error_firstname');
		}

		if ((utf8_strlen($this->request->post['lastname']) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
			$this->error['lastname'] = $this->language->get('error_lastname');
		}

		if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}

		/*$registration_info = $this->model_extension_registrations->getCustomerByEmail($this->request->post['email']);

		if (!isset($this->request->get['registration_id'])) {
			if ($registration_info) {
				$this->error['warning'] = $this->language->get('error_exists');
			}
		} else {
			if ($registration_info && ($this->request->get['registration_id'] != $registration_info['registration_id'])) {
				$this->error['warning'] = $this->language->get('error_exists');
			}
		}*/

		if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
			$this->error['telephone'] = $this->language->get('error_telephone');
		}
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
		return !$this->error;
	}
	
	public function delete() {
		$this->language->load('extension/registrations');		
		$this->load->model('extension/registrations');
		$this->document->setTitle($this->language->get('heading_title'));		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $registrations_id) {
				$this->model_extension_registrations->deleteRegistrations($registrations_id);
			}
			$this->session->data['success'] = $this->language->get('text_success');
		}		
		$this->response->redirect($this->url->link('extension/registrations', 'token=' . $this->session->data['token'], 'SSL'));
	}
	
	protected function validateDelete() {
		if (!$this->user->hasPermission('modify','extension/registrations')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
 
		if (!$this->error) {
			return true; 
		} else {
			return false;
		}
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/registrations')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}