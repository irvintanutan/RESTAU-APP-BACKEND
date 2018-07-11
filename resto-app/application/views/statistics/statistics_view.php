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
                <div id="page-content" class="panel panel-light panel-colorful">
                
                    <div class="panel-heading">
                        <h3 class="panel-title">Results as of <?php echo date('l, F j, Y', strtotime(date('Y-m-d'))); ?></h3>
                    </div>
                    <br>

                    

                    <!-- <div id="container-interests-prev" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>

                    <hr style="background-color: #ccccff; height: 5px;"> -->

                    <div id="container-current-net-sales" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>

                    <hr style="background-color: #ccccff; height: 40px;">

                    <!-- Basic Data Tables -->
                    <!--===================================================-->
                    <!-- <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">Top Clients - Total Loans Information Table</h3>
                        </div>
                        <div class="panel-body">
                            
                            <table id="top-clients-list-table" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th style="width:60px;">Client ID</th>
                                        <th>Name</th>
                                        <th>Total Loans *</th>
                                        <th>Total Paid</th>
                                        <th>Total Balance</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div> -->
                    <!--===================================================-->
                    <!-- End Striped Table -->
                    <!-- <span>Legend: [ &nbsp; <i style = "color: #ffff66;" class="fa fa-square"></i> - Has Current Balance &nbsp; | &nbsp; <i style = "color: #ffffff;" class="fa fa-square"></i> - No Current Balance &nbsp; ]</span>
                    <hr style="background-color: #ccccff; height: 40px;"> -->
                </div>

                        


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
                <!--===================================================-->
                <!--End page content-->


            </div>
            <!--===================================================-->
            <!--END CONTENT CONTAINER-->


            
        