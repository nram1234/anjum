class Invoice_json {
  int id;
  int userId;
  int requestLevel;
  String requestType;
  int employeeId;
  int customerId;
  int storeId;
  int supervisorId;
  int salesmanagerId;
  String noOfItems;
  String supervisorNote;
  String salesmanagerNote;
  double totalPriceWithoutTaxDiscount;
  double totalTax;
  String totalDiscount;
  double totalPrice;
  String requestStatus;
  String salesmanagerStatus;
  String supervisorStatus;
  int isSuccessfullySubmitted;
  String createdAt;
  String updatedAt;

  Invoice_json(
      {this.id,
        this.userId,
        this.requestLevel,
        this.requestType,
        this.employeeId,
        this.customerId,
        this.storeId,
        this.supervisorId,
        this.salesmanagerId,
        this.noOfItems,
        this.supervisorNote,
        this.salesmanagerNote,
        this.totalPriceWithoutTaxDiscount,
        this.totalTax,
        this.totalDiscount,
        this.totalPrice,
        this.requestStatus,
        this.salesmanagerStatus,
        this.supervisorStatus,
        this.isSuccessfullySubmitted,
        this.createdAt,
        this.updatedAt});

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
