<?php
include "includes/inc.php";
$id=Trim(stripslashes($_GET['id']));
?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <style type="text/css">

            /* printer specific CSS */
            @media print
            {
                #contentnoprint { display:none;}
                #contentnoprint2 { display:none;}
                #contentnoprint3 { display:none;}
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="menu_source/styles.css" rel="stylesheet" type="text/css">
        <script type='text/javascript' src='menu_source/menu_jquery.js'></script>
        <title><?php echo"" . $get_db_CompanyName . ""; ?></title>

        <?php include"includes/css.php"; ?>
        <?php include"includes/js.php"; ?>
    </head>
    <body  class="cmenu1 example-target">

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">

                <div class="panel-body">
                    <div class="table-responsive">

                        <table class="table table-striped table-bordered table-hover" id="table_print">
                            <thead>
                            <tr>
                                <th  class="text-center" colspan="16"><?php echo"$code_lang"; ?> : <?php echo Get_model_name($_GET['id']); ?></th>

                            </tr>
                            <tr>
                                <th  class="text-center"><?php echo"$color_lang"; ?></th>
                                <?php
                                if($use_sizes==1){
                                    $result_sizes= @mysqli_query($con,"SELECT * FROM sizes where id in (".rtrim(get_sizes_of_item($_GET['id']), ",").")  order by id ASC limit 0,15");
                                    $num_sizes=@mysqli_num_rows($result_sizes);
                                    if($num_sizes>0) {

                                        while ($row_sizes= mysqli_fetch_array($result_sizes)) {
                                            echo'<th class="text-center">';
                                            echo $row_sizes['size'];
                                            echo'</th>';
                                        }
                                    }
                                }
                                ?>

                            </tr>
                            </thead>
                            <tbody>
                            <?php
                            $result_colors= @mysqli_query($con,"SELECT * FROM colors where id in (".rtrim(get_clolors_of_item($_GET['id']), ",").")   order by id ASC");
                            $num_colors=@mysqli_num_rows($result_colors);
                            if($num_colors>0) {
                                while ($row_colors= mysqli_fetch_array($result_colors)) {
                                    $color_db=$row_colors['color'];
                                    echo"<tr>";
                                    echo'<td class="text-center">'.$row_colors['color'].'</td>';
                                    if($use_sizes=="1"){
                                        $result_sizes= @mysqli_query($con,"SELECT * FROM sizes where id in (".rtrim(get_sizes_of_item($_GET['id']), ",").") order by id ASC limit 0,15");
                                        $num_sizes=@mysqli_num_rows($result_sizes);
                                        if($num_sizes>0) {

                                            while ($row_sizes= mysqli_fetch_array($result_sizes)) {
                                                echo'<td class="text-center">'.Get_total_items(''.$row_sizes['id'].'',''.$row_colors['id'].'',$_GET['id']).'</td>';
                                            }
                                        }
                                    }else{
                                        echo'<td class="text-center">'.Get_total_items('0',''.$row_colors['id'].'',$_GET['id']).'</td>';
                                    }
                                    echo"</tr>";
                                }
                            }
                            ?>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>

    </body>

    </html>
<?php include 'includes/footer.php'; ?>
