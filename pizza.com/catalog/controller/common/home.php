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
        //print_r($data['content_top']);exit;
        $data['content_bottom_left'] = $this->load->controller('common/content_bottom_left');
        $data['content_bottom_right'] = $this->load->controller('common/content_bottom_right');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $data['instagram_id_parameter'] = $this->config->get('config_account_instagram_id_parameter');
        $data['token_instagram_parameter'] = $this->config->get('config_token_instagram_parameter');

        $this->load->model('catalog/information');
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

        $this->document->addStyle('catalog/view/javascript/ilashmax/instagram/pongstagr.am.min.css');
        $this->document->addScript('catalog/view/javascript/ilashmax/instagram/pongstagr.am.min.js');

        // Homepage  banner;
        $banner_id = 9;
        $this->load->model('design/banner');
        $data['banners'] = array();
        $data['banners'] = $this->model_design_banner->getBanner($banner_id, 'top_banner_sidebar');
//
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/home.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/common/home.tpl', $data));
        }
    }
}