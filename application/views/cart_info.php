<!DOCTYPE html>
<html>
<head>
	<title>Carts</title>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	 <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
		<script>
			$(document).ready(function(){
				$('#continue_shopping').submit(function(){
					$.post('/products/shipping_information', $(this).serialize(), function(res) {
						$('#shipping_details').html(res);
					}); return false;
				});
			});
		</script>
		<style>
  .main{
    margin-top: 60px;
   }
  .sidebar {
    margin-top: 60px;
   }
  .form-control.search{
    width: 125px;
   }
  .numbers {
   display: block; 
   width: 500px;
   height: 100px;
  }
  .dropdown {
    margin-bottom: 20px;
    text-align: right;
  }
  .price {
    font-size: 12px;
    color: #b12704!important;
    font-weight: bold;
    text-align: center;
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
</head>
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
    </ul> 
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <form id="search" action="" method="post"> <!-- Search box -->
             <input type="text" name="name" class="form-control search" placeholder="Search">
          </form>
          
          <ul class="nav nav-sidebar">
            <?php foreach($allcategories as $categories) { ?>
              <li><a href="/products/category/<?php echo $categories['id'] ?>"><?php echo $categories['name'] ?></a></li>
           <?php  } ?>
          </ul>
        </div>
				<div class="col-md-10 main">
					<table class="table table-striped table-bordered" style="width: 700px;">
						<thead>
							<tr>
								<th>Item</th>
								<th>Quantity</th>
								<th>Price</th>
								<th>Find</th>
							</tr>
						</thead>
						<tbody>
							<?php	$total_bill = 0; $total_quantity = 0;


									foreach($cart_products as $value)
									{
							?>			<tr>
											<td><?= $value['name']; ?></td>
											
											<td><?= $total = $value['quantity'] ?></td>
											<td><?= $total = $value['price'] * $value['quantity']?></td>
											<td><a href="/products/google/<?= $value['id']; ?>/<?= $value['category_id']; ?>">Find the product in your nearest store</a></td>
											</tr>
							<?php 	$total_bill += $total;
									$this->session->set_userdata('value', $value['id']);
									$this->session->set_userdata('product', $value['category_id']);
									// var_dump($this->session->userdata('product')); die();
									}			
							?>		</tbody>
					</table>
					<p> Total: <?= $total_bill; ?></p>
					<?php  
					$this->session->set_userdata('bill', $total_bill);
				          if ($this->session->flashdata('errors')) {
				            echo $this->session->flashdata('errors');
				   } ?>
					<div id="shipping_info">
					<form action="" method="post" class="form-group" id="continue_shopping">
						<input type="submit" value="continue shopping" class="btn btn-default">
					</form>
					<div id="shipping_details">	</div>
					</div>
				</div>
			</div>
		</div>	<!-- end of container-fluid -->	
		<div class="panel-footer">        
        <ul class="nav">
          <li><a href="/meet_the_team">Meet the Team</a></li>
          <li><a href="/careers">Careers</a></li>
          <li><a href="/FAQs">FAQs</a></li>
          <li><a href="contact_us">Contact Us</a></li>
        </ul>
      </div>
 </div><!--  end of container -->
</body>
</html>
