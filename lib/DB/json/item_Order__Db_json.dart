class Item_Order__Db_json {
 late List<Item> item;

  Item_Order__Db_json({required this.item});

  Item_Order__Db_json.fromJson(Map<String, dynamic> json) {
    if (json['item'] != null) {
      item = <Item>[];
      json['item'].forEach((v) {
        item.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.item != null) {
      data['item'] = this.item.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
late  int itemId;
late  int categoryId;
late  int measurementUnitId;
late  int basePricePerUnit;
late  int bonus;
late  String quantity;
late  String taxType;
late  int totalTax;
late  int totalPriceBeforeTax;
late  int totalPriceWithTax;
late  int totalPrice;

  Item(
      {required this.itemId,
       required  this.categoryId,
       required  this.measurementUnitId,
       required  this.basePricePerUnit,
       required  this.bonus,
       required  this.quantity,
       required  this.taxType,
       required  this.totalTax,
       required  this.totalPriceBeforeTax,
       required  this.totalPriceWithTax,
       required  this.totalPrice});

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