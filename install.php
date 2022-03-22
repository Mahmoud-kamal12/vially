<?php
$con=mysqli_connect("localhost","root","root","cost");
//$con=mysqli_connect("localhost","root","et123et","db");
if (!mysqli_set_charset($con, "utf8")) {
    //printf("Error loading character set utf8: %s\n", mysqli_error($con));
} else {
   // printf("Current character set: %s\n", mysqli_character_set_name($con));
}
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
  $ch = curl_init();
$os="http://".$_SERVER[HTTP_HOST]."/cairo/os.php";
curl_setopt($ch, CURLOPT_URL,"$os");
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS,
    "mc=1");

// in real life you should use something like:
// curl_setopt($ch, CURLOPT_POSTFIELDS,
//          http_build_query(array('postvar1' => 'value1')));

// receive server response ...
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$server_output = curl_exec ($ch);
  $hash="$server_output";
  //file_get_contents("activationcode.txt");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <?php include"includes/css.php"; ?>
    </head>
    <?php
	if(isset($_POST['submit'])){
/*$hash=Trim(stripslashes($_POST['hash']));
$name=Trim(stripslashes($_POST['name']));
$ID=Trim(stripslashes($_POST['ID']));
$Phone=Trim(stripslashes($_POST['Phone']));
$activationcode=Trim(stripslashes($_POST['activationcode']));

$ch_local = curl_init();
$os_local="http://".$_SERVER[HTTP_HOST]."/pos/os.php";
curl_setopt($ch_local, CURLOPT_URL,"$os_local");
curl_setopt($ch_local, CURLOPT_POST, 1);
curl_setopt($ch_local, CURLOPT_POSTFIELDS,
    "mc=1");

// in real life you should use something like:
// curl_setopt($ch, CURLOPT_POSTFIELDS,
//          http_build_query(array('postvar1' => 'value1')));

// receive server response ...
curl_setopt($ch_local, CURLOPT_RETURNTRANSFER, true);
$localserver_output = curl_exec ($ch_local);
 */
######################
$ch_et = curl_init();
$data = array('hash' => $hash, 'name' => $name, 'ID' => $ID, 'Phone' => $Phone, 'activationcode' => $activationcode, 'cm' =>'1');
$os_et="http://www.etolv.com/api/pos/api.php";
curl_setopt($ch_et, CURLOPT_URL,"$os_et");
curl_setopt($ch_et, CURLOPT_POST, 1);
curl_setopt($ch_et, CURLOPT_POSTFIELDS,$data);

// in real life you should use something like:
// curl_setopt($ch, CURLOPT_POSTFIELDS,
//          http_build_query(array('postvar1' => 'value1')));

// receive server response ...
curl_setopt($ch_et, CURLOPT_RETURNTRANSFER, true);
//if(curl_errno($c))
//{
  //  echo 'error:' . curl_error($c);
//}
echo $server_et = curl_exec ($ch_et);
$filename='activationcode.txt';
if(file_exists($filename)=='1'){}else{
    fopen($filename, 'w');
}
if (is_writable($filename)) { fopen($filename, 'w');
$fp=fopen($filename, 'w');
    fwrite($fp, $server_et);
}else{
   echo "The file $filename is not writable";
}
		}
	?>
<table style="text-align:center;" align="center">
    <form method="post">
    <tr>
        <td align="center">Name</td>
        <td align="center">ID</td>
        <td align="center">Phone</td>
        <td align="center">Activation Code</td>
    </tr>
    <tr>
        <td align="center"><input type="text" name="name" /></td>
        <td align="center"><input type="text" name="ID" /></td>
        <td align="center"><input type="text" name="Phone" /></td>
        <td align="center"><input type="text" name="activationcode" /></td>
    </tr>
        <tr><td colspan="4" align="center">    <input type="submit" name="submit" value="تفعيل" ></td></tr>
    </form>
</table>

