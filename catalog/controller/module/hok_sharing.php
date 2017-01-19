<?php
class ControllerModuleHokSharing extends Controller {
	public function index($setting) 
	{
		/*$this->load->language('module/hok_sharing');
		$data['heading_title'] = $this->language->get('heading_title');		
		$data['size'] = $setting['size'];		
		$style = ($setting['pos_top']?'top:'.$setting['pos_top'].';':'');
		$style .= ($setting['pos_bottom']?'bottom:'.$setting['pos_bottom'].';':'');
		$style .= ($setting['pos_left']?'left:'.$setting['pos_left'].';':'');
		$style .= ($setting['pos_right']?'right:'.$setting['pos_right'].';':'');		
		$data['style'] = $style;		
		$results = $setting['sharing'];		
		$sort_order = array();		
		foreach ($results as $result){
			$sort_order[] = $result['sort_order'];
		}
		array_multisort($sort_order,$results);		
		$data['sharings'] = $results;*/
		
		$this->document->addScript('catalog/view/javascript/calishopvn/share_social.js');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/hok_sharing.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/hok_sharing.tpl', $data);
		} else {
			return $this->load->view('default/template/module/hok_sharing.tpl', $data);
		}
	}
}