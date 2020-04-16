<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Slide;

use App\Product;
use App\ProductType;
use App\Cart;
use Session;
use App\Customer;
use App\BillDetail;
use App\Bill;
use App\User;
use Hash;
use Auth;
use Alert;
class MyController extends Controller
{
   	public function getIndex(){
   		$slide = Slide::all();

   		$new_product = Product::where('new',1)->paginate(8);
        // print_r($new_product);
   	//	return view('page.trang-chu',compact('slide'));
         $other_product = Product::where('new',0)->paginate(8);
         return view('page.trang-chu',compact('slide','new_product','other_product'));

   	}

   	 	public function getProductType($type){
            $sp_theoloai = Product::where('id_type',$type)->paginate(6);
            $loai = ProductType::all();
            $ten_sp = ProductType::where('id',$type)->first();
   		return view('page.loai_sanpham',compact('sp_theoloai','ten_sp','loai'));
   	}


   	 	public function getProduct(Request $request){
                  $sanpham = Product::where('id',$request->id)->first();
                  $product = Product::where('promotion_price','>',0)->paginate(4);
                  $new_product = Product::where('new',1)->paginate(4);
   		return view('page.chitiet_loaisanpham',compact('sanpham','product','new_product'));
   	}

   	public function getContact(){
   		return view('page.lienhe');
   	}

      public function getCart(Request $request,$id){
         $product = Product::find($id);
         $oldCart = Session('cart')?Session::get('cart'):null;
         $cart = new Cart($oldCart);

         $cart->add($product,$id,1);
        
         $request->session()->put('cart',$cart);
        
         return redirect()->back();

      }
       public function postMultiCart(Request $request,$id){
         $product = Product::find($id);
         $oldCart = Session('cart')?Session::get('cart'):null;
         $cart = new Cart($oldCart);

         $cart->add($product,$id,$request->qtyProduct);
        
         $request->session()->put('cart',$cart);

         return redirect()->back();

      }

     public function moveCart($id){
         
         $oldCart = Session::has('cart')?Session::get('cart'):null;
         $cart =  new Cart($oldCart);
         $cart->removeItem($id);

         if (count($cart->items)>0)
         {
            Session::put('cart',$cart);
         }
         else Session::forget('cart');
         return redirect()->back();

      } 

      public function getCheckout(){
         return view('page.donhang');
      }

      public function postCheckout(Request $request){

         $cart = Session::get('cart');
         
         
         $checkCustomer = Customer::where('phone_number',$request->phone)->first();

         
        $checkCustomerId;
         

         if ($checkCustomer==null) 
         {
            $customer = new Customer;
                $customer->name = $request->name;
                $customer->gender = $request->gender; 
                $customer->email = $request->email;
                $customer->address = $request->address;
                $customer->phone_number = $request->phone;
                $customer->note = $request->note;
                $customer->save();
                $checkCustomerId = $customer->id;
         }
        else if (strcasecmp($checkCustomer['phone_number'],$request->phone)!=0)
         {
                 $customer = new Customer;
                $customer->name = $request->name;
                $customer->gender = $request->gender; 
                $customer->email = $request->email;
                $customer->address = $request->address;
                $customer->phone_number = $request->phone;
                $customer->note = $request->note;
                $customer->save();
                $checkCustomerId = $customer->id;
         }  else $checkCustomerId = $checkCustomer['id'];
 
         $bill = new Bill;
         $bill->id_customer = $checkCustomerId;
         $bill->date_order= date('y-m-d');
         $bill->total = $cart->totalPrice;
         $bill->payment = $request->payment_method;
         $bill->note = $request->note;
         $bill->save();

         $bill_detail = new BillDetail;

         foreach ($cart->items as $key => $value) {

               $bill_detail->id_bill = $bill->id;
               $bill_detail->id_product = $key;
               $bill_detail->quantity = $value['qty'];
               $bill_detail->unit_price = $value['price']/$value['qty'];
               $bill_detail->save();
         }
        
        Session::forget('cart');
         Alert::success('Success','đặt hàng thành công');
        return redirect('index');


      } 
    public function getLogin(){
         return view('page.login');
    }

    public function postLogin(Request $request){

      $this->validate($request,[
               'email'=>'required|email',
               'password'=>'required|min:6|max:20'

            ]
         ,[
            'email.required'=>'Vui lòng nhập Email',
            'email.email'=>'Sai định dạng email example: abc@gmail.com',
            'password.required'=>'Vui lòng nhập password',
            'password.min'=>'mật khẩu phải từ 6 ký tự trở lên',
            'password.max'=>'mật khẩu tối đa 20 ký tự'

         ]);
      $checkLogin = array('email' =>$request->email ,'password'=>$request->password );

         if (Auth::attempt($checkLogin)) return redirect('index');
         else return redirect()->back()->with(['flag'=>'danger','message'=>'Sai tên tài khoản hoặc mật khẩu']);
    }

    public function getSignin(){
      return view('page.signin');
    }
    public function postSignin(Request $request){
         $this->validate($request,
            [
               'email' =>'required|email|unique:users,email',
               'password'=>'required|min:6|max:20',
               'hoten'=>'required',
               're_password' => 'required|same:password'

            ],
            [
               'email.required'=>'Bạn chưa nhập email',
               'email.email'=>'Định dạng email chưa đúng ex: ABC@gmail.com',
               'email.unique'=>'Tài khoản này đã có người sử dụng',
               'password.required'=>'Bạn chưa nhập mật khẩu',
               'password.min'=>'Mật khẩu từ 6 ký tự trở lên',
               'password.max'=>'Mật khẩu ít hơn 20 ký tự',
               're_password.required'=>'Bạn chưa nhập lại mật khẩu',
               're_password.same'=>'Mật khẩu nhập lại không khớp với mật khẩu trên',
               'hoten.required'=>'Bạn chưa điền họ tên'
            ]);

         $user = new User();
         $user->full_name = $request->hoten;
         $user->email = $request->email;
         $user->password = Hash::make($request->password);
         $user->phone = $request->phone;
         $user->address = $request->diachi;

         $user->save();

         return redirect('index');


    }

    public function logOut(){

         Auth::logout();
         return redirect('index');

    }

    public function Search(Request $request){

         $product = Product::where('name','like','%'.$request->search.'%')->get();

         return view('page.search',compact('product'));
    }
}
