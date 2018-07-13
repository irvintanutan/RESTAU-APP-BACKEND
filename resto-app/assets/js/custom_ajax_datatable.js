var save_method; //for save method string
var table;
var text;
var tableID = $("table").attr('id');

$(document).ready(function() 
{
    if(tableID == "items-table")
    {
    //datatables
            table = $('#items-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "showlist-items",
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                {
                      "targets": 3,
                      "className": "text-center",
                },
                {
                      "targets": 4,
                      "className": "text-right",
                },
                ],
                "scrollX": true
            });
    }
    else if(tableID == "sold-today-table")
    {
    //datatables
            table = $('#sold-today-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
                "ordering": false,
                "searching": false,
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "showlist-sold-today",
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                {
                      "targets": 2,
                      "className": "text-center",
                },
                {
                      "targets": 3,
                      "className": "text-right",
                },
                {
                      "targets": 4,
                      "className": "text-right",
                },
                {
                      "targets": 5,
                      "className": "text-right",
                }
                ],
                "scrollX": true,

                "rowCallback": function( row, data, index )
                {
                  var best_selling = data[4],
                      $node = this.api().row(row).nodes().to$();

                  if (best_selling.length > 20) // if there are words such as rank, star symbol, etc. (more than 14 chars automatically)
                  {
                    function isOdd(num) { return num % 2;}

                    if (isOdd(index) == 1) // to have different color when changed color is in sequence
                    {
                      $node.css('background-color', '#ccff99');
                    }
                    else
                    {
                      $node.css('background-color', '#ccffcc');
                    }
                  }
                }
            });
    }
    else if(tableID == "products-table")
    {
    //datatables
            table = $('#products-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "showlist-products",
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                {
                      "targets": 4,
                      "className": "text-center",
                },
                {
                      "targets": 5,
                      "className": "text-right",
                },
                {
                      "targets": 6,
                      "className": "text-right",
                },
                {
                      "targets": 7,
                      "className": "text-right",
                },
                {
                      "targets": 8,
                      "className": "text-center",
                },
                ],
                "scrollX": true,

                "rowCallback": function( row, data, index )
                {
                  var row_count = data[9], best_selling = data[6],
                      $node = this.api().row(row).nodes().to$();

                  if (row_count == 0) 
                  {
                    $node.css('background-color', '#ccccff');
                  }
                  else if (best_selling.length > 20) // if there are words such as rank, star symbol, etc. (more than 14 chars automatically)
                  {
                    function isOdd(num) { return num % 2;}
                    
                    if (isOdd(index) == 1) // to have different color when changed color is in sequence
                    {
                      $node.css('background-color', '#ccff99');
                    }
                    else
                    {
                      $node.css('background-color', '#ccffcc');
                    } 
                  }
                }
            });
    }
    else if(tableID == "packages-table")
    {
    //datatables
            table = $('#packages-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "showlist-packages",
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                {
                      "targets": 4,
                      "className": "text-right",
                },
                {
                      "targets": 5,
                      "className": "text-right",
                },
                {
                      "targets": 6,
                      "className": "text-right",
                },
                {
                      "targets": 7,
                      "className": "text-center",
                },
                ],
                "scrollX": true,

                "rowCallback": function( row, data, index )
                {
                  var row_count = data[8], best_selling = data[5],
                      $node = this.api().row(row).nodes().to$();

                  if (row_count == 0) 
                  {
                    $node.css('background-color', '#ccccff');
                  }
                  else if (best_selling.length > 20) // if there are words such as rank, star symbol, etc. (more than 14 chars automatically)
                  {
                    function isOdd(num) { return num % 2;}
                    
                    if (isOdd(index) == 1) // to have different color when changed color is in sequence
                    {
                      $node.css('background-color', '#ccff99');
                    }
                    else
                    {
                      $node.css('background-color', '#ccffcc');
                    } 
                  }
                }
            });
    }
    else if(tableID == "categories-table")
    {
    //datatables
            table = $('#categories-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "showlist-categories",
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                {
                      "targets": 3,
                      "className": "text-right",
                },
                ],
                "scrollX": true
            });
    }
    else if(tableID == "tables-table")
    {
    //datatables
            table = $('#tables-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "showlist-tables",
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                {
                      "targets": 2,
                      "className": "text-center",
                },
                {
                      "targets": 3,
                      "className": "text-center",
                },
                {
                      "targets": 4,
                      "className": "text-right",
                },
                {
                      "targets": 5,
                      "className": "text-center",
                },
                ],
                "scrollX": true,

                "rowCallback": function( row, data, index )
                {
                  var status = data[2],
                      $node = this.api().row(row).nodes().to$();

                  if (status == 'Occupied') 
                  {
                    $node.css('background-color', '#66cccc');
                  }
                  else if (status == 'Reserved') 
                  {
                    $node.css('background-color', '#cccc99');
                  }
                  else if (status == 'Unavailable') 
                  {
                    $node.css('background-color', '#cccccc');
                  }
                }
            });
    }
    else if(tableID == "transactions-table")
    {
    //datatables
            // get id
            var trans_status = $('[name="trans_status"]').val();

            var url = 'showlist-transactions/0'; // default is ONGOING - 0

            if (trans_status == 'CLEARED') // - 1
            {
              url = 'showlist-transactions/1';
            }
            else if (trans_status == 'CANCELLED') // - 2
            {
              url = 'showlist-transactions/2';
            }

            table = $('#transactions-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": url,
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                { 
                    "targets": [ 3 ], //last column
                    "orderable": false, //set not orderable
                },
                { 
                    "targets": [ 5 ], //last column
                    "orderable": false, //set not orderable
                },
                {
                      "targets": 2,
                      "className": "text-center",
                },
                {
                      "targets": 3,
                      "className": "text-right",
                },
                {
                      "targets": 4,
                      "className": "text-right",
                },
                {
                      "targets": 5,
                      "className": "text-right",
                },
                {
                      "targets": 6,
                      "className": "text-center",
                },
                {
                      "targets": 7,
                      "className": "text-center",
                },
                {
                      "targets": 8,
                      "className": "text-center",
                }
                ],
                "scrollX": true,

                "rowCallback": function( row, data, index )
                {
                  $('td', row).eq(5).css({color: "#006699"});

                  var order_type = data[2],
                      $node = this.api().row(row).nodes().to$();

                  if (order_type == 'TAKE-OUT') 
                  {
                    function isOdd(num) { return num % 2;}

                    if (isOdd(index) == 1) // to have different color when changed color is in sequence
                    {
                      $node.css('background-color', '#ffffcc');
                    }
                    else
                    {
                      $node.css('background-color', '#ffff99');
                    }
                    
                  }
                }
            });
    }
    else if(tableID == "discounts-table")
    {
    //datatables
            table = $('#discounts-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "showlist-discounts",
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                {
                      "targets": 3,
                      "className": "text-right",
                },
                {
                      "targets": 4,
                      "className": "text-right",
                },
                {
                      "targets": 5,
                      "className": "text-right",
                },
                {
                      "targets": 6,
                      "className": "text-center",
                },
                ],
                "scrollX": true,

                "rowCallback": function( row, data, index )
                {
                  var disc_type = data[7],
                      $node = this.api().row(row).nodes().to$();

                  $('td', row).eq(3).css({"background-color": "#ffcc99"});

                  if (disc_type != 0) 
                  {
                    $node.css('background-color', '#ffffcc');
                  }
                  else
                  {
                    $node.css('background-color', '#ccffcc');
                  }
                }
            });
    }
    else if(tableID == "prod-discounts-table")
    {
    //datatables
            table = $('#prod-discounts-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "showlist-prod-discounts",
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                {
                      "targets": 4,
                      "className": "text-center",
                },
                {
                      "targets": 5,
                      "className": "text-center",
                },
                {
                      "targets": 6,
                      "className": "text-center",
                },
                {
                      "targets": 7,
                      "className": "text-right",
                },
                {
                      "targets": 8,
                      "className": "text-right",
                },
                {
                      "targets": 9,
                      "className": "text-center",
                },
                {
                      "targets": 10,
                      "className": "text-right",
                },
                ],
                "scrollX": true,

                "rowCallback": function( row, data, index )
                {
                  $('td', row).eq(7).css({color: "#3300cc"});
                  $('td', row).eq(8).css({color: "#cc3300"});

                  var status = data[6],
                      $node = this.api().row(row).nodes().to$();

                  if (status != 'ACTIVE') 
                  {
                    $node.css('background-color', '#cccccc');
                  }
                  else
                  {
                    $node.css('background-color', '#99ff99');
                  }
                }
            });
    }
    else if(tableID == "pack-discounts-table")
    {
    //datatables
            table = $('#pack-discounts-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "showlist-pack-discounts",
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                {
                      "targets": 4,
                      "className": "text-center",
                },
                {
                      "targets": 5,
                      "className": "text-center",
                },
                {
                      "targets": 6,
                      "className": "text-center",
                },
                {
                      "targets": 7,
                      "className": "text-right",
                },
                {
                      "targets": 8,
                      "className": "text-right",
                },
                {
                      "targets": 9,
                      "className": "text-center",
                },
                {
                      "targets": 10,
                      "className": "text-right",
                },
                ],
                "scrollX": true,

                "rowCallback": function( row, data, index )
                {
                  $('td', row).eq(7).css({color: "#3300cc"});
                  $('td', row).eq(8).css({color: "#cc3300"});

                  var status = data[6],
                      $node = this.api().row(row).nodes().to$();

                  if (status != 'ACTIVE') 
                  {
                    $node.css('background-color', '#cccccc');
                  }
                  else
                  {
                    $node.css('background-color', '#99ff99');
                  }
                }
            });
    }
    else if(tableID == "prod-details-table")
    {
    //datatables
            // get id
            var prod_id = $('[name="prod_id"]').val();

            table = $('#prod-details-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "../showlist-prod-details/" + prod_id,
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                ],
                "scrollX": true
            });
    }
    else if(tableID == "pack-details-table")
    {
    //datatables
            // get id
            var pack_id = $('[name="pack_id"]').val();

            table = $('#pack-details-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "../showlist-pack-details/" + pack_id,
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                ],
                "scrollX": true
            });
    }
    else if(tableID == "trans-details-table")
    {
    //datatables
            // get id
            var trans_id = $('[name="trans_id"]').val();

            table = $('#trans-details-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
                "ordering": false,
                "searching": false,
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "../showlist-trans-details/" + trans_id,
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                {
                      "targets": 2,
                      "className": "text-right",
                },
                {
                      "targets": 3,
                      "className": "text-right",
                },
                {
                      "targets": 4,
                      "className": "text-right",
                },
                {
                      "targets": 5,
                      "className": "text-center",
                },
                ],

                "rowCallback": function( row, data, index )
                {
                  var status = data[6],
                      $node = this.api().row(row).nodes().to$();

                  if (status == '1') 
                  {
                    $node.css('background-color', '#ffcc66');
                  }
                  else if (status == '2') 
                  {
                    $node.css('background-color', '#ffffcc');
                  }

                  var item_count = data[8];

                  $('[name="item_count"]').val(item_count);
                }
            });
    }




    else if(tableID == "atm-table")
    {
    //datatables
            table = $('#atm-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "atm/atm_controller/ajax_list",
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                ],
                "scrollX": true
            });
    }
    else if(tableID == "clients-table")
    {
    //datatables
            table = $('#clients-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "clients/clients_controller/ajax_list",
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -2 ], // 2nd last column
                    "orderable": false, //set not orderable
                },
                ],

                "rowCallback": function( row, data, index )
                {
                  var sex = data[10],
                      $node = this.api().row(row).nodes().to$();

                  if (sex == 'Male') 
                  {
                    $node.css('background-color', '#ccccff');
                  }
                  else
                  {
                    $node.css('background-color', '#ffcccc');
                  }

                  var status = data[11],
                      $node = this.api().row(row).nodes().to$();

                  if (status == 'active') 
                  {
                    $node.css('background-color', '#99ffff');
                  }
                },
                "scrollX": true 
            });
    }
    else if(tableID == "loans-table")
    {
    //datatables

            // get client_id
            var client_id = $('[name="client_id"]').val();

            table = $('#loans-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
                "ordering": false,
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "../profiles/profiles_controller/ajax_list/" + client_id,
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                {
                      "targets": 1,
                      "className": "text-right",
                },
                {
                      "targets": 2,
                      "className": "text-right",
                },
                {
                      "targets": 3,
                      "className": "text-right",
                },
                {
                      "targets": 4,
                      "className": "text-center",
                },
                {
                      "targets": 5,
                      "className": "text-center",
                },
                {
                      "targets": 6,
                      "className": "text-center",
                },
                {
                      "targets": 7,
                      "className": "text-center",
                },
                {
                      "targets": 8,
                      "className": "text-right",
                },
                {
                      "targets": 9,
                      "className": "text-right",
                },
                {
                      "targets": 10,
                      "className": "text-right",
                }
                ],

                "rowCallback": function( row, data, index )
                {
                  var status = data[6],
                      $node = this.api().row(row).nodes().to$();

                  if (status == 'New') 
                  {
                    $node.css('background-color', '#99ff99');
                  }
                  else if (status == 'Ongoing') 
                  {
                    $node.css('background-color', '#ccff99');
                  }
                  else
                  {
                    $node.css('background-color', '#cccccc');
                  }
                },
                "scrollX": true 
            });
    }
    else if(tableID == "capital-table")
    {
    //datatables

            table = $('#capital-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "capital/capital_controller/ajax_list",
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                {
                      "targets": 1,
                      "className": "text-center",
                },
                {
                      "targets": 2,
                      "className": "text-right",
                },
                {
                      "targets": 3,
                      "className": "text-right",
                },
                {
                      "targets": 4,
                      "className": "text-center",
                },
                {
                      "targets": 5,
                      "className": "text-center",
                }
                ],

                "rowCallback": function( row, data, index ) {
                  var amount = parseFloat(data[2]),
                      $node = this.api().row(row).nodes().to$();

                  // set color based on log type
                  if (amount >= 0) {
                     $node.css('background-color', '#99cccc');
                  }
                  else {
                     $node.css('background-color', '#ffcc99');
                  }
                },    

                "scrollX": true 
            });
    }
    else if(tableID == "top-clients-list-table")
    {
    //datatables

            table = $('#top-clients-list-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
                "ordering": false,
                "searching": false,
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "statistics/statistics_controller/ajax_list",
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                {
                      "targets": 2,
                      "className": "text-right",
                },
                {
                      "targets": 3,
                      "className": "text-right",
                },
                {
                      "targets": 4,
                      "className": "text-center",
                }
                ],  

                "rowCallback": function( row, data, index ) {
                  var has_balance = parseFloat(data[4]),
                      $node = this.api().row(row).nodes().to$();

                  // set color based on log type
                  if (has_balance != 0) {
                     $node.css('background-color', '#ffff66');
                  }

                },   

                "scrollX": true 
            });
    }


    else if(tableID == "logs-table")
    {
            table = $('#logs-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "showlist-logs",
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                ],

                "rowCallback": function( row, data, index ) {
                  var log_type = data[1],
                      $node = this.api().row(row).nodes().to$();

                  // set color based on log type
                  if (log_type == 'Add') {
                     $node.css('background-color', '#99ff99');
                  }
                  else if (log_type == 'Update') {
                     $node.css('background-color', '#99ffff');
                  }
                  else if (log_type == 'Delete') {
                     $node.css('background-color', '#ffcc99');
                  }
                  else if (log_type == 'Logout') {
                     $node.css('background-color', '#cccccc');
                  }
                  else if (log_type == 'Report') {
                     $node.css('background-color', '#ccff99');
                  }
                }               
            });           
    }
    
    else if(tableID == "schedules-table")
    {
            table = $('#schedules-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "showlist-schedules",
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                ],

                "rowCallback": function( row, data, index ) {
                  var log_type = data[6],
                      $node = this.api().row(row).nodes().to$();

                  // set color based on log type
                  if (log_type == 'Today') {
                     $node.css('background-color', '#99ff99');
                  }      
                  else if (log_type == 'Ended') {
                     $node.css('background-color', '#cccccc');
                  }
                  
                }               
            });           
    }

    else if(tableID == "users-table")
    {
            table = $('#users-table').DataTable({ 
         
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
         
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": "showlist-users",
                    "type": "POST",
                },
         
                //Set column definition initialisation properties.
                "columnDefs": [
                { 
                    "targets": [ -1 ], //last column
                    "orderable": false, //set not orderable
                },
                ],

                "rowCallback": function( row, data, index ) {
                  var user_type = data[1], user_id = data[0]
                      $node = this.api().row(row).nodes().to$();

                  // set color to light cyan if admin  
                  if (user_type == 'Administrator') {
                     $node.css('background-color', '#66ffff');
                  }
                  // set color to light gold if super admin
                  if (user_id == 'U101') {
                     $node.css('background-color', '#ffff66');
                  }
                },
                "scrollX": true              
            });           
    }
         
});


// ========================================================== TRANSACTION DETAILS FORM SECTION ====================================

function reload_page() // ---> calling for reload page
{
    location.reload();
}

function go_to_ongoing_trans() // ---> calling for rgo back page
{
    window.location.href='../transactions-page';
}

function go_to_cleared_trans() // ---> calling for rgo back page
{
    window.location.href='../transactions-page-cleared';
}

function go_to_cancelled_trans() // ---> calling for rgo back page
{
    window.location.href='../transactions-page-cancelled';
}



function set_payment() // ---> calling for the Add Modal form
{
    var id = $('[name="trans_id"]').val();
    
    //Ajax Load data from ajax
    $.ajax({
        url : "../edit-transaction/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            var is_updated = data.is_updated; // get current is_updated value

            if (is_updated == 1) // transaction is updated
            {
              bootbox.dialog({
                  title  : "This transaction was updated",
                  message  : "Reloading..."
              });

              setTimeout(function(){ reload_page(); }, 1500);
            }
            else
            {
              save_method = 'set-payment';
              text = 'Set Payment';
              
              $('#form_set_payment')[0].reset(); // reset form on modals
              $('.form-group').removeClass('has-error'); // clear error class
              $('.help-block').empty(); // clear error string
              $('#modal_form_set_payment').modal('show'); // show bootstrap modal
              $('.modal-title').text(text); // Set Title to Bootstrap modal title
            }
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function set_discount() // ---> calling for the Add Modal form
{
    var id = $('[name="trans_id"]').val();
    
    //Ajax Load data from ajax
    $.ajax({
        url : "../edit-transaction/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            var is_updated = data.is_updated; // get current is_updated value

            if (is_updated == 1) // transaction is updated
            {
              bootbox.dialog({
                  title  : "This transaction was updated",
                  message  : "Reloading..."
              });

              setTimeout(function(){ reload_page(); }, 1500);
            }
            else
            {
              save_method = 'set-discount';
              text = 'Set Discount';
              
              $('#form_set_discount')[0].reset(); // reset form on modals
              $('.form-group').removeClass('has-error'); // clear error class
              $('.help-block').empty(); // clear error string
              $('#modal_form_set_discount').modal('show'); // show bootstrap modal
              $('.modal-title').text(text); // Set Title to Bootstrap modal title
            }
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function set_cancel(id) // ---> calling for the Add Modal form
{
  var id = $('[name="trans_id"]').val();
  
  //Ajax Load data from ajax
  $.ajax({
      url : "../edit-transaction/" + id,
      type: "GET",
      dataType: "JSON",
      success: function(data)
      {
          var is_updated = data.is_updated; // get current is_updated value

          if (is_updated == 1) // transaction is updated
          {
            bootbox.dialog({
                title  : "This transaction was updated",
                message  : "Reloading..."
            });

            setTimeout(function(){ reload_page(); }, 1500);
          }
          else
          {
            bootbox.prompt({
                  title: "Enter 'Manager's Password' to proceed",
                  inputType: 'password',
                  callback: function (result) {

                      var managers_password = $('[name="managers_password"]').val();

                      if (result == managers_password) 
                      {
                        bootbox.confirm("ARE YOU SURE YOU WANT TO CANCEL THIS TRANSACTION?", function(result){

                          if (result == true)
                          {
                            // ajax delete data to database
                            $.ajax({
                                url : "../set-cancel/" + id,
                                type: "POST",
                                dataType: "JSON",
                                success: function(data)
                                {
                                    var log_type = 'Delete';

                                    var details = 'Transaction has been cancelled'; 

                                    set_system_log_one(log_type, details);

                                    bootbox.dialog({
                                        title  : "Transaction Cancelled Successfully",
                                        message  : "Transaction Cancellation"
                                    });

                                    setTimeout(function(){ go_to_ongoing_trans(); }, 1200); // delay effect
                                },
                                error: function (jqXHR, textStatus, errorThrown)
                                {
                                    alert('Error deleting data');
                                }
                            });
                          }

                        });
                      }
                      else if (result != null)
                      {
                        
                        bootbox.alert({
                            title: "Incorrect Password Input",
                            message: "Access Denied",
                            callback: function () {
                                
                            }
                        });
                      }
                  }
              });
          }
      },
      error: function (jqXHR, textStatus, errorThrown)
      {
          alert('Error get data from ajax');
      }
  });
}



// ------------------------------------------------- 

// enable / disable input fields when condition is met
$("#method").change(function()
{
    var method = $('[name="method"]').val();

    if (method == "Cash")
    {
        $('[name="card_number"]').val("");

        document.getElementById("cash_amt").disabled = false;

        document.getElementById("card_number").disabled = true;
        document.getElementById("cust_name").disabled = true;

        document.getElementById("cash_input_div").style.display = 'block';
        document.getElementById("cash_buttons").style.display = 'block';
    }
    else if (method == "Credit Card")
    {
        $('[name="cash_amt"]').val("");

        document.getElementById("cash_amt").disabled = true;
        
        document.getElementById("card_number").disabled = false;
        document.getElementById("cust_name").disabled = false;

        document.getElementById("cash_input_div").style.display = 'none';
        document.getElementById("cash_buttons").style.display = 'none';
    }
    else if (method == "Cash Card")
    {
        $('[name="cash_amt"]').val("");

        document.getElementById("cash_amt").disabled = true;
        
        document.getElementById("card_number").disabled = false;
        document.getElementById("cust_name").disabled = false;

        document.getElementById("cash_input_div").style.display = 'none';
        document.getElementById("cash_buttons").style.display = 'none';
    }
});

$("#disc_type_trans_details").change(function()
{
    var disc_type = $('[name="disc_type"]').val();
    var gross_total = $('[name="gross_total"]').val();

    if (disc_type == "")
    {
      $('[name="calc_disc"]').val("");
    }
    else
    {
      //Ajax Load data from ajax
      $.ajax({
          url : "../edit-discount/" + disc_type,
          type: "GET",
          dataType: "JSON",
          success: function(data)
          {
              var less_p = data.less_p;
              var less_c = data.less_c;

              if (less_c == 0) // if disc_type is percentage
              {
                var calc_disc = (gross_total * (less_p / 100));

                $('[name="calc_disc"]').val("₱ " + calc_disc + " ( " + less_p + "% ) ");
              }
              else
              {
                var calc_disc = less_c;

                $('[name="calc_disc"]').val("₱ " + calc_disc + " ( cash ) ");  
              }
          },
          error: function (jqXHR, textStatus, errorThrown)
          {
              alert('Error get data from ajax');
          }
      });
    }
});

function exact_amt_cash_input()
{
    amount_due = parseFloat($('[name="amount_due"]').val());

    $('[name="cash_amt"]').val(amount_due);
}

function add_cash_input(cash_input)
{
    var current_cash = 0;

    if ($('[name="cash_amt"]').val() != "")
    {
      current_cash = parseFloat($('[name="cash_amt"]').val());
    }
    
    var new_cash = (current_cash + cash_input);

    $('[name="cash_amt"]').val(new_cash);
}

function clear_cash_input()
{
    $('[name="cash_amt"]').val("");
}

$( "form" ).submit(function( event ) { // -------------------------------- EXPIREMENTAL FUNCTION (Fixes dismissed modal when add_cash_input buttons are clicked)
  event.preventDefault();
});

function confirm_trans()
{
    // resetting errors in form validations
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string

    $('#btnSave').text('Processing...'); //change button text
    $('#btnSave').attr('disabled',true); //set button disable 
    var url;

    if(save_method == 'set-payment') 
    {
        $form = '#form_set_payment';
        url = "../set-payment";
    }
    if(save_method == 'set-discount') 
    {
        $form = '#form_set_discount';
        url = "../set-discount";
    }   
 
    // ajax adding data to database
    $.ajax({
        url : url,
        type: "POST",
        data: $($form).serialize(),
        dataType: "JSON",
        success: function(data)
        {
 
            if(data.status) //if success close modal and reload ajax table
            {
                $('#modal_form_set_payment').modal('hide');
                $('#modal_form_set_discount').modal('hide');
                
                reload_table();

                // set logs -------------------------------------------------------------------

                var log_type = "";
                var details = "";

                if(save_method == 'set-payment') 
                {
                    log_type = 'Add';

                    details = 'New transaction payment added: S' + $('[name="trans_id"]').val();

                    set_system_log_one(log_type, details);

                    bootbox.dialog({
                        title  : "Payment Processed Successfully",
                        message  : "Transaction Payment"
                    });

                    setTimeout(function(){ go_to_ongoing_trans(); }, 1200); // delay effect
                }
                if(save_method == 'set-discount') 
                {
                    log_type = 'Add';

                    details = 'New transaction discount added: S' + $('[name="trans_id"]').val();

                    set_system_log_one(log_type, details);

                    reload_page();
                }
            }
            else
            {
                for (var i = 0; i < data.inputerror.length; i++) 
                {
                    $('[name="'+data.inputerror[i]+'"]').parent().parent().addClass('has-error'); //select parent twice to select div form-group class and add has-error class
                    $('[name="'+data.inputerror[i]+'"]').next().text(data.error_string[i]); //select span help-block class set text error string
                }
            }
            $('#btnSave').text('Confirm'); //change button text
            $('#btnSave').attr('disabled',false); //set button enable 
 
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error adding / update data');
            $('#btnSave').text('Save'); //change button text
            $('#btnSave').attr('disabled',false); //set button enable 
 
        }
    });
}

function print_bill_out(id) // ---> calling for the Add Modal form
{
    var id = $('[name="trans_id"]').val();
      
      //Ajax Load data from ajax
      $.ajax({
          url : "../edit-transaction/" + id,
          type: "GET",
          dataType: "JSON",
          success: function(data)
          {
              var is_updated = data.is_updated; // get current is_updated value

              if (is_updated == 1) // transaction is updated
              {
                bootbox.dialog({
                    title  : "This transaction was updated",
                    message  : "Reloading..."
                });

                setTimeout(function(){ reload_page(); }, 1500);
              }
              else
              {
                bootbox.prompt({
                      title: "Enter 'Manager's Password' to proceed",
                      inputType: 'password',
                      callback: function (result) {

                          var managers_password = $('[name="managers_password"]').val();

                          if (result == managers_password) 
                          {
                            bootbox.confirm("ARE YOU SURE YOU WANT TO CANCEL THIS TRANSACTION?", function(result){

                              if (result == true)
                              {
                                // ajax delete data to database
                                $.ajax({
                                    url : "../set-cancel/" + id,
                                    type: "POST",
                                    dataType: "JSON",
                                    success: function(data)
                                    {
                                        var log_type = 'Delete';

                                        var details = 'Transaction has been cancelled'; 

                                        set_system_log_one(log_type, details);

                                        reload_table();

                                        // refresh transaction details page
                                        window.location.href=$('[name="trans_id"]').val();
                                    },
                                    error: function (jqXHR, textStatus, errorThrown)
                                    {
                                        alert('Error deleting data');
                                    }
                                });
                              }

                            });
                          }
                          else if (result != null)
                          {
                            
                            bootbox.alert({
                                title: "Incorrect Password Input",
                                message: "Access Denied",
                                callback: function () {
                                    
                                }
                            });
                          }
                      }
                  });
              }
          },
          error: function (jqXHR, textStatus, errorThrown)
          {
              alert('Error get data from ajax');
          }
      });
}

function delete_trans_detail_prod(idone, idtwo)
{
    var id = $('[name="trans_id"]').val();
    
    //Ajax Load data from ajax
    $.ajax({
        url : "../edit-transaction/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            var is_updated = data.is_updated; // get current is_updated value

            if (is_updated == 1) // transaction is updated
            {
              bootbox.dialog({
                  title  : "This transaction was updated",
                  message  : "Reloading..."
              });

              setTimeout(function(){ reload_page(); }, 1500);
            }
            else
            {
              bootbox.prompt({
                  title: "Enter 'Manager's Password' to proceed",
                  inputType: 'password',
                  callback: function (result) {

                      var managers_password = $('[name="managers_password"]').val();

                      if (result == managers_password) 
                      {
                        bootbox.confirm("ARE YOU SURE YOU WANT TO DELETE THIS DATA?", function(result){

                          if (result == true)
                          {
                            // ajax delete data to database
                            $.ajax({
                                url : "../delete-trans-detail-prod/"+idone+"/"+idtwo,
                                type: "POST",
                                dataType: "JSON",
                                success: function(data)
                                {
                                    var log_type = 'Delete';

                                    var details = 'Transaction detail product voided T' + idone 
                                    + ': P' + idtwo; 

                                    set_system_log_one(log_type, details);

                                    // refresh transaction details page
                                    window.location.href=$('[name="trans_id"]').val();

                                    //if success reload ajax table
                                    $('#modal_form').modal('hide');
                                    reload_table();
                                },
                                error: function (jqXHR, textStatus, errorThrown)
                                {
                                    alert('Error deleting data');
                                }
                            });
                          }

                        });
                      }
                      else if (result != null)
                      {
                        bootbox.alert({
                            title: "Incorrect Password Input",
                            message: "Access Denied",
                            callback: function () {
                                
                            }
                        });
                      }
                  }
              });
            }
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}
function delete_trans_detail_pack(idone, idtwo)
{
    var id = $('[name="trans_id"]').val();
    
    //Ajax Load data from ajax
    $.ajax({
        url : "../edit-transaction/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            var is_updated = data.is_updated; // get current is_updated value

            if (is_updated == 1) // transaction is updated
            {
              bootbox.dialog({
                  title  : "This transaction was updated",
                  message  : "Reloading..."
              });

              setTimeout(function(){ reload_page(); }, 1500);
            }
            else
            {
              bootbox.prompt({
                  title: "Enter 'Manager's Password' to proceed",
                  inputType: 'password',
                  callback: function (result) {

                      var managers_password = $('[name="managers_password"]').val();

                      if (result == managers_password) 
                      {
                        bootbox.confirm("ARE YOU SURE YOU WANT TO DELETE THIS DATA?", function(result){

                          if (result == true)
                          {
                            // ajax delete data to database
                            $.ajax({
                                url : "../delete-trans-detail-pack/"+idone+"/"+idtwo,
                                type: "POST",
                                dataType: "JSON",
                                success: function(data)
                                {
                                    var log_type = 'Delete';

                                    var details = 'Transaction detail package voided T' + idone 
                                    + ': G' + idtwo; 

                                    // refresh transaction details page
                                    window.location.href=$('[name="trans_id"]').val();

                                    set_system_log_one(log_type, details);

                                    //if success reload ajax table
                                    $('#modal_form').modal('hide');
                                    reload_table();
                                },
                                error: function (jqXHR, textStatus, errorThrown)
                                {
                                    alert('Error deleting data');
                                }
                            });
                          }

                        });
                      }
                      else if (result != null)
                      {
                        bootbox.alert({
                            title: "Incorrect Password Input",
                            message: "Access Denied",
                            callback: function () {
                                
                            }
                        });
                      }
                  }
              });
            }
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function set_refund_transaction() // ---> calling for the Add Modal form
{
  bootbox.prompt({
        title: "Enter 'Manager's Password' to proceed",
        inputType: 'password',
        callback: function (result) {

            var managers_password = $('[name="managers_password"]').val();

            if (result == managers_password) 
            {
              bootbox.prompt({
                    title: "Enter Transaction's Receipt Number to Refund",
                    inputType: 'text',
                    callback: function (result) {

                        var receipt_no = result;

                        //Ajax Load data from ajax
                        $.ajax({
                            url : "get-transaction-by-receipt/" + receipt_no,
                            type: "GET",
                            dataType: "JSON",
                            success: function(data)
                            {
                              if (data == null)
                              {
                                bootbox.alert({
                                    title: "Transaction Not Found",
                                    message: "Wrong Receipt Number Input",
                                    callback: function () {
                                        
                                    }
                                });
                              }
                              else
                              {
                                window.location.href='trans-details-refund-page/' + data.trans_id;
                              }
                            },
                            error: function (jqXHR, textStatus, errorThrown)
                            {
                                bootbox.alert({
                                    title: "Transaction Not Found",
                                    message: "Wrong Receipt Number Input",
                                    callback: function () {
                                        
                                    }
                                });
                            }
                        });

                    }
                });
            }
            else if (result != null)
            {
              bootbox.alert({
                  title: "Incorrect Password Input",
                  message: "Access Denied",
                  callback: function () {
                      
                  }
              });
            }
        }
    });
}

// ========================================================== DISCOUNTS FORM LISTENER SECTION =====================================


// enable / disable input fields when condition is met
$("#disc_type").change(function()
{
    var disc_type = $('[name="disc_type"]').val();

    if (disc_type == "percentage")
    {
        $('[name="less_c"]').val("");

        document.getElementById("less_p").disabled = false;

        document.getElementById("less_c").disabled = true;
    }
    else if (disc_type == "cash")
    {
        $('[name="less_p"]').val("");

        document.getElementById("less_p").disabled = true;
        
        document.getElementById("less_c").disabled = false;
    }
    
});

$("#discount_prod_id").change(function() // display product's original price when selected on the product discount form
{
    var prod_id = $('[name="prod_id"]').val();

    if (prod_id == "")
    {
      $('[name="orig_price"]').val("");
    }
    else
    {
      //Ajax Load data from ajax
      $.ajax({
          url : "edit-product/" + prod_id,
          type: "GET",
          dataType: "JSON",
          success: function(data)
          {
              $('[name="orig_price"]').val(data.price);
          },
          error: function (jqXHR, textStatus, errorThrown)
          {
              alert('Error get data from ajax');
          }
      });
    }
});

$("#discount_pack_id").change(function() // display package's original price when selected on the package discount form
{
    var pack_id = $('[name="pack_id"]').val();

    if (pack_id == "")
    {
      $('[name="orig_price"]').val("");
    }
    else
    {
      //Ajax Load data from ajax
      $.ajax({
          url : "edit-package/" + pack_id,
          type: "GET",
          dataType: "JSON",
          success: function(data)
          {
              $('[name="orig_price"]').val(data.price);
          },
          error: function (jqXHR, textStatus, errorThrown)
          {
              alert('Error get data from ajax');
          }
      });
    }
});


// ================================================================== VIEW IMAGE SECTION ==========================================


// reset file path everytime modal_form_view is closed - for image upload
$('#modal_form_view').on('hidden.bs.modal', function(){
    $("#userfile").val("");
});

function readURL(input,image) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        
        reader.onload = function (e) {
            $(image).attr('src', e.target.result);
        }
        
        reader.readAsDataURL(input.files[0]);
    }
}

$("#userfile1").change(function(){
    readURL(this,'#image1');
});

$("#userfile2").change(function(){
    readURL(this,'#image2');
});

$("#userfile3").change(function(){
    readURL(this,'#image3');
});

// if attendance_date selection box is changed
// $("#attendance_date").change(function(){
//     window.location.href='../attendance-page/' + $('[name="attendance_date"]').val();
// });


// ================================================== VIEW SECTION =================================================================



function view_product(prod_id)
{
     window.location.href='prod-details-page/' + prod_id;
}

function view_package(pack_id)
{
     window.location.href='pack-details-page/' + pack_id;
}

function view_table(tbl_id)
{
     window.location.href='tbl-details-page/' + tbl_id;
}

function view_transaction(trans_id)
{
     window.location.href='trans-details-page/' + trans_id;
}

function view_loan(client_id, loan_id)
{
     window.location.href='transactions-page/' + client_id + '/' + loan_id;
}

function edit_privileges(id) // for customer table
{
    save_method = 'update-privileges';
    $('#form')[0].reset(); // reset form on modals
    $('#form_privileges')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : "edit-user/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="user_id"]').val(data.user_id);
            $('[name="administrator"]').val(data.administrator).prop('selected', true);
            $('[name="current_administrator"]').val(data.administrator);
            
            //$('[name="report"]').val(data.report).prop('selected', true);

            $('#modal_form_privileges').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Privileges'); // Set title to Bootstrap modal title
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function view_edit_user(id) // for customer table
{
    save_method = 'update-user';
    $('#form')[0].reset(); // reset form on modals
    $('#form_privileges')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : "edit-user/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="user_id"]').val(data.user_id);
            $('[name="username"]').val(data.username);
            $('[name="password"]').val(data.password);
            $('[name="repassword"]').val(data.password);
            $('[name="current_username"]').val(data.username);
            $('[name="lastname"]').val(data.lastname);
            $('[name="firstname"]').val(data.firstname);
            $('[name="middlename"]').val(data.middlename);
            $('[name="current_name"]').val(data.lastname + data.firstname + data.middlename);
            $('[name="contact"]').val(data.contact);
            $('[name="email"]').val(data.email);
            $('[name="address"]').val(data.address);

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit User'); // Set title to Bootstrap modal title
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}


// ================================================== ADD SECTION ======================================================================

function add_item() // ---> calling for the Add Modal form
{
    save_method = 'add-item';
    text = 'Add Item';
    
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text(text); // Set Title to Bootstrap modal title
}

function add_product() // ---> calling for the Add Modal form
{
    save_method = 'add-product';
    text = 'Add Product';
    
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text(text); // Set Title to Bootstrap modal title
}

function add_package() // ---> calling for the Add Modal form
{
    save_method = 'add-package';
    text = 'Add Package';
    
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text(text); // Set Title to Bootstrap modal title
}

function add_category() // ---> calling for the Add Modal form
{
    save_method = 'add-category';
    text = 'Add Category';
    
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text(text); // Set Title to Bootstrap modal title
}

function add_table() // ---> calling for the Add Modal form
{
    save_method = 'add-table';
    text = 'Add Table';
    
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string

    $('[name="status"]').prop('disabled', true);

    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text(text); // Set Title to Bootstrap modal title
}

function add_discount() // ---> calling for the Add Modal form
{
    save_method = 'add-discount';
    text = 'Add Discount';
    
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string

    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text(text); // Set Title to Bootstrap modal title
}

function add_prod_discount() // ---> calling for the Add Modal form
{
    save_method = 'add-prod-discount';
    text = 'Add Product Discount';
    
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string

    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text(text); // Set Title to Bootstrap modal title
}

function add_pack_discount() // ---> calling for the Add Modal form
{
    save_method = 'add-pack-discount';
    text = 'Add Package Discount';
    
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string

    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text(text); // Set Title to Bootstrap modal title
}

function add_prod_detail() // ---> calling for the Add Modal form
{
    save_method = 'add-prod-detail';
    text = 'Add Product Item';

    $('[name="item_id"]').prop('disabled', false);
    
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text(text); // Set Title to Bootstrap modal title
}

function add_pack_detail() // ---> calling for the Add Modal form
{
    save_method = 'add-pack-detail';
    text = 'Add Package Product';

    $('[name="prod_id"]').prop('disabled', false);
    
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text(text); // Set Title to Bootstrap modal title
}




function add_atm() // ---> calling for the Add Modal form
{
    save_method = 'add-atm';
    text = 'Add ATM Bank';
    
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text(text); // Set Title to Bootstrap modal title
}

function add_client() // ---> calling for the Add Modal form
{
    save_method = 'add-client';
    text = 'Add Client';
    
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text(text); // Set Title to Bootstrap modal title
}

function add_loan() // ---> calling for the Add Modal form
{
    save_method = 'add-loan';
    text = 'Add New Loan';
    
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text(text); // Set Title to Bootstrap modal title
}

function add_payment() // ---> calling for the Add Modal form
{
    save_method = 'add-payment';
    text = 'Add Payment';
    
    $('#form_add_payment')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form_add_payment').modal('show'); // show bootstrap modal
    $('.modal-title').text(text); // Set Title to Bootstrap modal title
}


function add_interest() // ---> calling for the Add Modal form
{
    save_method = 'add-interest';
    text = 'Add Interest';
    
    $('#form_add_interest')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form_add_interest').modal('show'); // show bootstrap modal
    $('.modal-title').text(text); // Set Title to Bootstrap modal title
}


function adjust_loan() // ---> calling for the Add Modal form
{
    save_method = 'adjust-loan';
    text = 'Adjust Loan';
    
    $('#form_adjust_loan')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form_adjust_loan').modal('show'); // show bootstrap modal
    $('.modal-title').text(text); // Set Title to Bootstrap modal title
}

function adjust_capital() // ---> calling for the Add Modal form
{
    save_method = 'adjust-capital';
    text = 'Adjust Capital';
    
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text(text); // Set Title to Bootstrap modal title
}

function add_schedule() // ---> calling for the Add Modal form
{
    save_method = 'add-schedule';
    text = 'Add Appointment Schedule Record';
    
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text(text); // Set Title to Bootstrap modal title
}


function add_user()
{
    save_method = 'add-user';

    $('#form')[0].reset(); // reset form on modals
    $('#form_privileges')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text('Add User'); // Set Title to Bootstrap modal title
}


// ================================================ EDIT SECTION =========================================================================



function edit_item(id)
{
    save_method = 'update-item';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : "edit-item/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="item_id"]').val(data.item_id);
            $('[name="name"]').val(data.name);
            $('[name="descr"]').val(data.descr);
            $('[name="type"]').val(data.type).prop('selected', true);
            
            $('[name="current_name"]').val(data.name);

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Item'); // Set title to Bootstrap modal title
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function edit_product(id)
{
    save_method = 'update-product';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : "edit-product/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="prod_id"]').val(data.prod_id);
            $('[name="name"]').val(data.name);
            $('[name="short_name"]').val(data.short_name);
            $('[name="descr"]').val(data.descr);

            $('[name="cat_id"]').val(data.cat_id).prop('selected', true);

            $('[name="price"]').val(data.price);

            $('[name="current_name"]').val(data.name);
            $('[name="current_short_name"]').val(data.short_name);

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Product'); // Set title to Bootstrap modal title
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function edit_package(id)
{
    save_method = 'update-package';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : "edit-package/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="pack_id"]').val(data.pack_id);
            $('[name="name"]').val(data.name);
            $('[name="short_name"]').val(data.short_name);
            $('[name="descr"]').val(data.descr);

            $('[name="price"]').val(data.price);

            $('[name="current_name"]').val(data.name);
            $('[name="current_short_name"]').val(data.short_name);

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Package'); // Set title to Bootstrap modal title
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function edit_category(id)
{
    save_method = 'update-category';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : "edit-category/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="cat_id"]').val(data.cat_id);
            $('[name="name"]').val(data.name);
            $('[name="descr"]').val(data.descr);

            $('[name="current_name"]').val(data.name);

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Category'); // Set title to Bootstrap modal title
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function edit_table(id)
{
    save_method = 'update-table';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : "edit-table/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="tbl_id"]').val(data.tbl_id);
            $('[name="name"]').val(data.name);
            $('[name="status"]').val(data.status).prop('selected', true).prop('disabled', false);

            $('[name="current_name"]').val(data.name);

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Table'); // Set title to Bootstrap modal title
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function edit_discount(id)
{
    save_method = 'update-discount';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : "edit-discount/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="disc_id"]').val(data.disc_id);
            $('[name="name"]').val(data.name);
            $('[name="descr"]').val(data.descr);

            if (data.less_c == 0)
            {
              $('[name="disc_type"]').val('percentage').prop('selected', true);
              $('[name="less_p"]').val(data.less_p).prop('disabled', false);
              $('[name="less_c"]').val(data.less_c).prop('disabled', true);  
            }
            else
            {
              $('[name="disc_type"]').val('cash').prop('selected', true);
              $('[name="less_p"]').val(data.less_p).prop('disabled', true);
              $('[name="less_c"]').val(data.less_c).prop('disabled', false);
            }
            
            $('[name="current_name"]').val(data.name);

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Discount'); // Set title to Bootstrap modal title
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function edit_prod_discount(id)
{
    save_method = 'update-prod-discount';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : "edit-prod-discount/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="pd_id"]').val(data.pd_id);
            $('[name="prod_id"]').val(data.prod_id).prop('selected', true);

            $('[name="remarks"]').val(data.remarks);

            $('[name="date_start"]').val(data.date_start);
            $('[name="date_end"]').val(data.date_end);

            $('[name="status"]').val(data.status).prop('selected', true);

            $('[name="new_price"]').val(data.new_price);
            
            $('[name="current_name"]').val(data.prod_id);

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Product Discount'); // Set title to Bootstrap modal title
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function edit_pack_discount(id)
{
    save_method = 'update-pack-discount';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : "edit-pack-discount/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="pd_id"]').val(data.pd_id);
            $('[name="pack_id"]').val(data.pack_id).prop('selected', true);

            $('[name="remarks"]').val(data.remarks);

            $('[name="date_start"]').val(data.date_start);
            $('[name="date_end"]').val(data.date_end);

            $('[name="status"]').val(data.status).prop('selected', true);

            $('[name="new_price"]').val(data.new_price);
            
            $('[name="current_name"]').val(data.pack_id);

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Package Discount'); // Set title to Bootstrap modal title
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function edit_store_config(id)
{
    save_method = 'update-store-config';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : "edit-store-config/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="conf_id"]').val(data.conf_id);
            $('[name="name"]').val(data.name);
            $('[name="address"]').val(data.address);
            $('[name="city"]').val(data.city);
            $('[name="tin"]').val(data.tin);
            $('[name="vat"]').val(data.vat);
            $('[name="bs_price"]').val(data.bs_price);
            $('[name="password"]').val(data.password);

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Store Config'); // Set title to Bootstrap modal title
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function edit_prod_detail_qty(idone, idtwo)
{
    save_method = 'update-prod-detail';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : "../edit-prod-detail/" + idone + "/" + idtwo,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="item_id"]').val(data.item_id).prop('selected', true).prop('disabled', true);
            $('[name="qty"]').val(data.qty);

            $('[name="current_item_id"]').val(data.item_id);

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Product Item'); // Set title to Bootstrap modal title
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function edit_pack_detail_qty(idone, idtwo)
{
    save_method = 'update-pack-detail';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : "../edit-pack-detail/" + idone + "/" + idtwo,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="prod_id"]').val(data.prod_id).prop('selected', true).prop('disabled', true);
            $('[name="qty"]').val(data.qty);

            $('[name="current_prod_id"]').val(data.prod_id);

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Package Product'); // Set title to Bootstrap modal title
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}




function edit_client(id)
{
    save_method = 'update-client';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : "clients/clients_controller/ajax_edit/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="client_id"]').val(data.client_id);
            $('[name="lname"]').val(data.lname);
            $('[name="fname"]').val(data.fname);

            $('[name="sex"]').val(data.sex).prop('selected', true);
            $('[name="contact"]').val(data.contact);
            $('[name="address"]').val(data.address);
            
            $('[name="comp_id"]').val(data.comp_id).prop('selected', true);
            $('[name="job"]').val(data.job);
            $('[name="salary"]').val(data.salary);

            $('[name="atm_id"]').val(data.atm_id).prop('selected', true);
            $('[name="atm_type"]').val(data.atm_type).prop('selected', true);
            $('[name="pin"]').val(data.pin)

            $('[name="remarks"]').val(data.remarks);
            $('[name="current_name"]').val(data.lname + data.fname);

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Client'); // Set title to Bootstrap modal title
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function edit_loan(id)
{
    save_method = 'update-loan';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : "../profiles/profiles_controller/ajax_edit/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="loan_id"]').val(data.loan_id);
            
            $('[name="amount"]').val(data.amount);
            $('[name="interest"]').val(data.interest);
            $('[name="total"]').val(data.total);

            $('[name="date_start"]').val(data.date_start);
            $('[name="date_end"]').val(data.date_end);
            
            $('[name="remarks"]').val(data.remarks);
            
            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Loan'); // Set title to Bootstrap modal title
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function edit_loan_date_remarks(id)
{
    save_method = 'update-loan-date-remarks';
    $('#form_edit_date_remarks')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : "../profiles/profiles_controller/ajax_edit/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="loan_id"]').val(data.loan_id);

            $('[name="date_start"]').val(data.date_start);
            $('[name="remarks"]').val(data.remarks);
            
            $('#modal_form_edit_date_remarks').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Loan Date/Remarks'); // Set title to Bootstrap modal title
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function edit_trans_date_remarks(id)
{
    save_method = 'update-trans-date-remarks';
    $('#form_edit_date_remarks')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : "../../../transactions/transactions_controller/ajax_edit/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="trans_id"]').val(data.trans_id);
            $('[name="total"]').val(data.total);
            $('[name="date"]').val(data.date);
            $('[name="remarks"]').val(data.remarks);

            $('#modal_form_edit_date_remarks').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Transaction Date/Remarks'); // Set title to Bootstrap modal title
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function edit_capital_date_remarks(id)
{
    save_method = 'update-capital-date-remarks';
    $('#form_edit_date_remarks')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : "capital/capital_controller/ajax_edit/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="capital_id"]').val(data.capital_id);

            $('[name="date"]').val(data.date);
            $('[name="remarks"]').val(data.remarks);

            $('#modal_form_edit_date_remarks').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Capital Adjustment Date/Remarks'); // Set title to Bootstrap modal title
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function edit_schedule(id)
{
    save_method = 'update-schedule';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : "Schedules/Schedules_controller/ajax_edit/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="sched_id"]').val(data.sched_id);
            $('[name="title"]').val(data.title);
            $('[name="date"]').val(data.date);
            $('[name="time"]').val(data.time);
            $('[name="remarks"]').val(data.remarks);

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Appointment Schedule'); // Set title to Bootstrap modal title
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

// function edit_cis_view(child_id)
// {
//     window.location.href='edit-cis-page/' + child_id;
// }



function reload_table()
{
    table.ajax.reload(null,false); //reload datatable ajax
}

function cancel_trans()
{
    window.location.href='../../../profiles-page/' + $('[name="client_id"]').val();
}



// =================================================== SAVE SECTION =====================================================================



function save()
{
    // resetting errors in form validations
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string

    $('#btnSave').text('Saving...'); //change button text
    $('#btnSave').attr('disabled',true); //set button disable 
    var url;
 
    // initialize form for both add and update as default 
    $form = '#form';

    if(save_method == 'add-item') 
    {
        url = "add-item";
    }
    else if(save_method == 'update-item') 
    {
        url = "update-item";
    }
    else if(save_method == 'add-product') 
    {
        url = "add-product";
    }
    else if(save_method == 'update-product') 
    {
        url = "update-product";
    }
    else if(save_method == 'add-package') 
    {
        url = "add-package";
    }
    else if(save_method == 'update-package') 
    {
        url = "update-package";
    }
    else if(save_method == 'add-category') 
    {
        url = "add-category";
    }
    else if(save_method == 'update-category') 
    {
        url = "update-category";
    }
    else if(save_method == 'add-table') 
    {
        url = "add-table";
    }
    else if(save_method == 'update-table') 
    {
        url = "update-table";
    }
    else if(save_method == 'add-discount') 
    {
        url = "add-discount";
    }
    else if(save_method == 'update-discount') 
    {
        url = "update-discount";
    }
    else if(save_method == 'add-prod-discount') 
    {
        url = "add-prod-discount";
    }
    else if(save_method == 'update-prod-discount') 
    {
        url = "update-prod-discount";
    }
    else if(save_method == 'add-pack-discount') 
    {
        url = "add-pack-discount";
    }
    else if(save_method == 'update-pack-discount') 
    {
        url = "update-pack-discount";
    }
    else if(save_method == 'update-store-config') 
    {
        url = "update-store-config";
    }

    else if(save_method == 'add-prod-detail') 
    {
        url = "../add-prod-detail";
    }
    else if(save_method == 'update-prod-detail') 
    {
        url = "../update-prod-detail";
    }
    else if(save_method == 'add-pack-detail') 
    {
        url = "../add-pack-detail";
    }
    else if(save_method == 'update-pack-detail') 
    {
        url = "../update-pack-detail";
    }






    else if(save_method == 'add-atm') 
    {
        url = "atm/atm_controller/ajax_add";
    }
    else if(save_method == 'update-atm') 
    {
        url = "atm/atm_controller/ajax_update";
    }
    else if(save_method == 'add-loan') 
    {
        url = "../profiles/profiles_controller/ajax_add";
    }
    else if(save_method == 'update-loan') 
    {
        url = "../profiles/profiles_controller/ajax_update";
    }
    else if(save_method == 'update-loan-date-remarks') 
    {
        $form = '#form_edit_date_remarks';
        url = "../profiles/profiles_controller/ajax_update_date_remarks";
    }
    else if(save_method == 'add-payment') 
    {
        $form = '#form_add_payment';
        url = "../../../transactions/transactions_controller/ajax_paid";
    }
    else if(save_method == 'add-interest') 
    {
        $form = '#form_add_interest';
        url = "../../../transactions/transactions_controller/ajax_add_interest";
    }
    else if(save_method == 'adjust-loan') 
    {
        $form = '#form_adjust_loan';
        url = "../../../transactions/transactions_controller/ajax_adjustment";
    }
    else if(save_method == 'update-trans-date-remarks') 
    {
        $form = '#form_edit_date_remarks';
        url = "../../../transactions/transactions_controller/ajax_update";
    }
    else if(save_method == 'adjust-capital') 
    {
        $form = '#form';
        url = "capital/capital_controller/ajax_add";
    }
    else if(save_method == 'update-capital-date-remarks') 
    {
        $form = '#form_edit_date_remarks';
        url = "capital/capital_controller/ajax_update";
    }
    
    else if(save_method == 'add-schedule') 
    {
        url = "Schedules/Schedules_controller/ajax_add";
    }
    else if(save_method == 'update-schedule') 
    {
        url = "Schedules/Schedules_controller/ajax_update";
    }

    else if(save_method == 'add-user') 
    {
        url = "Users/Users_controller/ajax_add";
    }
    else if(save_method == 'update-user') 
    {
        url = "Users/Users_controller/ajax_update";
    }
    else if(save_method == 'update-privileges') 
    {
        // change form for add stock to form_add_stock
        $form = '#form_privileges';
        url = "Users/Users_controller/ajax_privileges_update";
    }
 
    // ajax adding data to database
    $.ajax({
        url : url,
        type: "POST",
        data: $($form).serialize(),
        dataType: "JSON",
        success: function(data)
        {
 
            if(data.status) //if success close modal and reload ajax table
            {
                $('#modal_form').modal('hide');
                $('#modal_form_edit').modal('hide');
                
                $('#modal_form_privileges').modal('hide');

                $('#modal_form_add_payment').modal('hide');
                $('#modal_form_add_interest').modal('hide');
                $('#modal_form_adjust_loan').modal('hide');
                $('#modal_form_edit_date_remarks').modal('hide');
                
                if (save_method != 'update-store-config')
                {
                  reload_table();
                }


                // set logs -------------------------------------------------------------------

                var log_type = "";
                var details = "";

                if(save_method == 'add-item') 
                {
                    log_type = 'Add';

                    details = 'New item added: ' + $('[name="name"]').val();

                    set_system_log(log_type, details);
                }
                else if(save_method == 'update-item') 
                {
                    log_type = 'Update';

                    details = 'Item updated I' + $('[name="item_id"]').val() 
                    + ': ' + $('[name="current_name"]').val() + ' to ' + $('[name="name"]').val();

                    set_system_log(log_type, details);
                }
                else if(save_method == 'add-product')
                {
                    log_type = 'Add';

                    details = 'New product added: ' + $('[name="name"]').val(); 

                    set_system_log(log_type, details);
                }
                else if(save_method == 'update-product') 
                {
                    log_type = 'Update';

                    details = 'Product updated P' + $('[name="prod_id"]').val() 
                    + ': ' + $('[name="current_name"]').val() + ' to ' + $('[name="name"]').val();

                    set_system_log(log_type, details);
                }
                else if(save_method == 'add-package')
                {
                    log_type = 'Add';

                    details = 'New package added: ' + $('[name="name"]').val(); 

                    set_system_log(log_type, details);
                }
                else if(save_method == 'update-package') 
                {
                    log_type = 'Update';

                    details = 'Package updated G' + $('[name="pack_id"]').val() 
                    + ': ' + $('[name="current_name"]').val() + ' to ' + $('[name="name"]').val();

                    set_system_log(log_type, details);
                }
                else if(save_method == 'add-category')
                {
                    log_type = 'Add';

                    details = 'New category added: ' + $('[name="name"]').val(); 

                    set_system_log(log_type, details);
                }
                else if(save_method == 'update-category') 
                {
                    log_type = 'Update';

                    details = 'Category updated C' + $('[name="cat_id"]').val() 
                    + ': ' + $('[name="current_name"]').val() + ' to ' + $('[name="name"]').val();

                    set_system_log(log_type, details);
                }
                else if(save_method == 'add-table')
                {
                    log_type = 'Add';

                    details = 'New table added: ' + $('[name="name"]').val(); 

                    set_system_log(log_type, details);
                }
                else if(save_method == 'update-table') 
                {
                    log_type = 'Update';

                    details = 'Table updated T' + $('[name="tbl_id"]').val() 
                    + ': ' + $('[name="current_name"]').val() + ' to ' + $('[name="name"]').val();

                    set_system_log(log_type, details);
                }
                else if(save_method == 'add-discount')
                {
                    log_type = 'Add';

                    details = 'New discount added: ' + $('[name="name"]').val(); 

                    set_system_log(log_type, details);
                }
                else if(save_method == 'update-discount') 
                {
                    log_type = 'Update';

                    details = 'Discount updated D' + $('[name="tbl_id"]').val() 
                    + ': ' + $('[name="current_name"]').val() + ' to ' + $('[name="name"]').val();

                    set_system_log(log_type, details);
                }
                else if(save_method == 'add-prod-discount')
                {
                    log_type = 'Add';

                    details = 'New product discount added: P' + $('[name="prod_id"]').val(); 

                    set_system_log(log_type, details);
                }
                else if(save_method == 'update-prod-discount') 
                {
                    log_type = 'Update';

                    details = 'Product discount updated P' + $('[name="prod_id"]').val();

                    set_system_log(log_type, details);
                }
                else if(save_method == 'add-pack-discount')
                {
                    log_type = 'Add';

                    details = 'New package discount added: G' + $('[name="prod_id"]').val(); 

                    set_system_log(log_type, details);
                }
                else if(save_method == 'update-pack-discount') 
                {
                    log_type = 'Update';

                    details = 'Package discount updated G' + $('[name="prod_id"]').val();

                    set_system_log(log_type, details);
                }
                else if(save_method == 'update-store-config') 
                {
                    log_type = 'Update';

                    details = 'Store config updated';

                    set_system_log(log_type, details);

                    window.location.href="store-config-page";
                }

                else if(save_method == 'add-prod-detail')
                {
                    log_type = 'Add';

                    details = 'New product item added: ' + $('[name="item_id"]').val(); 

                    set_system_log_one(log_type, details);
                }
                else if(save_method == 'update-prod-detail') 
                {
                    log_type = 'Update';

                    details = 'Product item updated P' + $('[name="prod_id"]').val();

                    set_system_log_one(log_type, details);
                }
                else if(save_method == 'add-pack-detail')
                {
                    log_type = 'Add';

                    details = 'New package product added: ' + $('[name="pack_id"]').val(); 

                    set_system_log_one(log_type, details);
                }
                else if(save_method == 'update-pack-detail') 
                {
                    log_type = 'Update';

                    details = 'Package product updated G' + $('[name="pack_id"]').val();

                    set_system_log_one(log_type, details);
                }





                else if(save_method == 'add-atm')
                {
                    log_type = 'Add';

                    details = 'New ATM bank added: ' + $('[name="name"]').val(); 

                    set_system_log(log_type, details);
                }
                else if(save_method == 'update-atm') 
                {
                    log_type = 'Update';

                    details = 'ATM Bank updated A' + $('[name="atm_id"]').val() 
                    + ': ' + $('[name="current_name"]').val() + ' to ' + $('[name="name"]').val();

                    set_system_log(log_type, details);
                }
                else if(save_method == 'add-payment')
                {
                    log_type = 'Add';

                    details = 'New payment added to Loan ID: L' + $('[name="loan_id"]').val() + ' of Client: ' 
                    + $('[name="client_name"]').val(); 

                    set_system_log_three(log_type, details);

                    // refresh transaction page
                    window.location.href='../' +  $('[name="client_id"]').val() + '/' + $('[name="loan_id"]').val();
                }
                else if(save_method == 'add-interest')
                {
                    log_type = 'Add';

                    details = 'New interest added to Loan ID: L' + $('[name="loan_id"]').val() + ' of Client: ' 
                    + $('[name="client_name"]').val(); 

                    set_system_log_three(log_type, details);

                    // refresh transaction page
                    window.location.href='../' +  $('[name="client_id"]').val() + '/' + $('[name="loan_id"]').val();
                }
                else if(save_method == 'adjust-loan')
                {
                    log_type = 'Update';

                    details = 'New loan adjustment to Loan ID: L' + $('[name="loan_id"]').val() + ' of Client: ' 
                    + $('[name="client_name"]').val(); 

                    set_system_log_three(log_type, details);

                    // refresh transaction page
                    window.location.href='../' +  $('[name="client_id"]').val() + '/' + $('[name="loan_id"]').val();
                }
                else if(save_method == 'update-trans-date-remarks') 
                {
                    log_type = 'Update';

                    details = 'Transaction updated T' + $('[name="trans_id"]').val() + ' of Client: ' 
                    + $('[name="client_name"]').val(); 

                    set_system_log_three(log_type, details);
                }
                else if(save_method == 'adjust-capital')
                {
                    log_type = 'Update';

                    details = 'New capital adjustment'; 

                    set_system_log(log_type, details);

                    // refresh capital page
                    window.location.href='';
                }
                else if(save_method == 'update-capital-date-remarks') 
                {
                    log_type = 'Update';

                    details = 'Capital adjustment updated to: P' + $('[name="capital_id"]').val(); 

                    set_system_log(log_type, details);
                }

                else if(save_method == 'add-schedule')
                {
                    log_type = 'Add';

                    details = 'New schedule added: ' + $('[name="title"]').val(); 

                    set_system_log(log_type, details);
                }
                else if(save_method == 'update-schedule') 
                {
                    log_type = 'Update';

                    details = 'Schedule updated S' + $('[name="sched_id"]').val() 
                    + ': ' + $('[name="title"]').val();

                    set_system_log(log_type, details);
                }
                else if(save_method == 'add-loan') 
                {
                    log_type = 'Add';

                    details = 'New loan added to: C' + $('[name="client_id"]').val() + ': ' + $('[name="client_name"]').val();

                    set_system_log_one(log_type, details);
                }
                else if(save_method == 'update-loan') 
                {
                    log_type = 'Update';

                    details = 'Loan updated to: C' + $('[name="client_id"]').val() + ': ' + $('[name="client_name"]').val();

                    set_system_log_one(log_type, details);
                }
                else if(save_method == 'update-loan-date-remarks') 
                {
                    log_type = 'Update';

                    details = 'Loan updated to: C' + $('[name="client_id"]').val() + ': ' + $('[name="client_name"]').val();

                    set_system_log_one(log_type, details);
                }
                

                else if(save_method == 'add-user') 
                {
                    log_type = 'Add';

                    details = 'New user added: ' + $('[name="username"]').val();

                    set_system_log(log_type, details);
                }
                else if(save_method == 'update-user') 
                {
                    log_type = 'Update';

                    details = 'User record updated U' + $('[name="user_id"]').val() + ': ' 
                    + $('[name="username"]').val();

                    set_system_log(log_type, details);
                }
                else if(save_method == 'update-privileges') 
                {
                    log_type = 'Update';

                    details = 'User record updated U' + $('[name="user_id"]').val();

                    set_system_log(log_type, details);
                }
            }
            else
            {
                for (var i = 0; i < data.inputerror.length; i++) 
                {
                    $('[name="'+data.inputerror[i]+'"]').parent().parent().addClass('has-error'); //select parent twice to select div form-group class and add has-error class
                    $('[name="'+data.inputerror[i]+'"]').next().text(data.error_string[i]); //select span help-block class set text error string
                }
            }
            $('#btnSave').text('Save'); //change button text
            $('#btnSave').attr('disabled',false); //set button enable 
 
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error adding / update data');
            $('#btnSave').text('Save'); //change button text
            $('#btnSave').attr('disabled',false); //set button enable 
 
        }
    });
}




// ================================================= LOGS SECTION ===========================================================================




function set_system_log(log_type, details)
{
    // sanitize illegal string characters
    var cleanString = details.replace(/[|&;$%@"<>()+,]/g, "");

    $.ajax({
        url : "Logs/Logs_controller/ajax_add/" + log_type + '/' + cleanString,
        type: "POST",
        dataType: "JSON",
        success: function(data)
        {

        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

// back url by one (../)
function set_system_log_one(log_type, details)
{
    // sanitize illegal string characters
    var cleanString = details.replace(/[|&;$%@"<>()+,]/g, "");

    $.ajax({
        url : "../Logs/Logs_controller/ajax_add/" + log_type + '/' + cleanString,
        type: "POST",
        dataType: "JSON",
        success: function(data)
        {

        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

// back url by two (../../)
function set_system_log_two(log_type, details)
{
    // sanitize illegal string characters
    var cleanString = details.replace(/[|&;$%@"<>()+,]/g, "");

    $.ajax({
        url : "../../Logs/Logs_controller/ajax_add/" + log_type + '/' + cleanString,
        type: "POST",
        dataType: "JSON",
        success: function(data)
        {

        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}   

// back url by three (../../../)
function set_system_log_three(log_type, details)
{
    // sanitize illegal string characters
    var cleanString = details.replace(/[|&;$%@"<>()+,]/g, "");

    $.ajax({
        url : "../../../Logs/Logs_controller/ajax_add/" + log_type + '/' + cleanString,
        type: "POST",
        dataType: "JSON",
        success: function(data)
        {

        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
} 





// ================================================= DELETE SECTION =========================================================================



function delete_item(id, name)
{
    if(confirm('Are you sure to delete this data?'))
    {
        // ajax delete data to database
        $.ajax({
            url : "delete-item/"+id,
            type: "POST",
            dataType: "JSON",
            success: function(data)
            {
                var log_type = 'Delete';

                var details = 'Item deleted I' + id; 

                set_system_log(log_type, details);

                //if success reload ajax table
                $('#modal_form').modal('hide');
                reload_table();
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error deleting data');
            }
        });
 
    }
}
function delete_product(id, name)
{
    if(confirm('Are you sure to delete this data?'))
    {
        // ajax delete data to database
        $.ajax({
            url : "delete-product/"+id,
            type: "POST",
            dataType: "JSON",
            success: function(data)
            {
                var log_type = 'Delete';

                var details = 'Product deleted P' + id 
                + ': ' + name; 

                set_system_log(log_type, details);

                //if success reload ajax table
                $('#modal_form').modal('hide');
                reload_table();
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error deleting data');
            }
        });
 
    }
}
function delete_package(id, name)
{
    if(confirm('Are you sure to delete this data?'))
    {
        // ajax delete data to database
        $.ajax({
            url : "delete-package/"+id,
            type: "POST",
            dataType: "JSON",
            success: function(data)
            {
                var log_type = 'Delete';

                var details = 'Package deleted G' + id 
                + ': ' + name; 

                set_system_log(log_type, details);

                //if success reload ajax table
                $('#modal_form').modal('hide');
                reload_table();
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error deleting data');
            }
        });
 
    }
}
function delete_category(id, name)
{
    if(confirm('Are you sure to delete this data?'))
    {
        // ajax delete data to database
        $.ajax({
            url : "delete-category/"+id,
            type: "POST",
            dataType: "JSON",
            success: function(data)
            {
                var log_type = 'Delete';

                var details = 'Category deleted C' + id 
                + ': ' + name; 

                set_system_log(log_type, details);

                //if success reload ajax table
                $('#modal_form').modal('hide');
                reload_table();
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error deleting data');
            }
        });
 
    }
}
function delete_table(id, name)
{
    if(confirm('Are you sure to delete this data?'))
    {
        // ajax delete data to database
        $.ajax({
            url : "delete-table/"+id,
            type: "POST",
            dataType: "JSON",
            success: function(data)
            {
                var log_type = 'Delete';

                var details = 'Table deleted T' + id 
                + ': ' + name; 

                set_system_log(log_type, details);

                //if success reload ajax table
                $('#modal_form').modal('hide');
                reload_table();
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error deleting data');
            }
        });
 
    }
}
function delete_discount(id, name)
{
    if(confirm('Are you sure to delete this data?'))
    {
        // ajax delete data to database
        $.ajax({
            url : "delete-discount/"+id,
            type: "POST",
            dataType: "JSON",
            success: function(data)
            {
                var log_type = 'Delete';

                var details = 'Discount deleted D' + id 
                + ': ' + name; 

                set_system_log(log_type, details);

                //if success reload ajax table
                $('#modal_form').modal('hide');
                reload_table();
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error deleting data');
            }
        });
 
    }
}
function delete_prod_discount(id, name)
{
    if(confirm('Are you sure to delete this data?'))
    {
        // ajax delete data to database
        $.ajax({
            url : "delete-prod-discount/"+id,
            type: "POST",
            dataType: "JSON",
            success: function(data)
            {
                var log_type = 'Delete';

                var details = 'Product discount deleted: ' + name; 

                set_system_log(log_type, details);

                //if success reload ajax table
                $('#modal_form').modal('hide');
                reload_table();
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error deleting data');
            }
        });
 
    }
}
function delete_pack_discount(id, name)
{
    if(confirm('Are you sure to delete this data?'))
    {
        // ajax delete data to database
        $.ajax({
            url : "delete-pack-discount/"+id,
            type: "POST",
            dataType: "JSON",
            success: function(data)
            {
                var log_type = 'Delete';

                var details = 'Package discount deleted: ' + name; 

                set_system_log(log_type, details);

                //if success reload ajax table
                $('#modal_form').modal('hide');
                reload_table();
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error deleting data');
            }
        });
 
    }
}
function delete_prod_detail(idone, idtwo)
{
    if(confirm('Are you sure to delete this data?'))
    {
        // ajax delete data to database
        $.ajax({
            url : "../delete-prod-detail/"+idone+"/"+idtwo,
            type: "POST",
            dataType: "JSON",
            success: function(data)
            {
                var log_type = 'Delete';

                var details = 'Product item deleted P' + idone 
                + ': I' + idtwo; 

                set_system_log_one(log_type, details);

                //if success reload ajax table
                $('#modal_form').modal('hide');
                reload_table();
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error deleting data');
            }
        });
 
    }
}
function delete_pack_detail(idone, idtwo)
{
    if(confirm('Are you sure to delete this data?'))
    {
        // ajax delete data to database
        $.ajax({
            url : "../delete-pack-detail/"+idone+"/"+idtwo,
            type: "POST",
            dataType: "JSON",
            success: function(data)
            {
                var log_type = 'Delete';

                var details = 'Package product deleted G' + idone 
                + ': P' + idtwo; 

                set_system_log_one(log_type, details);

                //if success reload ajax table
                $('#modal_form').modal('hide');
                reload_table();
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error deleting data');
            }
        });
 
    }
}

function delete_user(id)
{
    if(confirm('Are you sure to delete this data?'))
    {
        // ajax delete data to database
        $.ajax({
            url : "delete-user/"+id,
            type: "POST",
            dataType: "JSON",
            success: function(data)
            {
                var log_type = 'Delete';

                var details = 'User record deleted'; 

                set_system_log(log_type, details);

                //if success reload ajax table
                $('#modal_form').modal('hide');
                $('#modal_form_privileges').modal('hide');
                reload_table();
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Unable to delete one remaining administrator account');
            }
        });

    }
}




// set typeahead value
// function set_typeahead_item(item)
// {
//     $('#srch-term').typeahead('val', item);
// }


// function firstFunction(receipt_window)
// {
//   var d = $.Deferred();
//   // some very time consuming asynchronous code...
//   setTimeout(function() 
//   {
//     // open new window
//     receipt_window.location.href = 'receipt';

//     d.resolve();
//   }, 1000);
//   return d.promise();
// }

// function secondFunction()
// {
//   var d = $.Deferred();
//   setTimeout(function() {
    
//     location.reload();
    
//     d.resolve();
//   }, 1000);
//   return d.promise();
// }

// ========================================================= LOAN FORM KEY LISTENER ===================================================

// generate total amount
$("#amount").change(function()
{
   $('[name="percentage"]').val(0).prop('selected', true);

   var amount = parseFloat($('[name="amount"]').val());
   var interest = parseFloat($('[name="interest"]').val());
    
   if ($('[name="amount"]').val() == '') 
   {
      amount = 0;  
   }
   if ($('[name="interest"]').val() == '') 
   {
      interest = 0;  
   }

   var total = (amount + interest).toFixed(2);

   $('[name="total"]').val(total); 
});

// generate total amount
$("#interest").change(function()
{
   $('[name="percentage"]').val(0).prop('selected', true);

   update_total_value();
});

// generate interest amount by percentage
$("#percentage").change(function()
{
   var amount = parseFloat($('[name="amount"]').val());
   var percentage = parseFloat($('[name="percentage"]').val());

   if (percentage != 0)
   {
      var interest = (amount * percentage).toFixed(2);

      $('[name="interest"]').val(interest);

      update_total_value();
   }
});

function update_total_value()
{
   var amount = parseFloat($('[name="amount"]').val());
   var interest = parseFloat($('[name="interest"]').val());

   if ($('[name="interest"]').val() == '') 
   {
      interest = 0;  
   }

   var total = (amount + interest).toFixed(2);

   $('[name="total"]').val(total);
}

// ========================================================= TRANSACTION FORM KEY LISTENER ===================================================

// generate total amount
$("#amount_payment").change(function()
{
   var amount = parseFloat($('[name="amount"]').val());
   var total_balance = parseFloat($('[name="total_balance"]').val());
    
   if ($('[name="amount"]').val() == '') 
   {
      amount = 0;  
   }

   var total = (total_balance - amount).toFixed(2);

   $('[name="total"]').val(total); 
});

// generate total amount
$("#interest_amount").change(function()
{
   $('[name="percentage"]').val(0).prop('selected', true);

   update_total_value_trans();
});

// generate interest amount by percentage (transactions page)
$("#percentage_trans").change(function()
{
   var total_balance = parseFloat($('[name="total_balance"]').val());
   var percentage = parseFloat($('[name="percentage"]').val());

   if (percentage != 0)
   {
      var interest = (total_balance * percentage).toFixed(2);

      $('[name="interest"]').val(interest);

      update_total_value_trans();
   }
});

// generate total amount
$("#adjustment_amount").change(function()
{
   var adjustment_amount = parseFloat($('[name="adjustment_amount"]').val());
   var total_balance = parseFloat($('[name="total_balance"]').val());
    
   if ($('[name="adjustment_amount"]').val() == '') 
   {
      adjustment_amount = 0;  
   }

   var total = (total_balance + adjustment_amount).toFixed(2);

   $('[name="total"]').val(total); 
});

function update_total_value_trans()
{
   var interest = parseFloat($('[name="interest"]').val());
   var total_balance = parseFloat($('[name="total_balance"]').val());
    
   if ($('[name="interest"]').val() == '') 
   {
      interest = 0;  
   }

   var total = (total_balance + interest).toFixed(2);

   $('[name="total"]').val(total);
}

// ========================================================= CAPITAL FORM KEY LISTENER ===================================================

// generate total amount
$("#amount_capital").change(function()
{
   var amount = parseFloat($('[name="amount"]').val());
   var total_capital = parseFloat($('[name="total_capital"]').val());
    
   if ($('[name="amount"]').val() == '') 
   {
      amount = 0;  
   }

   var total = (total_capital + amount).toFixed(2);

   $('[name="total"]').val(total); 
});


// ========================================================= REPORTS SECTION ==========================================================

// enable / disable generate CIS reports button
$("#report_type").change(function()
{
   var report_type = $('[name="report_type"]').val();

   if (report_type == "null")
   {
       document.getElementById("generate_report").disabled = true;
   }
   else
   {
       document.getElementById("generate_report").disabled = false;
   } 
});

// enable / disable generate Monthly reports button
$("#report_type_monthly").change(function()
{
   var report_type_monthly = $('[name="report_type_monthly"]').val();
   var month_selection = $('[name="month_selection"]').val();
   var year_selection = $('[name="year_selection"]').val();

   if (report_type_monthly == "null" || month_selection == "null" || year_selection == "null")
   {
       document.getElementById("generate_report_monthly").disabled = true;
   }
   else
   {
       document.getElementById("generate_report_monthly").disabled = false;
   } 
});

// enable / disable generate CIS reports button
$("#report_type_child").change(function()
{
   var report_type_child = $('[name="report_type_child"]').val();

   if (report_type_child == "null")
   {
       document.getElementById("generate_report_child").disabled = true;
   }
   else
   {
       document.getElementById("generate_report_child").disabled = false;
   } 
});

// enable / disable generate Monthly reports button
$("#month_selection").change(function()
{
   var report_type_monthly = $('[name="report_type_monthly"]').val();
   var month_selection = $('[name="month_selection"]').val();
   var year_selection = $('[name="year_selection"]').val();

   if (report_type_monthly == "null" || month_selection == "null" || year_selection == "null")
   {
       document.getElementById("generate_report_monthly").disabled = true;
   }
   else
   {
       document.getElementById("generate_report_monthly").disabled = false;
   }
});

// enable / disable generate Monthly reports button
$("#year_selection").change(function()
{
   var report_type_monthly = $('[name="report_type_monthly"]').val();
   var month_selection = $('[name="month_selection"]').val();
   var year_selection = $('[name="year_selection"]').val();

   if (report_type_monthly == "null" || month_selection == "null" || year_selection == "null")
   {
       document.getElementById("generate_report_monthly").disabled = true;
   }
   else
   {
       document.getElementById("generate_report_monthly").disabled = false;
   }
});

// set / generate report based on selected type - CIS
function set_report()
{

    // fetch report type value
    var report_type = $('[name="report_type"]').val();

    // setting report logs
    var log_type = 'Report';

    if (report_type == "cis-active-male")
    {
        var details = 'CIS Active - Male Report generated'; 
        window.open("cis-report-active-male");
    }
    else if (report_type == "cis-active-female")
    {
        var details = 'CIS Active - Female Report generated'; 
        window.open("cis-report-active-female");
    }
    else if (report_type == "cis-graduated-male")
    {
        var details = 'CIS Graduated - Male Report generated'; 
        window.open("cis-report-graduated-male");
    }
    else if (report_type == "cis-graduated-female")
    {
        var details = 'CIS Graduated - Female Report generated';
        window.open("cis-report-graduated-female");
    }
    else
    {
        // window.open("inventory-report/print-report-borrow");   
    }

    set_system_log(log_type, details);
}

// set / generate report based on selected type - Monthly Checkup
function set_report_monthly()
{

    // fetch report type value
    var report_type_monthly = $('[name="report_type_monthly"]').val();
    var month_selection = $('[name="month_selection"]').val();
    var year_selection = $('[name="year_selection"]').val();

    // setting report logs
    var log_type = 'Report';

    if (report_type_monthly == "monthly-male")
    {
        var details = 'Monthly Monitoring - Male Report generated'; 
        window.open("monthly-report-male/" + month_selection + "/" + year_selection);
    }
    else if (report_type_monthly == "monthly-female")
    {
        var details = 'Monthly Monitoring - Female Report generated'; 
        window.open("monthly-report-female/" + month_selection + "/" + year_selection);
    }

    set_system_log(log_type, details);
}

// set / generate report based on selected type - Monthly Checkup
function set_report_child()
{

    // fetch report type value
    var report_type_child = $('[name="report_type_child"]').val();

    // setting report logs
    var log_type = 'Report';

    var details = 'Child Profile Report generated: C' + report_type_child; 
    window.open("child-report/" + report_type_child);

    set_system_log(log_type, details);
}


// ========================================== STATISTICS CHARTS =====================================================



// check if div exist (execute if in dashboard page only) // chart for registration count
if (document.getElementById("container-current-net-sales")) 
{
    // fetch registrations data
    var current_year = $('[name="current_year"]').val();

    var jan = parseFloat($('[name="jan"]').val());
    var feb = parseFloat($('[name="feb"]').val());
    var mar = parseFloat($('[name="mar"]').val());
    var apr = parseFloat($('[name="apr"]').val());

    var may = parseFloat($('[name="may"]').val());
    var jun = parseFloat($('[name="jun"]').val());
    var jul = parseFloat($('[name="jul"]').val());
    var aug = parseFloat($('[name="aug"]').val());

    var sep = parseFloat($('[name="sep"]').val());
    var oct = parseFloat($('[name="oct"]').val());
    var nov = parseFloat($('[name="nov"]').val());
    var dec = parseFloat($('[name="dec"]').val());

    var year_total = $('[name="year_total"]').val();

        Highcharts.chart('container-current-net-sales', {
        chart: {
            type: 'line'
        },
        title: {
            text: 'Monthly Total Net Sales for Year ( ' + current_year + ' ): ₱ ' + year_total
        },
        subtitle: {
            text: 'January to December ' + current_year
        },
        xAxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        },
        yAxis: {
            title: {
                text: 'Net Sales Value in Php Amount'
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true,
                    formatter: function () {
                            return Highcharts.numberFormat(this.y,2);
                        }    
                },
                enableMouseTracking: true,
                tooltip: {
                    pointFormat: '<b style="color:#66cccc;">●</b> {series.name}: <b>₱ {point.y}.00</b>'
                }
            }
        },
        series: [{
            name: 'Monthly Total Net Sales',
            data: [jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec]
        }]
    });
}

// check if div exist (execute if in dashboard page only) // chart for registration count
if (document.getElementById("container-interests-prev")) 
{
    // fetch registrations data
    var prev_year = $('[name="prev_year"]').val();

    var prev_jan = parseFloat($('[name="prev_jan"]').val());
    var prev_feb = parseFloat($('[name="prev_feb"]').val());
    var prev_mar = parseFloat($('[name="prev_mar"]').val());
    var prev_apr = parseFloat($('[name="prev_apr"]').val());

    var prev_may = parseFloat($('[name="prev_may"]').val());
    var prev_jun = parseFloat($('[name="prev_jun"]').val());
    var prev_jul = parseFloat($('[name="prev_jul"]').val());
    var prev_aug = parseFloat($('[name="prev_aug"]').val());

    var prev_sep = parseFloat($('[name="prev_sep"]').val());
    var prev_oct = parseFloat($('[name="prev_oct"]').val());
    var prev_nov = parseFloat($('[name="prev_nov"]').val());
    var prev_dec = parseFloat($('[name="prev_dec"]').val());

    var prev_year_total = $('[name="prev_year_total"]').val();

        Highcharts.chart('container-interests-prev', {
        chart: {
            type: 'line'
        },
        title: {
            text: 'Monthly Total Loan Interests / Net Profit for Year ( ' + prev_year + ' ): ₱ ' + prev_year_total
        },
        subtitle: {
            text: 'January to December ' + prev_year
        },
        xAxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        },
        yAxis: {
            title: {
                text: 'Interest Values in Php Amount'
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true,
                    formatter: function () {
                            return Highcharts.numberFormat(this.y,2);
                        }    
                },
                enableMouseTracking: true,
                tooltip: {
                    pointFormat: '<b style="color:#66cccc;">●</b> {series.name}: <b>₱ {point.y}.00</b>'
                }
            }
        },
        series: [{
            name: 'Monthly Total Interest',
            data: [prev_jan, prev_feb, prev_mar, prev_apr, prev_may, prev_jun, 
            prev_jul, prev_aug, prev_sep, prev_oct, prev_nov, prev_dec]
        }]
    });
}
