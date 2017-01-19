<?php
class ModelExtensionVideo extends Model {	
	public function getVideo($video_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "video n LEFT JOIN " . DB_PREFIX . "video_description nd ON n.video_id = nd.video_id WHERE n.video_id = '" . (int)$video_id . "' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row;
	}
 
	public function getAllVideo($data) {
		$sql = "SELECT * FROM " . DB_PREFIX . "video n LEFT JOIN " . DB_PREFIX . "video_description nd ON n.video_id = nd.video_id WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n.status = '1' ORDER BY date_added DESC";
		
		if (isset($data['start']) && isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}
			
			if ($data['limit'] < 1) {
				$data['limit'] = 10;
			}	
		
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	
	public function getAllOtherVideo($id) {
		$sql = "SELECT * FROM " . DB_PREFIX . "video n LEFT JOIN " . DB_PREFIX . "video_description nd ON n.video_id = nd.video_id WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND nd.video_id != ".(int)$id."  AND n.status = '1' ORDER BY date_added DESC LIMIT 0,8";
		
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	
	public function getTotalVideo() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "video");
	
		return $query->row['total'];
	}
}