class Products_json {
late  List<Products> products;

  Products_json({required this.products});

  Products_json.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products =[];
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
late  int id;
late  int userId;
late  String itemNameEn;
late  String itemNameAr;
late  String itemNumber;
late  int categoryId;
late  int subCategoryId;
late  int subCategory2Id;
late  int inventoryId;
late  String sellingPrice;
late  String minimumQuantity;
late  String reference;
late  String image;
late  String itemCost;
late  String tax;
late  String status;
late  String stockStatus;
late  String taxStatus;
late  String taxType;
late  String createdAt;
late  String updatedAt;

  Products(
      {required this.id,
       required this.userId,
       required this.itemNameEn,
       required this.itemNameAr,
       required this.itemNumber,
       required this.categoryId,
       required this.subCategoryId,
       required this.subCategory2Id,
       required this.inventoryId,
       required this.sellingPrice,
       required this.minimumQuantity,
       required this.reference,
       required this.image,
       required this.itemCost,
       required this.tax,
       required this.status,
       required this.stockStatus,
       required this.taxStatus,
       required this.taxType,
       required this.createdAt,
       required this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    itemNameEn = json['item_name_en'];
    itemNameAr = json['item_name_ar'];
    itemNumber = json['item_number'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    subCategory2Id = json['sub_category_2_id'];
    inventoryId = json['inventory_id'];
    sellingPrice = json['selling_price'];
    minimumQuantity = json['minimum_quantity'];
    reference = json['reference'];
    image = json['image'];
    itemCost = json['item_cost'];
    tax = json['tax'];
    status = json['status'];
    stockStatus = json['stock_status'];
    taxStatus = json['tax_status'];
    taxType = json['tax_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['item_name_en'] = this.itemNameEn;
    data['item_name_ar'] = this.itemNameAr;
    data['item_number'] = this.itemNumber;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['sub_category_2_id'] = this.subCategory2Id;
    data['inventory_id'] = this.inventoryId;
    data['selling_price'] = this.sellingPrice;
    data['minimum_quantity'] = this.minimumQuantity;
    data['reference'] = this.reference;
    data['image'] = this.image;
    data['item_cost'] = this.itemCost;
    data['tax'] = this.tax;
    data['status'] = this.status;
    data['stock_status'] = this.stockStatus;
    data['tax_status'] = this.taxStatus;
    data['tax_type'] = this.taxType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
