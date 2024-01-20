class Get_second_step1_json {
late  String message;
late  int codenum;
late  bool status;
late  Result result;

  Get_second_step1_json({required this.message,required this.codenum,required this.status,required this.result});

  Get_second_step1_json.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    codenum = json['codenum'];
    status = json['status'];
    result =
    (json['result'] != null ? new Result.fromJson(json['result']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['codenum'] = this.codenum;
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
late  List<AllCustomers> allCustomers;

  Result({required this.allCustomers});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['all_customers'] != null) {
      allCustomers = [];
      json['all_customers'].forEach((v) {
        allCustomers.add(new AllCustomers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allCustomers != null) {
      data['all_customers'] = this.allCustomers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllCustomers {
late String id;
late String userId;
late String appEmployeeId;
late String refId;
late String priceListId;
late String customerId;
late String customerNameEn;
late String customerNameAr;
late String customerTypeId;
late String email;
late String phoneNo;
late String fax;
late String taxStatus;
late String image;
late String creditLimit;
late String chequeDueDate;
late String discount;
late String balance;
late String paymentType;
late String stateId;
late String cityId;
late String area1;
late String area2;
late String location;
late String latitude;
late String longitude;

  AllCustomers(
      {required this.id,
       required  this.userId,
       required  this.appEmployeeId,
       required  this.refId,
       required  this.priceListId,
       required  this.customerId,
       required  this.customerNameEn,
       required  this.customerNameAr,
       required  this.customerTypeId,
       required  this.email,
       required  this.phoneNo,
       required  this.fax,
       required  this.taxStatus,
       required  this.image,
       required  this.creditLimit,
       required  this.chequeDueDate,
       required  this.discount,
       required  this.balance,
       required  this.paymentType,
       required  this.stateId,
       required  this.cityId,
       required  this.area1,
       required  this.area2,
       required  this.location,
       required  this.latitude,
       required  this.longitude});

  AllCustomers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    appEmployeeId = json['app_employee_id'];
    refId = json['ref_id'];
    priceListId = json['price_list_id'];
    customerId = json['customer_id'];
    customerNameEn = json['customer_name_en'];
    customerNameAr = json['customer_name_ar'];
    customerTypeId = json['customer_type_id'];
    email = json['email'];
    phoneNo = json['phone_no'];
    fax = json['fax'];
    taxStatus = json['tax_status'];
    image = json['image'];
    creditLimit = json['credit_limit'];
    chequeDueDate = json['cheque_due_date'];
    discount = json['discount'];
    balance = json['balance'];
    paymentType = json['payment_type'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    area1 = json['area1'];
    area2 = json['area2'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['app_employee_id'] = this.appEmployeeId;
    data['ref_id'] = this.refId;
    data['price_list_id'] = this.priceListId;
    data['customer_id'] = this.customerId;
    data['customer_name_en'] = this.customerNameEn;
    data['customer_name_ar'] = this.customerNameAr;
    data['customer_type_id'] = this.customerTypeId;
    data['email'] = this.email;
    data['phone_no'] = this.phoneNo;
    data['fax'] = this.fax;
    data['tax_status'] = this.taxStatus;
    data['image'] = this.image;
    data['credit_limit'] = this.creditLimit;
    data['cheque_due_date'] = this.chequeDueDate;
    data['discount'] = this.discount;
    data['balance'] = this.balance;
    data['payment_type'] = this.paymentType;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['area1'] = this.area1;
    data['area2'] = this.area2;
    data['location'] = this.location;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
