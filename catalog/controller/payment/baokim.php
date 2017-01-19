<?php
/*****************************************************************************
 *                                                                           *
 *            Module tích hợp thanh toán Bảo Kim                             *
 * Phiên bản : 2.0                                                           *
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
class ControllerPaymentBaoKim extends Controller
{
	public function index()
	{
		$this->load->language('payment/baokim');
		$this->load->model('checkout/order');
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
		$this->load->library('encryption');

		$merchant_id = $this->config->get('baokim_merchant');
		$secure_pass = $this->config->get('baokim_security');
		$business = $this->config->get('baokim_business');
		$server = $this->config->get('baokim_server');

		$order_id = $this->session->data['order_id'];
		$total_amount = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);
		$shipping_fee = '';
		$tax_fee = '';
		$order_description = $order_info['comment'];
		$url_success = $this->url->link('payment/baokim/confirm', '', 'SSL');
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
			'merchant_id' => strval($merchant_id),
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
			'shipping_address' => strval($shipping_address),
			'currency' => strval($order_info['currency_code']),
		);
		//$data['continue'] = HTTPS_SERVER . 'checkout_bk.php?email=' . $business . '&total_amount=' . $total_amount . '&order_id=' . $order_id . '&merchant_id=' . $merchant_id . '&secure_pass=' . $secure_pass . '&url_success=' . $url_success;
		$data['continue'] = $this->createRequestUrl($data, $server, $secure_pass);
		$data['button_confirm'] = $this->language->get('button_confirm');
		$data['button_back'] = $this->language->get('button_back');
		//echo '<script>window.location = "' . $data['continue'] . '"</script>';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/baokim.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/payment/baokim.tpl', $data);
		} else {
			return $this->load->view('default/template/payment/baokim.tpl', $data);
		}
	}

	public function confirm()
	{
		$secure_pass = $this->config->get('baokim_security');
		$server = $this->config->get('baokim_server');
		unset($_GET['route']);

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

		if ($this->verifyResponseUrl($_GET, $secure_pass)) {
			$status = true;
		} else {
			$message = "Dữ liệu từ Bảo Kim không hợp lệ !";
			$status = false;
		}

		if ($order_info) {
			$this->language->load('payment/baokim');
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

			if ($status) {
				$this->load->model('checkout/order');
				$this->model_checkout_order->confirm($order_id, $this->config->get('config_order_status_id'));
				$this->model_checkout_order->update($order_id, $this->config->get('baokim_order_status_id'), $message, false);
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
	 * Hàm xây dựng url chuyển đến BaoKim.vn thực hiện thanh toán, trong đó có tham số mã hóa (còn gọi là public key)
	 * @param $data             Mảng dữ liệu thông tin để tạo tham số gửi sang BaoKim thực hiện thanh toán
	 * @param $redirect_url     Đường dẫn trang thực hiện thanh toán
	 * @param $secure_pass      Mã bảo mật
	 * @return string           URL chứa tham số
	 */
	private function createRequestUrl($data, $redirect_url, $secure_pass)
	{
		// Mảng các tham số chuyển tới baokim.vn
		$params = $data;
		ksort($params);

		$params['checksum'] = hash_hmac('SHA1', implode('', $params), $secure_pass);

		//Kiểm tra  biến $redirect_url xem có '?' không, nếu không có thì bổ sung vào
		if (strpos($redirect_url, '?') === false) {
			$redirect_url .= '?';
		} else if (substr($redirect_url, strlen($redirect_url) - 1, 1) != '?' && strpos($redirect_url, '&') === false) {
			// Nếu biến $redirect_url có '?' nhưng không kết thúc bằng '?' và có chứa dấu '&' thì bổ sung vào cuối
			$redirect_url .= '&';
		}

		// Tạo đoạn url chứa tham số
		$url_params = '';
		foreach ($params as $key => $value) {
			if ($url_params == '')
				$url_params .= $key . '=' . urlencode($value);
			else
				$url_params .= '&' . $key . '=' . urlencode($value);
		}
		return $redirect_url . $url_params;
	}

	/**
	 * Hàm thực hiện xác minh tính chính xác thông tin trả về từ BaoKim.vn
	 * @param $url_params       chứa tham số trả về trên url
	 * @param $secure_pass      Mã bảo mật
	 * @return true             True  -  thông tin là chính xác,
	 *                          False -  thông tin không chính xác
	 */
	private function verifyResponseUrl($url_params = array(), $secure_pass)
	{
		if (empty($url_params['checksum'])) {
			echo "invalid parameters: checksum is missing";
			return FALSE;
		}

		$checksum = $url_params['checksum'];
		unset($url_params['checksum']);

		ksort($url_params);

		if (strcasecmp($checksum, hash_hmac('SHA1', implode('', $url_params), $secure_pass)) === 0)
			return TRUE;
		else
			return FALSE;
	}
}

?>