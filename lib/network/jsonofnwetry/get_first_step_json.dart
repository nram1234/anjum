class Get_first_step_json {
  String message;
  int codenum;
  bool status;
  Result result;

  Get_first_step_json({this.message, this.codenum, this.status, this.result});

  Get_first_step_json.fromJson(Map<String, dynamic> json) {
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
  EmployeData employeData;
  List<EmployeePermissions> employeePermissions;
  List<AllRoutes> allRoutes;

  Result({this.employeData, this.employeePermissions, this.allRoutes});

  Result.fromJson(Map<String, dynamic> json) {
    employeData = json['employe_data'] != null
        ? new EmployeData.fromJson(json['employe_data'])
        : null;
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employeData != null) {
      data['employe_data'] = this.employeData.toJson();
    }
    if (this.employeePermissions != null) {
      data['employee_permissions'] =
          this.employeePermissions.map((v) => v.toJson()).toList();
    }
    if (this.allRoutes != null) {
      data['all_routes'] = this.allRoutes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmployeData {
  String id;
  String userId;
  String refId;
  String employeeNameEn;
  String employeeNameAr;
  String phoneNo;
  String username;
  String userid;
  String customerId;
  String businessUnitId;
  String appDeviceId;
  String groupType;
  String reference;
  String vehicle;
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
  String img;
  String status;

  EmployeData(
      {this.id,
        this.userId,
        this.refId,
        this.employeeNameEn,
        this.employeeNameAr,
        this.phoneNo,
        this.username,
        this.userid,
        this.customerId,
        this.businessUnitId,
        this.appDeviceId,
        this.groupType,
        this.reference,
        this.vehicle,
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
        this.img,
        this.status});

  EmployeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    refId = json['ref_id'];
    employeeNameEn = json['employee_name_en'];
    employeeNameAr = json['employee_name_ar'];
    phoneNo = json['phone_no'];
    username = json['username'];
    userid = json['userid'];
    customerId = json['customer_id'];
    businessUnitId = json['business_unit_id'];
    appDeviceId = json['app_device_id'];
    groupType = json['group_type'];
    reference = json['reference'];
    vehicle = json['vehicle'];
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
    img = json['img'];
    status = json['status'];
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
    data['userid'] = this.userid;
    data['customer_id'] = this.customerId;
    data['business_unit_id'] = this.businessUnitId;
    data['app_device_id'] = this.appDeviceId;
    data['group_type'] = this.groupType;
    data['reference'] = this.reference;
    data['vehicle'] = this.vehicle;
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
    data['img'] = this.img;
    data['status'] = this.status;
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
  String timeIn;
  String timeOut;
  String note;
  String schedule;
  String s1st;
  String s2nd;
  String s3rd;
  String s4th;
  String s5th;
  String sunday;
  String monday;
  String tuesday;
  String wednesday;
  String thursday;
  String friday;
  String saturday;
  String startDate;
  String endDate;

  ListRoutesInfo(
      {this.userId,
        this.routeId,
        this.customerId,
        this.timeIn,
        this.timeOut,
        this.note,
        this.schedule,
        this.s1st,
        this.s2nd,
        this.s3rd,
        this.s4th,
        this.s5th,
        this.sunday,
        this.monday,
        this.tuesday,
        this.wednesday,
        this.thursday,
        this.friday,
        this.saturday,
        this.startDate,
        this.endDate});

  ListRoutesInfo.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    routeId = json['route_id'];
    customerId = json['customer_id'];
    timeIn = json['time_in'];
    timeOut = json['time_out'];
    note = json['note'];
    schedule = json['schedule'];
    s1st = json['1st'];
    s2nd = json['2nd'];
    s3rd = json['3rd'];
    s4th = json['4th'];
    s5th = json['5th'];
    sunday = json['sunday'];
    monday = json['monday'];
    tuesday = json['tuesday'];
    wednesday = json['wednesday'];
    thursday = json['thursday'];
    friday = json['friday'];
    saturday = json['saturday'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['route_id'] = this.routeId;
    data['customer_id'] = this.customerId;
    data['time_in'] = this.timeIn;
    data['time_out'] = this.timeOut;
    data['note'] = this.note;
    data['schedule'] = this.schedule;
    data['1st'] = this.s1st;
    data['2nd'] = this.s2nd;
    data['3rd'] = this.s3rd;
    data['4th'] = this.s4th;
    data['5th'] = this.s5th;
    data['sunday'] = this.sunday;
    data['monday'] = this.monday;
    data['tuesday'] = this.tuesday;
    data['wednesday'] = this.wednesday;
    data['thursday'] = this.thursday;
    data['friday'] = this.friday;
    data['saturday'] = this.saturday;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}
