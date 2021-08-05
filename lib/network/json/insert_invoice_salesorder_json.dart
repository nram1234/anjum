class Insert_invoice_salesorder_json {
  String key;
  List<ListInvoice> listInvoice;

  Insert_invoice_salesorder_json({this.key, this.listInvoice});

  Insert_invoice_salesorder_json.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    if (json['list_invoice'] != null) {
      listInvoice = <ListInvoice>[];
      json['list_invoice'].forEach((v) {
        listInvoice.add(new ListInvoice.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    if (this.listInvoice != null) {
      data['list_invoice'] = this.listInvoice.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListInvoice {
  int userId;
  int requestLevel;
  String requestType;
  int employeeId;
  int customerId;
  String storeId;
  int supervisorId;
  int salesmanagerId;
  int noOfItems;
  String supervisorNote;
  String salesmanagerNote;
  String totalPriceWithoutTaxDiscount;
  double totalTax;
  int totalDiscount;
  int totalPrice;
  String requestStatus;
  int itemId;
  int categoryId;
  int measurementUnitId;
  int basePricePerUnit;
  int bonus;
  String quantity;
  String taxType;
  int totalPriceBeforeTax;
  int totalPriceWithTax;

  ListInvoice(
      {this.userId,
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
        this.itemId,
        this.categoryId,
        this.measurementUnitId,
        this.basePricePerUnit,
        this.bonus,
        this.quantity,
        this.taxType,
        this.totalPriceBeforeTax,
        this.totalPriceWithTax});

  ListInvoice.fromJson(Map<String, dynamic> json) {
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
    itemId = json['item_id'];
    categoryId = json['category_id'];
    measurementUnitId = json['measurement_unit_id'];
    basePricePerUnit = json['base_price_per_unit'];
    bonus = json['bonus'];
    quantity = json['quantity'];
    taxType = json['tax_type'];
    totalPriceBeforeTax = json['total_price_before_tax'];
    totalPriceWithTax = json['total_price_with_tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['item_id'] = this.itemId;
    data['category_id'] = this.categoryId;
    data['measurement_unit_id'] = this.measurementUnitId;
    data['base_price_per_unit'] = this.basePricePerUnit;
    data['bonus'] = this.bonus;
    data['quantity'] = this.quantity;
    data['tax_type'] = this.taxType;
    data['total_price_before_tax'] = this.totalPriceBeforeTax;
    data['total_price_with_tax'] = this.totalPriceWithTax;
    return data;
  }
}
