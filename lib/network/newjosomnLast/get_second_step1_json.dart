class Get_second_step1_json {
  String message;
  int codenum;
  bool status;
  Result result;

  Get_second_step1_json({this.message, this.codenum, this.status, this.result});

  Get_second_step1_json.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    codenum = json['codenum'];
    status = json['status'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
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
  List<AllCustomers> allCustomers;

  Result({this.allCustomers});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['all_customers'] != null) {
      allCustomers = new List<AllCustomers>();
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
  String id;
  String userId;
  String appEmployeeId;
  String refId;
  String priceListId;
  String customerId;
  String customerNameEn;
  String customerNameAr;
  String customerTypeId;
  String email;
  String phoneNo;
  String fax;
  String taxStatus;
  String image;
  String creditLimit;
  String chequeDueDate;
  String discount;
  String balance;
  String paymentType;
  String stateId;
  String cityId;
  String area1;
  String area2;
  String location;
  String latitude;
  String longitude;

  AllCustomers(
      {this.id,
        this.userId,
        this.appEmployeeId,
        this.refId,
        this.priceListId,
        this.customerId,
        this.customerNameEn,
        this.customerNameAr,
        this.customerTypeId,
        this.email,
        this.phoneNo,
        this.fax,
        this.taxStatus,
        this.image,
        this.creditLimit,
        this.chequeDueDate,
        this.discount,
        this.balance,
        this.paymentType,
        this.stateId,
        this.cityId,
        this.area1,
        this.area2,
        this.location,
        this.latitude,
        this.longitude});

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
