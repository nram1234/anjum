import 'package:flutter/cupertino.dart';

enum AdminType { Admin, Sub_Admin }
enum StatusType { Active, Inactive }
enum Tax_Type { value, percentage, NA }
enum Request_Status { pending, accepted, rejected }
enum Request_Type { salesOrder, invoice, return_invoice, sales }

enum Salesmanager_Status { NA, pending, accepted, rejected }

enum Supervisor_Status { pending, accepted, rejected }

enum Discount_Type { NA, value, percentage }
enum Promotion_Type { NA, range, package }

//=============================================================

class Sales_Order_Request_Details_Model {
 int id;
 int user_id;
 int sales_order_request_id;
 int employee_id;
 int store_id;
 int item_id;
 int category_id;
 int measurement_unit_id;
 double base_price_per_unit;
  int bonus;
  int quantity;
  double total_price;
  double total_tax;
  String tax_type;
  double total_price_before_tax;
  double total_price_with_tax;
  String request_status;
  int created_at;
   int updated_at;
  double Item_Discount;

  Sales_Order_Request_Details_Model({
    @required this.id,
    @required this.user_id,
    @required this.sales_order_request_id,
    @required this.employee_id,
    @required this.store_id,
    @required this.item_id,
    @required this.category_id,
    @required  this.measurement_unit_id,
    @required this.base_price_per_unit=0,
    this.bonus,
    this.quantity,
    this.total_price,
    this.total_tax,
    @required this.tax_type='NA',
    this.total_price_before_tax,
    this.total_price_with_tax,
 @required this.request_status='pending',
    @required  this.created_at,
    @required  this.updated_at,
    this.Item_Discount});

  Sales_Order_Request_Details_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    sales_order_request_id = json['sales_order_request_id'];
    employee_id = json['employee_id'];
    store_id = json['store_id'];
    item_id = json['item_id'];
    category_id = json['category_id'];
    measurement_unit_id = json['measurement_unit_id'];
    base_price_per_unit = json['base_price_per_unit'];
    bonus = json['bonus'];
    quantity = json['quantity'];
    total_price = json['total_price'];
    total_tax = json['total_tax'];
    tax_type = json['tax_type'];
    total_price_before_tax = json['total_price_before_tax'];
    total_price_with_tax = json['total_price_with_tax'];
    request_status = json['request_status'];
    Item_Discount = json['Item_Discount'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.user_id;
    data['sales_order_request_id'] = this.sales_order_request_id;
    data['employee_id'] = this.employee_id;
    data['store_id'] = this.store_id;
    data['item_id'] = this.item_id;
    data['category_id'] = this.category_id;
    data['measurement_unit_id'] = this.measurement_unit_id;
    data['base_price_per_unit'] = this.base_price_per_unit;
    data['bonus'] = this.bonus;
    data['quantity'] = this.quantity;
    data['total_price'] = this.total_price;
    data['total_tax'] = this.total_tax;
    data['tax_type'] = this.tax_type;
    data['total_price_before_tax'] = this.total_price_before_tax;
    data['total_price_with_tax'] = this.total_price_with_tax;
    data['request_status'] = this.request_status;
    data['Item_Discount'] = this.Item_Discount;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
 return data; }
}

class Sales_Order_Requests_Model {
 int id;
  int user_id;
  int request_level;
  String request_type;
  int employee_id;
  int store_id;
  int customer_id;
  int supervisor_id;
  int salesmanager_id;
  String no_of_items;
  String salesmanager_note;

  double total_price_without_tax_discount;
  double total_tax;
  double total_discount;
  double total_price;
  String request_status;
  String salesmanager_status;
  String supervisor_status;
  int is_successfully_submitted;


  String created_at;
  int updated_at;


  Sales_Order_Requests_Model({
    @required this.id,
    @required this.user_id,
    @required  this.supervisor_id,
    @required  this.employee_id,
    @required  this.store_id,
    this.salesmanager_id,
    @required  this.customer_id,
    this.is_successfully_submitted,
    this.no_of_items,
    this.request_level,
    @required  this.request_type='salesOrder',
    @required  this.total_price,
    this.total_tax,
    this.salesmanager_note,
    @required  this.salesmanager_status='NA',
    @required  this.supervisor_status='pending',
    @required  this.request_status='pending',
    @required  this.created_at,
    @required  this.updated_at,
    this.total_price_without_tax_discount,
    this.total_discount});

  Sales_Order_Requests_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    supervisor_id = json['supervisor_id'];
    employee_id = json['employee_id'];
    store_id = json['store_id'];
    salesmanager_id = json['salesmanager_id'];
    customer_id = json['customer_id'];
    is_successfully_submitted = json['is_successfully_submitted'];
    no_of_items = json['no_of_items'];
    request_level = json['request_level'];
    request_type = json['request_type'];
    total_price = json['total_price'];
    total_tax = json['total_tax'];
    salesmanager_note = json['salesmanager_note'];
    salesmanager_status = json['salesmanager_status'];
    supervisor_status = json['supervisor_status'];
    request_status = json['request_status'];
    total_price_without_tax_discount = json['total_price_without_tax_discount'];
    total_discount = json['total_discount'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.user_id;
    data['supervisor_id'] = this.supervisor_id;
    data['employee_id'] = this.employee_id;
    data['store_id'] = this.store_id;
    data['salesmanager_id'] = this.salesmanager_id;
    data['customer_id'] = this.customer_id;
    data['is_successfully_submitted'] = this.is_successfully_submitted;
    data['no_of_items'] = this.no_of_items;
    data['request_level'] = this.request_level;
    data['request_type'] = this.request_type;
    data['total_price'] = this.total_price;
    data['total_tax'] = this.total_tax;
    data['salesmanager_note'] = this.salesmanager_note;
    data['salesmanager_status'] = this.salesmanager_status;
    data['supervisor_status'] = this.supervisor_status;
    data['request_status'] = this.request_status;
    data['total_price_without_tax_discount'] =
        this.total_price_without_tax_discount;
    data['total_discount'] = this.total_discount;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
 return data; }
}

class Sales_Order_Invoice_Request_Stock_Items_Model {
  int id;
  int user_id;
  int sales_order_request_id;
  int store_id;
  int item_id;

  int measurement_unit_id;

  String quantity;


  int created_at;
  int updated_at;


  Sales_Order_Invoice_Request_Stock_Items_Model({@required this.id,
    this.user_id,
    this.store_id,
    this.item_id,
    this.measurement_unit_id,
    this.quantity,
    this.sales_order_request_id,
    this.created_at,
    this.updated_at,
  });

  Sales_Order_Invoice_Request_Stock_Items_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    store_id = json['store_id'];

    item_id = json['item_id'];
    measurement_unit_id = json['measurement_unit_id'];
    quantity = json['quantity'];
    sales_order_request_id = json['sales_order_request_id'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['user_id'] = this.user_id;
    data['store_id'] = this.store_id;
    data['item_id'] = this.item_id;

    data['measurement_unit_id'] = this.measurement_unit_id;
    data['quantity'] = this.quantity;

    data['sales_order_request_id'] = this.sales_order_request_id;


    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
return data;  }
}


class Sales_Order_Cart_Promotions_Model {
  int id;
  int sales_order_cart_id;
  String discount_type;
  double discount_percentage;
  double discount_amount;
  int promotion_id;
  String promotion_type;
  int promotion_bonus_item_id;
  int promotion_bonus_quantity;
  int created_at;
  int updated_at;


  Sales_Order_Cart_Promotions_Model({
    @required this.id,
    this.discount_amount,
    @required this.promotion_type= 'NA',
    @required this.sales_order_cart_id,
    this.discount_percentage,
    @required this.discount_type = 'NA',
    this.promotion_bonus_item_id,
    this.promotion_bonus_quantity,
    this.promotion_id,
    this.created_at,
    this.updated_at,
  });

  Sales_Order_Cart_Promotions_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    discount_amount = json['discount_amount'];
    promotion_type = json['promotion_type'];

    sales_order_cart_id = json['sales_order_cart_id'];
    discount_percentage = json['discount_percentage'];
    discount_type = json['discount_type'];
    promotion_bonus_item_id = json['promotion_bonus_item_id'];
    promotion_bonus_quantity = json['promotion_bonus_quantity'];
    promotion_id = json['promotion_id'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['discount_amount'] = this.discount_amount;
    data['promotion_type'] = this.promotion_type;
    data['sales_order_cart_id'] = this.sales_order_cart_id;

    data['discount_percentage'] = this.discount_percentage;
    data['discount_type'] = this.discount_type;

    data['promotion_bonus_item_id'] = this.promotion_bonus_item_id;
    data['promotion_bonus_quantity'] = this.promotion_bonus_quantity;

    data['promotion_id'] = this.promotion_id;


    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
  return  data;}
}


//=============================================================







class AdminsModel {
  int id;
  String admin_type;
  String name;
  String email;
  String phone_no;
  String image;
  String password;

  String decoded_password;
  String remember_token;
  String status;
  int created_at;
  int updated_at;

  AdminsModel({this.id,
    this.admin_type,
    this.name,
    this.email,
    this.phone_no,
    this.image,
    this.password,
    this.decoded_password,
    this.remember_token,
    this.status,
    this.created_at,
    this.updated_at});

  AdminsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    admin_type = json['admin_type'];
    name = json['name'];
    email = json['email'];
    phone_no = json['phone_no'];
    image = json['image'];
    password = json['password'];
    decoded_password = json['decoded_password'];
    remember_token = json['remember_token'];
    status = json['status'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_type'] = this.admin_type;

    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_no'] = this.phone_no;
    data['image'] = this.image;

    data['password'] = this.password;
    data['decoded_password'] = this.decoded_password;

    data['remember_token'] = this.remember_token;
    data['status'] = this.status;

    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
  }
}

class Alternate_Items_Model {
  int id;
  int user_id;
  int item_id;
  int alt_item_id;
  int created_at;
  int updated_at;

  Alternate_Items_Model({this.id,
    this.user_id,
    this.item_id,
    this.alt_item_id,
    this.created_at,
    this.updated_at});

  Alternate_Items_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    item_id = json['item_id'];
    alt_item_id = json['alt_item_id'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.user_id;

    data['item_id'] = this.item_id;
    data['alt_item_id'] = this.alt_item_id;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
  }
}

class Banks_Model {
  int id;
  int user_id;
  String bank_name_en;
  String bank_name_ar;

  String note;
  String status;

  int updated_at;
  String remember_token;

  Banks_Model({this.id,
    this.user_id,
    this.bank_name_en,
    this.bank_name_ar,
    this.note,
    this.status,
    this.updated_at,
    this.remember_token});

  Banks_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    bank_name_en = json['bank_name_en'];
    bank_name_ar = json['bank_name_ar'];
    note = json['note'];
    status = json['status'];
    updated_at = json['updated_at'];
    remember_token = json['remember_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.user_id;

    data['bank_name_en'] = this.bank_name_en;
    data['bank_name_ar'] = this.bank_name_ar;
    data['note'] = this.note;
    data['status'] = this.status;
    data['remember_token'] = this.remember_token;
    data['updated_at'] = this.updated_at;
  }
}

class Bank_Branches_Model {
  int id;
  int bank_id;
  int user_id;

  String branch_name_en;
  String branch_name_ar;

  String phone_no;
  String fax_no;

  String email;
  String area_1;

  String area_2;
  int state_id;

  int city_id;

  String contact_person;
  String note;
  StatusType status;

  int created_at;
  int updated_at;

  Bank_Branches_Model({this.id,
    this.bank_id,
    this.user_id,
    this.branch_name_en,
    this.branch_name_ar,
    this.phone_no,
    this.fax_no,
    this.email,
    this.area_1,
    this.area_2,
    this.state_id,
    this.city_id,
    this.contact_person,
    this.note,
    this.status,
    this.created_at,
    this.updated_at});

  Bank_Branches_Model.fromJson(Map<String, dynamic> json) {
    note = json['note'];
    area_2 = json['area_2'];
    state_id = json['state_id'];
    city_id = json['city_id'];
    contact_person = json['contact_person'];
    id = json['id'];
    bank_id = json['bank_id'];
    user_id = json['user_id'];
    branch_name_en = json['branch_name_en'];
    phone_no = json['phone_no'];
    branch_name_ar = json['branch_name_ar'];
    fax_no = json['fax_no'];
    email = json['email'];
    area_1 = json['area_1'];

    status = json['status'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['area_1'] = this.area_1;
    data['email'] = this.email;

    data['fax_no'] = this.fax_no;

    data['branch_name_en'] = this.branch_name_en;
    data['branch_name_ar'] = this.branch_name_ar;

    data['id'] = this.id;
    data['note'] = this.note;

    data['area_2'] = this.area_2;
    data['state_id'] = this.state_id;
    data['phone_no'] = this.phone_no;
    data['city_id'] = this.city_id;

    data['contact_person'] = this.contact_person;
    data['bank_id'] = this.bank_id;

    data['user_id'] = this.user_id;
    data['status'] = this.status;

    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
  }
}

class Categories_Model {
  int id;
  int user_id;
  String category_name_en;
  String category_name_ar;

  String brand_manager;
  String status;

  int updated_at;
  String remember_token;

  Categories_Model(this.id,
      this.user_id,
      this.category_name_en,
      this.category_name_ar,
      this.brand_manager,
      this.status,
      this.updated_at,
      this.remember_token);

  Categories_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    category_name_en = json['category_name_en'];
    category_name_ar = json['category_name_ar'];
    brand_manager = json['brand_manager'];
    status = json['status'];
    updated_at = json['updated_at'];
    remember_token = json['remember_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['updated_at'] = this.updated_at;
    data['remember_token'] = this.remember_token;

    data['id'] = this.id;
    data['user_id'] = this.user_id;

    data['category_name_en'] = this.category_name_en;
    data['category_name_ar'] = this.category_name_ar;
    data['brand_manager'] = this.brand_manager;
    data['status'] = this.status;
  }
}

class Cities_Model {
  int id;
  int state_id;
  String name;

  String status;

  Cities_Model(this.id,
      this.state_id,
      this.name,
      this.status,);

  Cities_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state_id = json['state_id'];
    name = json['name'];

    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['state_id'] = this.state_id;

    data['name'] = this.name;

    data['status'] = this.status;
  }
}

class Companies_Model {
  int id;

  String company_name_en;
  String email;
  String phone_no;
  String image;
  String company_name_ar;

  String fax_no;
  String vat_no;
  String status;
  int created_at;
  int updated_at;

  Companies_Model({this.id,
    this.company_name_en,
    this.company_name_ar,
    this.email,
    this.phone_no,
    this.image,
    this.fax_no,
    this.vat_no,
    this.status,
    this.created_at,
    this.updated_at});

  Companies_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company_name_en = json['company_name_en'];
    company_name_ar = json['company_name_ar'];
    email = json['email'];
    phone_no = json['phone_no'];
    image = json['image'];
    fax_no = json['fax_no'];
    vat_no = json['vat_no'];

    status = json['status'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_name_en'] = this.company_name_en;

    data['company_name_ar'] = this.company_name_ar;
    data['email'] = this.email;
    data['phone_no'] = this.phone_no;
    data['image'] = this.image;

    data['fax_no'] = this.fax_no;
    data['vat_no'] = this.vat_no;

    data['status'] = this.status;

    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
  }
}

class Countries_Model {
  int id;

  String sortname;
  String name;
  String phonecode;
  String currency;
  String currency_short;

  String status;

  Countries_Model({
    this.id,
    this.sortname,
    this.name,
    this.phonecode,
    this.currency,
    this.currency_short,
    this.status,
  });

  Countries_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sortname = json['sortname'];
    name = json['name'];
    phonecode = json['phonecode'];
    currency = json['currency'];
    currency_short = json['currency_short'];

    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sortname'] = this.sortname;

    data['name'] = this.name;
    data['phonecode'] = this.phonecode;
    data['currency'] = this.currency;
    data['currency_short'] = this.currency_short;

    data['status'] = this.status;
  }
}

class Currencies_Model {
  int id;

  int user_id;

  double rate;
  String name;
  String code;

  String precision;
  String symbol;

  String symbol_first;
  String decimal_mark;

  String thousands_separator;
  String enabled;
  int created_at;
  int deleted_at;
  int updated_at;

  Currencies_Model({this.id,
    this.rate,
    this.user_id,
    this.name,
    this.code,
    this.precision,
    this.symbol,
    this.symbol_first,
    this.decimal_mark,
    this.thousands_separator,
    this.enabled,
    this.deleted_at,
    this.created_at,
    this.updated_at});

  Currencies_Model.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    name = json['name'];
    code = json['code'];
    precision = json['precision'];
    symbol = json['symbol'];
    id = json['id'];
    symbol_first = json['symbol_first'];
    user_id = json['user_id'];
    decimal_mark = json['decimal_mark'];
    thousands_separator = json['thousands_separator'];
    enabled = json['enabled'];
    deleted_at = json['deleted_at'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['rate'] = this.rate;
    data['name'] = this.name;

    data['code'] = this.code;
    data['precision'] = this.precision;
    data['symbol'] = this.symbol;

    data['id'] = this.id;
    data['symbol_first'] = this.symbol_first;

    data['user_id'] = this.user_id;
    data['decimal_mark'] = this.decimal_mark;
    data['thousands_separator'] = this.thousands_separator;
    data['enabled'] = this.enabled;

    data['deleted_at'] = this.deleted_at;

    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
  }
}

class Customers_Model {
  int id;
  int app_employee_id;
  int user_id;

  String ref_id;
  String customer_id;

  String customer_name_en;
  String customer_name_ar;

  String email;
  String customer_type_id;

  String phone_no;
  String fax;

  String tax_status;

  String image;
  String credit_limit;
  String cheque_due_date;
  double discount;
  String balance;
  String payment_type;
  String price_list_id;
  String state_id;
  String city_id;
  String area1;
  String area2;
  String location;
  String latitude;
  String longitude;
  String status;
  int created_at;
  int updated_at;

  Customers_Model({this.longitude,
    this.status,
    this.area1,
    this.area2,
    this.location,
    this.latitude,
    this.state_id,
    this.city_id,
    this.credit_limit,
    this.cheque_due_date,
    this.discount,
    this.balance,
    this.payment_type,
    this.price_list_id,
    this.id,
    this.app_employee_id,
    this.user_id,
    this.customer_id,
    this.customer_name_en,
    this.phone_no,
    this.customer_name_ar,
    this.email,
    this.customer_type_id,
    this.fax,
    this.tax_status,
    this.image,
    this.created_at,
    this.updated_at});

  Customers_Model.fromJson(Map<String, dynamic> json) {
    app_employee_id = json['app_employee_id'];
    ref_id = json['ref_id'];
    state_id = json['state_id'];
    city_id = json['city_id'];
    customer_id = json['customer_id'];
    id = json['id'];
    customer_name_en = json['customer_name_en'];
    customer_name_ar = json['customer_name_ar'];
    customer_type_id = json['customer_type_id'];
    phone_no = json['phone_no'];
    fax = json['fax'];
    tax_status = json['tax_status'];
    email = json['email'];
    image = json['image'];

    credit_limit = json['credit_limit'];
    cheque_due_date = json['cheque_due_date'];
    discount = json['discount'];

    balance = json['balance'];
    payment_type = json['payment_type'];
    price_list_id = json['price_list_id'];

    state_id = json['state_id'];
    city_id = json['city_id'];
    area1 = json['area1'];

    area2 = json['area2'];
    location = json['location'];
    latitude = json['latitude'];

    longitude = json['longitude'];

    status = json['status'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['user_id'] = this.user_id;

    data['app_employee_id'] = this.app_employee_id;

    data['ref_id'] = this.ref_id;
    data['customer_id'] = this.customer_id;

    data['customer_name_en'] = this.customer_name_en;
    data['customer_name_ar'] = this.customer_name_ar;

    data['customer_type_id'] = this.customer_type_id;
    data['email'] = this.email;
    data['phone_no'] = this.phone_no;
    data['fax'] = this.fax;

    data['tax_status'] = this.tax_status;
    data['image'] = this.image;

    data['credit_limit'] = this.credit_limit;
    data['cheque_due_date'] = this.cheque_due_date;

    data['discount'] = this.discount;
    data['balance'] = this.balance;

    data['payment_type'] = this.payment_type;
    data['price_list_id'] = this.price_list_id;

    data['state_id'] = this.state_id;
    data['city_id'] = this.city_id;

    data['area1'] = this.area1;
    data['area2'] = this.area2;

    data['location'] = this.location;
    data['latitude'] = this.latitude;

    data['longitude'] = this.longitude;
    data['status'] = this.status;

    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
  }
}

class Customer_drawers_Model {
  int id;
  int customer_id;
  String drawer_name;
  int bank_id;

  int branch_id;

  int updated_at;
  int created_at;

  Customer_drawers_Model({this.id,
    this.customer_id,
    this.drawer_name,
    this.bank_id,
    this.branch_id,
    this.updated_at,
    this.created_at});

  Customer_drawers_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer_id = json['customer_id'];
    drawer_name = json['drawer_name'];
    bank_id = json['bank_id'];
    branch_id = json['branch_id'];

    updated_at = json['updated_at'];
    created_at = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customer_id;

    data['drawer_name'] = this.drawer_name;
    data['bank_id'] = this.bank_id;
    data['branch_id'] = this.branch_id;

    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
  }
}

class customer_payments_Model {
  int id;
  int employee_id;
  int user_id;
  int customer_id;
  int supervisor_id;
  int salesmanager_id;
  int payment_date;
  double amount;
  String payment_type;
  String customer_name;

  String salesman_name;
  String payment_no;

  String reference_no;
  int bank_id;
  int branch_id;
  String drawer_name;
  String cheque_no;
  int due_date;
  String note;
  String image;
  String request_status;
  int responded_date;
  int created_at;
  int updated_at;

  customer_payments_Model({this.id,
    this.amount,
    this.bank_id,
    this.branch_id,
    this.cheque_no,
    this.created_at,
    this.customer_id,
    this.customer_name,
    this.drawer_name,
    this.due_date,
    this.employee_id,
    this.image,
    this.note,
    this.payment_date,
    this.payment_no,
    this.payment_type,
    this.reference_no,
    this.request_status,
    this.responded_date,
    this.salesman_name,
    this.salesmanager_id,
    this.supervisor_id,
    this.updated_at,
    this.user_id});

  customer_payments_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employee_id = json['employee_id'];
    user_id = json['user_id'];
    customer_id = json['customer_id'];
    supervisor_id = json['supervisor_id'];
    salesmanager_id = json['salesmanager_id'];
    payment_date = json['payment_date'];
    amount = json['amount'];
    payment_type = json['payment_type'];
    customer_name = json['customer_name'];
    salesman_name = json['salesman_name'];
    payment_no = json['payment_no'];

    reference_no = json['reference_no'];
    bank_id = json['bank_id'];
    branch_id = json['branch_id'];
    drawer_name = json['drawer_name'];
    cheque_no = json['cheque_no'];
    due_date = json['due_date'];
    note = json['note'];
    image = json['image'];
    request_status = json['request_status'];
    responded_date = json['responded_date'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();

    json['id'] = this.id;
    json['employee_id'] = this.employee_id;
    json['user_id'] = this.user_id;

    json['customer_id'] = this.customer_id;
    json['supervisor_id'] = this.supervisor_id;

    json['payment_date'] = this.payment_date;
    json['amount'] = this.amount;
    json['payment_type'] = this.payment_type;
    json['customer_name'] = this.customer_name;
    json['salesman_name'] = this.salesman_name;
    json['payment_no'] = this.payment_no;

    json['reference_no'] = this.reference_no;
    json['bank_id'] = this.bank_id;
    json['branch_id'] = this.branch_id;
    json['drawer_name'] = this.drawer_name;
    json['cheque_no'] = this.cheque_no;
    json['due_date'] = this.due_date;
    json['note'] = this.note;
    json['image'] = this.image;
    json['request_status'] = this.request_status;
    json['responded_date'] = this.responded_date;
    json['created_at'] = this.created_at;
    json['updated_at'] = this.updated_at;
  }
}

class Customer_types_Model {
  int id;
  int user_id;
  String customer_type_en;
  String customer_type_ar;
  String status;

  int updated_at;
  int created_at;

  Customer_types_Model({this.id,
    this.user_id,
    this.customer_type_ar,
    this.customer_type_en,
    this.status,
    this.updated_at,
    this.created_at});

  Customer_types_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer_type_ar = json['customer_type_ar'];
    user_id = json['user_id'];
    customer_type_en = json['customer_type_en'];
    status = json['status'];

    updated_at = json['updated_at'];
    created_at = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;

    data['customer_type_en'] = this.customer_type_en;
    data['customer_type_ar'] = this.customer_type_ar;
    data['user_id'] = this.user_id;

    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
  }
}
class Temporary_tabel_cart{
String  user_id ;
String  customer_id ;
String  employee_id ;
String  salesmanager_id ;
String  store_id ;
String  supervisor_id ;


//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Temporary_tabel_cart({
    @required this.user_id,
    @required this.customer_id,
    @required this.employee_id,
    @required this.salesmanager_id,
    @required this.store_id,
    @required this.supervisor_id,

  });

  factory Temporary_tabel_cart.fromMap(Map<String, dynamic> map) {
    return new Temporary_tabel_cart(
      user_id: map['user_id'] as String,
      customer_id: map['customer_id'] as String,
      employee_id: map['employee_id'] as String,
      salesmanager_id: map['salesmanager_id'] as String,
      store_id: map['store_id'] as String,
      supervisor_id: map['supervisor_id'] as String,

    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'user_id': this.user_id,
      'customer_id': this.customer_id,
      'employee_id': this.employee_id,
      'salesmanager_id': this.salesmanager_id,
      'store_id': this.store_id,
      'supervisor_id': this.supervisor_id,

    } as Map<String, dynamic>;
  }

//</editor-fold>

}
class Temporary_tabel_cart_item{
 int  order_id ;
 String  id ;
 String  item_count ;




  Temporary_tabel_cart_item({
    @required this.order_id,
    @required this.id,
    @required this.item_count,
  });





  factory Temporary_tabel_cart_item.fromMap(Map<String, dynamic> map) {
    return new Temporary_tabel_cart_item(
      order_id: map['order_id']  ,
      id: map['id'] as String,
      item_count: map['item_count'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'order_id': this.order_id,
      'id': this.id,
      'item_count': this.item_count,
    } as Map<String, dynamic>;
  }





}