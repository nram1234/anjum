class Get_third_step_json {
  String message;
  int codenum;
  bool status;
  Result result;

  Get_third_step_json({this.message, this.codenum, this.status, this.result});

  Get_third_step_json.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    codenum = json['codenum'];
    status = json['status'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['codenum'] = this.codenum;
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  List<AllCategories> allCategories;
  List<AllItems> allItems;
  SalesOrder salesOrder;

  Result({this.allCategories, this.allItems, this.salesOrder});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['all_categories'] != null) {
      allCategories = new List<AllCategories>();
      json['all_categories'].forEach((v) {
        allCategories.add(new AllCategories.fromJson(v));
      });
    }
    if (json['all_items'] != null) {
      allItems = new List<AllItems>();
      json['all_items'].forEach((v) {
        allItems.add(new AllItems.fromJson(v));
      });
    }
    salesOrder = json['sales_order'] != null
        ? new SalesOrder.fromJson(json['sales_order'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allCategories != null) {
      data['all_categories'] =
          this.allCategories.map((v) => v.toJson()).toList();
    }
    if (this.allItems != null) {
      data['all_items'] = this.allItems.map((v) => v.toJson()).toList();
    }
    if (this.salesOrder != null) {
      data['sales_order'] = this.salesOrder.toJson();
    }
    return data;
  }
}

class AllCategories {
  String id;
  String userId;
  String categoryNameEn;
  String categoryNameAr;
  String status;
  List<SubCategories> subCategories;

  AllCategories(
      {this.id,
        this.userId,
        this.categoryNameEn,
        this.categoryNameAr,
        this.status,
        this.subCategories});

  AllCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryNameEn = json['category_name_en'];
    categoryNameAr = json['category_name_ar'];
    status = json['status'];
    if (json['sub_categories'] != null) {
      subCategories = new List<SubCategories>();
      json['sub_categories'].forEach((v) {
        subCategories.add(new SubCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category_name_en'] = this.categoryNameEn;
    data['category_name_ar'] = this.categoryNameAr;
    data['status'] = this.status;
    if (this.subCategories != null) {
      data['sub_categories'] =
          this.subCategories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
  String id;
  String userId;
  String categoryId;
  String subCategoryNameEn;
  String subCategoryNameAr;
  String image;
  String categoryNameEn;

  SubCategories(
      {this.id,
        this.userId,
        this.categoryId,
        this.subCategoryNameEn,
        this.subCategoryNameAr,
        this.image,
        this.categoryNameEn});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    subCategoryNameEn = json['sub_category_name_en'];
    subCategoryNameAr = json['sub_category_name_ar'];
    image = json['image'];
    categoryNameEn = json['category_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['sub_category_name_en'] = this.subCategoryNameEn;
    data['sub_category_name_ar'] = this.subCategoryNameAr;
    data['image'] = this.image;
    data['category_name_en'] = this.categoryNameEn;
    return data;
  }
}

class AllItems {
  String id;
  String userId;
  String employeeId;
  String itemId;
  String status;
  List<ItemDetails> itemDetails;

  AllItems(
      {this.id,
        this.userId,
        this.employeeId,
        this.itemId,
        this.status,
        this.itemDetails});

  AllItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    employeeId = json['employee_id'];
    itemId = json['item_id'];
    status = json['status'];
    if (json['item_details'] != null) {
      itemDetails = new List<ItemDetails>();
      json['item_details'].forEach((v) {
        itemDetails.add(new ItemDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['employee_id'] = this.employeeId;
    data['item_id'] = this.itemId;
    data['status'] = this.status;
    if (this.itemDetails != null) {
      data['item_details'] = this.itemDetails.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemDetails {
  String id;
  String userId;
  String itemNameEn;
  String itemNameAr;
  String itemNumber;
  String categoryId;
  String subCategoryId;
  String subCategory2Id;
  String inventoryId;
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

  ItemDetails(
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
        this.taxType});

  ItemDetails.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class SalesOrder {
  String id;
  String userId;
  String employeeId;
  String itemId;
  String status;
  String createdAt;
  String updatedAt;

  SalesOrder(
      {this.id,
        this.userId,
        this.employeeId,
        this.itemId,
        this.status,
        this.createdAt,
        this.updatedAt});

  SalesOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    employeeId = json['employee_id'];
    itemId = json['item_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['employee_id'] = this.employeeId;
    data['item_id'] = this.itemId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
