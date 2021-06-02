class OlderPost_json {
  List<ListOrderToJson> listOrder;

  OlderPost_json({this.listOrder});

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
  int userId;
  int requestLevel;
  String requestType;
  int employeeId;
  int customerId;
  int storeId;
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
  List<Item> item;

  ListOrderToJson(
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
        this.item});

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
  int itemId;
  int categoryId;
  int measurementUnitId;
  int basePricePerUnit;
  int bonus;
  String quantity;
  String taxType;
  int totalTax;
  int totalPriceBeforeTax;
  int totalPriceWithTax;
  int totalPrice;

  Item(
      {this.itemId,
        this.categoryId,
        this.measurementUnitId,
        this.basePricePerUnit,
        this.bonus,
        this.quantity,
        this.taxType,
        this.totalTax,
        this.totalPriceBeforeTax,
        this.totalPriceWithTax,
        this.totalPrice});

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
