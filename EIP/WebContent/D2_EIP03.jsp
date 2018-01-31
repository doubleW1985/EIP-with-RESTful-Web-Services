<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
      
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    	
<!--Bootstrap from CDN-->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--Bootstrap from CDN-->

<!--W3.CSS-->
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!--W3.CSS-->

      <title>D2 EIP</title>

      <link rel="stylesheet" href="css/D2_EIPCSS.css" type="text/css" />
      
<!-- Multi Dropdown for Navbar-->
      <link rel="stylesheet" href="css/multidropdown.css" type="text/css" />
      <script type="text/javascript" src="js/multidropdown.js"></script>
<!-- Multi Dropdown for Navbar-->   

<!--Interactive Graph-->
      <link rel="stylesheet" href="css/graph.css" type="text/css" />
      <script type="text/javascript" src="js/jquery.flot.min.js"></script>
<!--Interactive Graph-->

<!--bootstrap-select-->
      <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
      <!-- Latest compiled and minified JavaScript -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
<!--bootstrap-select-->

<!--D2_EIP02 Init-->
      <script type="text/javascript" src="js/NewPOInit.js"></script>
<!--D2_EIP02 Init-->

<!--For PODetailTable-->
    <link rel="stylesheet" href="css/poDetailTable.css" type="text/css" />
    <!--<script type="text/javascript" src="js/jquery.min.js"></script>-->
    <link rel="stylesheet" href="css/addNew&Sum.css" type="text/css" />
<!--For PODetailTable-->



    </head>
    
    <body>

      <div class="upon_navbar">
        <img src="img/logoD2_2s.png" style=" width: 225px; height: auto; "></img>
        <span style=" float: right; margin: 25px 15px; ">Hello，Double</span>
      </div>

<!--Navbar-->
      <div class="navbar navbar-inverse" role="navigation">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>
     
          <div class="collapse navbar-collapse">
              <ul class="nav navbar-nav navbar-right">
                <li><a href="#">選單1</a></li>
                <li class="dropdown"><a href="#" data-toggle="dropdown" >銷售管理 <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="D2_EIP02.jsp">新增訂單</a></li>
                    <li><a href="D2_EIP03.jsp">查詢訂單</a></li>
                  </ul>
                </li>
                <li><a href="#">選單3</a></li>
                <li><a href="#">選單4</a></li>
              </ul>
            </div>
        </div>
      </div>
<!--Navbar-->

<!--Main Body-->
      <div class="container" style="position: relative; top: 170px; background-color: white;  padding: 50px; ">
        
        <div class="row">
          <!--Table-->
          <div class="col-sm-6">  
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Firstname</th>
                  <th>Lastname</th>
                  <th>Email</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>John</td>
                  <td>Doe</td>
                  <td>john@example.com</td>
                </tr>
                <tr>
                  <td>Mary</td>
                  <td>Moe</td>
                  <td>mary@example.com</td>
                </tr>
                <tr>
                  <td>July</td>
                  <td>Dooley</td>
                  <td>july@example.com</td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--Table-->
          
          <!--Chart-->
          <div class="col-sm-6">
            <!-- Graph HTML -->
            <div id="graph-wrapper">
            	<div class="graph-info">
            		<a href="javascript:void(0)" class="visitors">Visitors</a>
            		<a href="javascript:void(0)" class="returning">Returning Visitors</a>
            
            		<a href="#" id="bars"><span></span></a>
            		<a href="#" id="lines" class="active"><span></span></a>
            	</div>
            
            	<div class="graph-container">
            		<div id="graph-lines"></div>
            		<div id="graph-bars"></div>
            	</div>
            </div>
            <!-- end Graph HTML -->

            <script>
            $(document).ready(function () {
            
            	// Graph Data ##############################################
            	var graphData = [{
            			// Visits
            			data: [ [6, 1300], [7, 1600], [8, 1900], [9, 2100], [10, 2500], [11, 2200], [12, 2000], [13, 1950], [14, 1900], [15, 2000] ],
            			color: '#71c73e'
            		}, {
            			// Returning Visits
            			data: [ [6, 500], [7, 600], [8, 550], [9, 600], [10, 800], [11, 900], [12, 800], [13, 850], [14, 830], [15, 1000] ],
            			color: '#77b7c5',
            			points: { radius: 4, fillColor: '#77b7c5' }
            		}
            	];
            
            	// Lines Graph #############################################
            	$.plot($('#graph-lines'), graphData, {
            		series: {
            			points: {
            				show: true,
            				radius: 5
            			},
            			lines: {
            				show: true
            			},
            			shadowSize: 0
            		},
            		grid: {
            			color: '#646464',
            			borderColor: 'transparent',
            			borderWidth: 20,
            			hoverable: true
            		},
            		xaxis: {
            			tickColor: 'transparent',
            			tickDecimals: 2
            		},
            		yaxis: {
            			tickSize: 1000
            		}
            	});
            
            	// Bars Graph ##############################################
            	$.plot($('#graph-bars'), graphData, {
            		series: {
            			bars: {
            				show: true,
            				barWidth: .9,
            				align: 'center'
            			},
            			shadowSize: 0
            		},
            		grid: {
            			color: '#646464',
            			borderColor: 'transparent',
            			borderWidth: 20,
            			hoverable: true
            		},
            		xaxis: {
            			tickColor: 'transparent',
            			tickDecimals: 2
            		},
            		yaxis: {
            			tickSize: 1000
            		}
            	});
            
            	// Graph Toggle ############################################
            	$('#graph-bars').hide();
            
            	$('#lines').on('click', function (e) {
            		$('#bars').removeClass('active');
            		$('#graph-bars').fadeOut();
            		$(this).addClass('active');
            		$('#graph-lines').fadeIn();
            		e.preventDefault();
            	});
            
            	$('#bars').on('click', function (e) {
            		$('#lines').removeClass('active');
            		$('#graph-lines').fadeOut();
            		$(this).addClass('active');
            		$('#graph-bars').fadeIn().removeClass('hidden');
            		e.preventDefault();
            	});
            
            	// Tooltip #################################################
            	function showTooltip(x, y, contents) {
            		$('<div id="tooltip">' + contents + '</div>').css({
            			top: y - 16,
            			left: x + 20
            		}).appendTo('body').fadeIn();
            	}
            
            	var previousPoint = null;
            
            	$('#graph-lines, #graph-bars').bind('plothover', function (event, pos, item) {
            		if (item) {
            			if (previousPoint != item.dataIndex) {
            				previousPoint = item.dataIndex;
            				$('#tooltip').remove();
            				var x = item.datapoint[0],
            					y = item.datapoint[1];
            					showTooltip(item.pageX, item.pageY, y + ' visitors at ' + x + '.00h');
            			}
            		} else {
            			$('#tooltip').remove();
            			previousPoint = null;
            		}
            	});
            
            });
            </script>            
            
         
              
          </div>
          <!--Chart-->
        </div>
        
      </div>
<!--Main Body-->





    </body>
</html>