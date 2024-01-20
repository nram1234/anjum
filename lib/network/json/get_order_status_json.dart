class Get_Order_Status_json {
 late String message;
 late int codenum;
 late bool status;
 late Result result;

  Get_Order_Status_json({required this.message,required this.codenum,required this.status,required this.result});

  Get_Order_Status_json.fromJson(Map<String, dynamic> json) {
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
 late List<AllOrderStatus> allOrderStatus;

  Result({required this.allOrderStatus});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['all_order_status'] != null) {
      allOrderStatus = [];//new List<AllOrderStatus>();
      json['all_order_status'].forEach((v) {
        allOrderStatus.add(new AllOrderStatus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allOrderStatus != null) {
      data['all_order_status'] =
          this.allOrderStatus.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllOrderStatus {
late  String salesmanagerId;
late  String customerId;
late  String customerNameEn;
late  String customerNameAr;
late  String storeId;
late  String storeSalesmanagerStatusid;
late  String supervisorStatus;
late  String totalPrice;
late  String noOfItems;

  AllOrderStatus(
      {required this.salesmanagerId,
       required  this.customerId,
       required  this.customerNameEn,
       required  this.customerNameAr,
       required  this.storeId,
       required  this.storeSalesmanagerStatusid,
       required  this.supervisorStatus,
       required  this.totalPrice,
       required  this.noOfItems});

  AllOrderStatus.fromJson(Map<String, dynamic> json) {
    salesmanagerId = json['salesmanager_id'];
    customerId = json['customer_id'];
    customerNameEn = json['customer_name_en'];
    customerNameAr = json['customer_name_ar'];
    storeId = json['store_id'];
    storeSalesmanagerStatusid = json['store_salesmanager_statusid'];
    supervisorStatus = json['supervisor_status'];
    totalPrice = json['total_price'];
    noOfItems = json['no_of_items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['salesmanager_id'] = this.salesmanagerId;
    data['customer_id'] = this.customerId;
    data['customer_name_en'] = this.customerNameEn;
    data['customer_name_ar'] = this.customerNameAr;
    data['store_id'] = this.storeId;
    data['store_salesmanager_statusid'] = this.storeSalesmanagerStatusid;
    data['supervisor_status'] = this.supervisorStatus;
    data['total_price'] = this.totalPrice;
    data['no_of_items'] = this.noOfItems;
    return data;
  }
}
