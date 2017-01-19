<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));
		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}
		$data['top_banner_sidebar'] = $this->load->controller('common/top_banner_sidebar');		
		$data['column_left_sidebar'] = $this->load->controller('common/column_left_sidebar');
		$data['column_right_sidebar'] = $this->load->controller('common/column_right_sidebar');
		$data['content_top'] = $this->load->controller('common/content_top');			
		$data['content_bottom_left'] = $this->load->controller('common/content_bottom_left');		
		$data['content_bottom_right'] = $this->load->controller('common/content_bottom_right');		
		$data['content_bottom'] = $this->load->controller('common/content_bottom');			
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		$data['instagram_id_parameter'] = $this->config->get('config_account_instagram_id_parameter');
		$data['token_instagram_parameter'] = $this->config->get('config_token_instagram_parameter');
		//load model
		$this->load->model('catalog/information');
		$this->load->model('extension/video');
		$this->load->model('catalog/product');
		$this->load->model('extension/module');
		$this->load->model('design/banner');

		$data['informations_sub_footer'] = array();
		$information_data = array();
		$information_data['ordering'] = array(8,7,9,10);
		$information_data['icon'] = array(7=>'icon-thumbs-up2',8=>'icon-credit-cards',9=>'icon-truck2',10=>'icon-undo');
		foreach ($this->model_catalog_information->getInformations() as $result) {			
			if (in_array($result['information_id'],$information_data['ordering'])) {
				$data['informations_sub_footer'][] = array(
					'icon' => $information_data['icon'][$result['information_id']],
					'title' => $result['title'],
					'desc' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100),
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}
		//video
		$filter_data = array(
			'page' 	=> 1,
			'limit' => 1,
			'start' => 0
		);

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

		//product

		$data['products_daily'] = array();

		$filter_data_daily = array(
			'sort'               => array(
				'pd.name',
				'p.model',
				'p.quantity',
				'p.price',
				'rating',
				'p.sort_order',
				'p.date_added'
			),
			'start'              => 0,
			'limit'              => 6
		);
		$results = $this->model_catalog_product->getProducts($filter_data_daily);
		$data["limit"] = $filter_data_daily['limit'];
		foreach ($results as $result) {
			$sub_price = 0;
			$sub_special=0;
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			}

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$sub_price = $this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax'));
				$price = $this->currency->format($sub_price);
			} else {
				$price = false;
			}

			if ((float)$result['special']) {
				$sub_special = $this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax'));
				$special = $this->currency->format($sub_special);
			} else {
				$special = false;
			}

			if ($this->config->get('config_tax')) {
				$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
			} else {
				$tax = false;
			}

			if ($this->config->get('config_review_status')) {
				$rating = (int)$result['rating'];
			} else {
				$rating = false;
			}
			$discount = (isset($sub_special) && $sub_special > 0) ? (100 - (round(($sub_special * 100)/$sub_price,2))) : 0;
			$data['products_daily'][] = array(
				'product_id'  => $result['product_id'],
				'thumb'       => $image,
				'name'        => $result['name'],
				'description' => $this->model_catalog_product->cutString( strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 12),
				'price'       => $price,
				'discount'    => $discount,
				'special'     => $special,
				'tax'         => $tax,
				'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
				'rating'      => $result['rating'],
				'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url),
				'quickview'   => $this->url->link('product/quickview', 'product_id=' . $result['product_id']),
			);
		}
		$url = '';

		if (isset($this->request->get['filter'])) {
			$url .= '&filter=' . $this->request->get['filter'];
		}

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}

		//special
		$data['products'] = array();

		$filter_data = array(
			'sort'               => array(
				'pd.name',
				'p.model',
				'p.quantity',
				'p.price',
				'rating',
				'p.sort_order',
				'p.date_added'
			),
			//'order' => $order,
			'start' => 0,
			'limit' => 3
		);

		//$product_total = $this->model_catalog_product->getTotalProductSpecials();

		$results_special = $this->model_catalog_product->getProductSpecials($filter_data);

		foreach ($results_special as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			}

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}

			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}

			if ($this->config->get('config_tax')) {
				$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
			} else {
				$tax = false;
			}

			if ($this->config->get('config_review_status')) {
				$rating = (int)$result['rating'];
			} else {
				$rating = false;
			}

			$data['products'][] = array(
				'product_id'  => $result['product_id'],
				'thumb'       => $image,
				'name'        => $result['name'],
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
				'price'       => $price,
				'special'     => $special,
				'tax'         => $tax,
				'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
				'rating'      => $result['rating'],
				'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'] . $url)
			);
		}
		//slider
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
		//$data['module'] = $module++;
//		echo '<pre>';
//		print_r($data['products_daily']);exit();
		//
		$this->document->addStyle('catalog/view/javascript/ilashmax/instagram/pongstagr.am.min.css');
		$this->document->addScript('catalog/view/javascript/ilashmax/instagram/pongstagr.am.min.js');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/home.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/home.tpl', $data));
		}
	}
}