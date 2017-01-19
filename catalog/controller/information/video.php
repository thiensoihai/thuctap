<?php
class ControllerInformationVideo extends Controller {
	public function index() {
		$this->language->load('information/video');		
		$this->load->model('extension/video');	 
		$this->document->setTitle($this->language->get('heading_title')); 	 
		$data['breadcrumbs'] = array();		
		$data['breadcrumbs'][] = array(
			'text' 		=> $this->language->get('text_home'),
			'href' 		=> $this->url->link('common/home')
		);
		$data['breadcrumbs'][] = array(
			'text' 		=> $this->language->get('heading_title'),
			'href' 		=> $this->url->link('information/video')
		);
		  
		$url = '';
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}	

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}
		
		$filter_data = array(
			'page' 	=> $page,
			'limit' => 10,
			'start' => 10 * ($page - 1),
		);
		
		$total = $this->model_extension_video->getTotalVideo();
		
		$pagination = new Pagination();
		$pagination->total = $total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->url = $this->url->link('information/video', 'page={page}');		
		$data['pagination'] = $pagination->render();	 
		$data['results'] = sprintf($this->language->get('text_pagination'), ($total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($total - 10)) ? $total : ((($page - 1) * 10) + 10), $total, ceil($total / 10));

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_title'] = $this->language->get('text_title');
		$data['text_description'] = $this->language->get('text_description');
		$data['text_date'] = $this->language->get('text_date');
		$data['text_view'] = $this->language->get('text_view');
	 
		$all_video = $this->model_extension_video->getAllVideo($filter_data);
		$data['all_video'] = array();
		$this->load->model('tool/image');
	 
		foreach ($all_video as $video) {
			$data['all_video'][] = array (
				'title' 		=> html_entity_decode($video['title'], ENT_QUOTES),
				'image'			=> $this->model_tool_image->resize($video['image'], 369, 226),
				'description' 	=> (strlen(strip_tags(html_entity_decode($video['short_description'], ENT_QUOTES))) > 50 ? substr(strip_tags(html_entity_decode($video['short_description'], ENT_QUOTES)), 0, 50) . '...' : strip_tags(html_entity_decode($video['short_description'], ENT_QUOTES))),
				'view' 			=> $this->url->link('information/video/video', 'video_id=' . $video['video_id']),
				'date_added' 	=> date($this->language->get('date_format_short'), strtotime($video['date_added']))
			);
		}
	 
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/video_list.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/video_list.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/information/video_list.tpl', $data));
		}
	}
 
	public function video() {
		$this->load->model('extension/video');	  
		$this->language->load('information/video'); 
		if (isset($this->request->get['video_id']) && !empty($this->request->get['video_id'])) {
			$video_id = $this->request->get['video_id'];
		} else {
			$video_id = 0;
		}
 
		$video = $this->model_extension_video->getVideo($video_id); 		
		$data['breadcrumbs'] = array();	  
		$data['breadcrumbs'][] = array(
			'text' 			=> $this->language->get('text_home'),
			'href' 			=> $this->url->link('common/home')
		);
	  
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/video')
		);
 
		if ($video) 
		{
			$data['breadcrumbs'][] = array(
				'text' 		=> $video['title'],
				'href' 		=> $this->url->link('information/video/video', 'video_id=' . $video_id)
			);
			
			if(strpos($video['youtube'],'https:')!==FALSE)
 				$data['link_youte'] = $video['youtube'];
			else
				$data['link_youte'] = "https://www.youtube.com/embed/".$video['youtube'];
			
			$this->document->setTitle($video['title']);			
			$this->load->model('tool/image');
			$data['image'] = $this->model_tool_image->resize($video['image'], 200, 200); 
			$data['heading_title'] = html_entity_decode($video['title'], ENT_QUOTES);
			$data['description'] = html_entity_decode($video['description'], ENT_QUOTES);
			$data['other_videos'] = array();
			$other_video = $this->model_extension_video->getAllOtherVideo($video_id);
			if(count($other_video) > 0)
			{
				foreach($other_video as $key=>$value)
				{
					if(!empty($value['image']))
					{
						$data['other_videos'][] = array(
							'title'=> html_entity_decode($value['title'], ENT_QUOTES),
							'description'=> (strlen(strip_tags(html_entity_decode($value['short_description'], ENT_QUOTES))) > 50 ? substr(strip_tags(html_entity_decode($value['short_description'], ENT_QUOTES)), 0, 50) . '...' : strip_tags(html_entity_decode($value['short_description'], ENT_QUOTES))),
							'image'=> $this->model_tool_image->resize($value['image'], 120, 90),
							'link'=> $this->url->link('information/video/video', 'video_id=' . $value['video_id']),
							'date_added' 	=> date('D, m/d/Y', strtotime($video['date_added']))
						);
					}					
				}
			}
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/video.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/video.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/information/video.tpl', $data));
			}
		} 
			else 
		{
			$data['breadcrumbs'][] = array(
				'text' 		=> $this->language->get('text_error'),
				'href' 		=> $this->url->link('information/video', 'video_id=' . $video_id)
			);
	 
			$this->document->setTitle($this->language->get('text_error'));	 
			$data['heading_title'] = $this->language->get('text_error');
			$data['text_error'] = $this->language->get('text_error');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['continue'] = $this->url->link('common/home');	 
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
			}
		}
	}
}