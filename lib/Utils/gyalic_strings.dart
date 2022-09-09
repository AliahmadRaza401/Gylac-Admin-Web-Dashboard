import 'package:get/get.dart';

class WorldLanguage extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'submit': "Submit",
          'enterInfo': "Enter information",
          'order': 'Order',
          'parcel': 'Parcel',
          'driverName': 'Driver name',
          'rating': 'Rating',
          'price': 'Price',
          'vehicleType': 'Vehicle type',
          'imgLink': 'Image link',
          'topHigh': "Top High Rated",
          'dashBoard': 'Dashboard',
          'welcomeToAdmin': 'Welcome to Gyalc Admin',
          'refresh': "Refresh",
          'totalRevenue': 'Total Revenue',
          'deliverdOrder': 'Delivered Ordes',
          'pendingOrder': 'Pending Orders',
          'customers': 'Customers',
          'orderDetails': 'Orders Details',
          'activeOrdder': 'Active Orders',
          'cancelOrder': 'Cancelled Orders',
          'customerDetails': 'Customers Details',
          'totalCustomer': 'Total Customers',
          'activeCustomer': 'Active Customers',
          'deliverCustomer': 'Delivered Customers',
          'newCustomer': 'New Customers',
          'payRole': 'PayRoll',
          'filterByda': 'Filter by da',
          'totalPay': 'Total Payroll',
          'driverDetails': 'Drivers Details',
          'totalDrivers': 'Total Drivers',
          'activeDrivers': 'Active Drivers',
          'pendignDriver': 'Pending Drivers',
          'deactiveDriver': 'Deactive Drivers',
          'nothingToshow': "Noting to show!",
          'somethingWentWrong': 'Something went wrong',
          'vehicleDetails': 'Vehicle Detail',
          'enginNO': 'Engine Number',
          'carDesign': 'Car Design',
          'chassiNO': 'Chaasis Number',
          'companyTitle': 'Company Title',
          'users': 'Users',
          'review': 'Reviews',
          'topRated': 'Top Rated',
          'searchHere': 'Search here',
          'admin': "Admin",
          'english': 'English',
          'urdu': 'Urdu',
          'copy': 'Copy',
          'csv': 'CSV',
          'excel': 'Excel',
          'pdf': 'PDF',
          'notification': 'Notifications',
          'doc': 'Docs',
          'document': 'Document',
          'pinLocation': 'PinLocation',
          'settings': 'Settings',
          'clickMarker': 'You have clicked a marker!',
          'adminLogin': "Admin Login",
          'rememberpass': 'Remember password',
          'invalidEmail': 'Invalid email or password',
          'login': "Login",
          'forgotPass': 'Forgot Password?',
          'userNamereq': "Username or Email is required",
          'userName': "Username or Email is required",
          'passReq': "Password required",
          'password': 'password',
          'recipGuide': 'Recipe Guide',
          'orderId': 'Order ID',
          'delgy': 'Delivery guy',
          'id': 'ID ',
          'estTime': 'Estimated Time',
          'mainCourse': 'mainCourse',
          'waitToAccept': "Waiting For Acceptance",
          'drAccept': "driverName accept your Request",
          'waitTopic': "Waiting for Pickup",
          'parcelPicked': "Parcel Picked up",
          'deliverLoc': "Delivered Location",
          'customerOrder': 'Customer Order',
          'items': 'Items',
          'qty': 'Qty',
          'totalprice': 'Total price',
          'orderList': 'Order List',
          'filter': 'Filter',
          'date': 'Date',
          'cusTName': 'Customer Name',
          'location': 'Location',
          'amount': 'Amount',
          'orderstatus': 'Status Order',
          'publish': 'PUBLISH',
          'delete': 'DELETE',
          'topRatList': 'Top Rated List',
          'createAdd': 'Create add',
        },
        'ru_RU': {
        'submit': "Илгээх",
          'enterInfo': "Мэдээллийг оруулна уу",
          'order': 'Захиалга',
          'parcel': 'Илгээмж',
          'driverName': 'Жолоочийн нэр',
          'rating': 'Үнэлгээ',
          'price': 'Үнэ',
          'vehicleType': 'Тээврийн хэрэгслийн төрөл',
          'imgLink': 'Зургийн холбоос',
          'topHigh': "Хамгийн өндөр үнэлгээтэй",
          'dashBoard': 'Хяналтын самбар',
          'welcomeToAdmin': 'Gyalc админд тавтай морил',
          'refresh': "Refresh",
          'totalRevenue': 'Нийт орлого',
          'deliverdOrder': 'Хүргэгдсэн захиалга',
          'pendingOrder': 'Хүлээгдэж буй захиалга',
          'customers': 'Үйлчлүүлэгчид',
          'orderDetails': 'Захиалгын дэлгэрэнгүй мэдээлэл',
          'activeOrdder': 'Идэвхтэй захиалга',
          'cancelOrder': 'Цуцлагдсан захиалга',
          'customerDetails': 'Хэрэглэгчийн дэлгэрэнгүй мэдээлэл',
          'totalCustomer': 'Нийт үйлчлүүлэгчид',
          'activeCustomer': 'Идэвхтэй үйлчлүүлэгчид',
          'deliverCustomer': 'Хүргүүлсэн үйлчлүүлэгчид',
          'newCustomer': 'Шинэ үйлчлүүлэгчид',
          'payRole': 'Цалингийн жагсаалт',
          'filterByda': 'Дагаар шүүх',
          'totalPay': 'Нийт цалин',
          'driverDetails': 'Жолооч нарын дэлгэрэнгүй мэдээлэл',
          'totalDrivers': 'Нийт жолооч',
          'activeDrivers': 'Идэвхтэй жолооч нар',
          'pendignDriver': 'Хүлээгдэж буй жолооч нар',
          'deactiveDriver': 'Идэвхгүй жолооч',
          'nothingToshow': "Үзүүлэх зүйл алга!",
          'somethingWentWrong': 'Ямар нэгэн зүйл буруугаар эргэсэн',
          'vehicleDetails': 'Тээврийн хэрэгслийн дэлгэрэнгүй',
          'enginNO': 'Хөдөлгүүрийн дугаар',
          'carDesign': 'Машины дизайн',
          'chassiNO': 'Явах эд ангийн дугаар',
          'companyTitle': 'Компанийн нэр',
          'users': 'Хэрэглэгчид',
          'review': 'Шүүмж',
          'topRated': 'Өндөр үнэлгээтэй',
          'searchHere': 'Эндээс хай',
          'admin': "админ",
          'english': 'Англи',
          'urdu': 'Урду',
          'copy': 'Хуулах',
          'csv': 'CSV',
          'excel': 'Excel',
          'pdf': 'PDF',
          'notification': 'Мэдэгдэл',
          'doc': 'Докс',
          'document': 'Баримт бичиг',
          'pinLocation': 'Байршлыг тогтоох',
          'settings': 'Тохиргоо',
          'clickMarker': 'Та тэмдэглэгээг товшсон байна!',
          'adminLogin': "Админ нэвтрэх",
          'rememberpass': 'Нууц үгээ санах',
          'invalidEmail': 'Хүчингүй имэйл эсвэл нууц үг',
          'login': "Нэвтрэх",
          'forgotPass': 'Нууц үгээ мартсан?',
          'userNamereq': "Хэрэглэгчийн нэр эсвэл имэйл шаардлагатай",
          'userName': "Хэрэглэгчийн нэр эсвэл имэйл шаардлагатай",
          'passReq': "Нууц үг шаардлагатай",
          'password': 'нууц үг',
          'recipGuide': 'Жорны гарын авлага',
          'orderId': 'Захиалгын ID',
          'delgy': 'Хүргэлтийн залуу',
          'id': 'ID ',
          'estTime': 'Тооцоолсон цаг',
          'mainCourse': 'үндсэн сургалт',
          'waitToAccept': "Хүлээн авахыг хүлээж байна",
          'drAccept': "driverName таны хүсэлтийг хүлээн авна уу",
          'waitTopic': "Татаж авахыг хүлээж байна",
          'parcelPicked': "Илгээмж авсан",
          'deliverLoc': "Хүргэгдсэн байршил",
          'customerOrder': 'Хэрэглэгчийн захиалга',
          'items': 'Эд зүйлс',
          'qty': 'Qty',
          'totalprice': 'Нийт үнэ',
          'orderList': 'Захиалгын жагсаалт',
          'filter': 'Шүүлтүүр',
          'date': 'Огноо',
          'cusTName': 'Хэрэглэгчийн нэр',
          'location': 'Байршил',
          'amount': 'Дүн',
          'orderstatus': 'Статусын захиалга',
          'publish': 'НИЙТЛЭХ',
          'delete': 'УСТГАХ',
          'topRatList': 'Хамгийн өндөр үнэлгээтэй жагсаалт',
          'createAdd': 'Нэмэлт үүсгэх',
        }
      };
}