class OlderPost_json {
late  List<ListOrderToJson> listOrder;

  OlderPost_json({required this.listOrder});

  OlderPost_json.fromJson(Map<String, dynamic> json) {
    if (json['list_order'] != null) {
      listOrder = <ListOrderToJson>[];
      json['list_order'].forEach((v) {
        listOrder.add(new ListOrderToJson.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listOrder != null) {
      data['list_order'] = this.listOrder.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListOrderToJson {
late  int userId;
late  int requestLevel;
late  String requestType;
late  int employeeId;
late  int customerId;
late  int storeId;
late  int supervisorId;
late  int salesmanagerId;
late  int noOfItems;
late  String supervisorNote;
late  String salesmanagerNote;
late  String totalPriceWithoutTaxDiscount;
late  double totalTax;
late  int totalDiscount;
late  int totalPrice;
late  String requestStatus;
late  List<Item> item;

  ListOrderToJson(
      {required this.userId,
       required this.requestLevel,
       required this.requestType,
       required this.employeeId,
       required this.customerId,
       required this.storeId,
       required this.supervisorId,
       required this.salesmanagerId,
       required this.noOfItems,
       required this.supervisorNote,
       required this.salesmanagerNote,
       required this.totalPriceWithoutTaxDiscount,
       required this.totalTax,
       required this.totalDiscount,
       required this.totalPrice,
       required this.requestStatus,
       required this.item});

  ListOrderToJson.fromJson(Map<String, dynamic> json) {
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
    if (json['item'] != null) {
      item = <Item>[];
      json['item'].forEach((v) {
        item.add(new Item.fromJson(v));
      });
    }
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
    if (this.item != null) {
      data['item'] = this.item.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
late int itemId;
late int categoryId;
late int measurementUnitId;
late int basePricePerUnit;
late int bonus;
late String quantity;
late String taxType;
late int totalTax;
late int totalPriceBeforeTax;
late int totalPriceWithTax;
late int totalPrice;

  Item(
      { required this.itemId,
       required this.categoryId,
       required this.measurementUnitId,
       required this.basePricePerUnit,
       required this.bonus,
       required this.quantity,
       required this.taxType,
       required this.totalTax,
       required this.totalPriceBeforeTax,
       required this.totalPriceWithTax,
       required this.totalPrice});

  Item.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    categoryId = json['category_id'];
    measurementUnitId = json['measurement_unit_id'];
    basePricePerUnit = json['base_price_per_unit'];
    bonus = json['bonus'];
    quantity = json['quantity'];
    taxType = json['tax_type'];
    totalTax = json['total_tax'];
    totalPriceBeforeTax = json['total_price_before_tax'];
    totalPriceWithTax = json['total_price_with_tax'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['category_id'] = this.categoryId;
    data['measurement_unit_id'] = this.measurementUnitId;
    data['base_price_per_unit'] = this.basePricePerUnit;
    data['bonus'] = this.bonus;
    data['quantity'] = this.quantity;
    data['tax_type'] = this.taxType;
    data['total_tax'] = this.totalTax;
    data['total_price_before_tax'] = this.totalPriceBeforeTax;
    data['total_price_with_tax'] = this.totalPriceWithTax;
    data['total_price'] = this.totalPrice;
    return data;
  }
}
