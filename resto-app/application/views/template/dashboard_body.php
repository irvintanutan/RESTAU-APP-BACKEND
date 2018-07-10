            <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">
                
                <!--Page Title-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <div id="page-title">
                    <div class="col-md-2">
                        <img src=<?php echo "'assets/img/" . $store->img . "'"; ?> style="width: 100%; margin-top: 0%; margin-right: 3%;">
                    </div>
                    <div class="col-md-10">
                        <h1 class="page-header text-overflow"><br><br><b><?php echo $store->name; ?></b><br><span style="font-size: 16px;">R e s t o A p p | Restaurant Point of Sales App by InnoTech Solutions</span></h1>
                    </div>

                    <!-- For alert and notifications assets/js/demo/nifty-demo.js-->

                    <input type="hidden" value=<?php echo "'" . $this->session->userdata('firstname').' '.$this->session->userdata('lastname') . "'"; ?> name="user_fullname"/>

                    <input type="hidden" value=<?php echo "'" . date('l, F j, Y', strtotime(date('Y-m-d'))) . "'"; ?> name="current_date"/>

                </div>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End page title-->

                <!--Breadcrumb-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!-- <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Library</a></li>
                    <li class="active">Data</li>
                </ol> -->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End breadcrumb-->
                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">
                    
                    <div class="panel">
                        <div class="panel-heading">
                            <h1 align="right" class="panel-title"><i style="font-size: 18px;">Daily Stats | <?php echo date('l, F j, Y', strtotime(date('Y-m-d'))); ?></i></h1>
                        </div>
                    </div>
                    <!--Tiles - Bright Version-->
                    <!--===================================================-->

                    <!--===================================================-->
                    <!--End Tiles - Bright Version-->               
                    <div class="row">
                        <div class="col-lg-12">                  
                            <div class="row">
                                
                                <!--Large tile (Visit Today)-->
                                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                                 <div class="col-sm-6 col-md-3">
                                    <div class="panel panel-dark panel-colorful">
                                        <div class="panel-body text-center">
                                            <p class="text-uppercase mar-btm text-sm">Total Net Sales Today</p>
                                            <i class="fa fa-money fa-5x"></i>
                                            <hr>
                                            <p class="h1 text-thin">
                                            <?php echo '₱ 36,000.00'; ?>     
                                            </p>
                                            <small><span class="text-semibold" style="font-size: 11px;">[ <?php echo ' 75 %'; ?> ] Higher than yesterday<br><br><br></small>
                                        </div>
                                    </div>
                                </div>
                                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                                <!--End large tile (Visit Today)-->

                                <!--Large tile (New orders)-->
                                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                                <div class="col-sm-6 col-md-3">
                                    <div class="panel panel-danger panel-colorful">
                                        <div class="panel-body text-center">
                                            <p class="text-uppercase mar-btm text-sm">Total Transactions Today</p>
                                            <i class="fa fa-users fa-5x"></i>
                                            <hr>
                                            <p class="h1 text-thin"><?php echo '14'; //echo number_format($total_balance, 2, '.', ','); ?> </p>
                                            <small><span class="text-semibold" style="font-size: 11px;">Dine in: [ <?php echo '15'; //echo number_format($total_paid, 2, '.', ','); ?> ] | Take out: [ <?php echo '6'; //echo number_format($total_paid, 2, '.', ','); ?> ]<br><br><br></small>
                                        </div>
                                    </div>
                                </div>
                                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                                <!--End Large tile (New orders)-->

                                <!--Large tile (Comments)-->
                                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                                <div class="col-sm-6 col-md-3">
                                    <div class="panel panel-warning panel-colorful">
                                        <div class="panel-body text-center">
                                            <p class="text-uppercase mar-btm text-sm">Total Menu Items Sold Today</p>
                                            <i class="fa fa-cutlery fa-5x"></i>
                                            <hr>
                                            <p class="h1 text-thin"><?php echo '57'; //echo number_format($total_interests, 2, '.', ','); ?> </p>
                                            <small><span class="text-bold" style="font-size: 11px;">Individual Products: [ <?php echo '43'; //echo number_format($total_paid, 2, '.', ','); ?> ] <br> Packages: [ <?php echo '14'; //echo number_format($total_paid, 2, '.', ','); ?> ]<br><br></small>
                                        </div>
                                    </div>
                                </div>
                                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                                <!--Large tile (Comments)-->

                                <!--Large tile (New orders)-->
                                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                                <div class="col-sm-6 col-md-3">
                                    <div class="panel panel-success panel-colorful">
                                        <div class="panel-body text-center">
                                            <p class="text-uppercase mar-btm text-sm">Total Discounts Rendered Today</p>
                                            <i class="fa fa-percent fa-5x"></i>
                                            <hr>
                                            <p class="h1 text-thin"><?php echo '₱ 2,200.00'; //echo $loans_count; ?></p>
                                            <small><span class="text-semibold" style="font-size: 11px;">[ 6 % ] of the Total<br>Gross Sales [ ₱ 42,000.00 ]<br><br></small>
                                        </div>
                                    </div>
                                </div>
                                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                                <!--End Large tile (New orders)-->

                            </div>                
                        </div>
                    </div>
                    
                    



                    
















                </div>
                <!--===================================================-->
                <!--End page content-->
                <hr style="background-color: #cccccc; height:1px;">
                <hr>
                <hr>

            </div>
            <!--===================================================-->
            <!--END CONTENT CONTAINER-->


            
        