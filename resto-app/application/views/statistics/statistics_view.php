            <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">
                
                <!--Page Title-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <div id="page-title">
                    <h1 class="page-header text-overflow"><?php echo $title; ?></h1>


                    <!--Searchbox-->
                    <!-- <div class="searchbox">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search..">
                            <span class="input-group-btn">
                                <button class="text-muted" type="button"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </div> -->
                </div>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End page title-->

                <!--Breadcrumb-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <ol class="breadcrumb">
                    <li><a href="<?php echo base_url('dashboard');?>">Dashboard</a></li>
                    <li><a href="<?php echo base_url('statistics-page');?>">Statistics / Charts</a></li>
                </ol>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End breadcrumb-->
                <!--Page content-->
                <!--===================================================-->

                <div class="col-md-12">
                    <div class="col-md-6">
                        <div id="page-content" class="panel panel-light panel-colorful col-md-12">
                        
                            <div class="panel-heading">
                                <h3 class="panel-title">Product Categories Sales</h3>
                            </div>
                            <br>

                            <div id="container-products-category" style="width: 80%; height: 100%; margin: 0 auto"></div>

                            <?php
                                $cat_index = -1; // initialize index to use

                                foreach ($cat_array as $categories)
                                {
                                    $cat_index++;

                                    echo '<input type="hidden" value="' . $categories['name'] . '" name="cat_name' . $cat_index . '"/>';
                                    echo '<input type="hidden" value="' . $categories['cat_prod_count'] . '" name="cat_prod_count' . $cat_index . '"/>';
                                    echo '<input type="hidden" value="' . $categories['cat_prod_sales'] . '" name="cat_prod_sales' . $cat_index . '"/>';
                                }
                                echo '<input type="hidden" value="' . $cat_index . '" name="cat_index"/>'; // send index value to use
                            ?>

                            
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div id="page-content" class="panel panel-light panel-colorful col-md-12">
                        
                            <div class="panel-heading">
                                <h3 class="panel-title">Top Selling Products</h3>
                            </div>
                            <br>

                            
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div id="page-content" class="panel panel-light panel-colorful col-md-12">
                        
                            <div class="panel-heading">
                                <h3 class="panel-title col-md-9">Net Sales ( Results as of <?php echo date('l, F j, Y', strtotime(date('Y-m-d'))); ?> )</h3>
                                <h3 class="panel-title col-md-3">Net Sales ( Results as of <?php echo date('l, F j, Y', strtotime(date('Y-m-d'))); ?> )</h3>
                            </div>
                            <br>

                            <div id="container-current-net-sales" style="width: 80%; height: 100%; margin: 0 auto"></div>

                            <!-- Hidden input files to be fetched by charts (MONTHLY REGISTRATION LINE CHART)-->

                            <input type="hidden" value=<?php echo "'" . $current_year . "'"; ?> name="current_year"/>

                            <input type="hidden" value=<?php echo "'" . $jan . "'"; ?> name="jan"/>
                            <input type="hidden" value=<?php echo "'" . $feb . "'"; ?> name="feb"/>
                            <input type="hidden" value=<?php echo "'" . $mar . "'"; ?> name="mar"/>
                            <input type="hidden" value=<?php echo "'" . $apr . "'"; ?> name="apr"/>

                            <input type="hidden" value=<?php echo "'" . $may . "'"; ?> name="may"/>
                            <input type="hidden" value=<?php echo "'" . $jun . "'"; ?> name="jun"/>
                            <input type="hidden" value=<?php echo "'" . $jul . "'"; ?> name="jul"/>
                            <input type="hidden" value=<?php echo "'" . $aug . "'"; ?> name="aug"/>

                            <input type="hidden" value=<?php echo "'" . $sep . "'"; ?> name="sep"/>
                            <input type="hidden" value=<?php echo "'" . $oct . "'"; ?> name="oct"/>
                            <input type="hidden" value=<?php echo "'" . $nov . "'"; ?> name="nov"/>
                            <input type="hidden" value=<?php echo "'" . $dec . "'"; ?> name="dec"/>

                            <input type="hidden" value=<?php echo "'" . $year_total . "'"; ?> name="year_total"/>
                            
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div id="page-content" class="panel panel-light panel-colorful col-md-12">
                        
                            <div class="panel-heading">
                                <h3 class="panel-title">Employee Staff Stats</h3>
                            </div>
                            <br>

                            
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div id="page-content" class="panel panel-light panel-colorful col-md-12">
                        
                            <div class="panel-heading">
                                <h3 class="panel-title">Employee Cashier Stats</h3>
                            </div>
                            <br>

                            
                        </div>
                    </div>
                </div>

                

                        


                    














                </div>
                <!--===================================================-->
                <!--End page content-->


            </div>
            <!--===================================================-->
            <!--END CONTENT CONTAINER-->


            
        