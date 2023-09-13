<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-shipping" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach( $breadcrumbs as $breadcrumb ){?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
   <?php if( $error_warning ){?>
    <div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-matkahuolto" class="form-horizontal">
          <div class="form-group">
          <label style="width:80%;margin-left:5%;"><?php echo $text_description; ?></label>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-cost"><?php echo $entry_user_id; ?></label>
            <div class="col-sm-10">
            <input type="text" name="matkahuolto_ticket[matkahuolto_ticket_user_id]" value="<?php echo $matkahuolto_ticket_user_id; ?>"  class="form-control"/>
                 <?php if( $error_matkahuolto_ticket_user_id ){?>
                  <div class="text-danger"><?php echo $error_matkahuolto_ticket_user_id; ?></div>
                  <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-cost"><?php echo $entry_password; ?></label>
            <div class="col-sm-10"> 
            <input type="text" name="matkahuolto_ticket[matkahuolto_ticket_password]" value="<?php echo $matkahuolto_ticket_password; ?>" class="form-control"/>
                 <?php if( $error_matkahuolto_ticket_password ){?>
                  <div class="text-danger"><?php echo $error_matkahuolto_ticket_password; ?></div>
                  <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-sender_id"><?php echo $entry_sender_id; ?></label>
            <div class="col-sm-10">
            <input type="text" name="matkahuolto_ticket[matkahuolto_ticket_sender_id]" value="<?php echo $matkahuolto_ticket_sender_id; ?>" class="form-control"/>
                 <?php if( $error_matkahuolto_ticket_sender_id ){?>
                  <div class="text-danger"><?php echo $error_matkahuolto_ticket_sender_id; ?></div>
                  <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sender-name"><?php echo $entry_sender_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="matkahuolto_ticket[matkahuolto_ticket_sender_name]" value="<?php echo $matkahuolto_ticket_sender_name; ?>" placeholder="<?php echo $entry_sender_name; ?>" id="input-sender-name" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sender-name"><?php echo $entry_sender_name_2; ?></label>
            <div class="col-sm-10">
              <input type="text" name="sender_name2" value="<?php echo $sender_name2; ?>" placeholder="<?php echo $entry_sender_name_2; ?>" id="input-sender-name" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sender-address"><?php echo $entry_sender_address; ?></label>
            <div class="col-sm-10">
              <input type="text" name="matkahuolto_ticket[matkahuolto_ticket_sender_address]" value="<?php echo $matkahuolto_ticket_sender_address; ?>" placeholder="<?php echo $entry_sender_address; ?>" id="input-sender-address" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sender-postal"><?php echo $entry_sender_postal; ?></label>
            <div class="col-sm-10">
              <input type="text" name="matkahuolto_ticket[matkahuolto_ticket_sender_postal]" value="<?php echo $matkahuolto_ticket_sender_postal; ?>" placeholder="<?php echo $entry_sender_postal; ?>" id="input-sender-postal" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sender-city"><?php echo $entry_sender_city; ?></label>
            <div class="col-sm-10">
              <input type="text" name="matkahuolto_ticket[matkahuolto_ticket_sender_city]" value="<?php echo $matkahuolto_ticket_sender_city; ?>" placeholder="<?php echo $entry_sender_city; ?>" id="input-sender-city" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sender-country"><?php echo $entry_sender_country; ?></label>
            <div class="col-sm-10">
              <input type="text" name="matkahuolto_ticket[matkahuolto_ticket_sender_country]" value="<?php echo $matkahuolto_ticket_sender_country; ?>" placeholder="<?php echo $entry_sender_country; ?>" id="input-sender-country" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sender-contact-name"><?php echo $entry_sender_contact_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="matkahuolto_ticket[matkahuolto_ticket_sender_contact_name]" value="<?php echo $matkahuolto_ticket_sender_contact_name; ?>" placeholder="<?php echo $entry_sender_contact_name; ?>" id="input-sender-contact-name" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sender-contact-number"><?php echo $entry_sender_contact_number; ?></label>
            <div class="col-sm-10">
              <input type="text" name="matkahuolto_ticket[matkahuolto_ticket_sender_contact_number]" value="<?php echo $matkahuolto_ticket_sender_contact_number; ?>" placeholder="<?php echo $entry_sender_contact_number; ?>" id="input-sender-contact-number" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sender-email"><?php echo $entry_sender_email; ?></label>
            <div class="col-sm-10">
              <input type="text" name="matkahuolto_ticket[matkahuolto_ticket_sender_email]" value="<?php echo $matkahuolto_ticket_sender_email; ?>" placeholder="<?php echo $entry_sender_email; ?>" id="input-sender-email" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sender-reference"><?php echo $entry_sender_reference; ?></label>
            <div class="col-sm-10">
              <input type="text" name="matkahuolto_ticket[matkahuolto_ticket_sender_reference]" value="<?php echo $matkahuolto_ticket_sender_reference; ?>" placeholder="<?php echo $entry_sender_reference; ?>" id="input-sender-reference" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-departure-place-code"><?php echo $entry_departure_place_code; ?></label>
            <div class="col-sm-10">
              <input type="text" name="matkahuolto_ticket[matkahuolto_ticket_departure_place_code]" value="<?php echo $matkahuolto_ticket_departure_place_code; ?>" placeholder="<?php echo $entry_departure_place_code; ?>" id="input-departure-place-code" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-departure-place-name"><?php echo $entry_departure_place_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="matkahuolto_ticket[matkahuolto_ticket_departure_place_name]" value="<?php echo $matkahuolto_ticket_departure_place_name; ?>" placeholder="<?php echo $entry_departure_place_name; ?>" id="input-departure-place-name" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-shipment-type"><?php echo $entry_shipment_type; ?></label>
            <div class="col-sm-10">
              <select name="shipment_type" id="input-shipment-type" class="form-control">
                <option value="0"><?php echo $text_none; ?></option>
                <?php foreach( $shipment_types as $shipment ){?>
               <?php if( $shipment['type'] == $shipment_type ){?>
                <option value="<?php echo $shipment['type']; ?>" selected="selected"><?php echo $shipment['name']; ?></option>
                <?php } else {?>
                <option value="<?php echo $shipment['type']; ?>"><?php echo $shipment['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
                 <?php if( $error_shipment_type ){?>
                  <div class="text-danger"><?php echo $error_shipment_type; ?></div>
                  <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-message-type"><?php echo $entry_message_type; ?></label>
            <div class="col-sm-10">
              <select name="message_type" id="message-type" class="form-control">
                <option value="0"><?php echo $text_none; ?></option>
                <?php foreach( $message_types as $message ){?>
               <?php if( $message['type'] == $message_type ){?>
                <option value="<?php echo $message['type']; ?>" selected="selected"><?php echo $message['name']; ?></option>
                <?php } else {?>
                <option value="<?php echo $message['type']; ?>"><?php echo $message['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
             <?php if( $error_message_type ){?>
                  <div class="text-danger"><?php echo $error_message_type; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-version"><?php echo $entry_version; ?></label>
            <div class="col-sm-10">
              <input type="text" name="version" value="<?php echo $version; ?>" placeholder="<?php echo $entry_version; ?>" id="input-version" class="form-control" />
             <?php if( $error_version ){?>
                  <div class="text-danger"><?php echo $error_version; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-packages"><?php echo $entry_packages; ?></label>
            <div class="col-sm-10">
              <input type="text" name="packages" value="<?php echo $packages; ?>" placeholder="<?php echo $entry_packages; ?>" id="input-packages" class="form-control" />
             <?php if( $error_packages ){?>
                  <div class="text-danger"><?php echo $error_packages; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-package-id"><?php echo $entry_package_id; ?></label>
            <div class="col-sm-10">
              <input type="text" name="package_id[1]" value="<?php echo $package_id[1]; ?>" placeholder="<?php echo $entry_package_id; ?>" id="input-package-id" class="form-control" />
            </div>
          </div>
          <div id="package-row"></div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-volume"><?php echo $entry_volume; ?></label>
            <div class="col-sm-10">
              <input type="text" name="volume" value="<?php echo $volume; ?>" placeholder="<?php echo $entry_volume; ?>" id="input-volume" class="form-control" />
             <?php if( $error_volume ){?>
                  <div class="text-danger"><?php echo $error_volume; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-weight"><?php echo $entry_weight; ?></label>
            <div class="col-sm-10">
              <input type="text" name="weight" value="<?php echo $weight; ?>" placeholder="<?php echo $entry_volume; ?>" id="input-weight" class="form-control" />
             <?php if( $error_weight ){?>
                  <div class="text-danger"><?php echo $error_weight; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-receiver-id"><?php echo $entry_receiver_id; ?></label>
            <div class="col-sm-10">
              <input type="text" name="receiver_id" value="<?php echo $receiver_id; ?>" placeholder="<?php echo $entry_receiver_id; ?>" id="input-receiver-id" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-receiver-name"><?php echo $entry_receiver_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="receiver_name" value="<?php echo $receiver_name; ?>" placeholder="<?php echo $entry_receiver_name; ?>" id="input-receiver-name" class="form-control" />
             <?php if( $error_receiver_name ){?>
                  <div class="text-danger"><?php echo $error_receiver_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-reveiver-name2"><?php echo $entry_receiver_name2; ?></label>
            <div class="col-sm-10">
              <input type="text" name="receiver_name2" value="<?php echo $receiver_name2; ?>" placeholder="<?php echo $entry_receiver_name2; ?>" id="input-receiver-name2" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-receiver-address"><?php echo $entry_receiver_address; ?></label>
            <div class="col-sm-10">
              <input type="text" name="receiver_address" value="<?php echo $receiver_address; ?>" placeholder="<?php echo $entry_receiver_address; ?>" id="input-receiver-address" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-receiver-postcode"><?php echo $entry_receiver_postal; ?></label>
            <div class="col-sm-10">
              <input type="text" name="receiver_postal" value="<?php echo $receiver_postal; ?>" placeholder="<?php echo $entry_receiver_postal; ?>" id="input-receiver-postcode" class="form-control" />
             <?php if( $error_receiver_postal ){?>
                  <div class="text-danger"><?php echo $error_receiver_postal; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-receiver-city"><?php echo $entry_receiver_city; ?></label>
            <div class="col-sm-10">
              <input type="text" name="receiver_city" value="<?php echo $receiver_city; ?>" placeholder="<?php echo $entry_receiver_city; ?>" id="input-receiver-city" class="form-control" />
             <?php if( $error_receiver_city ){?>
                  <div class="text-danger"><?php echo $error_receiver_city; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-receiver-country"><?php echo $entry_receiver_country; ?></label>
            <div class="col-sm-10">
              <input type="text" name="receiver_country" value="<?php echo $receiver_country; ?>" placeholder="<?php echo $entry_receiver_country; ?>" id="input-receiver-country" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-receiver-contact-name"><?php echo $entry_receiver_contact_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="receiver_contact_name" value="<?php echo $receiver_contact_name; ?>" placeholder="<?php echo $entry_receiver_contact_name; ?>" id="input-receiver-contact-name" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-receiver-contact-number"><?php echo $entry_receiver_contact_number; ?></label>
            <div class="col-sm-10">
              <input type="text" name="receiver_contact_number" value="<?php echo $receiver_contact_number; ?>" placeholder="<?php echo $entry_receiver_contact_number; ?>" id="input-receiver-contact-number" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-receiver-email"><?php echo $entry_receiver_email; ?></label>
            <div class="col-sm-10">
              <input type="text" name="receiver_email" value="<?php echo $receiver_email; ?>" placeholder="<?php echo $entry_receiver_email; ?>" id="input-receiver-email" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-receiver-country"><?php echo $entry_receiver_reference; ?></label>
            <div class="col-sm-10">
              <input type="text" name="receiver_reference" value="<?php echo $receiver_reference; ?>" placeholder="<?php echo $entry_receiver_reference; ?>" id="input-receiver-feference" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-destination-place-code"><?php echo $entry_destination_place_code; ?></label>
            <div class="col-sm-10">
              <input type="text" name="destination_place_code" value="<?php echo $destination_place_code; ?>" placeholder="<?php echo $entry_destination_place_code; ?>" id="input-destination-place-code" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-destination-place-name"><?php echo $entry_destination_place_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="destination_place_name" value="<?php echo $destination_place_name; ?>" placeholder="<?php echo $entry_destination_place_name; ?>" id="input-destination-place-name" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-remarks"><?php echo $entry_remarks; ?></label>
            <div class="col-sm-10">
              <input type="text" name="remarks" value="<?php echo $remarks; ?>" placeholder="<?php echo $entry_remarks; ?>" id="input-remarks" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-payer-code"><?php echo $entry_payer_code; ?></label>
            <div class="col-sm-10">
              <select name="payer_code" id="input-payer-code" class="form-control">
                <option value="0"><?php echo $text_none; ?></option>
                <?php foreach( $payer_codes as $payercode ){?>
               <?php if( $payercode['code'] == $payer_code ){?>
                <option value="<?php echo $payercode['code']; ?>" selected="selected"><?php echo $payercode['name']; ?></option>
                <?php } else {?>
                <option value="<?php echo $payercode['code']; ?>"><?php echo $payercode['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
          </div>
        </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-payer-id"><?php echo $entry_payer_id; ?></label>
            <div class="col-sm-10">
              <input type="text" name="payer_id" value="<?php echo $payer_id; ?>" placeholder="<?php echo $entry_payer_id; ?>" id="input-payer-id" class="form-control" />
            </div>
          </div>
          <div class="payer-info">
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-payer-code"><?php echo $entry_products; ?></label>
            <div class="col-sm-10">
              <select name="product_code" id="input-product" class="form-control">
                <option value=""><?php echo $text_none; ?></option>
                <?php foreach( $products as $product ){?>
               <?php if( $product['code'] == $product_code ){?>
                <option value="<?php echo $product['code']; ?>" selected="selected"><?php echo $product['name']; ?></option>
                <?php } else {?>
                <option value="<?php echo $product['code']; ?>"><?php echo $product['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
             <?php if( $error_product_code ){?>
                  <div class="text-danger"><?php echo $error_product_code; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-product['name']"><?php echo $entry_product_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="product['name']" value="<?php echo $product_name; ?>" placeholder="<?php echo $entry_product_name; ?>" id="input-product['name']" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pickup"><?php echo $entry_pickup; ?></label>
            <div class="col-sm-10">
              <select name="pickup" id="input-pickup" class="form-control">
                <option value=""><?php echo $text_none; ?></option>
                <?php foreach( $pickup_product as $pickups ){?>
                  <?php if( $pickup == $pickups['key'] ){?>
                      <option value="<?php echo $pickup.key; ?>" selected="selected"><?php echo $pickups['name']; ?></option>
                   <?php } else {?>
                      <option value="<?php echo $pickups['key']; ?>"><?php echo $pickups['name']; ?></option>
                   <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pickup-payer"><?php echo $entry_pickup_payer; ?></label>
            <div class="col-sm-10">
              <select name="pickup_payer" id="input-pickup-payer" class="form-control">
                <option value=""><?php echo $text_none; ?></option>
                <?php foreach( $pickup_payer as $payer ){?>
                      <option value="<?php echo $payer['key']; ?>"><?php echo $payer['name']; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pickup-remark"><?php echo $entry_pickup_remark; ?></label>
            <div class="col-sm-10">
              <input type="text" name="pickup_remark" value="<?php echo $pickup_remark; ?>" placeholder="<?php echo $entry_pickup_remark; ?>" id="input-pickup-remark" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-delivery-key"><?php echo $entry_delivery; ?></label>
            <div class="col-sm-10">
              <select name="delivery_key" id="input-delivery-key" class="form-control">
                <option value=""><?php echo $text_none; ?></option>
                <?php foreach( $delivery_product as $delivery ){?>
                  <?php if( $delivery_key == $delivery['key'] ){?>
                      <option value="<?php echo $delivery['key']; ?>" selected="selected"><?php echo $delivery['name']; ?></option>
                   <?php } else {?>
                      <option value="<?php echo $delivery['key']; ?>"><?php echo $delivery['name']; ?></option>
                   <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-delivery-payer"><?php echo $entry_delivery_payer; ?></label>
            <div class="col-sm-10">
              <select name="delivery_payer" id="input-delivery-payer" class="form-control">
                <option value=""><?php echo $text_none; ?></option>
                <?php foreach( $delivery_payer as $payer ){?>
                      <option value="<?php echo $payer['key']; ?>"><?php echo $payer['name']; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-delivery-remark"><?php echo $entry_delivery_remark; ?></label>
            <div class="col-sm-10">
              <input type="text" name="delivery_remark" value="<?php echo $delivery_remark; ?>" placeholder="<?php echo $entry_delivery_remark; ?>" id="input-delivery-remark" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-cod-sum"><?php echo $entry_cod_sum; ?></label>
            <div class="col-sm-10">
              <input type="text" name="cod_sum" value="<?php echo $cod_sum; ?>" placeholder="<?php echo $entry_cod_sum; ?>" id="input-cod-sum" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-cod-currency"><?php echo $entry_cod_currency; ?></label>
            <div class="col-sm-10">
              <select name="cod_currency" id="input-cod-currency" class="form-control">
                <option value=""><?php echo $text_none; ?></option>
                <option value="EUR">Euro</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-cod-iban"><?php echo $entry_cod_iban; ?></label>
            <div class="col-sm-10">
              <input type="text" name="cod_iban" value="<?php echo $cod_iban; ?>" placeholder="<?php echo $entry_cod_iban; ?>" id="input-cod-bic" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-cod-bic"><?php echo $entry_cod_bic; ?></label>
            <div class="col-sm-10">
              <input type="text" name="cod_bic" value="<?php echo $cod_bic; ?>" placeholder="<?php echo $entry_cod_bic; ?>" id="input-cod-bic" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-cod-reference"><?php echo $entry_cod_reference; ?></label>
            <div class="col-sm-10">
              <input type="text" name="cod_reference" value="<?php echo $cod_reference; ?>" placeholder="<?php echo $entry_cod_reference; ?>" id="input-cod-reference" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-goods"><?php echo $entry_goods; ?></label>
            <div class="col-sm-10">
              <input type="text" name="goods" value="<?php echo $goods; ?>" placeholder="<?php echo $entry_goods; ?>" id="input-goods" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-handling"><?php echo $entry_special_handling; ?></label>
            <div class="col-sm-10">
              <select name="special_handling" id="input-handling" class="form-control">
                <option value=""><?php echo $text_none; ?></option>
                <?php foreach( $special_handling as $handling ){?>
                  <option value="<?php echo $handlin['key']; ?>"><?php echo $handling['name']; ?></option>
                <?php } ?>
              </select>
              </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-vak-code"><?php echo $entry_vak_code; ?></label>
            <div class="col-sm-10">
              <select name="vak_code" id="input-vak-code" class="form-control">
                <option value=""><?php echo $text_none; ?></option>
                <?php foreach( $vak_codes as $vak ){?>
                  <?php if( $vak['key'] == $vak_code ){?>
                     <option value="<?php echo $vak['key']; ?>" selected="selected"><?php echo $vak['name']; ?></option>
                   <?php } else {?>
                     <option value="<?php echo $vak['key']; ?>"><?php echo $vak['name']; ?></option>
                   <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-vak-description"><?php echo $entry_vak_description; ?></label>
            <div class="col-sm-10">
              <input type="text" name="vak_description" value="<?php echo $vak_description; ?>" placeholder="<?php echo $entry_vak_description; ?>" id="input-vak-description" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-doc-type"><?php echo $entry_doc_type; ?></label>
            <div class="col-sm-10">
              <input type="text" name="doc_type" value="<?php echo $doc_type; ?>" placeholder="<?php echo $entry_doc_type; ?>" id="input-doc-type" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-handover"><?php echo $entry_handover; ?></label>
            <div class="col-sm-10">
              <select name="special_handover" id="input-handover" class="form-control">
                <option value=""><?php echo $text_none; ?></option>
               <?php if( $special_handover == 'Y' ){?>
                   <option value="Y" selected="selected">Kyllä</option>
                <?php } else {?>
                   <option value="Y">Kyllä</option>
                <?php } ?>
                <option value="N">Ei</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-handover-remark-1"><?php echo $entry_handover_remark_1; ?></label>
            <div class="col-sm-10">
              <input type="text" name="handover_remark_1" value="<?php echo $handover_remark_1; ?>" placeholder="<?php echo $entry_handover_remark_1; ?>" id="input-handover-remark-1" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-handover-remark-2"><?php echo $entry_handover_remark_2; ?></label>
            <div class="col-sm-10">
              <input type="text" name="handover_remark_2" value="<?php echo $handover_remark_2; ?>" placeholder="<?php echo $entry_handover_remark_2; ?>" id="input-handover-remark-2" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-handover-remark-3"><?php echo $entry_handover_remark_3; ?></label>
            <div class="col-sm-10">
              <input type="text" name="handover_remark_3" value="<?php echo $handover_remark_3; ?>" placeholder="<?php echo $entry_handover_remark_3; ?>" id="input-handover-remark-3" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-package-id"><?php echo $entry_package_id; ?></label>
            <div class="col-sm-10">
              <input type="text" name="package_idx" value="<?php echo $package_idx; ?>" placeholder="<?php echo $entry_package_id; ?>" id="input-package-id" class="form-control" />
            </div>
          </div>


        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('input[name=\'packages\']').ready(function() {
   packages = $('input[name=\'packages\']').val();

    pkg = '';
    if(packages > 1){

      for(i = 2; i<=packages; i++){
          pkg += '<div class="form-group">';
          pkg += ' <label class="col-sm-2 control-label" for="input-package-id"><?php echo $entry_package_id; ?></label>';
          pkg += '  <div class="col-sm-10">';
          pkg += '   <input type="text" name="package_id[' + i + ']" value="" placeholder="<?php echo $entry_package_id; ?>" id="input-package-id" class="form-control" />';
          pkg += '   </div>';
          pkg += ' </div>';

      }
       $('#package-row').html(pkg);
    }

});
$('input[name=\'packages\']').on('change', function() {
   pcs = $('input[name=\'packages\']').val();

    pkg = '';
    if(pcs > 1){
      for(var i = 2; i <=pcs; i++){
          pkg += '<div class="form-group">';
          pkg += ' <label class="col-sm-2 control-label" for="input-package-id"><?php echo $entry_package_id; ?></label>';
          pkg += '  <div class="col-sm-10">';
          pkg += '   <input type="text" name="package_id[' + i + ']" value="" placeholder="<?php echo $entry_package_id; ?>" id="input-package-id" class="form-control" />';
          pkg += '   </div>';
          pkg += ' </div>';
      }
       $('#package-row').html(pkg);
    }

});
// Disable the tabs
</script>
<script type="text/javascript"><!--
$('select[name=\'payer_code\']').on('change', function() {
   payer = $('select[name=\'payer_code\'] option:selected').val();

   type = '';

   if(payer == 'S'){
     type = 'sender';
   }
   if(payer == 'R'){
     type = 'receiver';
   }
    if(payer !='O'){
      name = $('#form-matkahuolto input[name=\'' + type + '_name\']').val();
      address = $('#form-matkahuolto input[name=\'' + type + '_address\']').val();
      postcode = $('#form-matkahuolto input[name=\'' + type + '_postal\']').val();
      city = $('#form-matkahuolto input[name=\'' + type + '_city\']').val();
      country = $('#form-matkahuolto input[name=\'' + type + '_country\']').val();
      contact_name = $('#form-matkahuolto input[name=\'' + type + '_contact_name\']').val();
      contact_number = $('#form-matkahuolto input[name=\'' + type + '_contact_number\']').val();
      email = $('#form-matkahuolto input[name=\'' + type + '_email\']').val();
      reference = $('#form-matkahuolto input[name=\'' + type + '_reference\']').val();
    }
    if(payer == 'O'){
      name = '';
      address = '';
      postcode = '';
      city = '';
      country = '';
      contact_name = '';
      contact_number = '';
      email = '';
      reference = '';
    }
    
    html = '    <div class="form-group">';
    html += '     <label class="col-sm-2 control-label" for="input-payer-name"><?php echo $entry_payer_name; ?></label>' + "\r\n";
    html += '     <div class="col-sm-10">' + "\r\n";
    html += '     <input type="text" name="payer_name" value="' + name + '" placeholder="<?php echo $entry_receiver_name; ?>" id="input-payer-name" class="form-control" />';
    html += '     </div></div>';
    html += '       <div class="form-group">';
    html += '         <label class="col-sm-2 control-label" for="input-payer-address"><?php echo $entry_payer_address; ?></label>';
    html += '         <div class="col-sm-10">';
    html += '           <input type="text" name="payer_address" value="' + address + '" placeholder="<?php echo $entry_payer_address; ?>" id="input-payer-address" class="form-control" />';
    html += '         </div>';
    html += '        </div>';
    html += '       <div class="form-group">';
    html += '         <label class="col-sm-2 control-label" for="input-payer-postcode"><?php echo $entry_payer_postal; ?></label>';
    html += '         <div class="col-sm-10">';
    html += '           <input type="text" name="payer_postal" value="' + postcode + '" placeholder="<?php echo $entry_payer_postal; ?>" id="input-payer-postcode" class="form-control" />';
    html += '         </div>';
    html += '       </div>';
    html += '       <div class="form-group">';
    html += '         <label class="col-sm-2 control-label" for="input-payer-city"><?php echo $entry_payer_city; ?></label>';
    html += '         <div class="col-sm-10">';
    html += '           <input type="text" name="payer_city" value="' + city + '" placeholder="<?php echo $entry_payer_city; ?>" id="input-payer-city" class="form-control" />';
    html += '         </div>';
    html += '       </div>';
    html += '       <div class="form-group">';
    html += '         <label class="col-sm-2 control-label" for="input-payer-country"><?php echo $entry_payer_country; ?></label>';
    html += '         <div class="col-sm-10">';
    html += '           <input type="text" name="payer_country" value="' + country + '" placeholder="<?php echo $entry_payer_country; ?>" id="input-payer-country" class="form-control" />';
    html += '        </div>';
    html += '        </div>';
    html += '      <div class="form-group required">';
    html += '        <label class="col-sm-2 control-label" for="input-payer-contact-name"><?php echo $entry_payer_contact_name; ?></label>';
    html += '        <div class="col-sm-10">';
    html += '          <input type="text" name="payer_contact_name" value="' + contact_name + '" placeholder="<?php echo $entry_payer_contact_name; ?>" id="input-payer-contact-name" class="form-control" />';
    html += '        </div>';
    html += '      </div>';
    html += '      <div class="form-group required">';
    html += '        <label class="col-sm-2 control-label" for="input-payer-contact-number"><?php echo $entry_payer_contact_number; ?></label>';
    html += '        <div class="col-sm-10">';
    html += '          <input type="text" name="payer_contact_number" value="' + contact_number + '" placeholder="<?php echo $entry_payer_contact_number; ?>" id="input-payer-contact-number" class="form-control" />';
    html += '         </div>';
    html += '      </div>';
    html += '      <div class="form-group required">';
    html += '        <label class="col-sm-2 control-label" for="input-payer-email"><?php echo $entry_payer_email; ?></label>';
    html += '        <div class="col-sm-10">';
    html += '         <input type="text" name="payer_email" value="' + email + '" placeholder="<?php echo $entry_sender_email; ?>" id="input-payer-email" class="form-control" />';
    html += '       </div>';
    html += '      </div>';
    html += '      <div class="form-group required">';
    html += '        <label class="col-sm-2 control-label" for="input-payer-reference"><?php echo $entry_payer_reference; ?></label>';
    html += '        <div class="col-sm-10">';
    html += '          <input type="text" name="payer_reference" value="' + reference + '" placeholder="<?php echo $entry_payer_reference; ?>" id="input-sender-reference" class="form-control" />';
    html += '        </div>';
    html += '       </div>';

    $('.payer-info').html(html);
});
// Disable the tabs
</script>
<?php echo $footer; ?> 
