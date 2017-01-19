<?php
class ControllerModuleFpcarousel extends Controller {
	public function index($setting) {
		static $module = 0;
		$this->load->language('module/fpcarousel');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');		
		
		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.transitions.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/fpcarousel.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/fpcarousel.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/fpcarousel.css');
		}

		$data['name'] = isset($setting['name']) ? $setting['name'] : '';
		$data['name_as_title'] = isset($setting['name_as_title']) ? $setting['name_as_title'] : 0;
		$data['products'] = array();
		$data['itemspage'] = isset($setting['itemspage']) ? (int)$setting['itemspage'] : 4;
		$data['auto_play'] = isset($setting['auto_play']) ? (int)$setting['auto_play'] : 0;
		$data['pause_on_hover'] = isset($setting['pause_on_hover']) ? (int)$setting['pause_on_hover'] : 0;
		$data['show_pagination'] = isset($setting['show_pagination']) ? (int)$setting['show_pagination'] : 0;
		$data['show_navigation'] = isset($setting['show_navigation']) ? (int)$setting['show_navigation'] : 1;

		if (!$setting['limit']) {
			$setting['limit'] = 8;
		}
		
		$thumb_width = isset($setting['thumb_width']) ? $setting['thumb_width'] : 180;
		$thumb_height = isset($setting['thumb_height']) ? $setting['thumb_height'] : 180;
		
		// shuffle products
		if(isset($setting['shuffle_items']) && $setting['shuffle_items']) {
			shuffle($setting['product']);
		}
		
		$products = array_slice($setting['product'], 0, (int)$setting['limit']);

		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $thumb_width, $thumb_height);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $thumb_width, $thumb_height);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}

				$data['products'][] = array(
					'product_id'  => $product_info['product_id'],
					'thumb'       => $image,
					'name'        => $product_info['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
				);
			}
		}
		
		$data['module'] = $module++;

		if ($data['products']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/fpcarousel.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/fpcarousel.tpl', $data);
			} else {
				return $this->load->view('default/template/module/fpcarousel.tpl', $data);
			}
		}
	}
}
