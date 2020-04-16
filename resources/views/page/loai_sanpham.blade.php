@extends('master')
@section('content')
	<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{route('trang-chu')}}">Home</a> / <span>Sản phẩm</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="container">
		<div id="content" class="space-top-none">
			<div class="main-content">
				<div class="space60">&nbsp;</div>
				<div class="row">
					<div class="col-sm-3">
						<ul class="aside-menu">
							@foreach($loai as $l)
							<li><a href="{{route('loaisanpham',$l->id)}}">{{$l->type_name}}</a></li>
							@endforeach
						</ul>
					</div>
					<div class="col-sm-9">
						<div class="beta-products-list">
							
							<h3 style="text-transform: uppercase;">{{$ten_sp->type_name}}</h3>
							<div class="beta-products-details">
								<p class="pull-left">có {{count($sp_theoloai)}} Sản phẩm</p>
								<div class="clearfix"></div>
							</div>

							<div class="row">
								@foreach($sp_theoloai as $loaisp)
								<div class="col-sm-4">
									<div class="single-item">
										@if($loaisp->promotion_price > 0)
											<div class="ribbon-wrapper"><div class="ribbon sale">Sale</div></div>
										@endif
										<div class="single-item-header">
											<a href="{{route('chitietloaisanpham',$loaisp->id)}}"><img src="source/image/product/{{$loaisp->image}}" alt="" height="250px"></a>
										</div>
										<div class="single-item-body" style="margin-bottom: 10px">
											<p class="single-item-title">{{$loaisp->name}}</p>
											<p class="single-item-price">
												@if($loaisp->promotion_price==0)
												<span class="flash-sale">{{$loaisp->unit_price}} đ</span>
											@else
												<span class="flash-del">{{$loaisp->unit_price}} đ</span>
												<span class="flash-sale">{{$loaisp->promotion_price}} đ</span>
											@endif
											</p>
										</div>
										<div class="single-item-caption" style="margin-bottom: 20px">
											<a class="add-to-cart pull-left" href="{{route('themgiohang',$loaisp->id)}}"><i class="fa fa-shopping-cart"></i></a>
											<a class="beta-btn primary" href="{{route('chitietloaisanpham',$loaisp->id)}}">Chi tiết <i class="fa fa-chevron-right"></i></a>
											<div class="clearfix"></div>
										</div>
									</div>

								</div>
								@endforeach
							</div>
							<div class="row">{{$sp_theoloai->links()}}</div>
						</div> <!-- .beta-products-list -->

						<div class="space50">&nbsp;</div>

						
					</div>
				</div> <!-- end section with sidebar and main content -->


			</div> <!-- .main-content -->
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection