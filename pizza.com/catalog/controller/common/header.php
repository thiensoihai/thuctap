<?php
class ControllerCommonHeader extends Controller 
{
	protected $category=NULL;
	protected $category_products=NULL;
		
	public function index() 
	{
		$data['title'] = $this->document->getTitle();
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}
		$data['code'] = $this->session->data['language'];
		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');
		$data['telephone'] = $this->config->get('config_telephone');
		$data['we_open'] = $this->config->get('config_open');
		$data['config_facebook_parameter'] = $this->config->get('config_facebook_parameter');
		$data['config_youtube_parameter'] = $this->config->get('config_youtube_parameter');
		$data['config_twitter_parameter'] = $this->config->get('config_twitter_parameter');
		$data['config_googleplus_parameter'] = $this->config->get('config_googleplus_parameter');
		$data['config_instagram_parameter'] = $this->config->get('config_instagram_parameter');
		$data['config_email'] = $this->config->get('config_email');
		
		if ($this->config->get('config_google_analytics_status')) {
			$data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
		} else {
			$data['google_analytics'] = '';
		}

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$data['icon'] = $server . 'image/' . $this->config->get('config_icon');
		} else {
			$data['icon'] = '';
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}
		
		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');
		$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));		
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_all'] = $this->language->get('text_all');
		$data['text_hello'] = $this->language->get('text_hello');
		$data['text_services'] = $this->language->get('text_services');

		$data['home'] = str_replace('index.php?route=common/home', '', $this->url->link('common/home'));
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['register'] = $this->url->link('account/register', '', 'SSL');
		$data['login'] = $this->url->link('account/login', '', 'SSL');
		$data['affiliate'] = $this->url->link('affiliate/login', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');		
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
        $data['product'] = $this->url->link('product/category', '', 'SSL');
		$data['contact'] = $this->url->link('information/contact');
		$data['about_us'] = $this->url->link('information/information', 'information_id=4');
		$data['registerform'] =  $this->url->link('account/registerform').'/online';
		$data['training_program'] =  $this->url->link('information/news');
		$data['video_youtube'] =  $this->url->link('information/video');
		if($data['logged']){
			$data['c_name'] = $this->customer->getFirstName() . ' ' . $this->customer->getLastName();
		}
		
		$status = true;
		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;
					break;
				}
			}
		}
		// Menu
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$data['categories'] = array();
		$categories = $this->model_catalog_category->getCategories(0);
		foreach ($categories as $category)
		{
			if ($category['top']) {				
				//Level 1
				$children_data = $this->parentMenu($category['category_id']);
				$data['categories'][] = array(
					'category_id'     => $category['category_id'],
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}
		
		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');
		if(!$data['logged']){
			$data['login_socical'] = $this->load->controller('common/top_right_login_sidebar');
		}
		
		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}
		$data['router'] = $this->request->get;
		//print_r($data['router']);exit;
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);
		} else {
			return $this->load->view('default/template/common/header.tpl', $data);
		}
	}
	
	private function parentMenu($category_id)
	{
		$this->load->model('catalog/category');
		// Level 2
		$children_data = array();
		$children = $this->model_catalog_category->getCategories($category_id);
		foreach ($children as $child) 
		{
			$filter_data = array(
				'filter_category_id'  => $child['category_id'],
				'filter_sub_category' => true
			);
			$sub_children = $this->parentMenu($child['category_id']);			
			$children_data[] = array(
				'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
				'href'  => $this->url->link('product/category', 'path=' . $category_id . '_' . $child['category_id']),
				'children'=>$sub_children
			);
		}
		return $children_data;
	}
}