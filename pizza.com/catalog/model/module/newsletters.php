<?php
class ModelModuleNewsletters extends Model {
	public function createNewsletter()
	{
			
		$res0 = $this->db->query("SHOW TABLES LIKE '".DB_PREFIX."newsletter'");
		if($res0->num_rows == 0){
			$this->db->query("
				CREATE TABLE IF NOT EXISTS `". DB_PREFIX. "newsletter` (
				  `news_id` int(11) NOT NULL AUTO_INCREMENT,
				  `news_email` varchar(255) NOT NULL,
				  PRIMARY KEY (`news_id`)
				) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
			");
		}
		
		
	}
	public function subscribes($data) {
		$res = $this->db->query("select * from ". DB_PREFIX ."newsletter where news_email='".$data['email']."'");
		if($res->num_rows == 1)
		{
			return "Your email already exist in system.";
		}
		else
		{
		
			if($this->db->query("INSERT INTO " . DB_PREFIX . "newsletter(news_email) values ('".$data['email']."')"))
			{
				//$this->response->redirect($this->url->link('common/home', '', 'SSL'));
				return "Your email has been subscription successful, we'll contact with you as soon we can.";
			}
			else
			{
				//$this->response->redirect($this->url->link('common/home', '', 'SSL'));
				return "Your email has been subscription failed.";
			}
		}
	}
		
}