<?php
include "includes/inc.php";
########################
  if(isset($_GET['cat_show'])){
mysqli_query($con, "UPDATE ".$prefix."_config SET cat_items_show=".$_GET['cat_show']." where id=".$get_db_id."");
header("refresh:0;url=receivings.php");
	  }
##########################
##########################
if(isset($_GET['unsuspend'])){
if(mysqli_query($con, "INSERT INTO ".$prefix."_receivings_temporary(item, Price, Quantity, unit, Discount, Total, SupplierID, BuyPrice, date, type, subqty, size, color, user_id)
SELECT item,Price,Quantity,unit,Discount,Total,SupplierID,BuyPrice,date,type,subqty,size,color,user_id from ".$prefix."_receivings_suspended")){
	if(mysqli_query($con,"DELETE FROM ".$prefix."_receivings_suspended")){

$report_suspend='0';

	}
     
}
}

if(isset($_GET['unpurshes_order'])){
	$result_sizes = @mysqli_query($con, "SELECT * FROM ".$prefix."_receivings_temporary");
	$num_sizes = @mysqli_num_rows($result_sizes);

	if(mysqli_query($con, "INSERT INTO ".$prefix."_receivings_temporary(item, Price, Quantity, unit, Discount, Total, SupplierID, BuyPrice, date, type, subqty, size, color, user_id)
	SELECT item,Price,Quantity,unit,Discount,Total,SupplierID,BuyPrice,date,type,subqty,size,color,user_id from ".$prefix."_receivings_orders_line where inv = ".$_GET['order_id'])){
		header("Location: ?");
	}

}

if(isset($_GET['delete_order'])){
	$result_sizes = @mysqli_query($con, "DELETE  FROM ".$prefix."_receivings_orders WHERE id = " . $_GET['order_id']);
	$num_sizes = @mysqli_num_rows($result_sizes);
	if(mysqli_query($con, "DELETE FROM ".$prefix."_receivings_orders_line where inv = ".$_GET['order_id'])){
		header("Location: ?");
	}

}


####################################
mysqli_query($con, "UPDATE ".$prefix."_receivings_temporary SET type='1' where user_id='$user_id' and type='2'");
mysqli_query($con, "UPDATE ".$prefix."_receivings_temporary SET Quantity=Quantity*-1 where user_id='$user_id' and Quantity<=0");
mysqli_query($con, "UPDATE ".$prefix."_receivings_temporary SET Total=Total*-1 where user_id='$user_id' and Total<=0");
###############
##################
if(isset($_POST['date'])){
$_POST['date']=str_replace("/", "-", $_POST['date']);
$DueDate=Trim(date('Y-m-d',strtotime($_POST['date'])));
								##################
																if(mysqli_query($con, "UPDATE ".$prefix."_receivings_temporary SET  date='$DueDate'")){
									}
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
<script>
function popupCenter(pageURL, title, w, h) {
    var left = (screen.width / 2)  - (w / 2);
    var top  = (screen.height / 2) - (h / 2);
    var targetWin = window.open(pageURL, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
}
</script>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script>
			function showResults(str) {
				if(str.length == 0) {
					document.getElementById("livesearchcl").innerHTML = "";
					document.getElementById("livesearchcl").style.border = "0px";
					return;
				}
				if(window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
					xmlhttp = new XMLHttpRequest();
				} else {// code for IE6, IE5
					xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				xmlhttp.onreadystatechange = function() {
					if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
						document.getElementById("livesearchcl").innerHTML = xmlhttp.responseText;
						document.getElementById("livesearchcl").style.border = "0px solid #A5ACB2";
					}
				}
				xmlhttp.open("GET", "suppliers_search.php?q=" + str, true);
				xmlhttp.send();
			}
		</script>
		<script>
			function showResultsOfItems(str) {
				if(str.length == 0) {
					document.getElementById("livesearch").innerHTML = "";
					document.getElementById("livesearch").style.border = "0px";
					return;
				}
				if(window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
					xmlhttp = new XMLHttpRequest();
				} else {// code for IE6, IE5
					xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				xmlhttp.onreadystatechange = function() {
					if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
						document.getElementById("livesearch").innerHTML = xmlhttp.responseText;
						document.getElementById("livesearch").style.border = "0px solid #A5ACB2";
					}
				}
				xmlhttp.open("GET", "items_search.php?q=" + str, true);
				xmlhttp.send();
			}
		</script>
		<title><?php echo"".$get_db_CompanyName.""; ?></title>
                <?php include"includes/css.php"; ?>
                 <?php include"includes/js.php"; ?>
	</head>
        <body  class="cmenu1 example-target">
	
			<div>
				<div>
                  <?php
  if(isset($_GET['receivings_cat'])){
mysqli_query($con, "UPDATE ".$prefix."_config SET receivings_cat_items_show=".$_GET['receivings_cat']." where id=".$get_db_id."");
header("refresh:0;url=receivings.php");
	  }
  ?>
					<?php
					if ($get_db_isLogo == 1) {
						if ($get_db_Logo == "") {
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
?>
			</div>
	
		<div id='main'>
			<article style="margin-bottom:70px;">
                        <?php
			if($user_buy!=="1" and $user_IsAdmin!=1){
				echo"<div style='margin-top:200px;text-align:center;font-family:Tahoma, Geneva, sans-serif;color:#666; font-weight:bold; font-size:14px;'>'.$not_have_permission_lang.'</div>";
				}else{ ?>
				<div>
					<div style="width:60%;border:1px solid #CCC; border-radius:5px; float:right; ">
						<div>
							<img src="images/Client.png" style="width:5%; border:0px; float:right; vertical-align:middle;" />
							<input type="text" name="code" value="" id="searchcl" onkeyup="showResults(this.value)"  autocomplete="off" style="float:right; text-align:center; padding-left:0px; margin-left:0px;  height:25px; width:40%; background-color:#CCC;"/>
							<div id="livesearchcl" style="z-index:1000000000; width:45%;  text-align:right; margin-top:30px;  float:right; position:fixed; border:0px; "></div>
							<div style="width:100%; padding-top:10px; text-align:center; margin:0 auto;border:0px solid #CCC; border-radius:5px;"">
<?php
if(isset($_GET['suspend'])){
	if(mysqli_query($con, "INSERT INTO ".$prefix."_receivings_suspended(item, Price, Quantity, unit, Discount, Total, SupplierID, BuyPrice, date, type, subqty, size, color, user_id)
	SELECT item,Price,Quantity,unit,Discount,Total,SupplierID,BuyPrice,date,type,subqty,size,color,user_id from ".$prefix."_receivings_temporary")){
		if(mysqli_query($con,"DELETE FROM ".$prefix."_receivings_temporary where user_id='$user_id'")){

	$report_suspend='1';

		}	
	}
}
?>

<?php
if(isset($_GET['purshes_order'])){
	$sql = "INSERT INTO ".$prefix."_receivings_orders (name) VALUES ('".$_GET['order_name']."')";
	mysqli_query($con,$sql);
	$inv_id = mysqli_insert_id($con);

	if(mysqli_query($con, "INSERT INTO ".$prefix."_receivings_orders_line( inv,item, Price, Quantity, unit, Discount, Total, SupplierID, BuyPrice, date, type, subqty, size, color, user_id)
	SELECT ".$inv_id." as inv,item,Price,Quantity,unit,Discount,Total,SupplierID,BuyPrice,date,type,subqty,size,color,user_id from ".$prefix."_receivings_temporary")){

		if(mysqli_query($con,"DELETE FROM ".$prefix."_receivings_temporary where user_id='$user_id'")){

	$report_suspend='1';

		}	
	}
}
?>
<form action="" method="get" id="purshes_order">
	<input type="hidden" name="purshes_order">
<a onclick="javascript:void getElementById('purshes_order').submit(); ;return false;"><img src="images/add.png" style="width:30px; height:30px; border:0px; float:left;"  title="'.$unsuspend_lang.'" /></a>
<input type="text" name="order_name" value="" style="text-align:center; background-color:#CCC; width:50px; height:20px;">

</form>

<?php
$result_receivings_suspended = mysqli_query($con, "SELECT id FROM ".$prefix."_receivings_suspended where user_id='$user_id'");
if (@mysqli_num_rows($result_receivings_suspended)>=1) {
echo'<a href="receivings.php?unsuspend"><img src="images/unsuspend.png" style="width:30px; height:30px; border:0px; float:left;"  title="'.$unsuspend_lang.'" /></a>';
}else{
echo'<a href="receivings.php?suspend"><img src="images/suspend.png" style="width:30px; height:30px; border:0px; float:left;"  title="'.$suspense_lang.'" /></a>';
}
?>
<a href="receivings.php?q=d"><img src="images/c.png" style="width:30px; height:30px; float:left; border:0px;"  title="<?php echo"$Cancel_lang"; ?>"/></a>
                            <a href="receivings_returns.php"><img src="images/return.png" style="width:30px; height:30px; float:left; border:0px;" title="<?php echo"$Returns_lang"; ?>" /></a>
                                                        <?php
							if($_GET['print_inv']!==null){
																##############
									$result_Get_supplier = mysqli_query($con, "SELECT  supplier  FROM ".$prefix."_receivings_inv where  inv_id=".$_GET['print_inv']."");
							while ($row_Get_supplier = mysqli_fetch_array($result_Get_supplier)) {
								$GsupplierID=$row_Get_supplier['supplier'];
							}
								##############
								 ?>
<a href="#" onclick="javascript:void window.open('invoice.php?id=<?php echo"".$_GET['print_inv'].""; ?>&type=receivings','1390937502641','width=700,height=600,toolbar=0,menubar=0,location=0,status=0,scrollbars=1,resizable=0,left=0,top=0,menubar=0');return false;"><img src="images/print_icon.gif" style="width:30px; height:30px; float:left; border:0px;" title="<?php echo"$Print_previous_bill_lang"; ?>" /></a>
<?php if($GsupplierID==null){}else{ ?>
<a href="#" onclick="javascript:void window.open('statement_of_account_suppliers.php?id=<?php echo"".$GsupplierID.""; ?>&from=<?php echo"".date("Y-m-01").""; ?>&to=<?php echo"".date("Y-m-d").""; ?>','1390937502641','width=1024,height=600,toolbar=0,menubar=0,location=0,status=0,scrollbars=1,resizable=0,left=0,top=0,menubar=0');return false;"><img src="images/arrears_list.gif" style="float:left; border:0px; margin-top:10px;" title="<?php echo"$supplier_statement_lang"; ?>" /></a>
<?php } ?>
 <?php } ?>
                            
							<?php echo"$Purchases_bill_lang"; ?></div>
							<div style="width:100%; padding-top:0px; text-align:center; margin:0 auto;border:0px dashed #CCC; border-radius:5px; height:290px; overflow:auto;">
                            <?php
							if($report_suspend=="1"){
								echo'<div style="text-align:center; background-color:#E18C80; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/chmarkicon.png" style="border:0px;" /></span>
							'.$suspended_bill_lang.'
							</div>';
							header("refresh:1;url=receivings.php");
								}
							if(is_numeric($_POST['submit'])==1 and $_POST['submit']!=null){
								
								#############
								$result_upt = mysqli_query($con, "SELECT * FROM ".$prefix."_receivings_temporary where user_id='$user_id' order by id DESC");
							while ($row_upt = mysqli_fetch_array($result_upt)) {
								//echo $row_up['id'];
								$itemt=round($_POST[item.$row_upt['id']]);
								$quantityt=round($_POST[quantity.$row_upt['id']]);
								$Pricet=$_POST[price.$row_upt['id']];
								$Discountt=round($_POST[discount.$row_upt['id']]);
								if ($Discount_type==1) {
									$DiscountValuet=$Discountt;
								} else if ($Discount_type==2) {
								
									$DiscountValuet=($quantityt * $Pricet) * ($Discountt/100);
								
								} else {
									$DiscountValuet=$Discountt;
								}
								$Totalt= ($quantityt*$Pricet)-$DiscountValuet;
								$inv_Totalt+=($quantityt*$Pricet)-$DiscountValuet;
							}
								#############
								$pay=$_POST['pay'];
$_POST['date']=str_replace("/", "-", $_POST['date']);
$DueDate=Trim(date('Y-m-d',strtotime($_POST['date'])));
$paid=trim($_POST['paid']);

							
								if($Discount_type==2){
									$alldiscount=trim($inv_Totalt*$_POST['alldiscount']/100);
									}else{
										$alldiscount=$_POST['alldiscount'];
									}
								$CheckNumber='';
								##########?????????????? ????????????????############
													if($_POST['SupplierID']=="" and $paid!=($inv_Totalt-$alldiscount))	{
						//print $paid;
														echo'<div style="text-align:center; background-color:#E18C80; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/close.png" style="border:0px;" /></span>
							'.$must_choose_Supplier.'
							</div>';
					}else{
								if($paid<0 or $paid==null or $paid==""){}else{
$sqlpayments_suppliers="INSERT INTO ".$prefix."_receivings_inv (supplier, Total, date, PaymentMethod, DueDate, notes, type, discount)
VALUES ('".$_POST['SupplierID']."','".($paid*-1)."','".$DueDate."','".$pay."','','".$notes."','3','" . $_POST['alldiscount'] . "')";
if (!mysqli_query($con,$sqlpayments_suppliers))
  {
	  echo"$Error_lang";
  }else{
	  			$pp=1;
				if($alldiscount<=0){}else{
				//	echo"0000000000000";
$sqlpayments="INSERT INTO ".$prefix."_receivings_inv (supplier, Total, date, PaymentMethod, DueDate, notes, type, discount)
VALUES ('".$_POST['SupplierID']."','".(($alldiscount)*-1)."','".$DueDate."','".$pay."','','".$Cash_discount_lang."','3','" . $_POST['alldiscount'] . "')";
if (!mysqli_query($con,$sqlpayments))
  {
	  echo"$Error_lang";
  }else{
	  			$pp=1;
	  }
												}
	  }
							
								}
								############################
mysqli_query($con, "UPDATE ".$prefix."_config SET  LastreceivingsInvoiceNo= LastreceivingsInvoiceNo + 1 where id=".$get_db_id."");
$result_LastInvoiceNo = mysqli_query($con,"SELECT LastreceivingsInvoiceNo FROM ".$prefix."_config where id='1'");
while($row_LastInvoiceNo = mysqli_fetch_array($result_LastInvoiceNo))
  {
$get_LastInvoiceNo=$row_LastInvoiceNo['LastreceivingsInvoiceNo'];
  }
######################
if($pp==1){
$sqlt="INSERT INTO ".$prefix."_treasury (type, Amount, date, notes)
VALUES ('3','".($paid*-1)."','".$DueDate."','.$Bill_No_lang.".$get_LastInvoiceNo."')";

	if (!mysqli_query($con,$sqlt))
  {
	 // die($paid);
  }
}
######################
								$result_up = mysqli_query($con, "SELECT * FROM ".$prefix."_receivings_temporary where user_id='$user_id' order by id DESC");
							while ($row_up = mysqli_fetch_array($result_up)) {
								//echo $row_up['id'];
								$item=round($_POST[item.$row_up['id']]);
								$quantity =round($_POST[quantity.$row_up['id']]);
								$unit=round($_POST[unit.$row_up['id']]);
								if($Retail_allow==1){}else{$unit="1";}
								$Price=$_POST[price.$row_up['id']];
                                                                $size=$_POST[size.$row_up['id']];
                                                                $color=$_POST[color.$row_up['id']];
								$Discount=round($_POST[discount.$row_up['id']]);
								if ($Discount_type==1) {
									$DiscountValue=$Discount;
								} else if ($Discount_type==2) {
									if($Discount==0){$DiscountValue=$Discount;}else{
									$DiscountValue=($quantity * $Price) * ($Discount/100);
									}
								} else {
									$DiscountValue=$Discount;
								}
								$Total= ($quantity*$Price)-$DiscountValue;
								$inv_Total+=($quantity*$Price)-$DiscountValue;
if(mysqli_query($con, "UPDATE ".$prefix."_receivings_temporary SET   inv_id='".$get_LastInvoiceNo."',Quantity='".$quantity."',Price=(select price from items where id='".$item."'),Discount='".$Discount."',Total='".$Total."',type='1',BuyPrice='".$Price."',color='".$color."',size='".$size."',user_id='".$user_id."' where  id='".$row_up['id']."'")){
#############?????????????? ?????? ??????????????###########
//if(mysqli_query($con, "UPDATE items SET Quantity=Quantity+$quantity where  id='".$row_up['item']."'")){}
###########################################	
        }else{
           // die("111111111111111111111111");
        }
								//echo"<br />";
							}
								######################
								
if(mysqli_query($con, "INSERT INTO ".$prefix."_receivings_inv(inv_id, date, Total, supplier, PaymentMethod, DueDate, CheckNumber, notes, type, paid, discount)
VALUES ('".$get_LastInvoiceNo."','".$DueDate."','".$inv_Total."','".$_POST['SupplierID']."','".$pay."','','".$CheckNumber."','".$notes."','1','".$paid."','" . $_POST['alldiscount'] . "')")){
$Report_Create_Invoice=1;
	##############
if(mysqli_query($con, "INSERT INTO ".$prefix."_receivings(inv_id, item, Price, Quantity, unit, Discount, Total, SupplierID, BuyPrice, date, type, subqty, size, color, user_id)
SELECT inv_id,item,Price, IF(unit = '2', (Quantity/subqty),Quantity) ,unit,Discount,Total,SupplierID,BuyPrice,date,type,subqty,size,color,user_id from ".$prefix."_receivings_temporary")){
$Report_Record_purchases=1;
}else{$Report_Record_purchases=0;}
	###############
	}else{$Report_Create_Invoice=0;}
################
	################################
if(mysqli_query($con,"DELETE FROM ".$prefix."_receivings_temporary where user_id='$user_id'")){
	header("refresh:0;url=receivings.php?print_inv=".$get_LastInvoiceNo."");
	}
								//echo $inv_Total;
								######################
					}
								}	
															
							if($_GET['del']!==null){
if(mysqli_query($con,"DELETE FROM ".$prefix."_receivings_temporary where user_id='$user_id' and id=".$_GET['del']."")){
													echo '<div style="text-align:center; background-color:#E18C80; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/chmarkicon.png" style="border:0px;" /></span>
							'.$Item_deleted_lang.'
							</div>';
							header("refresh:0;url=receivings.php");
	}
}
							if(isset($_POST['submit'])){
                                                     //       die("333333333333333333");
							$result_up = mysqli_query($con, "SELECT * FROM ".$prefix."_receivings_temporary where user_id='$user_id' order by id DESC");
							while ($row_up = mysqli_fetch_array($result_up)) {
								//echo $row_up['id'];
								$quantity=round($_POST[quantity.$row_up['id']]);
								$Price=$_POST[price.$row_up['id']];
								$Discount=round($_POST[discount.$row_up['id']]);
								$item=round($_POST[item.$row_up['id']]);
								$unit=round($_POST[unit.$row_up['id']]);
								$BuyPrice=$_POST[BuyPrice.$row_up['id']];
                                                                $size=$_POST[size.$row_up['id']];
                                                                $color=$_POST[color.$row_up['id']];
								if ($Discount_type==1) {
									$DiscountValue=$Discount;
								} else if ($Discount_type==2) {
									if($Discount==0){$DiscountValue=$Discount;}else{
									$DiscountValue=($quantity * $Price) * ($Discount/100);
									}
								} else {
									$DiscountValue=$Discount;
								}
								$Total= ($quantity*$Price)-$DiscountValue;
                                                   
								if($quantity>0){
        mysqli_query($con, "UPDATE ".$prefix."_receivings_temporary SET  Quantity='".$quantity."',unit='".$unit."',Price='".$BuyPrice."',Discount='".$Discount."',Total='".$Total."',type='1',BuyPrice='".$Price."',color='".$color."',size='".$size."',user_id='$user_id' where  id='".$row_up['id']."'");
								}else{
									$error_reports=1;
									}
							}
							}
							###########################################
							if($error_reports=="1"){
								echo '<div style="text-align:center; background-color:#E18C80; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/close.png" style="border:0px;" /></span>
							'.$quantity_not_zero_lang.'
							</div>';
								}
                            ?>
							<?php
							if(isset($_GET['SupplierID']) and $_GET['SupplierID']!==null){
							$SupplierID=$_GET['SupplierID'];
 if(mysqli_query($con,"UPDATE ".$prefix."_receivings_temporary SET SupplierID=".$SupplierID." where user_id='$user_id'")){
	 header("refresh:0;url=receivings.php");
		  }else{
			  echo"$Please_try_again_lang";
			  }
							}
							if(isset($_GET['barcode']) and $_GET['barcode']!==null and $_GET['barcode']!=="????????????????" ){
                                                                            $get_barcode= explode("-", $_GET['barcode']);
                                        $get_barcode_code=$get_barcode[0];
                                        $get_barcode_size=$get_barcode[1];
                                        $get_barcode_color=$get_barcode[2];
$result_barcode = mysqli_query($con, "SELECT id FROM items where Barcode='".$get_barcode_code."'");
if (@mysqli_num_rows($result_barcode)>=1) {
while ($row_barcode = mysqli_fetch_array($result_barcode)) {
	$db_item_id=$row_barcode['id'];											
}
}
//$db_item_id;
###################
######################
####################
								if ($_GET['barcode']==null) {
									//	header( "refresh:0;url=receivings.php" );
								} else {
										$result_new = mysqli_query($con, "SELECT * FROM items where id='".$db_item_id."'");
										if (@mysqli_num_rows($result_new)>=1) {

											while ($row_new = mysqli_fetch_array($result_new)) {
												$item_name_new = $row_new['item'];
												$item_subqty_new=$row_new['subqty'];
												$item_id_new = $row_new['id'];
												$item_Retail_price_new = $row_new['Retail_price'];
												$item_Discount_new = $row_new['Discount'];
												$item_price_new = $row_new['price'];
												if ($Discount_type == 1) {
													$item_total_new = $row_new['price'] - $row_new['Discount'];
												} else if ($Discount_type == 2) {
													$item_total_new = $row_new['price'] - (($row_new['price']) * ($row_new['Discount'] / 100));
												} else {$item_total_new = $row_new['price'];
												}
												$sql = "INSERT INTO ".$prefix."_receivings_temporary (item, Price, Quantity, Discount, Total, BuyPrice, date, type, subqty, size, color, user_id)
							VALUES ('".$item_id_new."','".$item_Retail_price_new."','1','".$row_new['Discount']."','".$item_total_new."','".$item_price_new."','".$DueDate."','1','".$item_subqty_new."','" . $get_barcode_size . "','" . $get_barcode_color . "','".$user_id."')";

											}
											if (!mysqli_query($con, $sql)) {
												echo '<div style="text-align:center; background-color:#E18C80; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/chmarkicon.png" style="border:0px;" /></span>
							'.$not_saved_try_lang.'
							</div>';
												header("refresh:5;url=receivings.php");
											} else {
												echo '<div style="text-align:center; background-color:#95D183; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/chmarkicon.png" style="border:0px;" /></span>
							'.$Added_Item_lang.'
							</div>';
												header("refresh:1;url=receivings.php");
											}
										} else {
						
                                                                                             echo'<div class="alert alert-warning text-center">
						'.$item_not_found_lang.'
							 </div>';
										}

								
								}
					
#####################
#####################				
#####################
}

							if ($_GET['q']=="d") {
								if (mysqli_query($con, "DELETE FROM ".$prefix."_receivings_temporary where user_id='$user_id'")) {
									header("refresh:0;url=receivings.php");
								}
							} else {
								if ($_GET['q']==null) {
									//	header( "refresh:0;url=receivings.php" );
								} else {
										$result_new = mysqli_query($con, "SELECT * FROM items where id='".$_GET['q']."'");
										if (@mysqli_num_rows($result_new)>=1) {

											while ($row_new = mysqli_fetch_array($result_new)) {
												$item_name_new = $row_new['item'];
												$item_id_new = $row_new['id'];
												$item_subqty_new = $row_new['subqty'];
												$item_Retail_price_new = $row_new['Retail_price'];
												$item_Discount_new = $row_new['Discount'];
												$item_price_new = $row_new['price'];
												
												if ($Discount_type == 1) {
													$item_total_new = $row_new['price'] - $row_new['Discount'];
												} else if ($Discount_type == 2) {
													$item_total_new = $row_new['price'] - (($row_new['price']) * ($row_new['Discount'] / 100));
												} else {$item_total_new = $row_new['price'];
												}
$sql = "INSERT INTO ".$prefix."_receivings_temporary (item, Price, Quantity, unit, Discount, Total, type, date, BuyPrice, subqty, size ,color, user_id)
VALUES ('".$item_id_new."','".$item_Retail_price_new."','1','1','".$row_new['Discount']."','".$item_total_new."','1','".$DueDate."','".$item_price_new."','".$item_subqty_new."','" . $get_barcode_size . "','" . $get_barcode_color . "','".$user_id."')";

											}
											if (!mysqli_query($con, $sql)) {
												echo '<div style="text-align:center; background-color:#E18C80; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/chmarkicon.png" style="border:0px;" /></span>
							'.$not_saved_try_lang.'
							</div>';
												header("refresh:5;url=receivings.php");
											} else {
												echo '<div style="text-align:center; background-color:#95D183; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/chmarkicon.png" style="border:0px;" /></span>
							'.$Added_Item_lang.'
							</div>';
												header("refresh:1;url=receivings.php");
											}
										} else {
											echo '<div style="text-align:center; background-color:#E18C80; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/chmarkicon.png" style="border:0px;" /></span>
							'.$item_not_found_lang.'
							</div>';
										}

									
								}
							}
							?>
							<form method="post">
                            <?php 
		   $result_SupplierID = mysqli_query($con,"SELECT SupplierID FROM ".$prefix."_receivings_temporary where user_id='$user_id' limit 0,1");
if(@mysqli_num_rows($result_SupplierID)>0){
while($row_SupplierID= mysqli_fetch_array($result_SupplierID))
  {
		   $result_search_suppliers = mysqli_query($con,"SELECT id,name FROM ".$prefix."_suppliers WHERE id=".$row_SupplierID['SupplierID']."");
if(@mysqli_num_rows($result_search_suppliers)>0){
while($row_search_suppliers= mysqli_fetch_array($result_search_suppliers))
  {
		   echo"\r\n";
          echo'<div style="font-size:16px;"><span dir="rtl">'.$The_Supplier_lang.': <br /></span> 
			<span style="color:#7D060F;" dir="rtl">'.$row_search_suppliers['name'].'</span></div>';
			echo'<input type="hidden" name="SupplierID" value="'.$row_search_suppliers['id'].'" />';
  }
}}
}
				   ?> 
							<table  border="1" style="font-size:16px; width:100%;  direction:rtl; border:1px; border-collapse:collapse; margin-top:10px; text-align:center;">

							<thead style="background-color:#0076EA; color:#fff;">
                                                     <th width="5%" class="text-center"><?php echo"$Serial_lang"; ?></th>
                                            <th width="35%" class="text-center"><?php echo"$the_Item_lang"; ?></th>
							<th class="text-center"><?php echo"$the_Quantity_lang"; ?></th>
                            <?php
							if($Retail_Buying=="1"){
								echo'<th class="text-center">'.$measruing_unit.'</th>';
								}
							?>
                                                       <?php if($use_sizes==1){echo'<th class="text-center">'.$the_Size_lang.'</th>';} ?>
                                                       <?php if($use_colors==1){echo'<th class="text-center">'.$the_Color_lang.'</th>';} ?>
							<th class="text-center"><?php echo"$the_Price_lang"; ?></th>
							<th class="text-center"><?php echo"$the_Discount_lang"; ?></th>
							<th class="text-center"><?php echo"$the_total_lang"; ?></th>
							<th class="text-center"><?php echo"$Delete_lang"; ?></th>
							</thead>
							<tbody>
							<?php

							$tbl_name = "".$prefix."_receivings_temporary";
							//your table name
							// How many adjacent pages should be shown on each side?
							$adjacents = 3;

							/*
							 First get total number of rows in data table.
							 If you have a WHERE clause in your query, make sure you mirror it here.
							 */
							$query = "SELECT COUNT(*) as num  FROM  ".$prefix."_receivings_temporary where  user_id='$user_id' order by id DESC";
							$total_pages = @mysqli_fetch_array(mysqli_query($con, $query));
							$total_pages = $total_pages[num];

							/* Setup vars for query. */
							$targetpage = "limit=" . $_GET['limit'] . "";
							//your file name  (the name of this file)
							//how many items to show per page
							if (!empty($_GET['limit'])) {
								$_SESSION[limit] = $_GET['limit'];
							} else {
							}
							if (!empty($_SESSION[limit])) {
								$limit = $_SESSION[limit];
								if ($limit > 100) {$limit = 20;
								}
							} else {
								$limit = 100;
							}
							$page = $_GET['page'];
							if ($page)
								$start = ($page - 1) * $limit;
							//first item to display on this page
							else
								$start = 0;
							//if no page var is given, set start to 0

							/* Get data. */
							$sql = "SELECT * FROM ".$prefix."_receivings_temporary where  user_id='$user_id' order by id DESC";

							$result = @mysqli_query($con, $sql);
							/* Setup page vars for display. */
							if ($page == 0)
								$page = 1;
							//if no page var is given, default to 1.
							$prev = $page - 1;
							//previous page is page - 1
							$next = $page + 1;
							//next page is page + 1
							$lastpage = ceil($total_pages / $limit);
							//lastpage is = total pages / items per page, rounded up.
							$lpm1 = $lastpage - 1;
							//last page minus 1

							/*
							 Now we apply our rules and draw the pagination object.
							 We're actually saving the code to a variable in case we want to draw it more than once.
							 */
							$pagination = "";
							if ($lastpage > 1) {
								$pagination .= "<div class=\"pagination\">";
								//previous button
								if ($page > 1)
									$pagination .= "<a href=\"$targetpage&page=$prev\">>></a>";
								else
									$pagination .= "<span class=\"disabled\">>></span>";

								//pages
								if ($lastpage < 7 + ($adjacents * 2))//not enough pages to bother breaking it up
								{
									for ($counter = 1; $counter <= $lastpage; $counter++) {
										if ($counter == $page)
											$pagination .= "<span class=\"current\">$counter</span>";
										else
											$pagination .= "<a href=\"$targetpage&page=$counter\">$counter</a>";
									}
								} elseif ($lastpage > 5 + ($adjacents * 2))//enough pages to hide some
								{
									//close to beginning; only hide later pages
									if ($page < 1 + ($adjacents * 2)) {
										for ($counter = 1; $counter < 4 + ($adjacents * 2); $counter++) {
											if ($counter == $page)
												$pagination .= "<span class=\"current\">$counter</span>";
											else
												$pagination .= "<a href=\"$targetpage&page=$counter\">$counter</a>";
										}
										$pagination .= "...";
										$pagination .= "<a href=\"$targetpage&page=$lpm1\">$lpm1</a>";
										$pagination .= "<a href=\"$targetpage&page=$lastpage\">$lastpage</a>";
									}
									//in middle; hide some front and some back
									elseif ($lastpage - ($adjacents * 2) > $page && $page > ($adjacents * 2)) {
										$pagination .= "<a href=\"$targetpage&page=1\">1</a>";
										$pagination .= "<a href=\"$targetpage&page=2\">2</a>";
										$pagination .= "...";
										for ($counter = $page - $adjacents; $counter <= $page + $adjacents; $counter++) {
											if ($counter == $page)
												$pagination .= "<span class=\"current\">$counter</span>";
											else
												$pagination .= "<a href=\"$targetpage&page=$counter\">$counter</a>";
										}
										$pagination .= "...";

										$pagination .= "<a href=\"$targetpage&page=$lpm1\">$lpm1</a>";
										$pagination .= "<a href=\"$targetpage&page=$lastpage\">$lastpage</a>";
									}
									//close to end; only hide early pages
									else {
										$pagination .= "<a href=\"$targetpage&page=1\">1</a>";
										$pagination .= "<a href=\"$targetpage&page=2\">2</a>";
										$pagination .= "...";
										for ($counter = $lastpage - (2 + ($adjacents * 2)); $counter <= $lastpage; $counter++) {
											if ($counter == $page)
												$pagination .= "<span class=\"current\">$counter</span>";
											else
												$pagination .= "<a href=\"$targetpage&page=$counter\">$counter</a>";
										}
									}
								}

								//next button
								if ($page < $counter - 1)
									$pagination .= "<a href=\"$targetpage&page=$next\"><<</a>";
								else
									$pagination .= "<span class=\"disabled\"><<</span>";
								$pagination .= "</div>\n";
							}
							###############
							$i = 1;
							while ($row = @mysqli_fetch_array($result)) {
								###########
								$result_it = mysqli_query($con, "SELECT * FROM items where id=".$row['item']."");
								if (@mysqli_num_rows($result_it) > 0) {
									while ($row_it=mysqli_fetch_array($result_it)) {
										$item_name=$row_it['item'];
										$item_id=$row_it['id'];
										$item_price=$row_it['Retail_price'];
										$item_Discount = $row_it['Discount'];
										$item_BuyPrice= $row_it['price'];
											$item_subqty=$row_it['subqty'];
									}
								}
								if ($item_Discount == null) {
									$item_Discount = 0;
								}
/*								if ($row['Quantity'] < 1) {
									$row['Quantity'] = 1;
								}*/

								if ($item_Discount == null) {
									$item_Discount = 0;
								}
								$sumTotal+= $row['Total'];
								###########
								#############?????????? ?????? ????????????#####
								if($Update_SellBuyPrice==1){
mysqli_query($con, "UPDATE items SET Price='".$row['BuyPrice']."' where id='".$row['item']."'");
								}
###############################################################################
                                                                        if(is_float($i/2)){
                                                        $gr="gr";
                                                    }else{
                                                        $gr="gr2";
                                                    }
$unit_option1=null;
$unit_option2=null;
if($row['unit']=="1"){$unit_option1=' selected="selected"';}
if($row['unit']=="2"){$unit_option2=' selected="selected"';}
								echo'<input type="hidden" name="BuyPrice'.$row['id'].'" value="'.$item_BuyPrice.'" /> <tr class="'.$gr.'">
							<td>'.$i.'</td>
							<td><input type="hidden" name="item'.$row['id'].'" value="'.$item_id.'" />'.$item_name.'</td>
							<td><input  class="'.$gr.'" type="number" name="quantity'.$row['id'].'"  value="'.$row['Quantity'].'" style="width:10%; height:20px; text-align:center;border:0px;"/></td>';
					if($Retail_Buying=="1"){		
							echo'<td><select  class="'.$gr.'" name="unit'.$row['id'].'" style="height:25px; text-align:center;border:0px;"><option value="1" '.$unit_option1.'>'.$primary_unit_lang.'</option><option value="2" '.$unit_option2.'>'.$Sub_unit_lang.'</option></select></td>';
					}
                                         if($use_sizes==1){
                                        echo'<td><select  class="'.$gr.'" name="size'.$row['id'].'" style="height:25px;  width:10px; text-align:center;border:0px;">';
                                                                          $result_sizes = @mysqli_query($con, "SELECT * FROM sizes where id in (".rtrim(get_sizes_of_item($item_id), ",").") limit 15");
                                                                        $num_sizes = @mysqli_num_rows($result_sizes);
                                                                        if ($num_sizes > 0) {
                                                                            while ($row_sizes = mysqli_fetch_array($result_sizes)) {
                    if ($row['size'] == $row_sizes['id']) {
                        echo '<option value="' . $row_sizes['id'] . '" selected >' . $row_sizes['size'] . '</option >';
                    } else {
                        echo '<option value="' . $row_sizes['id'] . '">' . $row_sizes['size'] . '</option >';
                    }
                                                                            }
                                                                        }
                                                
                                              echo'</select></td>';
                                         }
                                          if($use_colors==1){
                                        echo'<td><select  class="'.$gr.'" name="color'.$row['id'].'" style="height:25px; text-align:center;border:0px;">';
                                  $result_colors = @mysqli_query($con, "SELECT * FROM colors where status!=3 and  id in (".rtrim(get_clolors_of_item($item_id), ",").")  ");
            $num_colors = @mysqli_num_rows($result_colors);
            if ($num_colors > 0) {
                while ($row_colors = mysqli_fetch_array($result_colors)) {
                    if ($row['color'] == $row_colors['id']) {
                        echo '<option value="' . $row_colors['id'] . '" selected >' . $row_colors['color'] . '</option >';
                    } else {
                        echo '<option value="' . $row_colors['id'] . '">' . $row_colors['color'] . '</option >';
                    }
                }
            }
                                               echo'</select></td>';
                                          }
                                        
							echo'<td><input  class="'.$gr.'" type="text"  name="price'.$row['id'].'"  value="'.$row['BuyPrice'].'"  style="width:10%; height:20px;text-align:center;border:0px;" /></td>
							<td><input  class="'.$gr.'" type="number"  name="discount'.$row['id'].'" id="discount'.$i.'" value="'.$row['Discount'].'"  style="width:10%; height:20px;text-align:center;border:0px;" /></td>
							<td><input  class="'.$gr.'" type="text"  name="subtotal'.$row['id'].'" id="subtotal'.$i.'" value="'.$row['Total'].'"  style="width:10%; height:20px;text-align:center;border:0px;" /></td>
							<td valign="middle"><a href="receivings.php?del='.$row['id'].'"><img src="images/erase.png" style="border:0px;" /></a></td>
							</tr>';
								$i++;
							}
							?>
                            </tbody>
                            <?php
							if($sumTotal==null){}else{
                            echo'<tr>
                            
                            <td colspan="5">'.$the_total_lang.'</td>';
                           if($use_sizes==1){echo'<td></td>'; }
                            if($use_colors==1){echo'<td></td>'; }
						
							
                            echo'<td><font style="color:#060; font-weight:bold;">'.($sumTotal-$alldiscount).'</font></td>';
                            echo'<td></td>';
                           echo' </tr>';
                         
							
							
							                                  echo'<tr>';
                            
     if($use_sizes==1){
       if ($use_colors == 1) {echo'<td colspan="7">'.$the_total_after_lang.'</td>'; }else{ echo'<td colspan="6">'.$the_total_after_lang.'</td>'; }
         
     }else{
        if ($use_colors == 1) {echo'<td colspan="6">'.$the_total_after_lang.'</td>'; }else{ echo'<td colspan="5">'.$the_total_after_lang.'</td>'; }
     }
	 
                            echo'<td><font style="color:#060; font-weight:bold;">'.($sumTotal - (($sumTotal*$_POST['alldiscount'])/100)).'</font></td>';
                           echo' <td></td>';
                           echo' </tr>';
				}
 
							 ?>
                            
							</table>
                            
							<input type="submit" name="submit" value="submit" hidden="hidden" />
							
							</div>
                            <table width="100%" dir="rtl">
                            <tr>
                            <td style="font-size:16px;"><?php echo"$payment_method_alng"; ?></td>
                            <td><select name="pay"   style="text-align:center;background-color:#CCC; float:right;">
							<option value="1" <?php
								if ($_POST['pay'] == "1") {echo ' selected="selected"';
								}
 ?>><?php echo"$cash_lang"; ?></option>
							<option value="2" <?php
								if ($_POST['pay'] == "2") {echo ' selected="selected"';
								}
 ?>><?php echo"$On_credit_lang"; ?></option>
							<option value="3" <?php
								if ($_POST['pay'] == "3") {echo ' selected="selected"';
								}
 ?>><?php echo"$check_lang"; ?></option>
							</select></td>
                            <td style="font-size:16px;"><?php echo"$amount_paid_lang"; ?></td>
                            <td style="font-size:16px;"><input type="text" name="paid" id="price" value="" onkeypress='validate(event)'  style="text-align:center; background-color:#CCC; width:50px; height:20px;"/></td>
                            <td style="font-size:16px;"><?php echo"$the_date_lang"; ?></td>
                            <td><input type="text" name="date" id="date" value="<?php if($_POST['date']==""){echo date("d/m/Y");}else{echo"".$_POST['date']."";} ?>"  style="text-align:center; background-color:#CCC; width:80px; height:20px;"/>
                            <script type="text/javascript">
				$('#date').dateEntry({dateFormat: 'dmy/', spinnerImage:''});
			</script>
                            </td>
                            </tr>
                            <tr>
                            <td style="font-size:16px;"><?php echo"$Discount_lang"; ?></td>
                             <td colspan="6"><input type="text" name="alldiscount" value="<?php echo"".$_POST['alldiscount'].""; ?>"  style="text-align:center; background-color:#CCC; width:50px; height:20px;"/></td>
                            </tr>
                            <tr>
                              <td colspan="6" align="center"><span style=" text-align:center; margin-right:50px;">
                                <input type="submit" name="submit" value="<?php echo ($sumTotal - (($sumTotal*$_POST['alldiscount'])/100));?>"  style="width:120px; height:40px;"/>
                              </span></td>
                              </tr>

                            </table>
							<div style="text-align:right; float:right;">
							<div style="float:right; width:200px; margin-right:150px; vertical-align:middle;">
							
							

							
							</div>
							<div style="float:right; text-align:center; margin-right:50px;">
						</div>
							</div>
							</div>
                            <input type="hidden" name="inv" value="receivings" />
</form>
							</div>
							<div style="width:100%;border:1px solid #CCC; border-radius:5px;">
							<div style="height:500px; overflow:auto;">
							<script>
								window.onload = function() {
									document.getElementById("barcode").focus();
								};

							</script>
							<form method="get" style="padding-bottom:20px;">
							<div class="text-center">
                            <?php
							if($run_barcode==0){}else{ ?>
                            <input type="text" value="<?php
								if ($_GET['barcode']==null) {
								} else {echo "".$_GET['barcode']."";
								}
 ?>"  name="barcode" id="barcode"   style="background-color:#CCC;"
							onblur="this.value=!this.value?'<?php echo"$barcode_lang"; ?>':this.value;" onfocus="this.select()"/>
                            <?php } ?>
                            <a href="#" onclick="javascript:void window.open('additems.php','1390937502641','width=400,height=400,toolbar=0,menubar=0,location=0,status=0,scrollbars=1,resizable=0,left=0,top=0,menubar=0');return false;">
                                <i class="fa fa-plus-square"  title="<?php echo"$Add_New_Item_lang"; ?>"></i>
                            </a>
                            <span style="padding-right:20px;"></span><input type="text" value="<?php echo"$item_Name_lang"; ?>"  style="background-color:#CCC; z-index:100000000000;"  onkeyup="showResultsOfItems(this.value)" autocomplete="off"    onclick="this.value='';" onfocus="this.select()"  onblur="this.value=!this.value?'<?php echo"$item_Name_lang"; ?>':this.value;"/>
							<div id="livesearch" style="z-index:1000000000; width:45%;  text-align:right; margin-top:0px;  float:right; position:fixed; border:0px; "></div>
							<input type="submit" hidden="hidden"/>
                            <?php
                            if($db_cat_items_show==0 or $db_cat_items_show==null or $db_cat_items_show==""){}else{
echo'<a href="?cat_show=0"><i class="fa fa-list" title="'.$All_groups_lang.'"></i>
</a>';
							}
?>
							</form></div>
                            <?php
							if($showGroups==0){}else{ ?>
                                <?php if($db_cat_items_show>0){}else{ ?>                          
                            <div style="width:100%; margin:0 auto; text-align:center; float:right; text-align:center;">

                            <?php
							$result_cat=mysqli_query($con, "SELECT * FROM products where rank!='0'  and rank!='' and id>0  order by rank ASC");
									if (@mysqli_num_rows($result_cat)>=1) {
										while ($row_cat = mysqli_fetch_array($result_cat)) {
											if($row_cat['id']==$db_cat_items_show){
												$class="draggable-demo-product3";
											}else{
												$class="draggable-demo-product2";
												}
												if($row_cat['useimage']==1){
											echo "<div class=\"".$class." jqx-rc-all\" style='background-color:".$row_cat['background'].";'>
							<div class=\"jqx-rc-t draggable-demo-product-header jqx-widget-header-theme1 jqx-fill-state-normal-theme\" >
<a href=\"?cat_show=" . $row_cat['id'] . "\" class='a_cat_underlines'><img src=\"uploads/" . $row_cat['image'] . "\" class=\"img-responsive\" width=\"115\" height=\"30\" /></a></div>

							</div>";
													}else{
							echo "<div class=\"".$class." jqx-rc-all\" style='background-color:".$row_cat['background'].";'>
							<div class=\"jqx-rc-t draggable-demo-product-header jqx-widget-header-theme1 jqx-fill-state-normal-theme\" >
							<div class=\"draggable-demo-product-header-label\"> <a href=\"?cat_show=" . $row_cat['id'] . "\">" . $row_cat['product_name'] . "</a></div></div>

							</div>";
												}
										}
									}
							?>
                            </div>
                            <?php } ?>
                            <?php } ?>
							<?php
							###########################################
							$tbl_name = "items";
							//your table name
							// How many adjacent pages should be shown on each side?
							$adjacents = 3;

							/*
							 First get total number of rows in data table.
							 If you have a WHERE clause in your query, make sure you mirror it here.
							 */
						//	 if($db_cat_items_show==0 or $db_cat_items_show==null or $db_cat_items_show==""){
						//		 $query = "SELECT COUNT(*) as num  FROM  items where OrderNo!='0' and OrderNo!='' order by OrderNo ASC";
						//	 }else{
							$query = "SELECT COUNT(*) as num  FROM  items where OrderNo!='0'  and OrderNo!='' and groupid=".$db_cat_items_show." order by OrderNo ASC";
						//	 }
							$total_pages = @mysqli_fetch_array(mysqli_query($con, $query));
							$total_pages = $total_pages[num];

							/* Setup vars for query. */
							$targetpage = "limit=" . $_GET['limit'] . "";
							//your file name  (the name of this file)
							//how many items to show per page
							if (!empty($_GET['limit'])) {
								$_SESSION[limit] = $_GET['limit'];
							} else {
							}
							if (!empty($_SESSION[limit])) {
								$limit = $_SESSION[limit];
								if ($limit > 100) {$limit = 20;
								}
							} else {
								$limit = 100;
							}
							$page = $_GET['page'];
							if ($page)
								$start = ($page - 1) * $limit;
							//first item to display on this page
							else
								$start = 0;
							//if no page var is given, set start to 0

							/* Get data. */
		// if($db_cat_items_show==0 or $db_cat_items_show==null or $db_cat_items_show==""){
							//	 $sql = "SELECT * FROM items where OrderNo!='0'  and OrderNo!='' order by OrderNo ASC";
							// }else{
							$sql = "SELECT * FROM items where OrderNo!='0'  and OrderNo!='' and groupid=".$db_cat_items_show."  order by OrderNo ASC";
							// }
$result = @mysqli_query($con, $sql);
							/* Setup page vars for display. */
							if ($page == 0)
								$page = 1;
							//if no page var is given, default to 1.
							$prev = $page - 1;
							//previous page is page - 1
							$next = $page + 1;
							//next page is page + 1
							$lastpage = ceil($total_pages / $limit);
							//lastpage is = total pages / items per page, rounded up.
							$lpm1 = $lastpage - 1;
							//last page minus 1

							/*
							 Now we apply our rules and draw the pagination object.
							 We're actually saving the code to a variable in case we want to draw it more than once.
							 */
							$pagination = "";
							if ($lastpage > 1) {
								$pagination .= "<div class=\"pagination\">";
								//previous button
								if ($page > 1)
									$pagination .= "<a href=\"$targetpage&page=$prev\">>></a>";
								else
									$pagination .= "<span class=\"disabled\">>></span>";

								//pages
								if ($lastpage < 7 + ($adjacents * 2))//not enough pages to bother breaking it up
								{
									for ($counter = 1; $counter <= $lastpage; $counter++) {
										if ($counter == $page)
											$pagination .= "<span class=\"current\">$counter</span>";
										else
									
											$pagination .= "<a href=\"$targetpage&page=$counter\">$counter</a>";
									}
								} elseif ($lastpage > 5 + ($adjacents * 2))//enough pages to hide some
								{
									//close to beginning; only hide later pages
									if ($page < 1 + ($adjacents * 2)) {
										for ($counter = 1; $counter < 4 + ($adjacents * 2); $counter++) {
											if ($counter == $page)
												$pagination .= "<span class=\"current\">$counter</span>";
											else
												$pagination .= "<a href=\"$targetpage&page=$counter\">$counter</a>";
										}
										$pagination .= "...";
										$pagination .= "<a href=\"$targetpage&page=$lpm1\">$lpm1</a>";
										$pagination .= "<a href=\"$targetpage&page=$lastpage\">$lastpage</a>";
									}
									//in middle; hide some front and some back
									elseif ($lastpage - ($adjacents * 2) > $page && $page > ($adjacents * 2)) {
										$pagination .= "<a href=\"$targetpage&page=1\">1</a>";
										$pagination .= "<a href=\"$targetpage&page=2\">2</a>";
										$pagination .= "...";
										for ($counter = $page - $adjacents; $counter <= $page + $adjacents; $counter++) {
											if ($counter == $page)
												$pagination .= "<span class=\"current\">$counter</span>";
											else
												$pagination .= "<a href=\"$targetpage&page=$counter\">$counter</a>";
										}
										$pagination .= "...";
										$pagination .= "<a href=\"$targetpage&page=$lpm1\">$lpm1</a>";
										$pagination .= "<a href=\"$targetpage&page=$lastpage\">$lastpage</a>";
									}
									//close to end; only hide early pages
									else {
										$pagination .= "<a href=\"$targetpage&page=1\">1</a>";
										$pagination .= "<a href=\"$targetpage&page=2\">2</a>";
										$pagination .= "...";
										for ($counter = $lastpage - (2 + ($adjacents * 2)); $counter <= $lastpage; $counter++) {
											if ($counter == $page)
												$pagination .= "<span class=\"current\">$counter</span>";
											else
												$pagination .= "<a href=\"$targetpage&page=$counter\">$counter</a>";
										}
									}
								}

								//next button
								if ($page < $counter - 1)
									$pagination .= "<a href=\"$targetpage&page=$next\"><<</a>";
								else
									$pagination .= "<span class=\"disabled\"><<</span>";
								$pagination .= "</div>\n";
							}
							###############
							while ($row = @mysqli_fetch_array($result)) {
                                                           
								if ($row['image']== null or $row['useimage'] == 0) {
									###################
									echo "<div class=\"draggable-demo-product jqx-rc-all\"  style='background-color:" . $row['Background'] . ";'>
							<div class=\"jqx-rc-t draggable-demo-product-header jqx-widget-header-theme1 jqx-fill-state-normal-theme\" >
							<div class=\"draggable-demo-product-header-label\" style='background-color:#fff;'> <a href=\"?q=" . $row['id'] . "\">" . $row['item'] . "</a></div></div>

							</div>";
									/*	echo"<div class=\"draggable-demo-product jqx-rc-all\"  style='background-color:".$row['Background']."; height:50px;'>
									 <div class=\"jqx-rc-t draggable-demo-product-header jqx-widget-header-theme1 jqx-fill-state-normal-theme\" >
									 <div class=\"draggable-demo-product-header-label\" style='background-color:#fff;'> <a href=\"?q=".$row['id']."\">".$row['item']."</a></div></div>

									 </div>"; */
									###################
								} else {
									echo "<div class=\"draggable-demo-product jqx-rc-all\">
							<div class=\"jqx-rc-t draggable-demo-product-header jqx-widget-header-theme1 jqx-fill-state-normal-theme\">
							<div class=\"draggable-demo-product-header-label\"><a href=\"?q=".$row['id']."\">".$row['item']."</a></div></div>

							<a href=\"?q=".$row['id']."\"><img src=\"uploads/".$row['image']."\" class=\"img-responsive\" width=\"115\" height=\"115\" /></a>
							</div>";
								}
                                                               
							}
							?>
                            <?php
							if($total_pages==0 and $db_cat_items_show!=0){

			                       echo'<br /><div class="alert alert-warning text-right">
       '.$no_items_group_lang.'
                            </div>';
								}
								?>
							</div>
							</div>
							</div>
                            <?php } ?>
                            <!-- Trigger the modal with a button -->
 <?php 
          if($use_colors=='0' and $use_sizes=='0'){}else{ 
                 if($user_IsAdmin!=1){}else{
echo'<a href="multi_items.php"><button  type="button" class="btn btn-info btn-sm">'.$Insert_a_multi_alng.'</button></a>';
 }
          }
 ?>
							<div style="width:40%;border:1px solid #CCC; border-radius:5px;text-align: right;direction: rtl;margin-top: 20px; float: right;font-size: 20px;">

		  						<table style="width: 100%;text-align: right !important;direction: rtl !important;" border="1" >
		  							<thead>
									  <tr>
										  <th>?????? ????????????????</th>
										  <th>????????????</th>
									  </tr>
									  </thead>
		  								<tbody>
										  <?php 
										$result_sizes = @mysqli_query($con, "SELECT * FROM ".$prefix."_receivings_orders");
										$num_sizes = @mysqli_num_rows($result_sizes);
										if ($num_sizes > 0) {
											while ($row_sizes = mysqli_fetch_array($result_sizes)) {

											echo "<tr> 
												<td>{$row_sizes['name']}</td>
												<td style='text-align: center;'>
												<a href='?unpurshes_order&order_id={$row_sizes['id']}' style='width:120px; height:40px;'>??????????</a>

												<a href='inv_barcode.php?order_id={$row_sizes['id']}' style='width:120px; height:40px;margin:0 10px 0 10px'> ?????? ??????</a>

												<a href='?delete_order&order_id={$row_sizes['id']}' style='width:120px; height:40px;'>??????</a>

												</td>
											</tr>";

											}
										}
										?>

										  </tbody>
								  </table>
							</div>
							</article>

							</div>

                             <div id="toolbar">
							<footer>
							 <?php include"includes/scroller_container.php"; ?>
							</footer>
                            </div>
            
<html>
                                                        <?php //include 'includes/footer.php'; ?>
