class Products_json {
  List<Products> products;

  Products_json({this.products});

  Products_json.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = new List<Products>();
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
  int id;
  int userId;
  String itemNameEn;
  String itemNameAr;
  String itemNumber;
  int categoryId;
  int subCategoryId;
  int subCategory2Id;
  int inventoryId;
  String sellingPrice;
  String minimumQuantity;
  String reference;
  String image;
  String itemCost;
  String tax;
  String status;
  String stockStatus;
  String taxStatus;
  String taxType;
  String createdAt;
  String updatedAt;

  Products(
      {this.id,
        this.userId,
        this.itemNameEn,
        this.itemNameAr,
        this.itemNumber,
        this.categoryId,
        this.subCategoryId,
        this.subCategory2Id,
        this.inventoryId,
        this.sellingPrice,
        this.minimumQuantity,
        this.reference,
        this.image,
        this.itemCost,
        this.tax,
        this.status,
        this.stockStatus,
        this.taxStatus,
        this.taxType,
        this.createdAt,
        this.updatedAt});

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
