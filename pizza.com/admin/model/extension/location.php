<?php
class ModelExtensionLocation extends Model {
	public function addLocation($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "reg_location SET image = '" . $this->db->escape($data['image']) . "', geocode='" . $this->db->escape($data['geocode']) . "', date_added = NOW(), status = '" . (int)$data['status'] . "'");
		
		$location_id = $this->db->getLastId();
		
		foreach ($data['reg_location'] as $key => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX ."reg_location_description SET location_id = '" . (int)$location_id . "', language_id = '" . (int)$key . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "' ");
		}
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'location_id=" . (int)$location_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
	}
	
	public function editLocation($location_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "reg_location SET image = '" . $this->db->escape($data['image']) . "', geocode='" . $this->db->escape($data['geocode']) . "', status = '" . (int)$data['status'] . "' WHERE location_id = '" . (int)$location_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "reg_location_description WHERE location_id = '" . (int)$location_id. "'");
		
		foreach ($data['reg_location'] as $key => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX ."reg_location_description SET location_id = '" . (int)$location_id . "', language_id = '" . (int)$key . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "' ");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'location_id=" . (int)$location_id. "'");
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'location_id=" . (int)$location_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
	}
	
	public function getLocation($location_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'location_id=" . (int)$location_id . "') AS keyword FROM " . DB_PREFIX . "reg_location WHERE location_id = '" . (int)$location_id . "'"); 
 
		if ($query->num_rows) {
			return $query->row;
		} else {
			return false;
		}
	}
   
	public function getLocationDescription($location_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "reg_location_description WHERE location_id = '" . (int)$location_id . "'"); 
		
		foreach ($query->rows as $result) {
			$reg_location_description[$result['language_id']] = array(
				'title'       			=> $result['title'],				
				'description' 			=> $result['description']
			);
		}
		
		return $reg_location_description;
	}
 
	public function getAllLocation($data) {
		$sql = "SELECT * FROM " . DB_PREFIX . "reg_location n LEFT JOIN " . DB_PREFIX . "reg_location_description nd ON n.location_id = nd.location_id WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY date_added DESC";
		
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
   
	public function deleteLocation($location_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "reg_location WHERE location_id = '" . (int)$location_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "reg_location_description WHERE location_id = '" . (int)$location_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'location_id=" . (int)$location_id. "'");
	}
   
	public function getTotalLocation() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "reg_location");
	
		return $query->row['total'];
	}
}