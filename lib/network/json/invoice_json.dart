class Invoice_json {
late  int id;
late  int userId;
late  int requestLevel;
late  String requestType;
late  int employeeId;
late  int customerId;
late  int storeId;
late  int supervisorId;
late  int salesmanagerId;
late  String noOfItems;
late  String supervisorNote;
late  String salesmanagerNote;
late  double totalPriceWithoutTaxDiscount;
late  double totalTax;
late  String totalDiscount;
late  double totalPrice;
late  String requestStatus;
late  String salesmanagerStatus;
late  String supervisorStatus;
late  int isSuccessfullySubmitted;
late  String createdAt;
late  String updatedAt;

  Invoice_json(
      {required this.id,
       required  this.userId,
       required  this.requestLevel,
       required  this.requestType,
       required  this.employeeId,
       required  this.customerId,
       required  this.storeId,
       required  this.supervisorId,
       required  this.salesmanagerId,
       required  this.noOfItems,
       required  this.supervisorNote,
       required  this.salesmanagerNote,
       required  this.totalPriceWithoutTaxDiscount,
       required  this.totalTax,
       required  this.totalDiscount,
       required  this.totalPrice,
       required  this.requestStatus,
       required  this.salesmanagerStatus,
       required  this.supervisorStatus,
       required  this.isSuccessfullySubmitted,
       required  this.createdAt,
       required  this.updatedAt});

  Invoice_json.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    requestLevel = json['request_level'];
    requestType = json['request_type'];
    employeeId = json['employee_id'];
    customerId = json['customer_id'];
    storeId = json['store_id'];
    supervisorId = json['supervisor_id'];
    salesmanagerId = json['salesmanager_id'];
    noOfItems = json['no_of_items'];
    supervisorNote = json['supervisor_note'];
    salesmanagerNote = json['salesmanager_note'];
    totalPriceWithoutTaxDiscount = json['total_price_without_tax_discount'];
    totalTax = json['total_tax'];
    totalDiscount = json['total_discount'];
    totalPrice = json['total_price'];
    requestStatus = json['request_status'];
    salesmanagerStatus = json['salesmanager_status'];
    supervisorStatus = json['supervisor_status'];
    isSuccessfullySubmitted = json['is_successfully_submitted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['request_level'] = this.requestLevel;
    data['request_type'] = this.requestType;
    data['employee_id'] = this.employeeId;
    data['customer_id'] = this.customerId;
    data['store_id'] = this.storeId;
    data['supervisor_id'] = this.supervisorId;
    data['salesmanager_id'] = this.salesmanagerId;
    data['no_of_items'] = this.noOfItems;
    data['supervisor_note'] = this.supervisorNote;
    data['salesmanager_note'] = this.salesmanagerNote;
    data['total_price_without_tax_discount'] =
        this.totalPriceWithoutTaxDiscount;
    data['total_tax'] = this.totalTax;
    data['total_discount'] = this.totalDiscount;
    data['total_price'] = this.totalPrice;
    data['request_status'] = this.requestStatus;
    data['salesmanager_status'] = this.salesmanagerStatus;
    data['supervisor_status'] = this.supervisorStatus;
    data['is_successfully_submitted'] = this.isSuccessfullySubmitted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
