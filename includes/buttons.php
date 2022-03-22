<nav class="navbar  navbar-custom" role="navigation">
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>    
  </div>
 <a class="navbar-brand hidden-md" href="#"><?php echo"$get_db_CompanyName"; ?></a>
  <div class="navbar-collapse collapse">

  <!--  <ul class="nav navbar-nav navbar-left">
        <li><a href="#">Left</a></li>
        <li><a href="#about">Left</a></li>
    </ul> -->
    <ul class="nav navbar-nav navbar-right text-center">
 <li><a href="logout.php">خروج</a></li>
 <li <?php if(basename($_SERVER['PHP_SELF'])=="treasury.php"){echo'class="active"';} ?>><a href="treasury.php"><?php echo"$Treasury_lang"; ?></a></li>
                   <li <?php if(basename($_SERVER['PHP_SELF'])=="items_and_inventory.php"){echo'class="active"';} ?>><a href="items_and_inventory.php"><?php echo"$Items_and_inventory_lang"; ?></a></li>
                    <li <?php if(basename($_SERVER['PHP_SELF'])=="expenses.php"){echo'class="active"';} ?>><a href="expenses.php"><?php echo"$Expenses_lang"; ?></a></li>
                     <li <?php if(basename($_SERVER['PHP_SELF'])=="reports.php"){echo'class="active"';} ?>><a href="reports.php"><?php echo"$Reports_lang"; ?></a></li>
                      <li <?php if(basename($_SERVER['PHP_SELF'])=="suppliers.php"){echo'class="active"';} ?>><a href="suppliers.php"><?php echo"$Suppliers_lang"; ?></a></li>
                       <li <?php if(basename($_SERVER['PHP_SELF'])=="clients.php"){echo'class="active"';} ?>><a href="clients.php"><?php echo"$Clients_lang"; ?></a></li>
                        <li <?php if(basename($_SERVER['PHP_SELF'])=="config.php"){echo'class="active"';} ?>><a href="config.php"><?php echo"$Settings_lang"; ?></a></li>
                        
                        
              <li <?php if(basename($_SERVER['PHP_SELF']) =="receivings.php"){echo'class="active"';} ?>><a href="receivings.php"><?php echo"$Purchases_lang"; ?></a></li>
              <li <?php if(basename($_SERVER['PHP_SELF'])=="sales.php"){echo'class="active"';} ?>><a href="sales.php"><?php echo"$sales_lang"; ?></a></li>
              <li <?php if(basename($_SERVER['PHP_SELF'])=="index.php"){echo'class="active"';} ?>><a href="index.php"><?php echo"$Home_lang"; ?></a></li>
    </ul>
  </div>
</nav>