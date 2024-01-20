class Insert_invoice_salesorder_json {
  late  String key;
  late List<ListInvoice> listInvoice;

  Insert_invoice_salesorder_json({ required this.listInvoice});

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
 late int user_id;
 late int order_id;
 late int no_invoice;
 late String request_level;
 late String request_type;
 late int employee_id;
 late int customer_id;
 late int storeId;
 late int supervisorId;
 late int salesmanagerId;
 late int noOfItems;
 late String supervisorNote;
 late String salesmanagerNote;
 late double totalPriceWithoutTaxDiscount;
 late double totalTax;
 late double totalDiscount;
 late double totalPrice;
 late String requestStatus;
 late int itemId;
 late int categoryId;
 late int measurementUnitId;
 late double basePricePerUnit;
 late double bonus;
 late double quantity;
 late String taxType;
 late double totalPriceBeforeTax;
 late double totalPriceWithTax;

  ListInvoice(
      {required this.user_id,required this.order_id, required this.no_invoice,
       required  this.request_level,
       required  this.request_type,
       required  this.employee_id,
       required  this.customer_id,
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
       required  this.itemId,
       required  this.categoryId,
       required  this.measurementUnitId,
       required  this.basePricePerUnit,
       required  this.bonus,
       required  this.quantity,
       required  this.taxType,
       required  this.totalPriceBeforeTax,
       required  this.totalPriceWithTax});

  ListInvoice.fromJson(Map<String, dynamic> json) {
    user_id = json['user_id'];
    order_id = json['order_id'];
    request_level = json['request_level'];
    request_type = json['request_type'];
    employee_id = json['employee_id'];
    customer_id = json['customer_id'];
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
    data['user_id'] = this.user_id;
    data['order_id'] = this.order_id;
    data['no_invoice'] = this.no_invoice;
    data['request_level'] = this.request_level;
    data['request_type'] = this.request_type;
    data['employee_id'] = this.employee_id;
    data['customer_id'] = this.customer_id;
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
