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
  List<Item_Database> item;

  Item_Order__Db_json({this.item});

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
  int olderId;
  int itemId;
  int categoryId;
  int measurementUnitId;
  double basePricePerUnit;
  double bonus;
  int quantity;
  String taxType;
  double totalTax;
  double totalPriceBeforeTax;
  double totalPriceWithTax;
  double totalPrice;

  Item_Database(
      {this.itemId,this.olderId,
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
