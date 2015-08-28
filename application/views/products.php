<!DOCTYPE html>
<html>
<head>
	<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<title>All Products</title>
</head>
<style>
	.main{
	 		margin-top: 30px;
	 }
	.sidebar {
	 		margin-top: 60px;
	 }
	.form-control { 
	 	width: 125px;
	 }
	.price {
		font-size: 12px;
    color: #b12704!important;
    font-weight: bold;
		text-align: center;
	}
	.dropdown {
	  margin-bottom: 20px;
	  text-align: right;
	}
	 .logo {
    text-align: center;
    margin: 25px 0;
  }
  .nav {
    height: 50px;
  }
  .nav > li > a {
    color: #000;
  }
  h5 {
    line-height: 16px;
    color: #004b91;
    font-weight: bold;
  }
  .container-fluid {
    border-top: 1px solid #eee;
  }
  .caption {
    height: 60px;
    overflow: hidden;
  }
  .placeholder {
    margin-bottom: 30px;
  }
  .pagination {
    border: 3px solid #ddd;
    padding: 10px;
    text-align: center;
    margin: 0 auto;
    width: 100%;
  }
  .pagination a {
    margin: 0 10px;
    font-weight: bold;
  }
    .panel-footer{
    margin: 30px 0;
    border: 1px solid #ccc;
  }
  .panel-footer ul {
    text-decoration: none;
    width: auto;
    margin: 0 auto;
  }
  .panel-footer li {
    float: left;
  }
  .panel-footer li a{
    display: block;
    color: #004B91;
  }
  .panel-footer li a:hover {
    background-color: transparent;
  }
</style>
<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script>
  $(document).ready(function() {
  // 	$('.form-control').click(function () {
  // 	$('.form-control option').hover(function(e){
  // 			var test = $(this).val();
  //           console.log(test);
  //       });
  // });
    $(window).load(function() { // load first 4 products
      $.get('/products/allproducts/', function(res) {
        $('.placeholders').html(res);
      });
      return false;
    });
  	$(document).on('click', '.pagination a', function() { // onclick of 'a' tags
  		//e.preventDefault();
  		var link = $(this).attr('href');
      $.get(link, function(res) {
      	$('.placeholders').html(res);
    	});
    	return false;
  	});
  	$(document).on('click', '.nav-sidebar a', function() { // onclick of category 
  		var link = $(this).attr('href');
      $.get(link, function(res) {
      	console.log(res);
    	});
  	});
    $("form#search").submit(function() { //search button
        $name = $("input.form-control").val();
        $.get('/products/searchproduct/' + $name, function(lname){
        	$('.placeholders').html(lname);
        });
      return false;
      }); // .submit function
    $("#selectprice").change(function(){ //sort by price
	    	var priceval = $(this).val();
	    	if(priceval == 'price') {
	    		//alert (priceval);
			      $.get('/products/productbyprice/', function(res) {
			      	$('.placeholders').html(res);
			    	});
		    }
		    else if(priceval == 'Most Popular'){
		    	$.get('/products/mostpopular/', function(res) {
			      $('.placeholders').html(res);
			    });
		    }
    });    
  }); //document.ready
</script>
<body>
	<div class="container">
    <div class="logo"><a href="/"><img src="/assets/logo.gif"></a></div>
    
    <ul class="nav nav-pills nav-justified">
      <li role="presentation"><a href="/home">HOME</a></li>
      <li role="presentation"><a href="/products">WOMEN</a></li>
      <li role="presentation"><a href="/products">PRODUCTS</a></li>
      <li role="presentation"><a href="/products">SALE</a></li>
      <li role="presentation"><a href="/products">NEW ARRIVALS</a></li>
      <li role="presentation"><a href="/products">BEST SELLERS</a></li>
      <li role="presentation"><a href="/main/logoff">LOG OFF</a></li>
    </ul> 

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
        	<form id="search" action="" method="post"> <!-- Search box -->
				     <input type="text" name="name" class="form-control" placeholder="Search">
				  </form>
				  
          <ul class="nav nav-sidebar" style="height:215px;">
          	<?php foreach($allcategories as $categories) { ?>
							<li><a href="/products/category/<?php echo $categories['id'] ?>"><?php echo $categories['name'] ?></a></li>
           <?php	} ?>
          </ul>
          <a href="/products/category/3"><img src="/assets/brown_dress.png"></a>
        </div>
        <div class="col-md-10 main">
          <h1 class="page-header">All Products</h1>
          <div class="dropdown">
          		<select id="selectprice">
          			<option value="">Sorted by</option>
          			<option value="price">Price</option>
          			<option value="Most Popular">Most Popular</option>
          		</select>
          </div>
          <div class="row placeholders">
						<!-- code here is coming from partial -->		
          </div>
        </div>
      </div> <!--row ends -->
    </div>
    <div class="panel-footer">        
        <ul class="nav">
          <li><a href="/meet_the_team">Meet the Team</a></li>
          <li><a href="/careers">Careers</a></li>
          <li><a href="/FAQs">FAQs</a></li>
          <li><a href="contact_us">Contact Us</a></li>
        </ul>
    </div>
  </div>   
</body>
</html>


