class Get_Fifth_step_json {
  String message;
  int codenum;
  bool status;
  Result result;

  Get_Fifth_step_json({this.message, this.codenum, this.status, this.result});

  Get_Fifth_step_json.fromJson(Map<String, dynamic> json) {
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
  List<AllStockItems> allStockItems;
  List<AllPromotions> allPromotions;

  Result({this.allStockItems, this.allPromotions});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['all_stock_items'] != null) {
      allStockItems = new List<AllStockItems>();
      json['all_stock_items'].forEach((v) {
        allStockItems.add(new AllStockItems.fromJson(v));
      });
    }
    if (json['all_promotions'] != null) {
      allPromotions = new List<AllPromotions>();
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
  String id;
  String userId;
  String itemId;
  String storeId;
  String measurementUnitId;
  String quantity;
  String measurementUnitName;

  AllStockItems(
      {this.id,
        this.userId,
        this.itemId,
        this.storeId,
        this.measurementUnitId,
        this.quantity,
        this.measurementUnitName});

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
  String id;
  String name;
  String description;
  String promotionType;
  String priorityId;
  String priority;
  String categoryId;
  String subcategoryId;
  String subcategory2Id;
  String salesmanGroupId;
  String customerGroupId;
  List<AllGroupCustomers> allGroupCustomers;
  List<AllGroupSalesmans> allGroupSalesmans;
  String startDateTime;
  String endDateTime;
  String validFor;
  String isBonusDuplicate;
  String strictlyListedItem;
  String discount;
  String discountType;
  String bonusQty;
  String invoicePerSalesman;
  String invoicePerCustomer;
  String minimumQuantityValue;
  List<AllInQuantityPromotionItems> allInQuantityPromotionItems;
  List<AllOutQuantityPromotionItems> allOutQuantityPromotionItems;

  AllPromotions(
      {this.id,
        this.name,
        this.description,
        this.promotionType,
        this.priorityId,
        this.priority,
        this.categoryId,
        this.subcategoryId,
        this.subcategory2Id,
        this.salesmanGroupId,
        this.customerGroupId,
        this.allGroupCustomers,
        this.allGroupSalesmans,
        this.startDateTime,
        this.endDateTime,
        this.validFor,
        this.isBonusDuplicate,
        this.strictlyListedItem,
        this.discount,
        this.discountType,
        this.bonusQty,
        this.invoicePerSalesman,
        this.invoicePerCustomer,
        this.minimumQuantityValue,
        this.allInQuantityPromotionItems,
        this.allOutQuantityPromotionItems});

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
      allGroupCustomers = new List<AllGroupCustomers>();
      json['all_group_customers'].forEach((v) {
        allGroupCustomers.add(new AllGroupCustomers.fromJson(v));
      });
    }
    if (json['all_group_salesmans'] != null) {
      allGroupSalesmans = new List<AllGroupSalesmans>();
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
      allInQuantityPromotionItems = new List<AllInQuantityPromotionItems>();
      json['all_in_quantity_promotion_items'].forEach((v) {
        allInQuantityPromotionItems
            .add(new AllInQuantityPromotionItems.fromJson(v));
      });
    }
    if (json['all_out_quantity_promotion_items'] != null) {
      allOutQuantityPromotionItems = new List<AllOutQuantityPromotionItems>();
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
  String id;
  String groupId;
  String userId;
  String customerId;

  AllGroupCustomers({this.id, this.groupId, this.userId, this.customerId});

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
  String id;
  String userId;
  String employeeId;

  AllGroupSalesmans({this.id, this.userId, this.employeeId});

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
  String id;
  String userId;
  String qtyPromotionId;
  String itemId;
  String measurementUnitId;

  AllInQuantityPromotionItems(
      {this.id,
        this.userId,
        this.qtyPromotionId,
        this.itemId,
        this.measurementUnitId});

  AllInQuantityPromotionItems.fromJson(Map<String, dynamic> json) {
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
  String id;
  String userId;
  String qtyPromotionId;
  String itemId;
  String measurementUnitId;

  AllOutQuantityPromotionItems(
      {this.id,
        this.userId,
        this.qtyPromotionId,
        this.itemId,
        this.measurementUnitId});

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