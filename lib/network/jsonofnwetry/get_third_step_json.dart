class Get_third_step_json {
 late String message;
 late int codenum;
 late bool status;
 late Result result;

  Get_third_step_json({required this.message,required this.codenum,required this.status,required this.result});

  Get_third_step_json.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    codenum = json['codenum'];
    status = json['status'];
    result =
    (json['result'] != null ? new Result.fromJson(json['result']!) : null)!;
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
 late List<AllCategories> allCategories;
 late List<AllItems> allItems;
 late SalesOrder salesOrder;

  Result({required this.allCategories,required this.allItems,required this.salesOrder});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['all_categories'] != null) {
      allCategories = [];
      json['all_categories'].forEach((v) {
        allCategories.add(new AllCategories.fromJson(v));
      });
    }
    if (json['all_items'] != null) {
      allItems = <AllItems>[];
      json['all_items'].forEach((v) {
        allItems.add(new AllItems.fromJson(v));
      });
    }
    salesOrder = (json['sales_order'] != null
        ? new SalesOrder.fromJson(json['sales_order'])
        : null)!;
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
late  String id;
late  String userId;
late  String categoryNameEn;
late  String categoryNameAr;
late  String categoryImage;
late  String status;
late  List<SubCategories> subCategories;

  AllCategories(
      {required this.id,
       required  this.userId,
       required  this.categoryNameEn,
       required  this.categoryNameAr,
       required  this.categoryImage,
       required  this.status,
       required  this.subCategories});

  AllCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryNameEn = json['category_name_en'];
    categoryNameAr = json['category_name_ar'];
    categoryImage = json['category_image'];
    status = json['status'];
    if (json['sub_categories'] != null) {
      subCategories = [];
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
    data['category_image'] = this.categoryImage;
    data['status'] = this.status;
    if (this.subCategories != null) {
      data['sub_categories'] =
          this.subCategories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
 late String id;
 late String userId;
 late String categoryId;
 late String subCategoryNameEn;
 late String subCategoryNameAr;
 late String categoryNameEn;

  SubCategories(
      {required this.id,
       required  this.userId,
       required  this.categoryId,
       required  this.subCategoryNameEn,
       required  this.subCategoryNameAr,
       required  this.categoryNameEn});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    subCategoryNameEn = json['sub_category_name_en'];
    subCategoryNameAr = json['sub_category_name_ar'];
    categoryNameEn = json['category_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['sub_category_name_en'] = this.subCategoryNameEn;
    data['sub_category_name_ar'] = this.subCategoryNameAr;
    data['category_name_en'] = this.categoryNameEn;
    return data;
  }
}

class AllItems {
late  String id;
late  String userId;
late  String employeeId;
late  String itemId;
late  String status;
late  List<ItemDetails> itemDetails;

  AllItems(
      {required this.id,
       required  this.userId,
       required  this.employeeId,
       required  this.itemId,
       required  this.status,
       required  this.itemDetails});

  AllItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    employeeId = json['employee_id'];
    itemId = json['item_id'];
    status = json['status'];
    if (json['item_details'] != null) {
      itemDetails = [];
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
late  String id;
late  String userId;
late  String itemNameEn;
late  String itemNameAr;
late  String itemNumber;
late  String categoryId;
late  String subCategoryId;
late  String subCategory2Id;
late  String inventoryId;
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

  ItemDetails(
      {required this.id,
       required  this.userId,
       required  this.itemNameEn,
       required  this.itemNameAr,
       required  this.itemNumber,
       required  this.categoryId,
       required  this.subCategoryId,
       required  this.subCategory2Id,
       required  this.inventoryId,
       required  this.sellingPrice,
       required  this.minimumQuantity,
       required  this.reference,
       required  this.image,
       required  this.itemCost,
       required  this.tax,
       required  this.status,
       required  this.stockStatus,
       required  this.taxStatus,
       required  this.taxType});

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
late String id;
late String userId;
late String employeeId;
late String itemId;
late String status;
late String createdAt;
late String updatedAt;

  SalesOrder(
      {required this.id,
       required  this.userId,
       required  this.employeeId,
       required  this.itemId,
       required  this.status,
       required  this.createdAt,
       required  this.updatedAt});

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
