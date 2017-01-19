<?php
class ModelExtensionVideo extends Model {
	public function addVideo($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "video SET image = '" . $this->db->escape($data['image']) . "', youtube='" . $this->db->escape($data['youtube']) . "', date_added = NOW(), status = '" . (int)$data['status'] . "'");
		
		$video_id = $this->db->getLastId();
		
		foreach ($data['video'] as $key => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX ."video_description SET video_id = '" . (int)$video_id . "', language_id = '" . (int)$key . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', short_description = '" . $this->db->escape($value['short_description']) . "'");
		}
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'video_id=" . (int)$video_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
	}
	
	public function editVideo($video_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "video SET image = '" . $this->db->escape($data['image']) . "', youtube='" . $this->db->escape($data['youtube']) . "', status = '" . (int)$data['status'] . "' WHERE video_id = '" . (int)$video_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "video_description WHERE video_id = '" . (int)$video_id. "'");
		
		foreach ($data['video'] as $key => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX ."video_description SET video_id = '" . (int)$video_id . "', language_id = '" . (int)$key . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', short_description = '" . $this->db->escape($value['short_description']) . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'video_id=" . (int)$video_id. "'");
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'video_id=" . (int)$video_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
	}
	
	public function getVideo($video_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'video_id=" . (int)$video_id . "') AS keyword FROM " . DB_PREFIX . "video WHERE video_id = '" . (int)$video_id . "'"); 
 
		if ($query->num_rows) {
			return $query->row;
		} else {
			return false;
		}
	}
   
	public function getVideoDescription($video_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "video_description WHERE video_id = '" . (int)$video_id . "'"); 
		
		foreach ($query->rows as $result) {
			$video_description[$result['language_id']] = array(
				'title'       			=> $result['title'],
				'short_description'		=> $result['short_description'],
				'description' 			=> $result['description']
			);
		}
		
		return $video_description;
	}
 
	public function getAllVideo($data) {
		$sql = "SELECT * FROM " . DB_PREFIX . "video n LEFT JOIN " . DB_PREFIX . "video_description nd ON n.video_id = nd.video_id WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY date_added DESC";
		
		if (isset($data['start']) && isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}
			
			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
		
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}	
		
		$query = $this->db->query($sql);
 
		return $query->rows;
	}
   
	public function deleteVideo($video_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "video WHERE video_id = '" . (int)$video_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "video_description WHERE video_id = '" . (int)$video_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'video_id=" . (int)$video_id. "'");
	}
   
	public function getTotalVideo() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "video");
	
		return $query->row['total'];
	}
}