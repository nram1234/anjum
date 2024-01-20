class Get_Fifth_step_json {
late String message;
late int codenum;
late bool status;
late Result result;

  Get_Fifth_step_json({required this.message,required this.codenum,required this.status,required this.result});

  Get_Fifth_step_json.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    codenum = json['codenum'];
    status = json['status'];
    result =
    (json['result'] != null ? new Result.fromJson(json['result']) : null)!;
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
late  List<AllStockItems> allStockItems;
late  List<AllPromotions> allPromotions;

  Result({required this.allStockItems,required this.allPromotions});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['all_stock_items'] != null) {
      allStockItems =[];
      json['all_stock_items'].forEach((v) {
        allStockItems.add(new AllStockItems.fromJson(v));
      });
    }
    if (json['all_promotions'] != null) {
      allPromotions = [];
      json['all_promotions'].forEach((v) {
        allPromotions.add(new AllPromotions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allStockItems != null) {
      data['all_stock_items'] =
          this.allStockItems.map((v) => v.toJson()).toList();
    }
    if (this.allPromotions != null) {
      data['all_promotions'] =
          this.allPromotions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllStockItems {
late String id;
late String userId;
late String itemId;
late String storeId;
late String measurementUnitId;
late String quantity;
late String measurementUnitName;

  AllStockItems(
      {required this.id,
       required  this.userId,
       required  this.itemId,
       required  this.storeId,
       required  this.measurementUnitId,
       required  this.quantity,
       required  this.measurementUnitName});

  AllStockItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    itemId = json['item_id'];
    storeId = json['store_id'];
    measurementUnitId = json['measurement_unit_id'];
    quantity = json['quantity'];
    measurementUnitName = json['measurement_unit_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['item_id'] = this.itemId;
    data['store_id'] = this.storeId;
    data['measurement_unit_id'] = this.measurementUnitId;
    data['quantity'] = this.quantity;
    data['measurement_unit_name'] = this.measurementUnitName;
    return data;
  }
}

class AllPromotions {
late   String id;
late   String name;
late   String description;
late   String promotionType;
late   String priorityId;
late   String priority;
late   String categoryId;
late   String subcategoryId;
late   String subcategory2Id;
late   String salesmanGroupId;
late   String customerGroupId;
late   List<AllGroupCustomers> allGroupCustomers;
late   List<AllGroupSalesmans> allGroupSalesmans;
late   String startDateTime;
late   String endDateTime;
late   String validFor;
late   String isBonusDuplicate;
late   String strictlyListedItem;
late   String discount;
late   String discountType;
late   String bonusQty;
late   String invoicePerSalesman;
late   String invoicePerCustomer;
late   String minimumQuantityValue;
late   List<AllInQuantityPromotionItems> allInQuantityPromotionItems;
late   List<AllOutQuantityPromotionItems> allOutQuantityPromotionItems;

  AllPromotions(
      {required this.id,
       required  this.name,
       required  this.description,
       required  this.promotionType,
       required  this.priorityId,
       required  this.priority,
       required  this.categoryId,
       required  this.subcategoryId,
       required  this.subcategory2Id,
       required  this.salesmanGroupId,
       required  this.customerGroupId,
       required  this.allGroupCustomers,
       required  this.allGroupSalesmans,
       required  this.startDateTime,
       required  this.endDateTime,
       required  this.validFor,
       required  this.isBonusDuplicate,
       required  this.strictlyListedItem,
       required  this.discount,
       required  this.discountType,
       required  this.bonusQty,
       required  this.invoicePerSalesman,
       required  this.invoicePerCustomer,
       required  this.minimumQuantityValue,
       required  this.allInQuantityPromotionItems,
       required  this.allOutQuantityPromotionItems});

  AllPromotions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    promotionType = json['promotion_type'];
    priorityId = json['priority_id'];
    priority = json['priority'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    subcategory2Id = json['subcategory2_id'];
    salesmanGroupId = json['salesman_group_id'];
    customerGroupId = json['customer_group_id'];
    if (json['all_group_customers'] != null) {
      allGroupCustomers = [];
      json['all_group_customers'].forEach((v) {
        allGroupCustomers.add(new AllGroupCustomers.fromJson(v));
      });
    }
    if (json['all_group_salesmans'] != null) {
      allGroupSalesmans = [];
      json['all_group_salesmans'].forEach((v) {
        allGroupSalesmans.add(new AllGroupSalesmans.fromJson(v));
      });
    }
    startDateTime = json['start_date_time'];
    endDateTime = json['end_date_time'];
    validFor = json['valid_for'];
    isBonusDuplicate = json['is_bonus_duplicate'];
    strictlyListedItem = json['strictly_listed_item'];
    discount = json['discount'];
    discountType = json['discount_type'];
    bonusQty = json['bonus_qty'];
    invoicePerSalesman = json['invoice_per_salesman'];
    invoicePerCustomer = json['invoice_per_customer'];
    minimumQuantityValue = json['minimum_quantity_value'];
    if (json['all_in_quantity_promotion_items'] != null) {
      allInQuantityPromotionItems = [];
      json['all_in_quantity_promotion_items'].forEach((v) {
        allInQuantityPromotionItems
            .add(new AllInQuantityPromotionItems.fromJson(v));
      });
    }
    if (json['all_out_quantity_promotion_items'] != null) {
      allOutQuantityPromotionItems =[];
      json['all_out_quantity_promotion_items'].forEach((v) {
        allOutQuantityPromotionItems
            .add(new AllOutQuantityPromotionItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['promotion_type'] = this.promotionType;
    data['priority_id'] = this.priorityId;
    data['priority'] = this.priority;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['subcategory2_id'] = this.subcategory2Id;
    data['salesman_group_id'] = this.salesmanGroupId;
    data['customer_group_id'] = this.customerGroupId;
    if (this.allGroupCustomers != null) {
      data['all_group_customers'] =
          this.allGroupCustomers.map((v) => v.toJson()).toList();
    }
    if (this.allGroupSalesmans != null) {
      data['all_group_salesmans'] =
          this.allGroupSalesmans.map((v) => v.toJson()).toList();
    }
    data['start_date_time'] = this.startDateTime;
    data['end_date_time'] = this.endDateTime;
    data['valid_for'] = this.validFor;
    data['is_bonus_duplicate'] = this.isBonusDuplicate;
    data['strictly_listed_item'] = this.strictlyListedItem;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['bonus_qty'] = this.bonusQty;
    data['invoice_per_salesman'] = this.invoicePerSalesman;
    data['invoice_per_customer'] = this.invoicePerCustomer;
    data['minimum_quantity_value'] = this.minimumQuantityValue;
    if (this.allInQuantityPromotionItems != null) {
      data['all_in_quantity_promotion_items'] =
          this.allInQuantityPromotionItems.map((v) => v.toJson()).toList();
    }
    if (this.allOutQuantityPromotionItems != null) {
      data['all_out_quantity_promotion_items'] =
          this.allOutQuantityPromotionItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllGroupCustomers {
 late String id;
 late String groupId;
 late String userId;
 late String customerId;

  AllGroupCustomers({required this.id,required this.groupId,required this.userId,required this.customerId});

  AllGroupCustomers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group_id'];
    userId = json['user_id'];
    customerId = json['customer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['group_id'] = this.groupId;
    data['user_id'] = this.userId;
    data['customer_id'] = this.customerId;
    return data;
  }
}

class AllGroupSalesmans {
late  String id;
late  String userId;
late  String employeeId;

  AllGroupSalesmans({required this.id,required this.userId,required this.employeeId});

  AllGroupSalesmans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    employeeId = json['employee_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['employee_id'] = this.employeeId;
    return data;
  }
}

class AllInQuantityPromotionItems {
late  String id;
late  String userId;
late  String qtyPromotionId;
late  String itemId;
late  String measurementUnitId;

  AllInQuantityPromotionItems(
      {required this.id,
       required  this.userId,
       required  this.qtyPromotionId,
       required  this.itemId,
       required  this.measurementUnitId});

  AllInQuantityPromotionItems.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    qtyPromotionId = json['qty_promotion_id'];
    itemId = json['item_id'];
    measurementUnitId = json['measurement_unit_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['qty_promotion_id'] = this.qtyPromotionId;
    data['item_id'] = this.itemId;
    data['measurement_unit_id'] = this.measurementUnitId;
    return data;
  }
}

class AllOutQuantityPromotionItems {
late String id;
late String userId;
late String qtyPromotionId;
late String itemId;
late String measurementUnitId;

  AllOutQuantityPromotionItems(
      {required this.id,
       required  this.userId,
       required  this.qtyPromotionId,
       required  this.itemId,
       required  this.measurementUnitId});

  AllOutQuantityPromotionItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    qtyPromotionId = json['qty_promotion_id'];
    itemId = json['item_id'];
    measurementUnitId = json['measurement_unit_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['qty_promotion_id'] = this.qtyPromotionId;
    data['item_id'] = this.itemId;
    data['measurement_unit_id'] = this.measurementUnitId;
    return data;
  }
}