<?php
include "includes/inc.php";
##################
########################
  if(isset($_GET['cat_show'])){
mysqli_query($con, "UPDATE ".$prefix."_config SET cat_items_show=".$_GET['cat_show']." where id=".$get_db_id."");
header("refresh:0;url=receivings_returns.php");
	  }
##########################
if(isset($_GET['unsuspend'])){
								if(mysqli_query($con, "INSERT INTO ".$prefix."_receivings_temporary(item, Price, Quantity, Discount, Total, SupplierID, BuyPrice, date, type)
SELECT item,Price,Quantity,Discount,Total,SupplierID,BuyPrice,date,type from ".$prefix."_receivings_suspended")){
	if(mysqli_query($con,"DELETE FROM ".$prefix."_receivings_suspended")){

$report_suspend='0';

	}	
}
								}
#######################
mysqli_query($con, "UPDATE ".$prefix."_receivings_temporary SET type='2' where type='1'");
mysqli_query($con, "UPDATE ".$prefix."_receivings_temporary SET Quantity=Quantity*-1 where Quantity>=0");
mysqli_query($con, "UPDATE ".$prefix."_receivings_temporary SET Total=Total*-1 where Total>=0");
if(isset($_POST['date'])){
$_POST['date']=str_replace("/", "-", $_POST['date']);
$DueDate=Trim(date('Y-m-d',strtotime($_POST['date'])));
								##################
																if(mysqli_query($con, "UPDATE receivings_temporary SET  date='$DueDate'")){
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
<link rel="stylesheet" rev="stylesheet" href="css/forms.css" type="text/css" media="screen" />
<link type='text/css' rel='stylesheet' href='css/dgstyle.css' />
<link type='text/css' rel='stylesheet' href='css/style.css' />
<script type="text/javascript" src="js/jscroller2-1.61.js"></script>
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
<link rel="stylesheet" type="text/css" href="jquery.dateentry.package-2.0.0/jquery.dateentry.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="jquery.dateentry.package-2.0.0/jquery.dateentry.min.js" type="text/javascript"></script>
<script type="text/javascript" src="jquery.dateentry.package-2.0.0/jquery.plugin.js"></script>
<script type="text/javascript" src="jquery.dateentry.package-2.0.0/jquery.dateentry.js"></script>
<link type='text/css' rel='stylesheet' href='css/jquery.contextmenu.css' />
<script type="text/javascript" src="js/jquery.contextmenu.js"></script>
<title><?php echo"".$get_db_CompanyName.""; ?></title>
<script type="text/javascript" src="js/jquery.number.js"></script>
<script type="text/javascript">
			
			$(function(){
				// Set up the number formatting.
				
				$('#number_container').slideDown('fast');
				
				$('#price').on('change',function(){
					console.log('Change event.');
					var val = $('#price').val();
					$('#the_number').text( val !== '' ? val : '(empty)' );
				});
				
				$('#price').change(function(){
					console.log('Second change event...');
				});
				
				$('#price').number( true, 0,',','' );
				
				
				// Get the value of the number for the demo.
				$('#get_number').on('click',function(){
					
					var val = $('#price').val();
					
					$('#the_number').text( val !== '' ? val : '(empty)' );
				});
			});
		</script>
		</head>
		<body  class="cmenu1 example-target" onLoad="popupCenter('invoice.php?id=<?php echo"".$_GET['print_inv'].""; ?>&type=receivings_returns')">

          <div>
    <div>
              <?php
  if(isset($_GET['receivings_cat'])){
mysqli_query($con, "UPDATE config SET ".$prefix."_receivings_cat_items_show=".$_GET['receivings_cat']." where id=".$get_db_id."");
header("refresh:0;url=receivings_returns.php");
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
                <?php include"includes/css.php"; ?>
    <?php
include"includes/buttons.php";
?>
  </div>
   
<div id='main'>
          <article style="margin-bottom:70px;">
          <?php
			if($user_purchasesReturns!=="1" and $user_IsAdmin!=1){
				echo"<div style='margin-top:200px;text-align:center;font-family:Tahoma, Geneva, sans-serif;color:#666; font-weight:bold; font-size:14px;'>عفواً , ليست لديك الصلاحية لدخول هذه الصفحة</div>";
				}else{ ?>
          <div>
    <div style="width:55%;border:1px solid #CCC; border-radius:5px; float:right; ">
              <div>
              <img src="images/Client.png" style="width:5%; border:0px; float:right; vertical-align:middle;" />
              <input type="search" name="code" value="" id="searchcl" onkeyup="showResults(this.value)"  autocomplete="off" style="float:right; text-align:center; padding-left:0px; margin-left:0px;  height:25px; width:40%; background-color:#CCC;"/>
              <div id="livesearchcl" style="z-index:1000000000; width:45%;  text-align:right; margin-top:30px;  float:right; position:fixed; border:0px; "></div>
              <div style="width:100%; padding-top:10px; text-align:center; margin:0 auto;border:1px solid #CCC; border-radius:5px;"">
        <?php
if(isset($_GET['suspend'])){
								if(mysqli_query($con, "INSERT INTO ".$prefix."_receivings_suspended(item, Price, Quantity, Discount, Total, SupplierID, BuyPrice, date, type)
SELECT item,Price,Quantity,Discount,Total,SupplierID,BuyPrice,date,type from ".$prefix."_receivings_temporary")){
	if(mysqli_query($con,"DELETE FROM ".$prefix."_receivings_temporary")){

$report_suspend='1';

	}	
}
								}
?>
        <?php
$result_receivings_suspended = mysqli_query($con, "SELECT id FROM ".$prefix."_receivings_suspended");
if (@mysqli_num_rows($result_receivings_suspended)>=1) {
echo'<a href="receivings_returns.php?unsuspend"><img src="images/unsuspend.png" style="width:30px; height:30px; border:0px; float:left;" title="الغاء التعليق" /></a>';
}else{
echo'<a href="receivings_returns.php?suspend"><img src="images/suspend.png" style="width:30px; height:30px; border:0px; float:left;" title="تعليق"  /></a>';
}
?>
        <a href="receivings_returns.php?q=d"><img src="images/c.png" style="width:30px; height:30px; float:left; border:0px;"  title="مرتجعات" /></a> <a href="receivings.php"><img src="images/sales.png" style="width:30px; height:30px; float:left; border:0px;" title="مشتريات" /></a>
                                    <?php
							if($_GET['print_inv']!==null){ 
																							##############
							$result_Get_supplier = mysqli_query($con, "SELECT  supplier  FROM ".$prefix."_receivings_inv where  inv_id=".$_GET['print_inv']."");
							while ($row_Get_supplier = mysqli_fetch_array($result_Get_supplier)) {
								$GsupplierID=$row_Get_supplier['supplier'];
							}
								##############
							?>
<a href="#" onclick="javascript:void window.open('invoice.php?id=<?php echo"".$_GET['print_inv'].""; ?>&type=receivings_returns','1390937502641','width=700,height=600,toolbar=0,menubar=0,location=0,status=0,scrollbars=1,resizable=0,left=0,top=0,menubar=0');return false;"><img src="images/print_icon.gif" style="width:30px; height:30px; float:left; border:0px;" title="طباعة الفاتورة السابقة" /></a>
<?php if($GsupplierID==null){}else{ ?>
<a href="#" onclick="javascript:void window.open('statement_of_account_suppliers.php?id=<?php echo"".$GsupplierID.""; ?>&from=<?php echo"".date("Y-m-01").""; ?>&to=<?php echo"".date("Y-m-d").""; ?>','1390937502641','width=1024,height=600,toolbar=0,menubar=0,location=0,status=0,scrollbars=1,resizable=0,left=0,top=0,menubar=0');return false;"><img src="images/arrears_list.gif" style="float:left; border:0px; margin-top:10px;" title="كشف حساب العميل" /></a>
<?php } ?>
 <?php } ?>
         مرتجعات المشتريات</div>
              <div style="width:100%; padding-top:0px; text-align:center; margin:0 auto;border:2px dashed #CCC; border-radius:5px; height:290px; overflow:auto;">
              <?php
							if($report_suspend=="1"){
								echo'<div style="text-align:center; background-color:#E18C80; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/chmarkicon.png" style="border:0px;" /></span>
							تم تعليق الفاتورة
							</div>';
							header("refresh:1;url=receivings_returns.php");
								}
							if(is_numeric($_POST['submit'])==1 and $_POST['submit']!=null){
								$pay=$_POST['pay'];
$_POST['date']=str_replace("/", "-", $_POST['date']);
$DueDate=Trim(date('Y-m-d',strtotime($_POST['date'])));
$paid=trim($_POST['paid']);
								$notes=$_POST['notes'];
								$alldiscount=$_POST['alldiscount'];
								$CheckNumber='';
								##########مدفوعات الموردين############
								if($paid<0 or $paid==null or $paid==""){}else{
$sqlpayments_suppliers="INSERT INTO ".$prefix."_payments_suppliers (Supplier, Amount, Date, PaymentMethod, Due_Date, notes)
VALUES ('".$_POST['SupplierID']."','".($paid*-1)."','".$DueDate."','".$pay."','','".$notes."')";
if (!mysqli_query($con,$sqlpayments_suppliers))
  {
	  echo"Error";
  }else{
	  			$pp=1;
	  }
							
								}
								############################
								############################
mysqli_query($con, "UPDATE ".$prefix."_config SET  LastreceivingsInvoiceNo= LastreceivingsInvoiceNo + 1 where id=".$get_db_id."");
$result_LastInvoiceNo = mysqli_query($con,"SELECT LastreceivingsInvoiceNo FROM ".$prefix."_config where id='1'");
while($row_LastInvoiceNo = mysqli_fetch_array($result_LastInvoiceNo))
  {
$get_LastInvoiceNo=$row_LastInvoiceNo['LastreceivingsInvoiceNo'];
  }
######################
######################
if($pp==1){
$sqlt="INSERT INTO ".$prefix."_treasury (type, Amount, date, notes)
VALUES ('9','".$paid."','".$DueDate."','فاتورة رقم ".$get_LastInvoiceNo."')";

	if (!mysqli_query($con,$sqlt))
  {
	 // die($paid);
  }
}
######################
								######################						
								$result_up = mysqli_query($con, "SELECT * FROM ".$prefix."_receivings_temporary order by id DESC");
							while ($row_up = mysqli_fetch_array($result_up)) {
								//echo $row_up['id'];
								$item =round($_POST[item.$row_up['id']]);
								$quantity =round($_POST[quantity.$row_up['id']]);
								$Price=$_POST[price.$row_up['id']];
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
								$Total= ($quantity*$Price)+$DiscountValue;
								$inv_Total+=($quantity*$Price)+$DiscountValue;
if(mysqli_query($con, "UPDATE ".$prefix."_receivings_temporary SET   inv_id=".$get_LastInvoiceNo.",Quantity=".$quantity.",Price=(select price from items where id=".$item."),Discount=".$Discount.",Total=".$Total.",type='2',date='".$DueDate."',BuyPrice=".$Price." where  id='".$row_up['id']."'")){
#############التأثير على المخزون###########
//if(mysqli_query($con, "UPDATE items SET Quantity=Quantity-$quantity where  id='".$row_up['item']."'")){}
###########################################	
	}
								//echo"<br />";
							}
								######################
								
if(mysqli_query($con, "INSERT INTO ".$prefix."_receivings_inv(inv_id, date, Total, supplier, PaymentMethod, DueDate, CheckNumber, notes, type, paid)
VALUES ('".$get_LastInvoiceNo."','".$DueDate."','".$inv_Total."','".$_POST['SupplierID']."','".$pay."','','".$CheckNumber."','".$notes."','2','".$paid."')")){
$Report_Create_Invoice=1;
	##############
if(mysqli_query($con, "INSERT INTO ".$prefix."_receivings(inv_id, item, Price, Quantity, Discount, Total, SupplierID, BuyPrice, date, type)
SELECT inv_id,item,Price,Quantity,Discount,Total,SupplierID,BuyPrice,date,type from ".$prefix."_receivings_temporary")){
$Report_Record_purchases=1;
}else{$Report_Record_purchases=0;}
	###############
	}else{$Report_Create_Invoice=0;}
################
	################################
if(mysqli_query($con,"DELETE FROM ".$prefix."_receivings_temporary")){
	header("refresh:0;url=receivings_returns.php?print_inv=".$get_LastInvoiceNo."");
	}
								//echo $inv_Total;
								######################
								}	
															
							if($_GET['del']!==null){
if(mysqli_query($con,"DELETE FROM ".$prefix."_receivings_temporary where id=".$_GET['del']."")){
													echo '<div style="text-align:center; background-color:#E18C80; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/chmarkicon.png" style="border:0px;" /></span>
							تم حذف الصنف
							</div>';
							header("refresh:0;url=receivings_returns.php");
	}
}
							if(isset($_POST['submit'])){
							$result_up = mysqli_query($con, "SELECT * FROM ".$prefix."_receivings_temporary order by id DESC");
							while ($row_up = mysqli_fetch_array($result_up)) {
								//echo $row_up['id'];
								$quantity=$_POST[quantity.$row_up['id']];
								$Price=$_POST[price.$row_up['id']];
								$Discount=$_POST[discount.$row_up['id']];
								$item=round($_POST[item.$row_up['id']]);
								$BuyPrice=$_POST[BuyPrice.$row_up['id']];
								if ($Discount_type==1) {
									$DiscountValue=$Discount;
								} else if ($Discount_type==2) {
									if($Discount==0){$DiscountValue=$Discount;}else{
									$DiscountValue=($quantity * $Price) * ($Discount/100);
									}
								} else {
									$DiscountValue=$Discount;
								}
								$Total= ($quantity*$Price)+$DiscountValue;
								if($quantity<0){
mysqli_query($con, "UPDATE ".$prefix."_receivings_temporary SET  Quantity='".$quantity."',Price='".$Price."',Discount='".$Discount."',Total='".$Total."',type='2',BuyPrice=".$BuyPrice." where  id='".$row_up['id']."'");
								}else{
									//
									$error_reports=1;
									}
								//echo"<br />";
							}
							}
							###########################################
							if($error_reports=="1"){
																echo '<div style="text-align:center; background-color:#E18C80; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/chmarkicon.png" style="border:0px;" /></span>
							عفواً يجب أن تكون الكمية بالسالب
							</div>';
								}
								                            ?>
              <?php
							if(isset($_GET['SupplierID']) and $_GET['SupplierID']!==null){
							$SupplierID=$_GET['SupplierID'];
 if(mysqli_query($con,"UPDATE ".$prefix."_receivings_temporary SET SupplierID=".$SupplierID."")){
	 header("refresh:0;url=receivings_returns.php");
		  }else{
			  echo"من فضلك حاول مرة اخرى";
			  }
							}
							if(isset($_GET['barcode']) and $_GET['barcode']!==null and $_GET['barcode']!=="الباركود" ){
$result_barcode = mysqli_query($con, "SELECT id FROM items where Barcode='".$_GET['barcode']."'");
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
									//	header( "refresh:0;url=receivings_returns.php" );
								} else {
$result_ch = mysqli_query($con, "SELECT * FROM ".$prefix."_receivings_temporary	WHERE item='".$db_item_id."' limit 0,1");
									if (@mysqli_num_rows($result_ch)>=1) {
										while ($row_ch = mysqli_fetch_array($result_ch)) {
											$ch_id = $row_ch['id'];
											$ch_item = $row_ch['item'];
											$ch_Price = $row_ch['Price'];
											$ch_Quantitynew = $row_ch['Quantity'] - 1;
											$ch_Discount = $row_ch['Discount'];
											$ch_Total = $row_ch['Total'];
											$ch_BuyPrice = $row_ch['BuyPrice'];
											if ($Discount_type == 1) {
												$sumtot = ($ch_BuyPrice * $ch_Quantitynew) + $ch_Discount;
											} else if ($Discount_type == 2) {
												$sumtot = ($ch_BuyPrice * $ch_Quantitynew) + (($ch_BuyPrice * $ch_Quantitynew) * ($ch_Discount / 100));
											} else {
												$sumtot = ($ch_BuyPrice * $ch_Quantitynew);
											}
											if (mysqli_query($con, "UPDATE ".$prefix."_receivings_temporary SET Quantity=".$ch_Quantitynew.",Total=".$sumtot.",type='2',BuyPrice=".$ch_BuyPrice." WHERE id='".$ch_id."'")) {
												echo '<div style="text-align:center; background-color:#E18C80; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/chmarkicon.png" style="border:0px;" /></span>
							تم إضافة وحدة إضافية إلى الفاتورة
							</div>';
												header("refresh:1;url=receivings_returns.php");
											} else {
												echo "من فضلك حاول مرة اخرى";
												header("refresh:1;url=receivings_returns.php");
											}
										}
									} else {
										$result_new = mysqli_query($con, "SELECT * FROM items where id='".$db_item_id."'");
										if (@mysqli_num_rows($result_new)>=1) {

											while ($row_new = mysqli_fetch_array($result_new)) {
												$item_name_new = $row_new['item'];
												$item_id_new = $row_new['id'];
												$item_Retail_price_new = $row_new['Retail_price'];
												$item_Discount_new = $row_new['Discount'];
												$item_price_new = $row_new['price'];
												if ($Discount_type == 1) {
													$item_total_new = $row_new['price'] + $row_new['Discount'];
												} else if ($Discount_type == 2) {
													$item_total_new = $row_new['price'] + (($row_new['price']) * ($row_new['Discount'] / 100));
												} else {$item_total_new = $row_new['price'];
												}
												$sql = "INSERT INTO ".$prefix."_receivings_temporary (item, Price, Quantity, Discount, Total,  BuyPrice, date, type)
							VALUES ('".$item_id_new."','".$item_Retail_price_new."','-1','".$row_new['Discount']."','".$item_total_new."','".$item_price_new."','".$DueDate."','2')";

											}
											if (!mysqli_query($con, $sql)) {
												echo '<div style="text-align:center; background-color:#E18C80; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/chmarkicon.png" style="border:0px;" /></span>
							لم يتم حفظ البيانات , برجاء اعد المحاولة
							</div>';
												header("refresh:5;url=receivings_returns.php");
											} else {
												echo '<div style="text-align:center; background-color:#95D183; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/chmarkicon.png" style="border:0px;" /></span>
							تم إضافة الصنف
							</div>';
												header("refresh:1;url=receivings_returns.php");
											}
										} else {
											echo '<div style="text-align:center; background-color:#E18C80; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/chmarkicon.png" style="border:0px;" /></span>
							هذا الصنف غير معروف يمكنك إضافة صنف جديد <a href="items_and_inventory.php" target="_blank">من هنا</a>
							</div>';
										}

									}
								}
					
#####################
#####################				
#####################
}

							if ($_GET['q']=="d") {
								if (mysqli_query($con, "DELETE FROM ".$prefix."_receivings_temporary")) {
									header("refresh:0;url=receivings_returns.php");
								}
							} else {
								if ($_GET['q']==null) {
									//	header( "refresh:0;url=receivings_returns.php" );
								} else {
$result_ch = mysqli_query($con, "SELECT * FROM ".$prefix."_receivings_temporary	WHERE item='".$_GET['q']."' limit 0,1");
									if (@mysqli_num_rows($result_ch)>=1) {
										while ($row_ch = mysqli_fetch_array($result_ch)) {
											$ch_id = $row_ch['id'];
											$ch_item = $row_ch['item'];
											$ch_Price = $row_ch['Price'];
											$ch_Quantitynew = $row_ch['Quantity']-1;
											$ch_Discount = $row_ch['Discount'];
											$ch_Total = $row_ch['Total'];
											$ch_BuyPrice = $row_ch['BuyPrice'];
											if ($Discount_type==1) {
												$sumtot = ($ch_BuyPrice * $ch_Quantitynew) + $ch_Discount;
											} else if ($Discount_type == 2) {
												$sumtot = ($ch_BuyPrice * $ch_Quantitynew) + (($ch_BuyPrice * $ch_Quantitynew) * ($ch_Discount / 100));
											} else {
												$sumtot = ($ch_BuyPrice * $ch_Quantitynew);
											}
											if($ch_Quantitynew<0){
											if (mysqli_query($con, "UPDATE ".$prefix."_receivings_temporary SET Quantity=".$ch_Quantitynew.",Total=".$sumtot.",type='2',BuyPrice=(select price from items where id=".$ch_item.") WHERE id='".$ch_id."'")) {
												echo '<div style="text-align:center; background-color:#E18C80; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/chmarkicon.png" style="border:0px;" /></span>
							تم إضافة وحدة إضافية إلى الفاتورة
							</div>';
												header("refresh:1;url=receivings_returns.php");
											} else {
												echo "من فضلك حاول مرة اخرى";
												header("refresh:1;url=receivings_returns.php");
											}
											}else{
												echo"عفواً يجب ان تكون المرتجعات بالسالب";
												}
										}
									} else {
										$result_new = mysqli_query($con, "SELECT * FROM items where id='".$_GET['q']."'");
										if (@mysqli_num_rows($result_new)>=1) {

											while ($row_new = mysqli_fetch_array($result_new)) {
												$item_name_new = $row_new['item'];
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
												$sql = "INSERT INTO ".$prefix."_receivings_temporary (item, Price, Quantity, Discount, Total, type, date, BuyPrice)
							VALUES ('".$item_id_new."','".$item_Retail_price_new."','-1','".$row_new['Discount']."','".-$item_total_new."','2','".$DueDate."','".$item_price_new."')";

											}
											if (!mysqli_query($con, $sql)) {
												echo '<div style="text-align:center; background-color:#E18C80; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/chmarkicon.png" style="border:0px;" /></span>
							لم يتم حفظ البيانات , برجاء اعد المحاولة
							</div>';
												header("refresh:5;url=receivings_returns.php");
											} else {
												echo '<div style="text-align:center; background-color:#95D183; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/chmarkicon.png" style="border:0px;" /></span>
							تم إضافة الصنف
							</div>';
												header("refresh:1;url=receivings_returns.php");
											}
										} else {
											echo '<div style="text-align:center; background-color:#E18C80; border-radius:5px;">
							<span style="float:left; padding-left:20px;"><img src="images/chmarkicon.png" style="border:0px;" /></span>
							هذا الصنف غير معروف يمكنك إضافة صنف جديد <a href="items_and_inventory.php" target="_blank">من هنا</a>
							</div>';
										}

									}
								}
							}
							?>
              <form method="post">
        <?php 
		   $result_SupplierID = mysqli_query($con,"SELECT SupplierID FROM ".$prefix."_receivings_temporary limit 0,1");
if(@mysqli_num_rows($result_SupplierID)>0){
while($row_SupplierID= mysqli_fetch_array($result_SupplierID))
  {
		   $result_search_suppliers= mysqli_query($con,"SELECT id,name FROM ".$prefix."_suppliers WHERE id=".$row_SupplierID['SupplierID']."");
if(@mysqli_num_rows($result_search_suppliers)>0){
while($row_search_suppliers= mysqli_fetch_array($result_search_suppliers))
  {
		   echo"\r\n";
          echo'<div style="font-size:16px;"><span dir="rtl">المورد: </span> 
			<span style="color:#7D060F;" dir="rtl">'.$row_search_suppliers['name'].'</span></div>';
			echo'<input type="hidden" name="SupplierID" value="'.$row_search_suppliers['id'].'" />';
  }
}}
}
				   ?>
        <table  border="1" style="font-size:16px; width:100%;  direction:rtl; border:1px; border-collapse:collapse; margin-top:10px; text-align:center;">
                  <thead>
          <th width="5%">م</th>
            <th width="35%">الصنف</th>
            <th>الكمية</th>
            <th>السعر</th>
            <th>الخصم</th>
            <th>الاجمالى</th>
            <th>حذف</th>
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
							$query = "SELECT COUNT(*) as num  FROM  ".$prefix."_receivings_temporary  order by id DESC";
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
							$sql = "SELECT * FROM ".$prefix."_receivings_temporary  order by id DESC";

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
									while ($row_it = mysqli_fetch_array($result_it)) {
										$item_name = $row_it['item'];
										$item_id = $row_it['id'];
										$item_price = $row_it['Retail_price'];
										$item_Discount = $row_it['Discount'];
										$item_BuyPrice= $row_it['price'];
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

								echo'<input type="hidden" name="BuyPrice'.$row['id'].'" value="'.$item_BuyPrice.'" /><tr>
							<td>'.$i.'</td>
							<td><input type="hidden" name="item'.$row['id'].'" value="'.$item_id.'" />'.$item_name.'</td>
							<td><input type="number" name="quantity'.$row['id'].'"  value="'.$row['Quantity'].'" style="width:10%; height:20px; text-align:center;border:0px; background-color:#E1E1E1;"/></td>
							<td><input type="text"  name="price'.$row['id'].'"  value="'.$row['BuyPrice'].'"  style="width:10%; height:20px;text-align:center;border:0px; background-color:#E1E1E1;" /></td>
							<td><input type="number"  name="discount'.$row['id'].'" id="discount'.$i.'" value="'.$row['Discount'].'"  style="width:10%; height:20px;text-align:center;border:0px; background-color:#E1E1E1;" /></td>
							<td><input type="text"  name="subtotal'.$row['id'].'"  value="'.$row['Total'].'"  style="width:10%; height:20px;text-align:center;border:0px; background-color:#E1E1E1;" /></td>
							<td valign="middle"><a href="receivings.php?del='.$row['id'].'"><img src="images/erase.png" style="border:0px;" /></a></td>
							</tr>';
								$i++;
								$i++;
							}
							?>
          </tbody>
                  <?php
							if($sumTotal==null){}else{
                            echo'<tr>
                            
                            <td colspan="5">الاجمالى</td>
                            <td><font style="color:#060; font-weight:bold;">'.($sumTotal+$alldiscount).'</font></td>
                            <td></td>
                            </tr>';
                            } ?>
                </table>
        <input type="submit" name="submit" value="submit" hidden="hidden" />
        </div>
        <table width="100%" dir="rtl">
                  <tr>
            <td style="font-size:16px;">طريقة الدفع</td>
            <td><select name="pay"   style="text-align:center;background-color:#CCC; float:right;">
                <option value="1" <?php
								if ($_POST['pay'] == "1") {echo ' selected="selected"';
								}
 ?>>نقدى</option>
                <option value="2" <?php
								if ($_POST['pay'] == "2") {echo ' selected="selected"';
								}
 ?>>اجل</option>
                <option value="3" <?php
								if ($_POST['pay'] == "3") {echo ' selected="selected"';
								}
 ?>>شيك</option>
              </select></td>
            <td style="font-size:16px;">المبلغ المدفوع</td>
            <td style="font-size:16px;"><input type="text" name="paid" id="price" value="<?php echo"".$_POST['paid'].""; ?>"  style="text-align:center; background-color:#CCC; width:50px; height:20px;"/></td>
                       <td><input type="date" name="date" id="date" value="<?php if($_POST['date']==""){echo date("d/m/Y");}else{echo"".$_POST['date']."";} ?>"  style="text-align:center; background-color:#CCC; width:80px; height:20px;"/>
                            <script type="text/javascript">
				$('#date').dateEntry({dateFormat: 'dmy/', spinnerImage:''});
			</script></td>
          </tr>
                  <tr>
            <td style="font-size:16px;">خصم</td>
<td colspan="6"><input type="text" name="alldiscount" value="<?php echo"".$_POST['alldiscount'].""; ?>"  style="text-align:center; background-color:#CCC; width:50px; height:20px;"/></td>
          </tr>
                  <tr>
            <td colspan="6" align="center"><span style=" text-align:center; margin-right:50px;">
              <input type="submit" name="submit" value="<?php echo ($sumTotal+$alldiscount);?>"  style="width:120px; height:40px;"/>
              </span></td>
          </tr>
                </table>
        <div style="text-align:right; float:right;">
                  <div style="float:right; width:200px; margin-right:150px; vertical-align:middle;"> </div>
                  <div style="float:right; text-align:center; margin-right:50px;">
            <?php /*?>                            <button style="width:120px; height:60px;" onclick="javascript:location.href='receivings_returns.php'"><?php echo $sumTotal;?> :الاجمالى</button><?php */?>
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
                  <input type="search" value="<?php
								if ($_GET['barcode'] == null) {
								} else {echo "" . $_GET['barcode'] . "";
								}
 ?>"  name="barcode" id="barcode" onKeyUp="this.form.submit();"   style="background-color:#CCC;"
							onblur="this.value=!this.value?'الباركود':this.value;" onfocus="this.select()"/>
                  <?php } ?>
                  <a href="#" onclick="javascript:void window.open('additems.php','1390937502641','width=400,height=400,toolbar=0,menubar=0,location=0,status=0,scrollbars=1,resizable=0,left=0,top=0,menubar=0');return false;"><img src="images/shoppinglistadditem002a.png" style="border:0px; float:left;" title="إضافة صنف جديد"></a> <span style="padding-right:20px;"></span>
                  <input type="search" value="اسم الصنف"  style="background-color:#CCC; z-index:100000000000;"  onkeyup="showResultsOfItems(this.value)" autocomplete="off"    onclick="this.value='';" onfocus="this.select()"  onblur="this.value=!this.value?'اسم الصنف':this.value;"/>
                  <div id="livesearch" style="z-index:1000000000; width:45%;  text-align:right; margin-top:0px;  float:right; position:fixed; border:0px; "></div>
                  <input type="submit" hidden="hidden"/>
                  <?php
                            if($db_cat_items_show==0 or $db_cat_items_show==null or $db_cat_items_show==""){}else{
echo'<a href="?cat_show=0"><img src="images/icon_all_cats.png" title="جميع المجموعات" style="border:0px; box-shadow: 5px 5px 5px #888888; float:right;" /></a>';
							}
?>
                </form>
      </div>
              <?php
							if($showGroups==0){}else{ ?>
              <?php if($db_cat_items_show>0){}else{ ?>
              <div style="width:100%; margin:0 auto; text-align:center; float:right; text-align:center;">
        <?php
							$result_cat=mysqli_query($con, "SELECT * FROM products where rank!='0' and id>0  order by rank DESC");
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
<a href=\"?cat_show=" . $row_cat['id'] . "\" class='a_cat_underlines'><img src=\"uploads/" . $row_cat['image'] . "\" class=\"imcart\" width=\"115\" height=\"30\" /></a></div>

							</div>";
													}else{
							echo "<div class=\"".$class." jqx-rc-all\" style='background-color:".$row_cat['background'].";'>
							<div class=\"jqx-rc-t draggable-demo-product-header jqx-widget-header-theme1 jqx-fill-state-normal-theme\" >
							<div class=\"draggable-demo-product-header-label\"> <a href=\"?cat_show=" . $row_cat['id'] . "\" class='a_cat_underlines'>" . $row_cat['product_name'] . "</a></div></div>

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
							 if($db_cat_items_show==0 or $db_cat_items_show==null or $db_cat_items_show==""){
								 $query = "SELECT COUNT(*) as num  FROM  items where OrderNo!='0'  order by OrderNo ASC";
							 }else{
							$query = "SELECT COUNT(*) as num  FROM  items where OrderNo!='0' and groupid=".$db_cat_items_show." order by OrderNo ASC";
							 }
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
														 if($db_cat_items_show==0 or $db_cat_items_show==null or $db_cat_items_show==""){
								 $sql = "SELECT * FROM items where OrderNo!='0' order by OrderNo ASC";
							 }else{
							$sql = "SELECT * FROM items where OrderNo!='0' and groupid=".$db_cat_items_show."  order by OrderNo ASC";
							 }
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
								if ($row['image'] == null or $row['useimage'] == 0) {
									###################
									echo "<div class=\"draggable-demo-product jqx-rc-all\"  style='background-color:" . $row['Background'] . ";'>
							<div class=\"jqx-rc-t draggable-demo-product-header jqx-widget-header-theme1 jqx-fill-state-normal-theme\" >
							<div class=\"draggable-demo-product-header-label\" style='background-color:#fff;'> <a href=\"?q=" . $row['id'] . "\">" . $row['item'] . "</a></div></div>

							</div>";
									/*	echo"<div class=\"draggable-demo-product jqx-rc-all\"  style='background-color:".$row['Background']."; height:50px;'>
									 <div class=\"jqx-rc-t draggable-demo-product-header jqx-widget-header-theme1 jqx-fill-state-normal-theme\" >
									 <div class=\"draggable-demo-product-header-label\" style='background-color:#fff;'> <a href=\"?q=".$row['id']."\">".$row['item']."</a></div></div>

									 </div>";*/
									###################
								} else {
									echo "<div class=\"draggable-demo-product jqx-rc-all\">
							<div class=\"jqx-rc-t draggable-demo-product-header jqx-widget-header-theme1 jqx-fill-state-normal-theme\">
							<div class=\"draggable-demo-product-header-label\"><a href=\"?q=".$row['id']."\">".$row['item']."</a></div></div>

							<a href=\"?q=".$row['id']."\"><img src=\"uploads/".$row['image']."\" class=\"imcart\" width=\"115\" height=\"115\" /></a>
							</div>";
								}
							}
							?>
              <?php
							if($total_pages==0){
echo"<div style='margin-top:200px;text-align:center;font-family:Tahoma, Geneva, sans-serif;color:#666; font-weight:bold; font-size:14px;'>لا يوجد أى اصناف تحت هذه المجموعة , لإضافة صنف جديد <a href='items_and_inventory.php' target='_blank'>اضغط هنا</a></div>";
								}
								?>
            </div>
  </div>
        </div>
<?php } ?>
</article>

<!--    <nav>nav</nav>--> 
<!-- <aside>aside</aside>-->
</div>
<div id="toolbar">
          <footer>
    <?php include"includes/scroller_container.php"; ?>
  </footer>
        </div>
</body>
</html>
<?php include 'includes/footer.php'; ?>
