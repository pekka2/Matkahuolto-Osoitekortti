<?php

class Matkahuolto {
	private $user_id;
	private $password;
	private $url;
	private $shipmentnumber;
	private $ErrorMsg;

	public function __construct($user_id,$password,$url) {
		$this->user_id = $user_id;
		$this->password = $password;
		$this->url = $url;
	}
	  
    public function sendXML($post)
    {
     
    $xml = new XMLWriter();
    $xml->openMemory(); 
    $xml->startDocument('1.0'); 
    $xml->startElement('MHShipmentRequest');
   
    $xml->writeElement('UserId', $this->user_id); // REQUIRED
    $xml->writeElement('Password', $this->password); // REQUIRED
    $xml->writeElement('Version', $post['version']);  // REQUIRED
     
        $xml->startElement('Shipment');
     
            $xml->writeElement('MessageType', $post['message_type']);

            if(isset($post['shipment_date'])){
            	$shipment_date = $post['shipment_date'];
            } else {
            	$shipment_date = date('d.m.Y');
            }
            $xml->writeElement('ShipmentNumber', !empty($post['shipment_number']) ? $post['shipment_number']:'');
            $xml->writeElement('ShipmentDate', $shipment_date);
            $xml->writeElement('Weight', !empty($post['weight']) ? $post['weight']:'');
            $xml->writeElement('Volume', !empty($post['volume']) ? $post['volume']:'');
            $xml->writeElement('Packages', $post['packages']);  // REQUIRED
            $xml->writeElement('SenderId', $post['sender_id']);  // REQUIRED
            $xml->writeElement('SenderName1', !empty($post['sender_name']) ? $post['sender_name']:'');
            $xml->writeElement('SenderName2', !empty($post['sender_name2']) ? $post['sender_name2']:'');
            $xml->writeElement('SenderAddress', !empty($post['sender_address']) ? $post['sender_address']:'');
            $xml->writeElement('SenderPostal', !empty($post['sender_postal']) ? $post['sender_postal']:'');
            $xml->writeElement('SenderCity', !empty($post['sender_city']) ? $post['sender_city']:'');
            $xml->writeElement('SenderContactName', !empty($post['sender_contact_pame']) ? $post['sender_contact_pame']:'');
            $xml->writeElement('SenderContactNumber', !empty($post['sender_contact_number']) ? $post['sender_contact_number']:'');
            $xml->writeElement('SenderEmail', !empty($post['sender_email']) ? $post['sender_email']:'');
            $xml->writeElement('SenderReference', !empty($post['sender_reference']) ? $post['sender_reference']:'');
            $xml->writeElement('DeparturePlaceCode', !empty($post['departure_place_code']) ? $post['departure_place_code']:'');
            $xml->writeElement('DeparturePlaceName', !empty($post['departure_place_name']) ? $post['departure_place_name']:'');
            $xml->writeElement('ReceiverId', !empty($post['receiver_id']) ? $post['receiver_id']:'');
            $xml->writeElement('ReceiverName1', $post['receiver_name']);  // REQUIRED
            $xml->writeElement('ReceiverName2', !empty($post['receiver_name2']) ? $post['receiver_name2']:'');
            $xml->writeElement('ReceiverAddress', !empty($post['receiver_address']) ? $post['receiver_address']:'');
            $xml->writeElement('ReceiverPostal', $post['receiver_postal']);  // REQUIRED
            $xml->writeElement('ReceiverCity', $post['receiver_city']);  // REQUIRED
            $xml->writeElement('ReceiverContactName', !empty($post['receiver_contact_name']) ? $post['receiver_contact_name']:'');
            $xml->writeElement('ReceiverContactNumber', !empty($post['receiver_contact_number']) ? $post['receiver_contact_number']:'');
            $xml->writeElement('ReceiverEmail', !empty($post['receiver_email']) ? $post['receiver_email']:'');
            $xml->writeElement('ReceiverReference', !empty($post['receiver_reference']) ? $post['receiver_reference']:'');
            $xml->writeElement('DestinationPlaceCode', !empty($post['destination_place_code']) ? $post['destination_place_code']:'');
            $xml->writeElement('DestinationPlaceName', !empty($post['destination_place_name']) ? $post['destination_place_name']:'');
            $xml->writeElement('ShipmentType', !empty($post['shipment_type']) ? $post['shipment_type']:'');
            $xml->writeElement('ShipmentType', !empty($post['message_type']) ? $post['message_type']:'');
            $xml->writeElement('PayerCode', !empty($post['payer_code']) ? $post['payer_code']:'S');
            $xml->writeElement('PayerId', !empty($post['payer_id']) ?  $post['payer_id']:'');
            $xml->writeElement('PayerName1', !empty($post['payer_name']) ?  $post['payer_name']:'');
            $xml->writeElement('PayerAddress', !empty($post['payer_address']) ?  $post['payer_address']:'');
            $xml->writeElement('PayerPostal', !empty($post['payer_postal']) ?  $post['payer_postal']:'');
            $xml->writeElement('PayerCity', !empty($post['payer_city']) ?  $post['payer_city']:'');
            $xml->writeElement('PayerCountry', !empty($post['payer_country']) ?  $post['payer_country']:'');
            $xml->writeElement('PayerContactName', !empty($post['payer_contact_name']) ?  $post['payer_contact_name']:'');
            $xml->writeElement('PayerContactNumber', !empty($post['payer_contact_number']) ?  $post['payer_contact_number']:'');
            $xml->writeElement('PayerEmail', !empty($post['payer_email']) ?  $post['payer_email']:'');
            $xml->writeElement('PayerReference', !empty($post['payer_reference']) ?  $post['payer_reference']:'');
            $xml->writeElement('Remarks', !empty($post['remarks']) ? $post['remarks']:'');
            $xml->writeElement('ProductCode', $post['product_code']);  // REQUIRED
            $xml->writeElement('ProductName', !empty($post['product_name']) ? $post['product_name']:'');
            $xml->writeElement('Pickup', !empty($post['pickup']) ? $post['pickup']:'');
            $xml->writeElement('PickupPayer', !empty($post['pickup_payer']) ? $post['pickup_payer']:'');
            $xml->writeElement('PickupRemarks', !empty($post['pickup_remark']) ? $post['pickup_remark']:'');
            $xml->writeElement('Delivery', !empty($post['delivery']) ? $post['delivery']:'');
            $xml->writeElement('DeliveryPayer', !empty($post['delivery_payer']) ? $post['delivery_payer']:'');
            $xml->writeElement('DeliveryRemarks', !empty($post['delivery_remark']) ? $post['delivery_remark']:'');
            $xml->writeElement('CODSum', !empty($post['cod_sum']) ? $post['cod_sum']:'');
            $xml->writeElement('CODCurrency', !empty($post['cod_currency']) ? $post['cod_currency']:'');
            $xml->writeElement('CODAccount', !empty($post['cod_iban']) ? $post['cod_iban']:'');
            $xml->writeElement('CODBic', !empty($post['cod_bic']) ? $post['cod_bic']:'');
            $xml->writeElement('CODReference', !empty($post['cod_reference']) ? $post['cod_reference']:'');

            if(!empty($post['package_id'])){
            	foreach($post['package_id'] as $id){
            	    if(trim($id) !=''){
                        $xml->startElement('ShipmentRow');
                        $xml->writeElement('PackageId', $id);
                        $xml->endElement(); 
                    }
            	}
            }

            $xml->writeElement('Goods', $post['goods']);
            $xml->writeElement('SpecialHandling', !empty($post['special_handling']) ? $post['special_handling']:'');
            $xml->writeElement('VAKCode', !empty($post['vak_code']) ? $post['vak_code']:'');
            $xml->writeElement('VAKDescription', !empty($post['vak_description']) ? $post['vak_description']:'');
            $xml->writeElement('SpecialHandover', !empty($post['special_handover']) ? $post['special_handover']:'');
            $xml->writeElement('HandoverRemark1', !empty($post['handover_remark_1']) ? $post['handover_remark_1']:'');
            $xml->writeElement('HandoverRemark2', !empty($post['handover_remark_2']) ? $post['handover_remark_2']:'');
            $xml->writeElement('HandoverRemark3', !empty($post['handover_remark_3']) ? $post['handover_remark_3']:'');
            $xml->writeElement('DocumentType', !empty($post['doc_type']) ? $post['doc_type']:'');
        
        $xml->endElement();
  
    $xml->endElement();
    define('sendXml', $xml->flush());
    $xml->endDocument();    

     /* Lähetetään XML */

    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL,$this->url); 
    curl_setopt($ch, CURLOPT_RETURNTRANSFER,1); 
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,false);
    curl_setopt($ch, CURLOPT_TIMEOUT, 1000); 
    curl_setopt($ch, CURLOPT_POSTFIELDS, sendXml); 
    curl_setopt($ch, CURLOPT_POST, 1);  
    curl_setopt($ch, CURLOPT_HTTPHEADER,array('Content-Type: text/xml')); 

    $res = curl_exec($ch);
    
    /* Vastaanotetaan paluuviesti */

    if(curl_error($ch)==null){
     
        $reader = new XMLReader();
        $reader->XML($res);
        
         while ($reader->read()) {
   
            if($reader->nodeType == 1 && $reader->name !='ErrNbr')
            {

                 /* Asetetaan paluuviestin arvot */
                 
                 
                switch ($reader->name)
                {
                 case "ShipmentNumber":
                    $reader->read();
                    $this->shipmentnumber = $reader->value;
                    break;
                 case "ShipmentPdf":
                    $reader->read();
                    $this->shipmentPdf = $reader->value;
                    break;
                 case "ErrorNbr":
                    $reader->read();
                    $this->ErrorNbr = $reader->value;
                    $this->shipmentnumber = $reader->value;
                    break;
                 case "ErrorMsg":
                    $reader->read();
                    $this->ErrorMsg = $reader->value;
                    break;      
                } 
            }
         }

         if(!empty($this->shipmentPdf)){
            return $this->shipmentPdf;
          } else {
          	 return array("error"=>$this->ErrorMsg);
          }
       }
    }
    
    public function showPDF($pdf){
        
         /* Luodaan PDF-tiedosto */
        
        $filebytes = base64_decode($pdf);
        header("Content-type:application/pdf");
        header("Content-Disposition:attachment;filename=$this->shipmentnumber.pdf");
        echo $filebytes;

    
    }
}
