class Get_employee_data_json {
  String message;
  int codenum;
  bool status;
  Result result;

  Get_employee_data_json(
      {this.message, this.codenum, this.status, this.result});

  Get_employee_data_json.fromJson(Map<String, dynamic> json) {
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
  List<EmployeData> employeData;
  List<EmployeePermissions> employeePermissions;
  List<AllRoutes> allRoutes;
  List<AllCustomers> allCustomers;
  List<AllCategories> allCategories;
  List<AllItems> allItems;
  SalesOrder salesOrder;
  List<UserData> userData;
  List<AllCurrencies> allCurrencies;
  List<AllBanks> allBanks;
  List<AllCheques> allCheques;
  List<AllStockItems> allStockItems;

  Result(
      {this.employeData,
        this.employeePermissions,
        this.allRoutes,
        this.allCustomers,
        this.allCategories,
        this.allItems,
        this.salesOrder,
        this.userData,
        this.allCurrencies,
        this.allBanks,
        this.allCheques,
        this.allStockItems});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['employe_data'] != null) {
      employeData = new List<EmployeData>();
      json['employe_data'].forEach((v) {
        employeData.add(new EmployeData.fromJson(v));
      });
    }
    if (json['employee_permissions'] != null) {
      employeePermissions = new List<EmployeePermissions>();
      json['employee_permissions'].forEach((v) {
        employeePermissions.add(new EmployeePermissions.fromJson(v));
      });
    }
    if (json['all_routes'] != null) {
      allRoutes = new List<AllRoutes>();
      json['all_routes'].forEach((v) {
        allRoutes.add(new AllRoutes.fromJson(v));
      });
    }
    if (json['all_customers'] != null) {
      allCustomers = new List<AllCustomers>();
      json['all_customers'].forEach((v) {
        allCustomers.add(new AllCustomers.fromJson(v));
      });
    }
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
    if (json['user_data'] != null) {
      userData = new List<UserData>();
      json['user_data'].forEach((v) {
        userData.add(new UserData.fromJson(v));
      });
    }
    if (json['all_currencies'] != null) {
      allCurrencies = new List<AllCurrencies>();
      json['all_currencies'].forEach((v) {
        allCurrencies.add(new AllCurrencies.fromJson(v));
      });
    }
    if (json['all_banks'] != null) {
      allBanks = new List<AllBanks>();
      json['all_banks'].forEach((v) {
        allBanks.add(new AllBanks.fromJson(v));
      });
    }
    if (json['all_cheques'] != null) {
      allCheques = new List<AllCheques>();
      json['all_cheques'].forEach((v) {
        allCheques.add(new AllCheques.fromJson(v));
      });
    }
    if (json['all_stock_items'] != null) {
      allStockItems = new List<AllStockItems>();
      json['all_stock_items'].forEach((v) {
        allStockItems.add(new AllStockItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employeData != null) {
      data['employe_data'] = this.employeData.map((v) => v.toJson()).toList();
    }
    if (this.employeePermissions != null) {
      data['employee_permissions'] =
          this.employeePermissions.map((v) => v.toJson()).toList();
    }
    if (this.allRoutes != null) {
      data['all_routes'] = this.allRoutes.map((v) => v.toJson()).toList();
    }
    if (this.allCustomers != null) {
      data['all_customers'] = this.allCustomers.map((v) => v.toJson()).toList();
    }
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
    if (this.userData != null) {
      data['user_data'] = this.userData.map((v) => v.toJson()).toList();
    }
    if (this.allCurrencies != null) {
      data['all_currencies'] =
          this.allCurrencies.map((v) => v.toJson()).toList();
    }
    if (this.allBanks != null) {
      data['all_banks'] = this.allBanks.map((v) => v.toJson()).toList();
    }
    if (this.allCheques != null) {
      data['all_cheques'] = this.allCheques.map((v) => v.toJson()).toList();
    }
    if (this.allStockItems != null) {
      data['all_stock_items'] =
          this.allStockItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmployeData {
  String id;
  String userId;
  Null refId;
  String employeeNameEn;
  String employeeNameAr;
  Null phoneNo;
  String username;
  String password;
  String email;
  String type;
  Null customerId;
  String businessUnitId;
  String appDeviceId;
  String groupType;
  Null reference;
  String vehicle;
  Null collectPercent;
  String salesCommission;
  String salary;
  String insurance;
  String socialSecurity;
  String cashBoxAccount;
  String debitAmount;
  String storeId;
  String supervisorId;
  String salesmanagerId;
  String address;
  String image;
  String status;
  String onlineStatus;
  String createdAt;
  String updatedAt;

  EmployeData(
      {this.id,
        this.userId,
        this.refId,
        this.employeeNameEn,
        this.employeeNameAr,
        this.phoneNo,
        this.username,
        this.password,
        this.email,
        this.type,
        this.customerId,
        this.businessUnitId,
        this.appDeviceId,
        this.groupType,
        this.reference,
        this.vehicle,
        this.collectPercent,
        this.salesCommission,
        this.salary,
        this.insurance,
        this.socialSecurity,
        this.cashBoxAccount,
        this.debitAmount,
        this.storeId,
        this.supervisorId,
        this.salesmanagerId,
        this.address,
        this.image,
        this.status,
        this.onlineStatus,
        this.createdAt,
        this.updatedAt});

  EmployeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    refId = json['ref_id'];
    employeeNameEn = json['employee_name_en'];
    employeeNameAr = json['employee_name_ar'];
    phoneNo = json['phone_no'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    type = json['type'];
    customerId = json['customer_id'];
    businessUnitId = json['business_unit_id'];
    appDeviceId = json['app_device_id'];
    groupType = json['group_type'];
    reference = json['reference'];
    vehicle = json['vehicle'];
    collectPercent = json['collect_percent'];
    salesCommission = json['sales_commission'];
    salary = json['salary'];
    insurance = json['insurance'];
    socialSecurity = json['social_security'];
    cashBoxAccount = json['cash_box_account'];
    debitAmount = json['debit_amount'];
    storeId = json['store_id'];
    supervisorId = json['supervisor_id'];
    salesmanagerId = json['salesmanager_id'];
    address = json['address'];
    image = json['image'];
    status = json['status'];
    onlineStatus = json['online_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['ref_id'] = this.refId;
    data['employee_name_en'] = this.employeeNameEn;
    data['employee_name_ar'] = this.employeeNameAr;
    data['phone_no'] = this.phoneNo;
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['type'] = this.type;
    data['customer_id'] = this.customerId;
    data['business_unit_id'] = this.businessUnitId;
    data['app_device_id'] = this.appDeviceId;
    data['group_type'] = this.groupType;
    data['reference'] = this.reference;
    data['vehicle'] = this.vehicle;
    data['collect_percent'] = this.collectPercent;
    data['sales_commission'] = this.salesCommission;
    data['salary'] = this.salary;
    data['insurance'] = this.insurance;
    data['social_security'] = this.socialSecurity;
    data['cash_box_account'] = this.cashBoxAccount;
    data['debit_amount'] = this.debitAmount;
    data['store_id'] = this.storeId;
    data['supervisor_id'] = this.supervisorId;
    data['salesmanager_id'] = this.salesmanagerId;
    data['address'] = this.address;
    data['image'] = this.image;
    data['status'] = this.status;
    data['online_status'] = this.onlineStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class EmployeePermissions {
  String id;
  String userId;
  String employeeId;
  String invoice;
  String returnInvoice;
  String order;
  String payment;
  String stockTaking;
  String loadItems;
  String unloadItems;
  String takePhoto;
  String beforeAfterPhoto;
  String note;
  String survey;
  String loadRequestAcceptReject;
  String unloadRequestAcceptReject;
  String salesOrderRequestAcceptReject;
  String salesOrderToPrice;
  String requestToExceedCustomerCreditLimit;
  String requestToExceedChequeDueDateLimit;
  String requestToReturnInvoice;
  String requestToOrdersApproval;
  String requestToChangeInvoicePaymentType;
  String requestToExceedCustomerInvoiceNumber;
  String requestToVisitCustomerNotInRoute;
  String requestForCustomerLoginWithoutVerification;
  String employeeAddDrawersFromApp;
  String addBonus;
  String addItemDiscount;
  String addVoucherDiscount;
  String addCustomer;
  String displayProductQuantity;
  String createdAt;
  String updatedAt;
  String displayStores;

  EmployeePermissions(
      {this.id,
        this.userId,
        this.employeeId,
        this.invoice,
        this.returnInvoice,
        this.order,
        this.payment,
        this.stockTaking,
        this.loadItems,
        this.unloadItems,
        this.takePhoto,
        this.beforeAfterPhoto,
        this.note,
        this.survey,
        this.loadRequestAcceptReject,
        this.unloadRequestAcceptReject,
        this.salesOrderRequestAcceptReject,
        this.salesOrderToPrice,
        this.requestToExceedCustomerCreditLimit,
        this.requestToExceedChequeDueDateLimit,
        this.requestToReturnInvoice,
        this.requestToOrdersApproval,
        this.requestToChangeInvoicePaymentType,
        this.requestToExceedCustomerInvoiceNumber,
        this.requestToVisitCustomerNotInRoute,
        this.requestForCustomerLoginWithoutVerification,
        this.employeeAddDrawersFromApp,
        this.addBonus,
        this.addItemDiscount,
        this.addVoucherDiscount,
        this.addCustomer,
        this.displayProductQuantity,
        this.createdAt,
        this.updatedAt,
        this.displayStores});

  EmployeePermissions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    employeeId = json['employee_id'];
    invoice = json['invoice'];
    returnInvoice = json['return_invoice'];
    order = json['order'];
    payment = json['payment'];
    stockTaking = json['stock_taking'];
    loadItems = json['load_items'];
    unloadItems = json['unload_items'];
    takePhoto = json['take_photo'];
    beforeAfterPhoto = json['before_after_photo'];
    note = json['note'];
    survey = json['survey'];
    loadRequestAcceptReject = json['load_request_accept_reject'];
    unloadRequestAcceptReject = json['unload_request_accept_reject'];
    salesOrderRequestAcceptReject = json['sales_order_request_accept_reject'];
    salesOrderToPrice = json['sales_order_to_price'];
    requestToExceedCustomerCreditLimit =
    json['request_to_exceed_customer_credit_limit'];
    requestToExceedChequeDueDateLimit =
    json['request_to_exceed_cheque_due_date_limit'];
    requestToReturnInvoice = json['request_to_return_invoice'];
    requestToOrdersApproval = json['request_to_orders_approval'];
    requestToChangeInvoicePaymentType =
    json['request_to_change_invoice_payment_type'];
    requestToExceedCustomerInvoiceNumber =
    json['request_to_exceed_customer_invoice_number'];
    requestToVisitCustomerNotInRoute =
    json['request_to_visit_customer_not_in_route'];
    requestForCustomerLoginWithoutVerification =
    json['request_for_customer_login_without_verification'];
    employeeAddDrawersFromApp = json['employee_add_drawers_from_app'];
    addBonus = json['add_bonus'];
    addItemDiscount = json['add_item_discount'];
    addVoucherDiscount = json['add_voucher_discount'];
    addCustomer = json['add_customer'];
    displayProductQuantity = json['display_product_quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    displayStores = json['Display Stores'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['employee_id'] = this.employeeId;
    data['invoice'] = this.invoice;
    data['return_invoice'] = this.returnInvoice;
    data['order'] = this.order;
    data['payment'] = this.payment;
    data['stock_taking'] = this.stockTaking;
    data['load_items'] = this.loadItems;
    data['unload_items'] = this.unloadItems;
    data['take_photo'] = this.takePhoto;
    data['before_after_photo'] = this.beforeAfterPhoto;
    data['note'] = this.note;
    data['survey'] = this.survey;
    data['load_request_accept_reject'] = this.loadRequestAcceptReject;
    data['unload_request_accept_reject'] = this.unloadRequestAcceptReject;
    data['sales_order_request_accept_reject'] =
        this.salesOrderRequestAcceptReject;
    data['sales_order_to_price'] = this.salesOrderToPrice;
    data['request_to_exceed_customer_credit_limit'] =
        this.requestToExceedCustomerCreditLimit;
    data['request_to_exceed_cheque_due_date_limit'] =
        this.requestToExceedChequeDueDateLimit;
    data['request_to_return_invoice'] = this.requestToReturnInvoice;
    data['request_to_orders_approval'] = this.requestToOrdersApproval;
    data['request_to_change_invoice_payment_type'] =
        this.requestToChangeInvoicePaymentType;
    data['request_to_exceed_customer_invoice_number'] =
        this.requestToExceedCustomerInvoiceNumber;
    data['request_to_visit_customer_not_in_route'] =
        this.requestToVisitCustomerNotInRoute;
    data['request_for_customer_login_without_verification'] =
        this.requestForCustomerLoginWithoutVerification;
    data['employee_add_drawers_from_app'] = this.employeeAddDrawersFromApp;
    data['add_bonus'] = this.addBonus;
    data['add_item_discount'] = this.addItemDiscount;
    data['add_voucher_discount'] = this.addVoucherDiscount;
    data['add_customer'] = this.addCustomer;
    data['display_product_quantity'] = this.displayProductQuantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['Display Stores'] = this.displayStores;
    return data;
  }
}

class AllRoutes {
  String userId;
  String salesmanId;
  String name;
  String minCustomers;
  String maxCustomers;
  String routeId;
  List<ListRoutesInfo> listRoutesInfo;

  AllRoutes(
      {this.userId,
        this.salesmanId,
        this.name,
        this.minCustomers,
        this.maxCustomers,
        this.routeId,
        this.listRoutesInfo});

  AllRoutes.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    salesmanId = json['salesman_id'];
    name = json['name'];
    minCustomers = json['min_customers'];
    maxCustomers = json['max_customers'];
    routeId = json['route_id'];
    if (json['list_routes_info'] != null) {
      listRoutesInfo = new List<ListRoutesInfo>();
      json['list_routes_info'].forEach((v) {
        listRoutesInfo.add(new ListRoutesInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['salesman_id'] = this.salesmanId;
    data['name'] = this.name;
    data['min_customers'] = this.minCustomers;
    data['max_customers'] = this.maxCustomers;
    data['route_id'] = this.routeId;
    if (this.listRoutesInfo != null) {
      data['list_routes_info'] =
          this.listRoutesInfo.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListRoutesInfo {
  String userId;
  String routeId;
  String customerId;
  Null timeIn;
  Null timeOut;
  Null note;

  ListRoutesInfo(
      {this.userId,
        this.routeId,
        this.customerId,
        this.timeIn,
        this.timeOut,
        this.note});

  ListRoutesInfo.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    routeId = json['route_id'];
    customerId = json['customer_id'];
    timeIn = json['time_in'];
    timeOut = json['time_out'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['route_id'] = this.routeId;
    data['customer_id'] = this.customerId;
    data['time_in'] = this.timeIn;
    data['time_out'] = this.timeOut;
    data['note'] = this.note;
    return data;
  }
}

class AllCustomers {
  CustomerInfo customerInfo;
  List<PriceListsInfo> priceListsInfo;

  AllCustomers({this.customerInfo, this.priceListsInfo});

  AllCustomers.fromJson(Map<String, dynamic> json) {
    customerInfo = json['customer_info'] != null
        ? new CustomerInfo.fromJson(json['customer_info'])
        : null;
    if (json['price_lists_info'] != null) {
      priceListsInfo = new List<PriceListsInfo>();
      json['price_lists_info'].forEach((v) {
        priceListsInfo.add(new PriceListsInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerInfo != null) {
      data['customer_info'] = this.customerInfo.toJson();
    }
    if (this.priceListsInfo != null) {
      data['price_lists_info'] =
          this.priceListsInfo.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerInfo {
  String id;
  String userId;
  String appEmployeeId;
  String refId;
  String customerId;
  String customerNameEn;
  String customerNameAr;
  String customerTypeId;
  Null email;
  String phoneNo;
  Null fax;
  String taxStatus;
  String image;
  String creditLimit;
  String chequeDueDate;
  String discount;
  Null balance;
  String paymentType;
  String priceListId;
  String stateId;
  String cityId;
  Null area1;
  Null area2;
  String location;
  Null latitude;
  Null longitude;
  String status;
  String createdAt;
  String updatedAt;

  CustomerInfo(
      {this.id,
        this.userId,
        this.appEmployeeId,
        this.refId,
        this.customerId,
        this.customerNameEn,
        this.customerNameAr,
        this.customerTypeId,
        this.email,
        this.phoneNo,
        this.fax,
        this.taxStatus,
        this.image,
        this.creditLimit,
        this.chequeDueDate,
        this.discount,
        this.balance,
        this.paymentType,
        this.priceListId,
        this.stateId,
        this.cityId,
        this.area1,
        this.area2,
        this.location,
        this.latitude,
        this.longitude,
        this.status,
        this.createdAt,
        this.updatedAt});

  CustomerInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    appEmployeeId = json['app_employee_id'];
    refId = json['ref_id'];
    customerId = json['customer_id'];
    customerNameEn = json['customer_name_en'];
    customerNameAr = json['customer_name_ar'];
    customerTypeId = json['customer_type_id'];
    email = json['email'];
    phoneNo = json['phone_no'];
    fax = json['fax'];
    taxStatus = json['tax_status'];
    image = json['image'];
    creditLimit = json['credit_limit'];
    chequeDueDate = json['cheque_due_date'];
    discount = json['discount'];
    balance = json['balance'];
    paymentType = json['payment_type'];
    priceListId = json['price_list_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    area1 = json['area1'];
    area2 = json['area2'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['app_employee_id'] = this.appEmployeeId;
    data['ref_id'] = this.refId;
    data['customer_id'] = this.customerId;
    data['customer_name_en'] = this.customerNameEn;
    data['customer_name_ar'] = this.customerNameAr;
    data['customer_type_id'] = this.customerTypeId;
    data['email'] = this.email;
    data['phone_no'] = this.phoneNo;
    data['fax'] = this.fax;
    data['tax_status'] = this.taxStatus;
    data['image'] = this.image;
    data['credit_limit'] = this.creditLimit;
    data['cheque_due_date'] = this.chequeDueDate;
    data['discount'] = this.discount;
    data['balance'] = this.balance;
    data['payment_type'] = this.paymentType;
    data['price_list_id'] = this.priceListId;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['area1'] = this.area1;
    data['area2'] = this.area2;
    data['location'] = this.location;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PriceListsInfo {
  String id;
  String userId;
  String priceListId;
  String itemId;
  String sellingPrice;
  String toPrice;
  String discount;
  String taxStatus;
  String useInSales;
  String useInReturn;
  Null createdAt;
  Null updatedAt;
  List<ItemUnits> itemUnits;

  PriceListsInfo(
      {this.id,
        this.userId,
        this.priceListId,
        this.itemId,
        this.sellingPrice,
        this.toPrice,
        this.discount,
        this.taxStatus,
        this.useInSales,
        this.useInReturn,
        this.createdAt,
        this.updatedAt,
        this.itemUnits});

  PriceListsInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    priceListId = json['price_list_id'];
    itemId = json['item_id'];
    sellingPrice = json['selling_price'];
    toPrice = json['to_price'];
    discount = json['discount'];
    taxStatus = json['tax_status'];
    useInSales = json['use_in_sales'];
    useInReturn = json['use_in_return'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['item_units'] != null) {
      itemUnits = new List<ItemUnits>();
      json['item_units'].forEach((v) {
        itemUnits.add(new ItemUnits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['price_list_id'] = this.priceListId;
    data['item_id'] = this.itemId;
    data['selling_price'] = this.sellingPrice;
    data['to_price'] = this.toPrice;
    data['discount'] = this.discount;
    data['tax_status'] = this.taxStatus;
    data['use_in_sales'] = this.useInSales;
    data['use_in_return'] = this.useInReturn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.itemUnits != null) {
      data['item_units'] = this.itemUnits.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemUnits {
  String id;
  String userId;
  String itemId;
  String itemBarcodes;
  String itemMeasurementUnits;
  String sellingPrice;
  String unitTypeId;
  String noOfPiece;
  String defaultValue;
  String createdAt;
  String updatedAt;

  ItemUnits(
      {this.id,
        this.userId,
        this.itemId,
        this.itemBarcodes,
        this.itemMeasurementUnits,
        this.sellingPrice,
        this.unitTypeId,
        this.noOfPiece,
        this.defaultValue,
        this.createdAt,
        this.updatedAt});

  ItemUnits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    itemId = json['item_id'];
    itemBarcodes = json['item_barcodes'];
    itemMeasurementUnits = json['item_measurement_units'];
    sellingPrice = json['selling_price'];
    unitTypeId = json['unit_type_id'];
    noOfPiece = json['no_of_piece'];
    defaultValue = json['default_value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['item_id'] = this.itemId;
    data['item_barcodes'] = this.itemBarcodes;
    data['item_measurement_units'] = this.itemMeasurementUnits;
    data['selling_price'] = this.sellingPrice;
    data['unit_type_id'] = this.unitTypeId;
    data['no_of_piece'] = this.noOfPiece;
    data['default_value'] = this.defaultValue;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
  String status;
  String createdAt;
  String updatedAt;

  SubCategories(
      {this.id,
        this.userId,
        this.categoryId,
        this.subCategoryNameEn,
        this.subCategoryNameAr,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    subCategoryNameEn = json['sub_category_name_en'];
    subCategoryNameAr = json['sub_category_name_ar'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['sub_category_name_en'] = this.subCategoryNameEn;
    data['sub_category_name_ar'] = this.subCategoryNameAr;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
  Null itemCost;
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

class UserData {
  String id;
  String branchNameEn;
  String branchNameAr;
  String branchLocation;
  String companyId;
  String locationLat;
  String locationLng;
  String email;
  String password;
  String decodedPassword;
  Null area1;
  Null area2;
  String cityId;
  String stateId;
  String countryId;
  Null currency;
  Null currencyShort;
  Null phoneNo;
  Null faxNo;
  String vatNo;
  String taxableStatus;
  String sToken;
  String status;
  String rememberToken;
  String createdAt;
  String updatedAt;

  UserData(
      {this.id,
        this.branchNameEn,
        this.branchNameAr,
        this.branchLocation,
        this.companyId,
        this.locationLat,
        this.locationLng,
        this.email,
        this.password,
        this.decodedPassword,
        this.area1,
        this.area2,
        this.cityId,
        this.stateId,
        this.countryId,
        this.currency,
        this.currencyShort,
        this.phoneNo,
        this.faxNo,
        this.vatNo,
        this.taxableStatus,
        this.sToken,
        this.status,
        this.rememberToken,
        this.createdAt,
        this.updatedAt});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchNameEn = json['branch_name_en'];
    branchNameAr = json['branch_name_ar'];
    branchLocation = json['branch_location'];
    companyId = json['company_id'];
    locationLat = json['location_lat'];
    locationLng = json['location_lng'];
    email = json['email'];
    password = json['password'];
    decodedPassword = json['decoded_password'];
    area1 = json['area_1'];
    area2 = json['area_2'];
    cityId = json['city_id'];
    stateId = json['state_id'];
    countryId = json['country_id'];
    currency = json['currency'];
    currencyShort = json['currency_short'];
    phoneNo = json['phone_no'];
    faxNo = json['fax_no'];
    vatNo = json['vat_no'];
    taxableStatus = json['taxable_status'];
    sToken = json['_token'];
    status = json['status'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branch_name_en'] = this.branchNameEn;
    data['branch_name_ar'] = this.branchNameAr;
    data['branch_location'] = this.branchLocation;
    data['company_id'] = this.companyId;
    data['location_lat'] = this.locationLat;
    data['location_lng'] = this.locationLng;
    data['email'] = this.email;
    data['password'] = this.password;
    data['decoded_password'] = this.decodedPassword;
    data['area_1'] = this.area1;
    data['area_2'] = this.area2;
    data['city_id'] = this.cityId;
    data['state_id'] = this.stateId;
    data['country_id'] = this.countryId;
    data['currency'] = this.currency;
    data['currency_short'] = this.currencyShort;
    data['phone_no'] = this.phoneNo;
    data['fax_no'] = this.faxNo;
    data['vat_no'] = this.vatNo;
    data['taxable_status'] = this.taxableStatus;
    data['_token'] = this.sToken;
    data['status'] = this.status;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class AllCurrencies {
  String currencyName;
  String currencyCode;
  String currencyRate;
  String currencyPrecision;
  String currencySymbol;
  String currencySymbolFirst;
  String currencyDecimalMark;
  String currencyThousandsSeparator;

  AllCurrencies(
      {this.currencyName,
        this.currencyCode,
        this.currencyRate,
        this.currencyPrecision,
        this.currencySymbol,
        this.currencySymbolFirst,
        this.currencyDecimalMark,
        this.currencyThousandsSeparator});

  AllCurrencies.fromJson(Map<String, dynamic> json) {
    currencyName = json['currency_name'];
    currencyCode = json['currency_code'];
    currencyRate = json['currency_rate'];
    currencyPrecision = json['currency_precision'];
    currencySymbol = json['currency_symbol'];
    currencySymbolFirst = json['currency_symbol_first'];
    currencyDecimalMark = json['currency_decimal_mark'];
    currencyThousandsSeparator = json['currency_thousands_separator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency_name'] = this.currencyName;
    data['currency_code'] = this.currencyCode;
    data['currency_rate'] = this.currencyRate;
    data['currency_precision'] = this.currencyPrecision;
    data['currency_symbol'] = this.currencySymbol;
    data['currency_symbol_first'] = this.currencySymbolFirst;
    data['currency_decimal_mark'] = this.currencyDecimalMark;
    data['currency_thousands_separator'] = this.currencyThousandsSeparator;
    return data;
  }
}

class AllBanks {
  String id;
  String bankNameEn;
  String bankNameAr;
  String userId;
  Null note;
  List<AllBankBranches> allBankBranches;

  AllBanks(
      {this.id,
        this.bankNameEn,
        this.bankNameAr,
        this.userId,
        this.note,
        this.allBankBranches});

  AllBanks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankNameEn = json['bank_name_en'];
    bankNameAr = json['bank_name_ar'];
    userId = json['user_id'];
    note = json['note'];
    if (json['all_bank_branches'] != null) {
      allBankBranches = new List<AllBankBranches>();
      json['all_bank_branches'].forEach((v) {
        allBankBranches.add(new AllBankBranches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bank_name_en'] = this.bankNameEn;
    data['bank_name_ar'] = this.bankNameAr;
    data['user_id'] = this.userId;
    data['note'] = this.note;
    if (this.allBankBranches != null) {
      data['all_bank_branches'] =
          this.allBankBranches.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllBankBranches {
  String id;
  String bankId;
  String userId;
  String branchNameEn;
  String branchNameAr;
  Null phoneNo;
  Null faxNo;
  String email;
  Null area1;
  Null area2;
  String stateId;
  String cityId;
  String contactPerson;
  Null note;
  String status;
  String createdAt;
  String updatedAt;

  AllBankBranches(
      {this.id,
        this.bankId,
        this.userId,
        this.branchNameEn,
        this.branchNameAr,
        this.phoneNo,
        this.faxNo,
        this.email,
        this.area1,
        this.area2,
        this.stateId,
        this.cityId,
        this.contactPerson,
        this.note,
        this.status,
        this.createdAt,
        this.updatedAt});

  AllBankBranches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankId = json['bank_id'];
    userId = json['user_id'];
    branchNameEn = json['branch_name_en'];
    branchNameAr = json['branch_name_ar'];
    phoneNo = json['phone_no'];
    faxNo = json['fax_no'];
    email = json['email'];
    area1 = json['area_1'];
    area2 = json['area_2'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    contactPerson = json['contact_person'];
    note = json['note'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bank_id'] = this.bankId;
    data['user_id'] = this.userId;
    data['branch_name_en'] = this.branchNameEn;
    data['branch_name_ar'] = this.branchNameAr;
    data['phone_no'] = this.phoneNo;
    data['fax_no'] = this.faxNo;
    data['email'] = this.email;
    data['area_1'] = this.area1;
    data['area_2'] = this.area2;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['contact_person'] = this.contactPerson;
    data['note'] = this.note;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class AllCheques {
  String customerId;
  String customerName;
  String customerNameEn;
  List<ListCheques> listCheques;

  AllCheques(
      {this.customerId,
        this.customerName,
        this.customerNameEn,
        this.listCheques});

  AllCheques.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    customerNameEn = json['customer_name_en'];
    if (json['list_cheques'] != null) {
      listCheques = new List<ListCheques>();
      json['list_cheques'].forEach((v) {
        listCheques.add(new ListCheques.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['customer_name_en'] = this.customerNameEn;
    if (this.listCheques != null) {
      data['list_cheques'] = this.listCheques.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListCheques {
  String id;
  String customerId;
  String chequeDueDate;
  String drawerName;
  String bankId;
  String branchId;
  String bankNameEn;
  String bankNameAr;
  String branchNameEn;
  String branchNameAr;

  ListCheques(
      {this.id,
        this.customerId,
        this.chequeDueDate,
        this.drawerName,
        this.bankId,
        this.branchId,
        this.bankNameEn,
        this.bankNameAr,
        this.branchNameEn,
        this.branchNameAr});

  ListCheques.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    chequeDueDate = json['cheque_due_date'];
    drawerName = json['drawer_name'];
    bankId = json['bank_id'];
    branchId = json['branch_id'];
    bankNameEn = json['bank_name_en'];
    bankNameAr = json['bank_name_ar'];
    branchNameEn = json['branch_name_en'];
    branchNameAr = json['branch_name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['cheque_due_date'] = this.chequeDueDate;
    data['drawer_name'] = this.drawerName;
    data['bank_id'] = this.bankId;
    data['branch_id'] = this.branchId;
    data['bank_name_en'] = this.bankNameEn;
    data['bank_name_ar'] = this.bankNameAr;
    data['branch_name_en'] = this.branchNameEn;
    data['branch_name_ar'] = this.branchNameAr;
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
