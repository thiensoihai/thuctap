<?php
class ModelExtensionRegistrations extends Model {
	public function addRegistrations($data) {
		$query  = "INSERT INTO " . DB_PREFIX . "registrations SET customer_id = '" . $this->db->escape($data['customer_id']) . "', store_id = '" . $this->db->escape($data['store_id']) . "', date_added = NOW(), status = 1";
		$query .= " ,firstname ='".$this->db->escape($data['firstname'])."'"; 
		$query .= " ,lastname ='".$this->db->escape($data['lastname'])."'"; 
		$query .= " ,email ='".$this->db->escape($data['email'])."'"; 
		$query .= " ,telephone ='".$this->db->escape($data['telephone'])."'"; 
		$query .= " ,fax ='".$this->db->escape($data['fax'])."'"; 
		$query .= " ,address_1 ='".$this->db->escape($data['address_1'])."'"; 
		$query .= " ,address_2 ='".$this->db->escape($data['address_2'])."'"; 
		$query .= " ,city ='".$this->db->escape($data['city'])."'"; 
		$query .= " ,state ='".$this->db->escape($data['state'])."'"; 
		$query .= " ,zipcode ='".$this->db->escape($data['zipcode'])."'"; 
		$query .= " ,newsletter ='".$this->db->escape($data['newsletter'])."'"; 
		$query .= " ,job_title ='".$this->db->escape($data['job_title'])."'"; 
		$query .= " ,experience ='".$this->db->escape($data['experience'])."'"; 
		$query .= " ,location ='".$this->db->escape($data['location'])."'"; 
		$query .= " ,date_training ='".$this->db->escape($data['date_training'])."'"; 
		$query .= " ,returning_student ='".$this->db->escape($data['returning_student'])."'"; 
		$query .= " ,message ='".$this->db->escape($data['message'])."'"; 
		$query .= " ,class_id ='".$this->db->escape(join(',',$data['class_group_id']))."'"; 				
		$this->db->query($query);
		$last_id = $this->db->getLastId();
		if($last_id > 0)
		{
			$this->updateClassRegData($last_id,$data['class_group_id'],'ADD');
		}
		return $last_id;
	}
	
	public function editRegistrations($reg_id, $data) {
		$query  = "UPDATE " . DB_PREFIX . "registrations SET customer_id = '" . $this->db->escape($data['customer_id']) . "', store_id = '" . $this->db->escape($data['store_id']) . "', date_added = NOW(), status = 1";
		$query .= " ,firstname ='".$this->db->escape($data['firstname'])."'"; 
		$query .= " ,lastname ='".$this->db->escape($data['lastname'])."'"; 
		$query .= " ,email ='".$this->db->escape($data['email'])."'"; 
		$query .= " ,telephone ='".$this->db->escape($data['telephone'])."'"; 
		$query .= " ,fax ='".$this->db->escape($data['fax'])."'"; 
		$query .= " ,address_1 ='".$this->db->escape($data['address_1'])."'"; 
		$query .= " ,address_2 ='".$this->db->escape($data['address_2'])."'"; 
		$query .= " ,city ='".$this->db->escape($data['city'])."'"; 
		$query .= " ,state ='".$this->db->escape($data['state'])."'"; 
		$query .= " ,zipcode ='".$this->db->escape($data['zipcode'])."'"; 
		$query .= " ,newsletter ='".$this->db->escape($data['newsletter'])."'"; 
		$query .= " ,class_id ='".$this->db->escape(join(',',$data['class_group_id']))."'"; 
		$query .= " ,job_title ='".$this->db->escape($data['job_title'])."'"; 
		$query .= " ,experience ='".$this->db->escape($data['experience'])."'"; 
		$query .= " ,location ='".$this->db->escape($data['location'])."'"; 
		$query .= " ,date_training ='".$this->db->escape($data['date_training'])."'"; 
		$query .= " ,returning_student ='".$this->db->escape($data['returning_student'])."'"; 
		$query .= " ,message ='".$this->db->escape($data['message'])."'"; 
		$query .= "  WHERE registration_id = '" . (int)$reg_id . "'";
		
		$result = $this->db->query($query);	
		if($result){
			$this->updateClassRegData($reg_id,$data['class_group_id'],'update');
		}
		return $result;		
	}
	
	public function getAllLocation() {
		$sql = "SELECT * FROM " . DB_PREFIX . "reg_location n LEFT JOIN " . DB_PREFIX . "reg_location_description nd ON n.location_id = nd.location_id WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY date_added DESC";
		$sql .= " LIMIT 0,50";
		$query = $this->db->query($sql); 
		return $query->rows;
	}
	
	public function updateClassRegData($reg_id,$data,$action='update')
	{
		if(count($data) > 0){
			if($action=='update')
				$result = $this->db->query("DELETE FROM " . DB_PREFIX . "registration_classname WHERE registration_id = '" . (int)$reg_id . "'");
			else $result = TRUE;
			if($result)
			{
				foreach($data as $key=>$value)
				{
					$this->db->query("INSERT INTO " . DB_PREFIX . "registration_classname SET registration_id='" . $this->db->escape($reg_id) . "', class_id='" . $this->db->escape($value) . "'");
				}
				return TRUE;
			}
		}
		return FALSE;
	}
	
	public function getRegistrations($reg_id) {
		$query = $this->db->query("SELECT  * FROM " . DB_PREFIX . "registrations WHERE registration_id = '" . (int)$reg_id . "'"); 
 
		if ($query->num_rows) {
			return $query->row;
		} else {
			return false;
		}
	}
 
	public function getAllRegistrations($data) {
		$sql = "SELECT *,r.registration_id as reg_id, CONCAT(r.firstname, ' ', r.lastname) AS name, cg.`title` as classname  FROM " . DB_PREFIX . "registrations r  LEFT JOIN " . DB_PREFIX . "registration_classname rc ON (r.registration_id=rc.registration_id) LEFT JOIN " . DB_PREFIX . "news_description cg ON (rc.class_id=cg.news_id)   WHERE 1=1 ";
		
		$implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "CONCAT(r.firstname, ' ', r.lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "r.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}


		if (!empty($data['filter_class_group_id'])) {
			$implode[] = "cg.news_id = '" . (int)$data['filter_class_group_id'] . "'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$implode[] = "r.status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['filter_approved']) && !is_null($data['filter_approved'])) {
			$implode[] = "r.approved = '" . (int)$data['filter_approved'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(r.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}

		$sort_data = array(
			'name',
			'r.email',
			'news_id',
			'r.status',
			'r.approved',			
			'r.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}
		
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
	
	public function getClassRegistrations() {
		$sql = "SELECT * FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nd ON n.news_id = nd.news_id WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n.status=1 AND n.active_registration=1 ORDER BY date_added DESC";		
		$query = $this->db->query($sql); 
		return $query->rows;
	}
   
	public function deleteRegistrations($reg_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "registrations WHERE registration_id = '" . (int)$reg_id . "'");
	}
   
	public function getTotalRegistrations($data) {
		
		$sql = "SELECT COUNT(*) AS total  FROM " . DB_PREFIX . "registrations r  LEFT JOIN " . DB_PREFIX . "registration_classname rc ON (r.registration_id=rc.registration_id) LEFT JOIN " . DB_PREFIX . "news_description cg ON (rc.class_id=cg.news_id)  WHERE 1=1 ";
		
		$implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "CONCAT(r.firstname, ' ', r.lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "r.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}


		if (!empty($data['filter_class_group_id'])) {
			$implode[] = "cg.news_id = '" . (int)$data['filter_class_group_id'] . "'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$implode[] = "r.status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['filter_approved']) && !is_null($data['filter_approved'])) {
			$implode[] = "r.approved = '" . (int)$data['filter_approved'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(r.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}

		$sort_data = array(
			'name',
			'r.email',
			'news_id',
			'r.status',
			'r.approved',			
			'r.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}		
		$query = $this->db->query($sql);	
		return $query->row['total'];
	}
}