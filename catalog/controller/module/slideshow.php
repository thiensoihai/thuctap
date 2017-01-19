<?php
class ControllerModuleSlideshow extends Controller 
{
	public function index($setting) {
		static $module = 0;
		$this->load->language('module/slideshow');
		$this->load->model('design/banner');
		$this->load->model('tool/image');

		//$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		//$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');
		$this->document->addStyle('catalog/view/javascript/ilashmax/rs-plugin/css/settings.css');
		$this->document->addScript('catalog/view/javascript/ilashmax/rs-plugin/js/jquery.themepunch.tools.min.js');
		$this->document->addScript('catalog/view/javascript/ilashmax/rs-plugin/js/jquery.themepunch.revolution.min.js');
		$this->document->addScript('catalog/view/javascript/ilashmax/revolution-slider.js');

		$data['banners'] = array();
		
		$results = $this->model_design_banner->getBanner($setting['banner_id']);
		$url = '';
		if ($this->request->server['HTTPS']) {
			$url =  $this->config->get('config_ssl') . 'image/';
		} else {
			$url = $this->config->get('config_url') . 'image/';
		}
		
		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$extract = explode('|',$result['title']);
				$data['banners'][] = array(
					'description' => $result['description'],
					'sub_title' => isset($extract[0]) ? $extract[0] : '',
					'l_title' => isset($extract[1]) ? $extract[1] : $extract[0],
					'discount' => isset($discount[2]) ? $discount[2] : 0,
					'link'  => $result['link'],
					'image' => $url.$result['image']
				);
			}
		}		
		$data['module'] = $module++;
		$data['start_shopping_bnt'] = $this->language->get('start_shopping_bnt');
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/slideshow.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/slideshow.tpl', $data);
		} else {
			return $this->load->view('default/template/module/slideshow.tpl', $data);
		}
	}
}