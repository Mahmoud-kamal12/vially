<?php
include "includes/inc.php";
?>
<!DOCTYPE html>
<html lang="en">
	<head>
    <title><?php echo"".$get_db_CompanyName.""; ?></title>
    		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		
<?php include"includes/css.php"; ?>
                <?php include"includes/js.php"; ?>
	</head>
	<body  class="cmenu1 example-target">
		
			<div>
				<div>
					<?php
					if ($get_db_isLogo == 1) {
						if ($get_db_Logo=="") {
							echo '<img src="images/yourLogoHere.png" style="float:left; border:0px;"/>';
						} else {
							echo '<img src="uploads/'.$get_db_Logo.'" style="float:left; border:0px;"/>';
						}
					} else {
						//echo"<div class='logodiv'>$get_db_CompanyName</div>";
					}
					?>
				</div>
<?php
include"includes/buttons.php";
?>			</div>
	
		<div id='main'>
			<article style="margin-bottom:70px;">
                                                            <?php
			if($user_UsersAndPermissions!=="1" and $user_IsAdmin!=1){
					                       echo'<div class="alert alert-warning text-right">
                           '.$not_have_permission_lang.'
                            </div>';
				}else{ ?>
                            <div class="text-center">
<?php include"includes/config_menu.php"; ?>
</div>
<fieldset style=" margin:0 auto;">
<?php
if($_GET['del']!==null){
                                 if($demo==1){
echo '<div class="alert alert-warning text-right">
                  '.$demo_alert.'
                            </div>';
      }else{
 if($_GET['del']==1){
                                               echo'<div class="alert alert-warning text-right">
                      '.$can_not_delete_admin_lang.'

                            </div>';
         }else{
if(mysqli_query($con,"DELETE FROM ".$prefix."_users WHERE id='".$_GET['del']."' and id!=1")){
          echo'<div class="alert alert-success text-right">
                             '.$Deletion_successfully_lang.'
                            </div>';
}
         }
      }
	}
?>
<?php
 $checkbox = $_POST['cb']; //from name="checkbox[]"
$countCheck = count($_POST['cb']);
if($countCheck>0){
                                     if($demo==1){
echo '<div class="alert alert-warning text-right">
                  '.$demo_alert.'
                            </div>';
      }else{
 for ($i=0; $i<=$countCheck; $i++) {
$del_id  = $checkbox[$i];
mysqli_query($con,"DELETE FROM ".$prefix."_users WHERE id='".$del_id."'  and id!=1");
if($i==$countCheck-1){
  echo'<div class="alert alert-success text-right">
                '.$Deletion_successfully_lang.'
                            </div>'; 
header("refresh:1;url=users.php");
	}
		  }
      }
}
     ?>
<?php
if(isset($_POST['add']) or isset($_POST['modification'])){

$name=Trim(stripslashes($_POST['name']));
$username=Trim(stripslashes($_POST['username']));	
$password=Trim(stripslashes($_POST['password']));		
$sale=Trim(stripslashes($_POST['sale']));
$buy=Trim(stripslashes($_POST['buy']));
$SoldReturns=Trim(stripslashes($_POST['SoldReturns']));
$purchasesReturns=Trim(stripslashes($_POST['purchasesReturns']));
$EditPrice=Trim(stripslashes($_POST['EditPrice']));
$DeleteBllsOfSale=Trim(stripslashes($_POST['DeleteBllsOfSale']));
$DeletePurchaseInvoices=Trim(stripslashes($_POST['DeletePurchaseInvoices']));
$ModifyBillsOfSale=Trim(stripslashes($_POST['ModifyBillsOfSale']));
$ModifyBillsBuy=Trim(stripslashes($_POST['ModifyBillsBuy']));
$Revenue=Trim(stripslashes($_POST['Revenue']));
$Expenses=Trim(stripslashes($_POST['Expenses']));
$Customers=Trim(stripslashes($_POST['Customers']));
$GeneralSettings=Trim(stripslashes($_POST['GeneralSettings']));
$Groups=Trim(stripslashes($_POST['Groups']));
$Items=Trim(stripslashes($_POST['Items']));
$UsersAndPermissions=Trim(stripslashes($_POST['UsersAndPermissions']));
$ReportsPurchases=Trim(stripslashes($_POST['ReportsPurchases']));
$SalesReports=Trim(stripslashes($_POST['SalesReports']));
$ReportsSuppliers=Trim(stripslashes($_POST['ReportsSuppliers']));
$CustomerReports=Trim(stripslashes($_POST['CustomerReports']));
$InventoryReports=Trim(stripslashes($_POST['InventoryReports']));
$ReportsRevenues=Trim(stripslashes($_POST['ReportsRevenues']));
$ExpenseReports=Trim(stripslashes($_POST['ExpenseReports']));
$ReportsOfPayments=Trim(stripslashes($_POST['ReportsOfPayments']));
$user_treasury=Trim(stripslashes($_POST['user_treasury']));

$permision_treasury_withdrawal = Trim(stripslashes($_POST['permision_treasury_withdrawal']));
$permision_treasury_deposit = Trim(stripslashes($_POST['permision_treasury_deposit']));
$permision_delete_treasury = Trim(stripslashes($_POST['permision_delete_treasury']));
$Item_movement_detection = Trim(stripslashes($_POST['Item_movement_detection']));
$barcode_manual = Trim(stripslashes($_POST['barcode_manual']));
$Cost_price = Trim(stripslashes($_POST['Cost_price']));

$colors = Trim(stripslashes($_POST['colors']));
$sizes = Trim(stripslashes($_POST['sizes']));

}
if(isset($_POST['add'])){
                                     if($demo==1){
echo '<div class="alert alert-warning text-right">
                  '.$demo_alert.'
                            </div>';
      }else{
$username=Trim(stripslashes($_POST['username']));	
$password=Trim(stripslashes($_POST['password']));
$name=Trim(stripslashes($_POST['name']));
if($username==null or $username=="" or $password==null or $password=="" or $name==null or $name==""){
                          echo'<div class="alert alert-danger  text-right">
               '.$must_add_user_pass.'
                            </div>';
	}else{
            if(currently_users()>=$allow_num_users){
                                  echo'<div class="alert alert-warning text-right">
                      '.$allow_num_users_lang.'
                            </div>';
            }else{
$sql="INSERT INTO ".$prefix."_users (name, username,  password, sale, buy, SoldReturns, purchasesReturns, DeleteBllsOfSale, DeletePurchaseInvoices, ModifyBillsOfSale, ModifyBillsBuy, Revenue, Expenses, Customers, Suppliers, GeneralSettings, Groups, Items, UsersAndPermissions, ReportsPurchases, SalesReports, ReportsSuppliers, CustomerReports, InventoryReports, ReportsRevenues, ExpenseReports, ReportsOfPayments, EditPrice, user_treasury, permision_treasury_withdrawal ,permision_treasury_deposit,permision_delete_treasury,Item_movement_detection,barcode_manual,Cost_price , colors , sizes)
VALUES ('".$name."','".$username."','".$password."','".$sale."','".$buy."','".$SoldReturns."','".$purchasesReturns."','".$DeleteBllsOfSale."','".$DeletePurchaseInvoices."','".$ModifyBillsOfSale."','".$ModifyBillsBuy."','".$Revenue."','".$Expenses."','".$Customers."','".$Suppliers."','".$GeneralSettings."','".$Groups."','".$Items."','".$UsersAndPermissions."','".$ReportsPurchases."','".$SalesReports."','".$ReportsSuppliers."','".$CustomerReports."','".$InventoryReports."','".$ReportsRevenues."','".$ExpenseReports."','".$ReportsOfPayments."','".$EditPrice."','".$user_treasury. "','". $permision_treasury_withdrawal ."','". $permision_treasury_deposit ."','". $permision_delete_treasury ."','". $Item_movement_detection ."','". $barcode_manual ."','". $Cost_price  ."','" .$colors ."','". $sizes . "')";

if (!mysqli_query($con,$sql))
  {
	 if(mysqli_errno($con)==1062){
        
        	                       echo'<div class="alert alert-warning text-right">
                       '.$user_already_exists_lang.'
                            </div>';
		 }else{
         echo'<div class="alert alert-danger  text-right">
            '.$not_saved_try_lang.'
         
                            </div>';
	 }
  }else{
  echo'<div class="alert alert-success text-right">
                      '.$Data_is_saved_lang.'
                            </div>';
header("refresh:1;url=users.php");
}
        }
}
      }
}
?>
<legend align="right"><?php echo"$users_lang"; ?>:</legend>
<!--  <span id="result"></span>-->
 <?php
 if(isset($_POST['modification'])){
                                      if($demo==1){
echo '<div class="alert alert-warning text-right">
                  '.$demo_alert.'
                            </div>';
      }else{
 			$sql="UPDATE ".$prefix."_users SET name='".$name."', username='".$username."',  password='".$password."', sale='".$sale."', buy='".$buy."', SoldReturns='".$SoldReturns."', purchasesReturns='".$purchasesReturns."', DeleteBllsOfSale='".$DeleteBllsOfSale."', DeletePurchaseInvoices='".$DeletePurchaseInvoices."', ModifyBillsOfSale='".$ModifyBillsOfSale."', ModifyBillsBuy='".$ModifyBillsBuy."', Revenue='".$Revenue."', Expenses='".$Expenses."', Customers='".$Customers."', Suppliers='".$Suppliers."', GeneralSettings='".$GeneralSettings."', Groups='".$Groups."', Items='".$Items."', UsersAndPermissions='".$UsersAndPermissions."', ReportsPurchases='".$ReportsPurchases."', SalesReports='".$SalesReports."', ReportsSuppliers='".$ReportsSuppliers."', CustomerReports='".$CustomerReports."', InventoryReports='".$InventoryReports."', ReportsRevenues='".$ReportsRevenues."', ExpenseReports='".$ExpenseReports."', ReportsOfPayments='".$ReportsOfPayments."', user_treasury='".$user_treasury."', EditPrice='".$EditPrice. "' , permision_treasury_withdrawal = '" . $permision_treasury_withdrawal . "',permision_treasury_deposit = '" .$permision_treasury_deposit . "',permision_delete_treasury='". $permision_delete_treasury . "',Item_movement_detection='". $Item_movement_detection . "',barcode_manual = '" .$barcode_manual . "',Cost_price = '" . $Cost_price ."',colors= '".$colors."',sizes = '". $sizes . "' where id=".$_POST['id']."";

             if (!mysqli_query($con,$sql))
  {
         echo'<div class="alert alert-danger  text-right">
             '.$not_saved_try_lang.'
                            </div>';
  }else{
  echo'<div class="alert alert-success text-right">
                          '.$Data_is_saved_lang.'
                            </div>'; 
header("refresh:1;url=users.php");
}
      }
 }
 if(isset($_GET['Edit'])){
	 $isedit=1;
			$result_users = mysqli_query($con,"SELECT * FROM  ".$prefix."_users where id='".$_GET['Edit']."'");
if(mysqli_num_rows($result_users)>0){
while($row_users = mysqli_fetch_array($result_users))
  {
	 $row_id=$row_users['id'];
	 $row_name=$row_users['name'];
	 $row_username=$row_users['username'];
	 $row_password=$row_users['password'];
	 $row_sale=$row_users['sale'];
	 $row_buy=$row_users['buy'];
	 $row_SoldReturns=$row_users['SoldReturns'];
	 $row_purchasesReturns=$row_users['purchasesReturns'];
	 $row_DeleteBllsOfSale=$row_users['DeleteBllsOfSale'];
	 $row_DeletePurchaseInvoices=$row_users['DeletePurchaseInvoices'];
	 $row_ModifyBillsOfSale=$row_users['ModifyBillsOfSale'];
	 $row_ModifyBillsBuy=$row_users['ModifyBillsBuy'];
	 $row_Revenue=$row_users['Revenue'];
	 $row_Expenses=$row_users['Expenses'];
	 $row_Customers=$row_users['Customers'];
	 $row_Suppliers=$row_users['Suppliers'];
	 $row_GeneralSettings=$row_users['GeneralSettings'];
	 $row_Groups=$row_users['Groups'];
	 $row_Items=$row_users['Items'];
	 $row_UsersAndPermissions=$row_users['UsersAndPermissions'];
	 $row_ReportsPurchases=$row_users['ReportsPurchases'];
	 $row_SalesReports=$row_users['SalesReports'];
	 $row_ReportsSuppliers=$row_users['ReportsSuppliers'];
	 $row_CustomerReports=$row_users['CustomerReports'];
	 $row_InventoryReports=$row_users['InventoryReports'];
	 $row_ReportsRevenues=$row_users['ReportsRevenues'];
	 $row_ExpenseReports=$row_users['ExpenseReports'];
	 $row_ReportsOfPayments=$row_users['ReportsOfPayments'];
	 $row_EditPrice=$row_users['EditPrice'];
     $row_user_treasury=$row_users['user_treasury'];

     $row_permision_treasury_withdrawal = $row_users['permision_treasury_withdrawal'];
     $row_permision_treasury_deposit = $row_users['permision_treasury_deposit'];
     $row_permision_delete_treasury = $row_users['permision_delete_treasury'];
     $row_Item_movement_detection = $row_users['Item_movement_detection'];
     $row_barcode_manual = $row_users['barcode_manual'];
     $row_Cost_price = $row_users['Cost_price'];

     $row_colors = $row_users['colors'];
     $row_sizes = $row_users['sizes'];


  }
}
	 }else{
		 
		 }
	 ?>
<form id="myForm"  method="post"  name="myForm" enctype="multipart/form-data">
<table  border="0" dir="rtl" style="padding-top:30px; text-align:right; color:#009; font-weight:bold; font-size:14px; text-align:center; width:100%;">
  <tr>
      <th colspan="5" class="text-right"><?php echo"$the_name_lang"; ?>
      <input type="text" name="name"   class="form-control" value="<?php echo"$row_name"; ?>" /></th>
    <th class="text-right"><?php echo"$user_name_lang"; ?>
<input type="text" name="username"   class="form-control" value="<?php echo"$row_username"; ?>" /></th>
    <td colspan="2" class="text-right"><span style="vertical-align:middle;"><?php echo"$password_lang"; ?></span>     
        <input type="text" name="password"   class="form-control" value="<?php echo"$row_password"; ?>" /></td>

    </tr>
  <tr>
    <th colspan="9" style="text-align:right; color:#666;"><?php echo"$permissions_lang"; ?>:
<hr style="color:#E8E8E8;" />
    </th>
  </tr>
  <tr>
        <th class="text-right"><label for="permision_treasury_withdrawal"><?php echo"$permision_treasury_withdrawal_lang"; ?></label></th>
        <th class="text-right"><input   class="form-control" type="checkbox" value="1" name="permision_treasury_withdrawal" id="permision_treasury_withdrawal" <?php if($row_permision_treasury_withdrawal=="1"){echo"checked";} ?>/></th>


        <th class="text-right"><label for="permision_treasury_deposit"><?php echo"$permision_treasury_deposit_lang"; ?></label></th>
        <th class="text-right"><input   class="form-control" type="checkbox" value="1" name="permision_treasury_deposit" id="permision_treasury_deposit" <?php if($row_permision_treasury_deposit=="1"){echo"checked";} ?>/></th>


        <th class="text-right"><label for="permision_delete_treasury"><?php echo"$permision_delete_treasury_lang"; ?></label></th>
        <th class="text-right"><input   class="form-control" type="checkbox" value="1" name="permision_delete_treasury" id="permision_delete_treasury" <?php if($row_permision_delete_treasury=="1"){echo"checked";} ?>/></th>

        <th class="text-right"><label for="Item_movement_detection"><?php echo"$Item_movement_detection_lang"; ?></label></th>
        <th class="text-right"><input   class="form-control" type="checkbox" value="1" name="Item_movement_detection" id="Item_movement_detection" <?php if($row_Item_movement_detection=="1"){echo"checked";} ?>/></th>

    </tr>
  <tr>
    <th class="text-right"><label for="Suppliers"><?php echo"$Suppliers_lang"; ?></label></th>
    <th class="text-right"><input   class="form-control" type="checkbox" value="1" name="Suppliers" id="Suppliers" <?php if($row_Suppliers=="1"){echo"checked";} ?>/></th>
    <th class="text-right"><label for="Items"><?php echo"$the_items_lang"; ?></label></th>
    <th class="text-right"><input   class="form-control" type="checkbox" value="1" name="Items" id="Items" <?php if($row_Items=="1"){echo"checked";} ?> /></th>
    <th class="text-right"><label for="sale"><?php echo"$sales_lang"; ?></label></th>
    <th class="text-right"><input   class="form-control" type="checkbox" value="1" name="sale" id="sale" <?php if($row_sale=="1"){echo"checked";} ?>  /></th>
    <th class="text-right"><label for="buy"><?php echo"$Purchases_lang"; ?></label>
     </th>
    <th class="text-right"><input   class="form-control" type="checkbox" value="1" name="buy" id="buy" <?php if($row_buy==1){echo"checked";} ?> /></th>
  </tr>
  <tr>
    <th class="text-right"><label for="Revenue"><?php echo"$Revenue_lang"; ?></label></th>
    <th class="text-right"><input  class="form-control" type="checkbox" value="1" name="Revenue" id="Revenue" <?php if($row_Revenue=="1"){echo"checked";} ?>  class="form-control"  /></th>
    <th class="text-right"><label for="GeneralSettings"><?php echo"$General_Settings_lang"; ?></label></th>
    <th class="text-right"><input   class="form-control" type="checkbox" value="1" name="GeneralSettings" id="GeneralSettings" <?php if($row_GeneralSettings=="1"){echo"checked";} ?>  class="form-control" /></th>
    <th class="text-right"><label for="SoldReturns"><?php echo"$Sales_returns_lang"; ?></label></th>
    <th class="text-right"><input  class="form-control" type="checkbox" value="1" name="SoldReturns" id="SoldReturns" <?php if($row_SoldReturns=="1"){echo"checked";} ?>  class="form-control" /></th>
    <th class="text-right"><label for="purchasesReturns"><?php echo"$Returns_Purchases_lang"; ?></label></th>
    <th class="text-right"><input  class="form-control" type="checkbox" value="1" name="purchasesReturns" id="purchasesReturns" <?php if($row_purchasesReturns=="1"){echo"checked";} ?>   class="form-control"/></th>
    </tr>
  <tr>
    <th class="text-right"><label for="Expenses"><?php echo"$Expenses_lang"; ?></label></th>
    <th class="text-right"><input  class="form-control" type="checkbox" value="1" name="Expenses" id="Expenses" <?php if($row_Expenses=="1"){echo"checked";} ?> class="form-control"  /></th>
    <th class="text-right"><label for="Groups"><?php echo"$the_Groups_lang"; ?></label></th>
    <th class="text-right"><input  class="form-control" type="checkbox" value="1" name="Groups" id="Groups" <?php if($row_Groups=="1"){echo"checked";} ?>  class="form-control" /></th>
    <th class="text-right"><!--<label for="EditPrice">?????????? ?????????? ?????? ??????????</label>-->
      <label for="SalesReports2"><?php echo"$Sales_Reports_lang"; ?></label></th>
    <th class="text-right"><!--<input type="checkbox" value="1" name="EditPrice" id="EditPrice" <?php if($row_EditPrice=="1"){echo"checked";} ?>  />-->
      <input type="checkbox"  class="form-control" value="1" name="SalesReports" id="SalesReports" <?php if($row_SalesReports=="1"){echo"checked";} ?>  /></th>
    <th class="text-right"><label for="DeletePurchaseInvoices"><!--?????? ???????????? ????????--><?php echo"$users_lang"; ?></label></th>
    <th class="text-right"><!--<input type="checkbox" value="1" name="DeletePurchaseInvoices" id="DeletePurchaseInvoices" <?php if($row_DeletePurchaseInvoices=="1"){echo"checked";} ?>  />-->
      <input  class="form-control" type="checkbox" value="1" name="UsersAndPermissions" id="UsersAndPermissions" <?php if($row_UsersAndPermissions=="1"){echo"checked";} ?>  /></th>
  </tr>
  <tr>
    <th class="text-right"><label for="ModifyBillsOfSale"><?php echo"$Expenses_Reports_lang"; ?></label></th>
    <th class="text-right"><!--<input type="checkbox" value="1" name="ModifyBillsOfSale" id="ModifyBillsOfSale" <?php if($row_ModifyBillsOfSale=="1"){echo"checked";} ?>  />-->
      <input  class="form-control" type="checkbox" value="1" name="ExpenseReports" id="ExpenseReports" <?php if($row_ExpenseReports=="1"){echo"checked";} ?>  /></th>
    <th class="text-right"><label for="Customers"><?php echo"$Clients_lang"; ?></label></th>
    <th class="text-right"><input  class="form-control" type="checkbox" value="1" name="Customers" id="Customers" <?php if($row_Customers=="1"){echo"checked";} ?>  /></th>
    <th class="text-right"><label for="DeleteBllsOfSale"><!--?????? ???????????? ??????--><?php echo"$Customers_payments_lang"; ?></label></th>
    <th class="text-right"><!--<input type="checkbox" value="1" name="DeleteBllsOfSale" id="DeleteBllsOfSale" <?php if($row_DeleteBllsOfSale=="1"){echo"checked";} ?>  />-->
      <input  class="form-control" type="checkbox" value="1" name="CustomerReports" id="CustomerReports" <?php if($row_CustomerReports=="1"){echo"checked";} ?>  /></th>
    <th class="text-right"><label for="ModifyBillsBuy"><!--?????????? ???????????? ????????--><?php echo"$Inventory_reports_lang"; ?></label></th>
    <th class="text-right"><!--<input type="checkbox" value="1" name="ModifyBillsBuy" id="ModifyBillsBuy" <?php if($row_ModifyBillsBuy=="1"){echo"checked";} ?>  />-->
      <input  class="form-control" type="checkbox"  value="1" name="InventoryReports" id="InventoryReports" <?php if($row_InventoryReports=="1"){echo"checked";} ?>  /></th>
  </tr>
  <tr>
    <th class="text-right"><label for="ReportsSuppliers2"><?php echo"$Suppliers_payments_lang"; ?></label></th>
    <th class="text-right"><input  class="form-control" type="checkbox" value="1" name="ReportsSuppliers" id="ReportsSuppliers" <?php if($row_ReportsSuppliers=="1"){echo"checked";} ?>  /></th>
    <th class="text-right"><label for="ReportsPurchases"><?php echo"$Purchasing_Reports_lang"; ?></label></th>
    <th class="text-right"><input  class="form-control" type="checkbox" value="1" name="ReportsPurchases" id="ReportsPurchases" <?php if($row_ReportsPurchases=="1"){echo"checked";} ?>  /></th>
    <th class="text-right"><label for="user_treasury"><?php echo"$Treasury_lang"; ?></label></th>
    <th class="text-right"><input  class="form-control" type="checkbox" value="1" name="user_treasury" id="user_treasury" <?php if($row_user_treasury=="1"){echo"checked";} ?>  /></th>
  </tr>
  <tr>
      <th class="text-right"><label for="Cost_price"><?php echo"$Cost_price_lang"; ?></label></th>
      <th class="text-right"><input   class="form-control" type="checkbox" value="1" name="Cost_price" id="Cost_price" <?php if($row_Cost_price=="1"){echo"checked";} ?>/></th>

      <th class="text-right"><label for="barcode_manual"><?php echo"$barcode_manual_lang"; ?></label></th>
      <th class="text-right"><input   class="form-control" type="checkbox" value="1" name="barcode_manual" id="barcode_manual" <?php if($row_barcode_manual=="1"){echo"checked";} ?>/></th>

      <th class="text-right"><label for="colors">??????????????</label></th>
      <th class="text-right"><input   class="form-control" type="checkbox" value="1" name="colors" id="colors" <?php if($row_colors=="1"){echo"checked";} ?>/></th>

      <th class="text-right"><label for="sizes">????????????????</label></th>
      <th class="text-right"><input   class="form-control" type="checkbox" value="1" name="sizes" id="sizes" <?php if($row_sizes=="1"){echo"checked";} ?>/></th>

  </tr>
  <tr>
    <th class="text-right"><label for="ReportsRevenues"><?php /*?>???????????? ??????????????????<?php */?></label></th>
    <th class="text-center"><!--<input type="checkbox" value="1" name="ReportsRevenues" id="ReportsRevenues" <?php if($row_ReportsRevenues=="1"){echo"checked";} ?>  />--></th>
    <th class="text-center"><label for="ReportsOfPayments"><!--???????????? ??????????????????--></label></th>
    <th class="text-center"><!--<input type="checkbox" value="1" name="ReportsOfPayments" id="ReportsOfPayments" <?php if($row_ReportsOfPayments=="1"){echo"checked";} ?>  />--></th>
    <th  class="text-center">&nbsp;</th>
    <th colspan="2"  class="text-center">&nbsp;</th>
    <th  class="text-center">&nbsp;</th>
    <th  class="text-center">&nbsp;</th>
  </tr>
  <tr>
    <th  class="text-center">&nbsp;</th>
    <th  class="text-center">&nbsp;</th>
    <th  class="text-center">&nbsp;</th>
    <th  class="text-center">&nbsp;</th>
    <th  class="text-center">&nbsp;</th>
    <th colspan="2"  class="text-center">&nbsp;</th>
    <th  class="text-center">&nbsp;</th>
    <th  class="text-center">&nbsp;</th>
  </tr>
  <tr>
    <th colspan="9"  class="text-center"><?php
		if($isedit==1){
			echo'<input type="submit" name="modification" id="modification" value="'.$Modify_lang.'" class="button"  />';
			echo'<input type="hidden"  name="id" value="'.$row_id.'"/>';
			}else{
			echo'<input type="submit" name="add" id="add" value="'.$save_lang.'" class="button"  />';
			}
		?>
        <input type="button" class="button"  value="<?php echo"$Cancel_lang"; ?>" onclick="javascript:location.href='users.php'"  />
        </th>
  </tr>
  <tr  class="text-right">
    <th colspan="4"></th>
    <td width="9%"></td>
    <td width="22%" style="text-align:right; vertical-align:middle;"><!--<span style="text-align:right; direction:rtl;">??????????????/??????????</span>--></td>
    <td colspan="2" style="text-align:right; direction:rtl;"></td>
  </tr>
</table>
</form>
</fieldset>
<?php if($demo==1){
echo '<div class="alert alert-warning text-right">
                 '.$demo_lang.'
                            </div>';
      }else{ ?>
<form id="mainform" action="" method="post">
  <table border="1" style="font-size:16px; width:100%; direction:rtl; border:1px; border-collapse:collapse; margin-top:10px; text-align:center; margin-bottom:40px;"   class="container" id="container">
  <thead style="background-color:#CCC;">
  <th style="width:5%;"><div  class="all"><input type="checkbox" name="all" value="1" id="all" /></div></th>
  
  <th class="text-center <?php if($_GET['type']=="ASC" and $_GET['orderby']=="id"){echo"sort_t";}else if($_GET['type']=="DESC" and $_GET['orderby']=="id"){echo"sort_d";}else{echo"sort0";}?>"><a href="?orderby=id&type=<?php if($_GET['type']=="ASC"){echo"DESC";}else if($_GET['type']=="DESC"){echo"ASC";}else{echo"DESC";} ?>&page=<?php echo"".$_GET['page'].""; ?>" class="a_remove_underlines">??????????</a></th>
    <th class="text-center <?php if($_GET['type']=="ASC" and $_GET['orderby']=="name"){echo"sort_t";}else if($_GET['type']=="DESC" and $_GET['orderby']=="name"){echo"sort_d";}else{echo"sort0";}?>"><a href="?orderby=name&type=<?php if($_GET['type']=="ASC"){echo"DESC";}else if($_GET['type']=="DESC"){echo"ASC";}else{echo"DESC";} ?>&page=<?php echo"".$_GET['page'].""; ?>" class="a_remove_underlines">??????????</a></th>
    
  <th class="text-center <?php if($_GET['type']=="ASC" and $_GET['orderby']=="GroupName"){echo"sort_t";}else if($_GET['type']=="DESC" and $_GET['orderby']=="GroupName"){echo"sort_d";}else{echo"sort0";}?>"><a href="?orderby=GroupName&type=<?php if($_GET['type']=="ASC"){echo"DESC";}else if($_GET['type']=="DESC"){echo"ASC";}else{echo"DESC";} ?>&page=<?php echo"".$_GET['page'].""; ?>" class="a_remove_underlines">?????? ????????????????</a></th>
  
  <th class="text-center "><?php echo"$Password_lang"; ?></th>
  
  <th class="text-center "></th>
  </thead>
  <?php
if($orderby==null){$orderby="id";}
if($type==null){$type="DESC";}
###########################################
	$tbl_name="users";		//your table name
	// How many adjacent pages should be shown on each side?
	$adjacents = 3;
	
	/* 
	   First get total number of rows in data table. 
	   If you have a WHERE clause in your query, make sure you mirror it here.
	*/
	$query = "SELECT COUNT(*) as num  FROM  ".$prefix."_users order by $orderby $type";
	$total_pages = @mysqli_fetch_array(mysqli_query($con,$query));
	$total_pages = $total_pages[num];
		
	/* Setup vars for query. */
	$targetpage = "?limit=".$_GET['limit']."&orderby=".$_GET['orderby']."&type=".$_GET['type'].""; 	//your file name  (the name of this file)
	 								//how many items to show per page
										if(!empty($_GET['limit'])){
		$_SESSION[limit]=$_GET['limit'];
		}else{}
		if(!empty($_SESSION[limit])){
					$limit = $_SESSION[limit];
					if($limit>100){$limit=$items_per_page+4;}
			}else{
				$limit = $items_per_page+4;
				}
	$page = $_GET['page'];
	if($page) 
		$start = ($page - 1) * $limit; 			//first item to display on this page
	else
		$start = 0;								//if no page var is given, set start to 0
	
		
	$sql = "SELECT * FROM ".$prefix."_users  order by $orderby $type LIMIT $start, $limit";			


	$result = @mysqli_query($con,$sql);
		/* Setup page vars for display. */
	if ($page == 0) $page = 1;					//if no page var is given, default to 1.
	$prev = $page - 1;							//previous page is page - 1
	$next = $page + 1;							//next page is page + 1
	$lastpage = ceil($total_pages/$limit);		//lastpage is = total pages / items per page, rounded up.
	$lpm1 = $lastpage - 1;						//last page minus 1
	
	/* 
		Now we apply our rules and draw the pagination object. 
		We're actually saving the code to a variable in case we want to draw it more than once.
	*/
	$pagination = "";
	if($lastpage > 1)
	{	
		$pagination .= "<div class=\"pagination\">";
		//previous button
		if ($page > 1) 
			$pagination.= "<a href=\"$targetpage&page=$prev\">>></a>";
		else
			$pagination.= "<span class=\"disabled\">>></span>";	
		
		//pages	
		if ($lastpage < 7 + ($adjacents * 2))	//not enough pages to bother breaking it up
		{	
			for ($counter = 1; $counter <= $lastpage; $counter++)
			{
				if ($counter == $page)
					$pagination.= "<span class=\"current\">$counter</span>";
				else
					$pagination.= "<a href=\"$targetpage&page=$counter\">$counter</a>";					
			}
		}
		elseif($lastpage > 5 + ($adjacents * 2))	//enough pages to hide some
		{
			//close to beginning; only hide later pages
			if($page < 1 + ($adjacents * 2))		
			{
				for ($counter = 1; $counter < 4 + ($adjacents * 2); $counter++)
				{
					if ($counter == $page)
						$pagination.= "<span class=\"current\">$counter</span>";
					else
						$pagination.= "<a href=\"$targetpage&page=$counter\">$counter</a>";					
				}
				$pagination.= "...";
				$pagination.= "<a href=\"$targetpage&page=$lpm1\">$lpm1</a>";
				$pagination.= "<a href=\"$targetpage&page=$lastpage\">$lastpage</a>";		
			}
			//in middle; hide some front and some back
			elseif($lastpage - ($adjacents * 2) > $page && $page > ($adjacents * 2))
			{
				$pagination.= "<a href=\"$targetpage&page=1\">1</a>";
				$pagination.= "<a href=\"$targetpage&page=2\">2</a>";
				$pagination.= "...";
				for ($counter = $page - $adjacents; $counter <= $page + $adjacents; $counter++)
				{
					if ($counter == $page)
						$pagination.= "<span class=\"current\">$counter</span>";
					else
						$pagination.= "<a href=\"$targetpage&page=$counter\">$counter</a>";					
				}
				$pagination.= "...";
				$pagination.= "<a href=\"$targetpage&page=$lpm1\">$lpm1</a>";
				$pagination.= "<a href=\"$targetpage&page=$lastpage\">$lastpage</a>";		
			}
			//close to end; only hide early pages
			else
			{
				$pagination.= "<a href=\"$targetpage&page=1\">1</a>";
				$pagination.= "<a href=\"$targetpage&page=2\">2</a>";
				$pagination.= "...";
				for ($counter = $lastpage - (2 + ($adjacents * 2)); $counter <= $lastpage; $counter++)
				{
					if ($counter == $page)
						$pagination.= "<span class=\"current\">$counter</span>";
					else
						$pagination.= "<a href=\"$targetpage&page=$counter\">$counter</a>";					
				}
			}
		}
		
		//next button
		if ($page < $counter - 1) 
			$pagination.= "<a href=\"$targetpage&page=$next\"><<</a>";
		else
			$pagination.= "<span class=\"disabled\"><<</span>";
		$pagination.= "</div>\n";		
	}
###############
$i=0;
while($row = @mysqli_fetch_array($result))
		{
			#################
			$issingle=$i/2;
			 $dot = strstr($issingle, '.');
			if($dot==""){
				$class="background_color_FFF";
				}else{$class='background_color_D5EFF0';}
?>


  <tr class="<?php echo"".$class.""; ?>">
  <td><input type="checkbox" name="cb[]" value="<?php echo"".$row['id'].""; ?>"></td>
  <td><?php echo"".$row['id'].""; ?></td>
   <td><?php if($demo==1){echo"*****";}else{ echo"".$row['name']."";} ?></td>
<td><?php if($demo==1){echo"*****";}else{echo"".$row['username']."";} ?></td>
 <td><?php if($demo==1){echo"*****";}else{ echo"".$row['password']."";} ?></td>
 <td>
 
<a href="?del=<?php echo"".$row['id'].""; ?>"   onclick="return confirm('<?php echo"$sure_delete_lang"; ?>');"><img src="images/erase.png"/></a>
<a href="?Edit=<?php echo"".$row['id'].""; ?>"><img src="images/edit.png"/></a></td>
  </tr>
     
 <?php $i++; } ?>   
    <thead style="background-color:#CCC;">
  <th colspan="5"><?php echo"$pagination"; ?></th>
  <th class="text-center">

  <a href="#" onClick="confirmSubmit();"><img src="images/erase.png"/></a></th>
  </thead>
  </table>   
  <input type="hidden" name="delete" value="delete" />  
  </form>
                            
                                <?php }} ?> 
</article>
							</div>

                            <div id="toolbar">
							<footer>
							
                            <?php include"includes/scroller_container.php"; ?>
							</footer>
        </div>
							</body>

							</html>
                                                        <?php include 'includes/footer.php'; ?>
