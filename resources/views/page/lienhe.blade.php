@extends('master')
@section('content')

<div class="beta-map">
		
		<div class="abs-fullwidth beta-map wow flipInX"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.7023999921444!2d105.8491298146134!3d21.004563286011486!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac7520956ea9%3A0xcdd636ff119ab1fd!2zMjA1IELhuqFjaCBNYWksIEPhuqd1IEThu4FuLCBIb8OgbiBLaeG6v20sIEjDoCBO4buZaSwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1585153422013!5m2!1svi!2s" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe></div>
	</div>
	<div class="container">
		<div id="content" class="space-top-none">
			
			<div class="space50">&nbsp;</div>
			<div class="row">
				<div class="col-sm-8">
					<h2>Hỗ Trợ</h2>
					<div class="space20">&nbsp;</div>
					<p>Nếu có vấn đề gì cần hỗ trợ, hãy điền vào form dưới đây thông tin của bạn để được hỗ trợ</p>
					<div class="space20">&nbsp;</div>
					<form action="#" method="post" class="contact-form">	
						<div class="form-block">
							<input name="your-name" type="text" placeholder="Họ tên ">
						</div>
						<div class="form-block">
							<input name="your-email" type="email" placeholder="Email ">
						</div>
						<div class="form-block">
							<input name="your-subject" type="text" placeholder="Tiêu đề">
						</div>
						<div class="form-block">
							<textarea name="your-message" placeholder="Lời nhắn"></textarea>
						</div>
						<div class="form-block">
							<button type="submit" class="beta-btn primary">Gửi tin nhắn <i class="fa fa-chevron-right"></i></button>
						</div>
					</form>
				</div>
				<div class="col-sm-4">
					<h2>Thông tin liên hệ</h2>
					<div class="space20">&nbsp;</div>

					<h6 class="contact-title">Địa Chỉ</h6>
					<p>
						205 Bạch Mai, Hai Bà Trưng, Hà Nội<br>
					</p>
					<div class="space20">&nbsp;</div>
					<h6 class="contact-title">Email</h6>
					<p>
						
						<a href="mailto:anhmeorv99@gmail.com">anhmeorv99@gmail.com</a> </br>

					</p>
					<div class="space20">&nbsp;</div>
					<h6 class="contact-title">Điện thoại</h6>
					<p>
						
						<a href="phoneto:0988964753">0988964753</a> </br>

					</p>
					<div class="space20">&nbsp;</div>
					
				</div>
			</div>
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection