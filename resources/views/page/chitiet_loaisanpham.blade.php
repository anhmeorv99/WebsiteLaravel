@extends('master')
@section('content')
	<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">SẢN PHẨM</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="index.html">Home</a> / <span>Sản phẩm</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<div class="container">
		<div id="content">
			<div class="row">
				<div class="col-sm-9">

					<div class="row">
						<div class="col-sm-4">
							<img src="source/image/product/{{$sanpham->image}}" alt="" height="250px">
						</div>
						<div class="col-sm-8">
							<div class="single-item-body">
								<p class="single-item-title">{{$sanpham->name}}</p>
								<p class="single-item-price">
								@if ($sanpham->promotion_price > 0)
									<span class="flash-del">{{$sanpham->unit_price}} đ</span>
									<span class="flash-sale">{{$sanpham->promotion_price}} đ</span>
								@else 
									<span class="flash-sale">{{$sanpham->unit_price}} đ</span>
								@endif

								</p>
							</div>

							<div class="clearfix"></div>
							<div class="space20">&nbsp;</div>

							<div class="single-item-desc">
								<p>{{$sanpham->description}}</p>
							</div>
							<div class="space20">&nbsp;</div>

							<p>Options:</p>
							<div class="single-item-options">
								
							<form action="{{route('themgiohang1',$sanpham->id)}}" method="post">
								@csrf
								<select class="wc-select" name="size">
									<option>Size</option>
									<option value="XS">XS</option>
									<option value="S">S</option>
									<option value="M">M</option>
									<option value="L">L</option>
									<option value="XL">XL</option>
								</select>
								<select class="wc-select" name="color">
									<option>Color</option>
									<option value="Red">Red</option>
									<option value="Green">Green</option>
									<option value="Yellow">Yellow</option>
									<option value="Black">Black</option>
									<option value="White">White</option>
								</select>
								<label style="">SL:</label>
								<input type="number" name="qtyProduct" value="1" min="1" style="width: 90px; height: 35px;">
    
								<button type="submit" class="add-to-cart" href="{{route('themgiohang',$sanpham->id)}}"><i class="fa fa-shopping-cart"></i></button>
							</form>
								<div class="clearfix"></div>
							</div>

						</div>
					</div>

					<div class="space40">&nbsp;</div>
					<div class="woocommerce-tabs">
						<ul class="tabs">
							<li><a href="#tab-description">Description</a></li>
							<li><a href="#tab-reviews">Reviews (0)</a></li>
						</ul>

						<div class="panel" id="tab-description">

							 </p>
						</div>
						<div class="panel" id="tab-reviews">
							<p>No Reviews</p>
						</div>
					</div>
					<div class="space50">&nbsp;</div>
					
				</div>
				<div class="col-sm-3 aside">
					<div class="widget">
						<h3 class="widget-title" style="width: 300px">SẢN PHẨM GIẢM GIÁ</h3>
						<div class="widget-body">
							<div class="beta-sales beta-lists" style="width: 300px">
								@foreach($product as $sale)
								<div class="media beta-sales-item" >
								
									<a class="pull-left" href="{{route('chitietloaisanpham',$sale->id)}}"><img src="source/image/product/{{$sale->image}}" alt=""></a>
									<div class="media-body">
										{{$sale->name}}
							
										<span class="beta-sales-price">{{$sale->promotion_price}}đ</span>
									</div>
								
								</div>
								@endforeach
							</div>
						</div>
					</div> <!-- best sellers widget -->
					<div class="widget">
						<h3 class="widget-title">SẢN PHẨM MỚI</h3>
						<div class="widget-body">
							<div class="beta-sales beta-lists">
								@foreach($new_product as $sale)
								<div class="media beta-sales-item" >
								
									<a class="pull-left" href="{{route('chitietloaisanpham',$sale->id)}}"><img src="source/image/product/{{$sale->image}}" alt=""></a>
									<div class="media-body">
										{{$sale->name}} 
								@if ($sale->promotion_price>0)
										<span class="beta-sales-price">{{$sale->promotion_price}}đ</span>
								@else <span class="beta-sales-price">{{$sale->unit_price}}đ</span>
								@endif
									</div>
								
								</div>
								@endforeach
								
							</div>
						</div>
					</div> <!-- best sellers widget -->
				</div>
			</div>
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection