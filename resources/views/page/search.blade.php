@extends('master')
@section('content')
<div class="container">
		<div id="content" class="space-top-none">
			<div class="main-content">
				<div class="space60">&nbsp;</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="beta-products-list">
							<h3>TÌM KIẾM</h3	>
							<div class="beta-products-details">
								<div>tìm thấy {{count($product)}} sản phẩm</div>
								<div class="clearfix"></div>
							</div>

							<div class="row">

							@foreach($product as $new)
								<div class="col-sm-3">
									<div class="single-item" style="margin-bottom: 20px">
										@if($new->promotion_price > 0)
											<div class="ribbon-wrapper"><div class="ribbon sale">Sale</div></div>
										@endif
										<div class="single-item-header">
											<a href="{{route('chitietloaisanpham',$new->id)}}"><img src="source/image/product/{{$new->image}}" alt="" height="250"></a>
										</div>
										<div class="single-item-body">
											<p class="single-item-title">{{$new->name}}</p>
											<p class="single-item-price">
											@if($new->promotion_price==0)
												<span class="flash-sale">{{$new->unit_price}} đ</span>
											@else
												<span class="flash-del">{{$new->unit_price}} đ</span>
												<span class="flash-sale">{{$new->promotion_price}} đ</span>
											@endif
											</p>
										</div>
										<div class="single-item-caption" style="margin-top: 8px">
											<a class="add-to-cart pull-left" href="{{route('themgiohang',$new->id)}}"><i class="fa fa-shopping-cart"></i></a>
											<a class="beta-btn primary" href="{{route('chitietloaisanpham',$new->id)}}">Chi Tiết <i class="fa fa-chevron-right"></i></a>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>

							@endforeach

							</div>
							
						</div> <!-- .beta-products-list -->

						<div class="space50">&nbsp;</div>
						
							
							
						</div> <!-- .beta-products-list -->
					</div>
				</div> <!-- end section with sidebar and main content -->


			</div> <!-- .main-content -->
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection