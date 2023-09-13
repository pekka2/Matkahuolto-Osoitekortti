<?php
class ControllerSaleMatkahuolto extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('sale/matkahuolto');

		$this->install();

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/order');

		$this->getForm();
	}

	public function shipment() {
		$this->load->language('sale/matkahuolto');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/order');

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			$this->model_setting_setting->editSetting('matkahuolto_ticket', $this->request->post['matkahuolto_ticket']);

			require_once(DIR_SYSTEM . 'library/matkahuolto.php');

			$url = 'https://extservices.matkahuolto.fi/mpaketti/mhshipmentxml'; 
			//$url = 'https://extservicestest.matkahuolto.fi/mpaketti/mhshipmentxml'; // Testaus osoite
				$user_id = $this->request->post['matkahuolto_ticket']['matkahuolto_ticket_user_id'];
				$password = $this->request->post['matkahuolto_ticket']['matkahuolto_ticket_password'];
				$this->request->post['sender_id'] = $this->request->post['matkahuolto_ticket']['matkahuolto_ticket_sender_id'];
				$this->request->post['sender_name'] = !empty($this->request->post['matkahuolto_ticket']['matkahuolto_ticket_sender_name']) ? $this->request->post['matkahuolto_ticket']['matkahuolto_ticket_sender_name']:'';
				$this->request->post['sender_address'] = !empty($this->request->post['matkahuolto_ticket']['matkahuolto_ticket_sender_address']) ? $this->request->post['matkahuolto_ticket']['matkahuolto_ticket_sender_address']:'';
				$this->request->post['sender_postal'] = !empty($this->request->post['matkahuolto_ticket']['matkahuolto_ticket_sender_postal']) ? $this->request->post['matkahuolto_ticket']['matkahuolto_ticket_sender_postal']:'';
				$this->request->post['sender_city'] = !empty($this->request->post['matkahuolto_ticket']['matkahuolto_ticket_sender_city']) ? $this->request->post['matkahuolto_ticket']['matkahuolto_ticket_sender_city']:'';
				$this->request->post['sender_country'] = !empty($this->request->post['matkahuolto_ticket']['matkahuolto_ticket_sender_country']) ? $this->request->post['matkahuolto_ticket']['matkahuolto_ticket_sender_country']:'';
				$this->request->post['sender_contact_name'] = !empty($this->request->post['matkahuolto_ticket']['matkahuolto_ticket_sender_contact_name']) ? $this->request->post['matkahuolto_ticket']['matkahuolto_ticket_sender_contact_name']:'';
				$this->request->post['sender_contact_number'] = !empty($this->request->post['matkahuolto_ticket']['matkahuolto_ticket_sender_contact_number']) ? $this->request->post['matkahuolto_ticket']['matkahuolto_ticket_sender_contact_number']:'';
				$this->request->post['sender_email'] = !empty($this->request->post['matkahuolto_ticket']['matkahuolto_ticket_sender_email']) ? $this->request->post['matkahuolto_ticket']['matkahuolto_ticket_sender_email']:'';
				$this->request->post['departure_place_code'] = !empty($this->request->post['matkahuolto_ticket']['matkahuolto_ticket_departure_place_code']) ? $this->request->post['matkahuolto_ticket']['matkahuolto_ticket_departure_place_code']:'';
				$this->request->post['departure_place_name'] = !empty($this->request->post['matkahuolto_ticket']['matkahuolto_ticket_departure_place_name']) ? $this->request->post['matkahuolto_ticket']['matkahuolto_ticket_departure_place_name']:'';

			$shipment = new Matkahuolto($user_id, $password, $url);

			$pdf = $shipment->sendXML($this->request->post);
			if(!is_array($pdf)){
			   $shipment->showPDF($pdf);
		   } else {

                 echo '<div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> ';
                 echo $pdf['error'];
                 echo '<button type="button" class="close" data-dismiss="alert">&times;</button>';
                 echo '</div>';

		         $this->getForm();
		   }

		} else {

		    $this->getForm();
		}

	}
		
	public function getForm() {
		$data['text_form'] = !isset($this->request->get['order_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

		if (isset($this->request->get['order_id'])) {
			$order_info = $this->model_sale_order->getOrder($this->request->get['order_id']);
		}

		if (isset($this->request->post['sender_name2'])) {
			$data['sender_name2'] = $this->request->post['sender_name2'];
		} else {
			$data['sender_name2'] = '';
		}

		if (isset($this->request->post['matkahuolto_ticket_sender_email'])) {
			$data['matkahuolto_ticket_sender_email'] = $this->request->post['matkahuolto_ticket_sender_email'];
		} else {
			$data['matkahuolto_ticket_sender_email'] = '';
		}

		if (isset($this->request->post['destination_place_code'])) {
			$data['destination_place_code'] = $this->request->post['destination_place_code'];
		} else {
			if(strpos($order_info['shipping_code'],'.')){
			   $place_code = explode('.', $order_info['shipping_code']);
			   $place_code = array_reverse($place_code);
			   $data['destination_place_code'] = $place_code[0];
		    } else {
			   $data['destination_place_code'] = $order_info['shipping_code'];	
		    }
		}

		if (isset($this->request->post['destination_place_name'])) {
			$data['destination_place_name'] = $this->request->post['destination_place_name'];
		} else {
			$data['destination_place_name'] = $order_info['shipping_method'];
		}

		if (isset($this->request->post['payer_id'])) {
			$data['payer_id'] = $this->request->post['payer_id'];
		} else {
			$data['payer_id'] = '';
		}

		if (isset($this->request->post['version'])) {
			$data['version'] = $this->request->post['version'];
		} else {
			$data['version'] = '2.0';
		}

		if (isset($this->request->post['product_code'])) {
			$data['product_code'] = $this->request->post['product_code'];
		} else {
			$country = $this->country($order_info['shipping_country_id']);
			if($country == 'FI'){
			   $data['product_code'] = 80;
			} else {
			   $data['product_code'] = 95;	
			}
		}

		if (isset($this->request->post['product_name'])) {
			$data['product_name'] = $this->request->post['product_name'];
		} else {
			$data['product_name'] = '';
		}

		if (isset($this->request->post['pickup_remark'])) {
			$data['pickup_remark'] = $this->request->post['pickup_remark'];
		} else {
			$data['pickup_remark'] = '';
		}

		if (isset($this->request->post['pickup'])) {
			$data['pickup'] = $this->request->post['pickup'];
		} else {
			$data['pickup'] = '';
		}

		if (isset($this->request->post['delivery'])) {
			$data['delivery'] = $this->request->post['delivery'];
		} else {
			$data['delivery'] = '';
		}

		if (isset($this->request->post['delivery_remark'])) {
			$data['delivery_remark'] = $this->request->post['delivery_remark'];
		} else {
			$data['delivery_remark'] = '';
		}

		if (isset($this->request->post['shipment_type'])) {
			$data['shipment_type'] = $this->request->post['shipment_type'];
		} else {
			$data['shipment_type'] = 'N';
		}

		if (isset($this->request->post['message_type'])) {
			$data['message_type'] = $this->request->post['message_type'];
		} else {
			$data['message_type'] = 'N';
		}

		if (isset($this->request->post['payer_id'])) {
			$data['payer_id'] = $this->request->post['payer_id'];
		} else {
			$data['payer_id'] = '';
		}

		if (isset($this->request->post['payer_code'])) {
			$data['payer_code'] = $this->request->post['payer_code'];
		} else {
			$data['payer_code'] = '';
		}

		if (isset($this->request->post['packages'])) {
			$data['packages'] = $this->request->post['packages'];
		} else {
			$data['packages'] = 1;
		}

		if (isset($this->request->post['package_id'][1])) {
			$data['package_id'][1] = $this->request->post['package_id'][1];
		} else {
			$data['package_id'][1] = '';
		}

		if (isset($this->request->post['package_idx'])) {
			$data['package_idx'] = $this->request->post['package_idx'];
		} else {
			$data['package_idx'] = '';
		}

			$data['matkahuolto_ticket_user_id'] = '';
			$data['matkahuolto_ticket_password'] = '';
			$data['matkahuolto_ticket_sender_id'] = '';

		if (isset($this->request->post['matkahuolto_ticket'])) {
			foreach($this->request->post['matkahuolto_ticket'] as $key => $value){
			        $data[$key] = $value;
		    }
		} else {
			$data['matkahuolto_ticket_user_id'] = $this->config->get('matkahuolto_ticket_user_id');
			$data['matkahuolto_ticket_password'] = $this->config->get('matkahuolto_ticket_password');
			$data['matkahuolto_ticket_sender_id'] = $this->config->get('matkahuolto_ticket_sender_id');

			if($this->config->get('matkahuolto_ticket_sender_name')){
			   $data['matkahuolto_ticket_sender_name'] = $this->config->get('matkahuolto_ticket_sender_name');
		    } else {
			   $data['matkahuolto_ticket_sender_name'] = $this->config->get('config_name');
			}

			$data['matkahuolto_ticket_sender_address'] = $this->config->get('matkahuolto_ticket_sender_address');
			$data['matkahuolto_ticket_sender_postal'] = $this->config->get('matkahuolto_ticket_sender_postal');
			$data['matkahuolto_ticket_sender_city'] = $this->config->get('matkahuolto_ticket_sender_city');

			if($this->config->get('matkahuolto_ticket_sender_country')){
			   $data['matkahuolto_ticket_sender_country'] = $this->config->get('matkahuolto_ticket_sender_country');
		    } else {
			   $data['matkahuolto_ticket_sender_country'] = $this->country();
			}

			$data['matkahuolto_ticket_departure_place_code'] = $this->config->get('matkahuolto_ticket_departure_place_code');
			$data['matkahuolto_ticket_departure_place_name'] = $this->config->get('matkahuolto_ticket_departure_place_name');
		}

		if (isset($this->error['receiver_name'])) {
			$data['error_receiver_name'] = $this->error['receiver_name'];
		} else {
			$data['error_receiver_name'] = '';
		}

		if (isset($this->error['receiver_postal'])) {
			$data['error_receiver_postal'] = $this->error['receiver_postal'];
		} else {
			$data['error_receiver_postal'] = '';
		}

		if (isset($this->error['receiver_city'])) {
			$data['error_receiver_city'] = $this->error['receiver_city'];
		} else {
			$data['error_receiver_city'] = '';
		}

		if (isset($this->error['packages'])) {
			$data['error_packages'] = $this->error['packages'];
		} else {
			$data['error_packages'] = '';
		}

		if (isset($this->error['product_code'])) {
			$data['error_product_code'] = $this->error['product_code'];
		} else {
			$data['error_product_code'] = '';
		}

		if (isset($this->error['version'])) {
			$data['error_version'] = $this->error['version'];
		} else {
			$data['error_version'] = '';
		}

		if (isset($this->error['message_type'])) {
			$data['error_message_type'] = $this->error['message_type'];
		} else {
			$data['error_message_type'] = '';
		}

		if (isset($this->error['shipment_type'])) {
			$data['error_shipment_type'] = $this->error['shipment_type'];
		} else {
			$data['error_shipment_type'] = '';
		}

		if (isset($this->error['matkahuolto_ticket_sender_id'])) {
			$data['error_matkahuolto_ticket_sender_id'] = $this->error['matkahuolto_ticket_sender_id'];
		} else {
			$data['error_matkahuolto_ticket_sender_id'] = '';
		}

		if (isset($this->error['matkahuolto_ticket_user_id'])) {
			$data['error_matkahuolto_ticket_user_id'] = $this->error['matkahuolto_ticket_user_id'];
		} else {
			$data['error_matkahuolto_ticket_user_id'] = '';
		}

		if (isset($this->error['matkahuolto_ticket_password'])) {
			$data['error_matkahuolto_ticket_password'] = $this->error['matkahuolto_ticket_password'];
		} else {
			$data['error_matkahuolto_ticket_password'] = '';
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['action'] = $this->url->link('sale/matkahuolto/shipment', 'user_token=' . $this->session->data['user_token'] . '&order_id=' . $this->request->get['order_id'], true);

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_order'),
			'href' => $this->url->link('sale/order', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('sale/matkahuolto', 'user_token=' . $this->session->data['user_token'] . '&order_id=' . $this->request->get['order_id'], true)
		);

		$data['cancel'] = $this->url->link('sale/order', 'user_token=' . $this->session->data['user_token'], true);
		$data['user_token'] = $this->session->data['user_token'];

		$data['shipment_types'] = array(
			                          array('type' => 'N','name' => 'Normaali lähetys (oletus)'),
			                          array('type' => 'A','name' => 'Aktivoitava lähetys'),
			                          array('type' => 'R','name' => 'Palautuslähetys')
			                      );

		$data['message_types'] = array(
			                          array('type' => 'N','name' => 'Uusi'),
			                          array('type' => 'C','name' => 'Muutos'),
			                          array('type' => 'D','name' => 'Poisto/Peruutus')
			                      );

		$data['payer_codes'] = array(
			                          array('code' => 'S','name' => 'Lähettäjä'),
			                          array('code' => 'R','name' => 'Vastaanottaja'),
			                          array('code' => 'O','name' => 'Muu (koodi ilmoitettava kentässä "Maksajan asiakasnumero")')
			                      );

		$data['pickup_product'] = array(
			                          array('key' => 'Y', 'name' =>  'Kyllä'),
			                          array('key' => 'N', 'name' => 'Ei')
			                      );

		$data['pickup_payer'] = array(
			                          array('key' => 'S', 'name' => 'Lähettäjä'),
			                          array('key' => 'R', 'name' => 'Vastaanottaja')
			                      );

		$data['delivery_product'] = array(
			                          array('key' => 'Y', 'name' =>  'Kyllä'),
			                          array('key' => 'N', 'name' => 'Ei')
			                      );

		$data['delivery_payer'] = array(
			                          array('key' => 'S', 'name' => 'Lähettäjä'),
			                          array('key' => 'R', 'name' => 'Vastaanottaja')
			                      );
		$data['special_handling'] = $this->specialHandling('handling');

		$data['vak_codes'] = $this->specialHandling('vak_code');
			                 

			$data['order_id'] = $this->request->get['order_id'];

		if (isset($this->request->post['receiver_name'])) {
			$data['receiver_name'] = $this->request->post['receiver_name'];
		} else {
			$data['receiver_name'] = $order_info['shipping_firstname'] . ' ' . $order_info['shipping_lastname'];
		}

		if (isset($this->request->post['receiver_contact_name'])) {
			$data['receiver_contact_name'] = $this->request->post['receiver_contact_name'];
		} else {
			$data['receiver_contact_name'] = '';
		}

		if (isset($this->request->post['receiver_contact_number'])) {
			$data['receiver_contact_number'] = $this->request->post['receiver_contact_number'];
		} else {
			$data['receiver_contact_number'] = $order_info['telephone'];
		}

		if (isset($this->request->post['receiver_name2'])) {
			$data['receiver_name2'] = $this->request->post['receiver_name2'];
		} else {
			$data['receiver_name2'] = '';
		}

		if (isset($this->request->post['receiver_address'])) {
			$data['receiver_address'] = $this->request->post['receiver_address'];
		} else {
			$data['receiver_address'] = $order_info['shipping_address_1']; 
		}

		if (isset($this->request->post['receiver_postal'])) {
			$data['receiver_postal'] = $this->request->post['receiver_postal'];
		} else {
			$data['receiver_postal'] = $order_info['shipping_postcode']; 
		}

		if (isset($this->request->post['receiver_city'])) {
			$data['receiver_city'] = $this->request->post['receiver_city'];
		} else {
			$data['receiver_city'] = $order_info['shipping_city']; 
		}

		if (isset($this->request->post['receiver_country'])) {
			$data['receiver_country'] = $this->request->post['receiver_country'];
		} else {
			$data['receiver_country'] = $order_info['shipping_iso_code_2']; 
		}

		if (isset($this->request->post['receiver_id'])) {
			$data['receiver_id'] = $this->request->post['receiver_id'];
		} else {
			$data['receiver_id'] = ''; 
		}

		if (isset($this->request->post['doc_type'])) {
			$data['doc_type'] = $this->request->post['doc_type'];
		} else {
			$data['doc_type'] = ''; 
		}

		if (isset($this->request->post['remarks'])) {
			$data['remarks'] = $this->request->post['remarks'];
		} else {
			$data['remarks'] = '';
		}

		if (isset($this->request->post['cod_sum'])) {
			$data['cod_sum'] = $this->request->post['cod_sum'];
		} else {
			$data['cod_sum'] = '';
		}

		if (isset($this->request->post['cod_iban'])) {
			$data['cod_iban'] = $this->request->post['cod_iban'];
		} else {
			$data['cod_iban'] = '';
		}

		if (isset($this->request->post['cod_bic'])) {
			$data['cod_bic'] = $this->request->post['cod_bic'];
		} else {
			$data['cod_bic'] = '';
		}

		if (isset($this->request->post['cod_refrence'])) {
			$data['cod_reference'] = $this->request->post['cod_reference'];
		} else {
			$data['cod_reference'] = '';
		}

		if (isset($this->request->post['vak_code'])) {
			$data['vak_code'] = $this->request->post['vak_code'];
		} else {
			$data['vak_code'] = ''; 
		}

		if (isset($this->request->post['special_handover'])) {
			$data['special_handover'] = $this->request->post['special_handover'];
		} else {
			$data['special_handover'] = ''; 
		}

		if (isset($this->request->post['handover_remark_1'])) {
			$data['handover_remark_1'] = $this->request->post['handover_remark_1'];
		} else {
			$data['handover_remark_1'] = '';  // $order_info['telephone'];
		}

		if (isset($this->request->post['handover_remark_2'])) {
			$data['handover_remark_2'] = $this->request->post['handover_remark_2'];
		} else {
			$data['handover_remark_2'] = ''; 
		}

		if (isset($this->request->post['handover_remark_3'])) {
			$data['handover_remark_3'] = $this->request->post['handover_remark_3'];
		} else {
			$data['handover_remark_3'] = ''; 
		}

		$data['products'] = $this->getPackage();

		$products = $this->getProducts($this->request->get['order_id']);

		$data['weight'] = $products['weight'];
		$data['volume'] = $products['volume'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('sale/matkahuolto', $data));
	}

	protected function country($country_id = ''){
		if(!$country_id){
			$country_id = $this->config->get('config_country_id');
		}
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE `country_id` = '" . $country_id ."'");
		return $query->row['iso_code_2'];
	}

	protected function getPackage(){
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "matkahuolto_products`");
		return $query->rows;
	}

	protected function specialHandling($type){

		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "matkahuolto_special_handling` WHERE `type` = -'" . $type ."'");

		$special_handling = array();

		if($query->num_rows){
			foreach($query->rows as $result){
		        $special_handling[] = array('key' => $result['code'], 'name' => $result['description']);
	        }
	    }
	    return $special_handling;
	}

	protected function getProducts($order_id){

		$products = $this->model_sale_order->getOrderProducts($order_id);
		$weight = 0;
		$volume = 0;
		foreach($products as $product){
			$query = $this->db->query("SELECT * FROM `". DB_PREFIX . "product` WHERE `product_id` = '" . $product['product_id'] . "'");

			$weight += $query->row['weight'];
			$volume += $this->length_convertion($query->row['length'], $query->row['length_class_id']) * ($this->length_convertion($query->row['width'], $query->row['length_class_id']) * $this->length_convertion($query->row['height'], $query->row['length_class_id']));
		}
		return array("weight" => $weight, "volume" => $volume);
	}

	protected function length_convertion($length, $length_class_id){
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "length_class_description` WHERE length_class_id = '" . $length_class_id . "'");

		$unit = $query->row['unit'];
		if($unit == 'cm'){
			$length = $length/100;
		}
		if($unit == 'mm'){
			$length = $length/1000;
		}
		return $length;
	}

	protected function install() {

        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "matkahuolto_products` (
         `code` int(6) NOT NULL,
         `name` varchar(64) NOT NULL,
        PRIMARY KEY (`code`)
        ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci");

        if(!$this->getPackage()){
           $this->db->query("INSERT INTO `" . DB_PREFIX . "matkahuolto_products` (`code`, `name`) VALUES
           (10, 'Bussipaketti'),
           (30, 'Jakopaketti'),
           (34, 'Kotijakelu'),
           (40, 'Rahtipussi'),
           (42, 'Rahtipussin jakopaketti'),
           (43, 'Dokumenttikuori'),
           (44, 'Dokumenttikuoren jakopaketti'),
           (57, 'Lavarahti'),
           (70, 'Ulkomaan lentoasiakirja'),
           (71, 'Ulkomaan lentopaketti'),
           (72, 'Ulkomaan paketti'),
           (80, 'Lähellä-paketti'),
           (95, 'Ulkomaan lähellä-paketti'),
           (96, 'Ulkomaan jakopaketti')");
        }

        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "matkahuolto_special_handling` (
         `code` varchar(6) NOT NULL,
         `type` varchar(11) NOT NULL,
         `description` varchar(32) NOT NULL,
        PRIMARY KEY (`code`)
        ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci");

        if(!$this->specialHandling('handling')){
           $this->db->query("INSERT INTO `" . DB_PREFIX . "matkahuolto_special_handling` (`code`, `type`, `description`) VALUES
           ('E01', 'handling', 'Vaarallinen aine (VAK-luokka kenttään VAKCode)'),
           ('K02', 'handling', 'Ympärysmitta'),
           ('K03', 'handling', 'Tankomainen'),
           ('K04', 'handling', 'Varoen käsiteltävä'),
           ('K05', 'handling', 'Lämpösäädelty kuljetus'),
           ('1.4', 'vak_code', 'Räjähteet'),
	       ('2', 'vak_code', 'Kaasut'),
	       ('3', 'vak_code', 'Palavat nesteet'),
	       ('4.1', 'vak_code', 'Helposti syttyvät kiinteät aineet'),
		   ('6.1', 'vak_code', 'Myrkylliset aineet'),
	       ('8', 'vak_code',  'Syövyttävät aineet')");
	    }
    }

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'sale/matkahuolto')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['matkahuolto_ticket'] as $key => $value) {
			if($key == 'matkahuolto_ticket_user_id' || $key == 'matkahuolto_ticket_sender_id' || $key == 'matkahuolto_ticket_password'){
			   if (strlen($value) < 3) {
				   $this->error[$key] = $this->language->get('error_' . $key);
			   }
		   }
		}

		if(empty($this->request->post['receiver_name'])){
			$this->error['receiver_name'] = $this->language->get('error_receiver_name');
		}
		if(empty($this->request->post['receiver_postal'])){
			$this->error['receiver_postal'] = $this->language->get('error_receiver_postal');
		}
		if(empty($this->request->post['receiver_city'])){
			$this->error['receiver_city'] = $this->language->get('error_receiver_city');
		}
		if(empty($this->request->post['packages'])){
			$this->error['packages'] = $this->language->get('error_packages');
		}
		if(empty($this->request->post['product_code'])){
			$this->error['product_code'] = $this->language->get('error_product_code');
		}
		if(empty($this->request->post['message_type'])){
			$this->error['message_type'] = $this->language->get('error_message_type');
		}
		if(empty($this->request->post['shipment_type'])){
			$this->error['shipment_type'] = $this->language->get('error_shipment_type');
		}
		if(empty($this->request->post['version'])){
			$this->error['version'] = $this->language->get('error_version');
		}

		return !$this->error;
	}
}
