<?php
include "includes/inc.php";
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title><?php echo"" . $get_db_CompanyName . ""; ?></title>
        <?php include"includes/css.php"; ?>
        <?php include"includes/js.php"; ?>
    </head>

    <body   class="">

        <div>
            <div>
                <?php
                if ($get_db_isLogo == 1) {
                    if ($get_db_Logo == "") {
                        echo '<img src="images/yourLogoHere.png" style="float:left; border:0px;"/>';
                    } else {
                        echo '<img src="uploads/' . $get_db_Logo . '" style="float:left; border:0px;"/>';
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
            <p class="text-right pull-righ"><?php echo"$date_today_lang"; ?><span> <?php echo"" . $dateonly . ""; ?></span></p>

            <img src="images/pos-integration.gif" class="img-responsive" />
            <b class="text-right pull-righ"><?php echo"$welcome_lang"; ?><span class="text-right pull-righ" dir="rtl"> <?php echo"$user_name"; ?></span></b>




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

