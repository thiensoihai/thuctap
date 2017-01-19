<?php

/*****************************************************************************
 *                                                                           *
 *    Module tích hợp thanh toán trực tiếp với thẻ ngân hàng Bảo Kim         *
 * Phiên bản : 2.0                                                           *
 * Module được phát triển bởi IT Bảo Kim                                     *
 * Chức năng :                                                               *
 * - Tích hợp thanh toán qua baokim.vn cho các merchant site có đăng ký API. *
 * - Thực hiện lấy thông tin tài khoản người bán                             *
 *          danh sách các phương thức thanh toán ngân hàng qua email         *
 *                                                                           *
 * - Gửi thông tin thanh toán tới baokim.vn để xử lý việc thanh toán.        *
 * - Xác thực tính chính xác của thông tin được gửi về từ baokim.vn          *
 * @author hieunn                                                            *
 *****************************************************************************
 * Xin hãy đọc kĩ tài liệu tích hợp trên trang                               *
 * http://developer.baokim.vn/                                               *
 *                                                                           *
 *****************************************************************************/
class ControllerPaymentBaoKimPro extends Controller
{
	const API_SELLER_INFO = "/payment/rest/payment_pro_api/get_seller_info"; // API lấy thông tin người bán
	const API_PAYMENT_PRO = "/payment/rest/payment_pro_api/pay_by_card"; // API thực hiện thanh toán

	public function index()
	{
		$this->language->load('payment/baokim_pro');

		$business = $this->config->get('baokim_pro_business');
		$param = array(
			'business' => $business,
		);
		$call_API = $this->call_API('GET', $param, self::API_SELLER_INFO);

		//echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />';
		//echo '<pre>error'.print_r($call_API['error'], true).'</pre>';
		//echo '<pre>tmp'.print_r(isset($call_API['error']), true).'</pre>';
		
		if(isset($call_API['error']) && strlen($call_API['error']) > 2){
			echo "<strong style='color:red'>call_API : ".$call_API['error']."</strong> - " . $this->language->get('error_api');die;
		}
		$seller_info = json_decode($call_API, true);
		if(isset($seller_info['error'])){
			echo "<strong style='color:red'>seller_info: ".$seller_info['error']."</strong> - " . $this->language->get('error_api');die;
		}
		$data['banks'] = $seller_info['bank_payment_methods'];
		$data['text_credit_card'] = $this->language->get('text_credit_card');
		$data['text_start_date'] = $this->language->get('text_start_date');
		$data['text_issue'] = $this->language->get('text_issue');
		$data['text_wait'] = $this->language->get('text_wait');

		$data['button_confirm'] = $this->language->get('button_confirm');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/baokim_pro.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/payment/baokim_pro.tpl', $data);
		} else {
			return $this->load->view('default/template/payment/baokim_pro.tpl', $data);
		}
	}

	public function send()
	{
		$transaction_mode_id = $this->config->get('baokim_pro_transaction');
		$bank_payment_method_id = $this->request->post['baokim_bank_payment_method_id'];
		$business = $this->config->get('baokim_pro_business');

		$this->load->model('checkout/order');
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

		$order_id = $this->session->data['order_id'];
		$total_amount = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);
		$currency = $order_info['currency_code'];
		$shipping_fee = '';
		$tax_fee = '';
		$order_description = $order_info['comment'];
		$url_success = $this->url->link('payment/baokim_pro/confirm?order_id='.strval(time() . "-" . $order_id), '', 'SSL');
		$url_cancel = '';
		$url_detail = '';

		$payer_name = $order_info['lastname'] . ' ' . $order_info['firstname'];
		$payer_email = $order_info['email'];
		$payer_phone_no = $order_info['telephone'];
		$shipping_address = $order_info['payment_address_1'];
		/**
		 * @param $order_id            Mã đơn hàng
		 * @param $business            Email tài khoản người bán
		 * @param $total_amount        Giá trị đơn hàng
		 * @param $shipping_fee        Phí vận chuyển
		 * @param $tax_fee             Thuế
		 * @param $order_description   Mô tả đơn hàng
		 * @param $url_success         Url trả về khi thanh toán thành công
		 * @param $url_cancel          Url trả về khi hủy thanh toán
		 * @param $url_detail          Url chi tiết đơn hàng
		 */

		$data = array(
			'order_id' => strval(time() . "-" . $order_id),
			'business' => strval($business),
			'total_amount' => strval($total_amount),
			'shipping_fee' => strval($shipping_fee),
			'tax_fee' => strval($tax_fee),
			'order_description' => $order_description,
			'url_success' => strtolower($url_success),
			'url_cancel' => strtolower($url_cancel),
			'url_detail' => strtolower($url_detail),
			'payer_name' => strval($payer_name),
			'payer_email' => strval($payer_email),
			'payer_phone_no' => strval($payer_phone_no),
			'payer_address' => strval($shipping_address),
			'currency_code' =>  strval($currency),
			'bank_payment_method_id' => strval($bank_payment_method_id),
			'transaction_mode_id'=> strval($transaction_mode_id),
			'escrow_timeout' => 3,
		);
		$result = $this->call_API("POST", $data, self::API_PAYMENT_PRO);
		$this->response->setOutput($result);
	}

	public function confirm()
	{
		$message = '';
		$order_id = 0;
		if (isset($this->request->get['order_id'])) {
			$str_id = explode("-", $this->request->get['order_id']);
			$order_id = $str_id[1];
		} else {
			$message = '';
			$order_id = 0;
		}

		$this->load->model('checkout/order');
		$order_info = $this->model_checkout_order->getOrder($order_id);

		if ($order_info) {
			$this->language->load('payment/baokim_pro');
			$data['title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));

			if (!isset($this->request->server['HTTPS']) || ($this->request->server['HTTPS'] != 'on')) {
				$data['base'] = HTTP_SERVER;
			} else {
				$data['base'] = HTTPS_SERVER;
			}

			$data['language'] = $this->language->get('code');
			$data['direction'] = $this->language->get('direction');
			$data['heading_title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));
			$data['text_response'] = $this->language->get('text_response');
			$data['text_success'] = $this->language->get('text_success');
			$data['text_success_wait'] = sprintf($this->language->get('text_success_wait'), $this->url->link('checkout/success'));
			$data['text_failure'] = $this->language->get('text_failure');
			$data['text_failure_wait'] = sprintf($this->language->get('text_failure_wait'), $this->url->link('checkout/cart'));

			if (!empty($order_info)) {
				$this->load->model('checkout/order');
				$this->model_checkout_order->confirm($order_id, $this->config->get('config_order_status_id'));
				$this->model_checkout_order->update($order_id, $this->config->get('baokim_pro_order_status_id'), $message, false);
				$data['continue'] = $this->url->link('checkout/success');

				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/baokim_success.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/payment/baokim_success.tpl';
				} else {
					$this->template = 'default/template/payment/baokim_success.tpl';
				}

				$this->children = array(
					'common/column_left',
					'common/column_right',
					'common/content_top',
					'common/content_bottom',
					'common/footer',
					'common/header'
				);

				$this->response->setOutput($this->render());
			} else {
				$data['continue'] = $this->url->link('checkout/cart');

				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/baokim_failure.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/payment/baokim_failure.tpl';
				} else {
					$this->template = 'default/template/payment/baokim_failure.tpl';
				}

				$this->children = array(
					'common/column_left',
					'common/column_right',
					'common/content_top',
					'common/content_bottom',
					'common/footer',
					'common/header'
				);
				$this->response->setOutput($this->render());
			}
		}
	}

	public function baokim_listener()
	{
		include('catalog/controller/payment/baokim_listener.php');
		$registry = $this->registry;
		$baokim_listener = new BaokimListener($registry);
		$baokim_listener->index();
	}

	/**
	 * Gọi API Bảo Kim thực hiện thanh toán với thẻ ngân hàng
	 *
	 * @param $method Sử dụng phương thức GET, POST cho với từng API
	 * @param $data Dữ liệu gửi đên Bảo Kim
	 * @param $api API được gọi sang Bảo Kim
	 * @return mixed
	 */
	private function call_API($method, $data, $api)
	{
		$business = $this->config->get('baokim_pro_business');
		$username = $this->config->get('baokim_pro_username');
		$password = $this->config->get('baokim_pro_password');
		$private_key = $this->config->get('baokim_pro_signature');
		$server = $this->config->get('baokim_pro_server');
		$arrayPost = array();
		$arrayGet = array();

		ksort($data);
		if ($method == 'GET') {
			$arrayGet = $data;
		} else {
			$arrayPost = $data;
		}

		$signature = $this->makeBaoKimAPISignature($method, $api, $arrayGet, $arrayPost, $private_key);
		$url = $server . $api . '?' . 'signature=' . $signature . (($method == "GET") ? $this->createRequestUrl($data) : '');
		$curl = curl_init($url);

		//	Form
		curl_setopt($curl, CURLOPT_HEADER, 0);
		curl_setopt($curl, CURLINFO_HEADER_OUT, 1);
		curl_setopt($curl, CURLOPT_TIMEOUT, 30);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_DIGEST | CURLAUTH_BASIC);
		curl_setopt($curl, CURLOPT_USERPWD, $username . ':' . $password);
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
		if ($method == 'POST') {
			curl_setopt($curl, CURLOPT_POSTFIELDS, $this->httpBuildQuery(ksort($arrayPost)));
		}

		$result = curl_exec($curl);
		$status = curl_getinfo($curl, CURLINFO_HTTP_CODE);
		$error = curl_error($curl);
		if(empty($result)){
			return array(
				'status'=>$status,
				'error'=>$error
			);
		}

		return $result;
	}

	/**
	 * Hàm thực hiện việc tạo chữ ký với dữ liệu gửi đến Bảo Kim
	 *
	 * @param $method
	 * @param $url
	 * @param array $getArgs
	 * @param array $postArgs
	 * @param $priKeyFile
	 * @return string
	 */
	private function makeBaoKimAPISignature($method, $url, $getArgs = array(), $postArgs = array(), $priKeyFile)
	{
		if (strpos($url, '?') !== false) {
			list($url, $get) = explode('?', $url);
			parse_str($get, $get);
			$getArgs = array_merge($get, $getArgs);
		}
		ksort($getArgs);
		ksort($postArgs);
		$method = strtoupper($method);

		$data = $method . '&' . urlencode($url) . '&' . urlencode(http_build_query($getArgs)) . '&' . urlencode(http_build_query($postArgs));

		$priKey = openssl_get_privatekey($priKeyFile);
		assert('$priKey !== false');

		$x = openssl_sign($data, $signature, $priKey, OPENSSL_ALGO_SHA1);
		assert('$x !== false');
		return urlencode(base64_encode($signature));
	}

	/**
	 *
	 * @param $formData
	 * @param string $numericPrefix
	 * @param string $argSeparator
	 * @param string $arrName
	 * @return string
	 */
	private function httpBuildQuery($formData, $numericPrefix = '', $argSeparator = '&', $arrName = '')
	{
		$query = array();
		foreach ($formData as $k => $v) {
			if (is_int($k)) $k = $numericPrefix . $k;
			if (is_array($v)) $query[] = httpBuildQuery($v, $numericPrefix, $argSeparator, $k);
			else $query[] = rawurlencode(empty($arrName) ? $k : ($arrName . '[' . $k . ']')) . '=' . rawurlencode($v);
		}

		return implode($argSeparator, $query);
	}

	private function createRequestUrl($data)
	{
		$params = $data;
		ksort($params);
		$url_params = '';
		foreach ($params as $key => $value) {
			if ($url_params == '')
				$url_params .= $key . '=' . urlencode($value);
			else
				$url_params .= '&' . $key . '=' . urlencode($value);
		}
		return "&" . $url_params;
	}

}