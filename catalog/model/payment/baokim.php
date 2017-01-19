<?php
/*****************************************************************************
 *                                                                           *
 *            Module tích hợp thanh toán Bảo Kim                             *
 * Phiên bản : 1.1                                                           *
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
class ModelPaymentBaoKim extends Model {
  	public function getMethod($address) {
		$this->load->language('payment/baokim');
		
		if ($this->config->get('baokim_status')) {
      		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('baokim_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");
			
			if (!$this->config->get('baokim_geo_zone_id')) {
        		$status = TRUE;
      		} elseif ($query->num_rows) {
      		  	$status = TRUE;
      		} else {
     	  		$status = FALSE;
			}	
      	} else {
			$status = FALSE;
		}
		
		$method_data = array();
	
		if ($status) {  
      		$method_data = array( 
        		'code'         => 'baokim',
        		'title'      => $this->language->get('text_title'),
		        'terms'      => '',
				'sort_order' => $this->config->get('baokim_sort_order')
      		);
    	}
		
    	return $method_data;
  	}
}
?>