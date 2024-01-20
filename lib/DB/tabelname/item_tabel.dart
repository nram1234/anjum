final String item_tabelname='item_of_older_list';
final String item_older_id='older_id';
final String item_itemId='item_id';
final String item_categoryId='category_id';
final String item_measurementUnitId='measurement_unit_id';
final String item_basePricePerUnit='base_price_per_unit';
final String item_bonus='bonus';
final String item_quantity='quantity';
final String item_taxType='tax_type';
final String item_totalTax='total_tax';
final String item_totalPriceBeforeTax='total_price_before_tax';
final String item_totalPriceWithTax='total_price_with_tax';
final String item_totalPrice='total_price';

//======================================
class Item_Order__Db_json {
late  List<Item_Database> item;

  Item_Order__Db_json({required this.item});

  Item_Order__Db_json.fromJson(Map<String, dynamic> json) {
    if (json['item'] != null) {
      item = <Item_Database>[];
      json['item'].forEach((v) {
        item.add(new Item_Database.fromJson(v));
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

class Item_Database {
late  int olderId;
late  int itemId;
late  int categoryId;
late  int measurementUnitId;
late  double basePricePerUnit;
late  double bonus;
late  int quantity;
late  String taxType;
late  double totalTax;
late  double totalPriceBeforeTax;
late  double totalPriceWithTax;
late  double totalPrice;

  Item_Database(
      {required this.itemId,required this.olderId,
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

  Item_Database.fromJson(Map<String, dynamic> json) {
    olderId = json['older_id'];
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
    data['older_id'] = this.olderId;
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
