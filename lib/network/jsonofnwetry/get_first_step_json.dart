class Get_first_step_json {
 late String message;
 late int codenum;
 late bool status;
 late Result result;

  Get_first_step_json({required this.message,required this.codenum,required this.status,required this.result});

  Get_first_step_json.fromJson(Map<String, dynamic> json) {
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
late EmployeData employeData;
late List<EmployeePermissions> employeePermissions;
late List<AllRoutes> allRoutes;

  Result({required this.employeData,required this.employeePermissions,required this.allRoutes});

  Result.fromJson(Map<String, dynamic> json) {
    employeData = (json['employe_data'] != null
        ? new EmployeData.fromJson(json['employe_data'])
        : null)!;
    if (json['employee_permissions'] != null) {
      employeePermissions = [];
      json['employee_permissions'].forEach((v) {
        employeePermissions.add(new EmployeePermissions.fromJson(v));
      });
    }
    if (json['all_routes'] != null) {
      allRoutes = [];
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
late  String id;
late  String userId;
late  String refId;
late  String employeeNameEn;
late  String employeeNameAr;
late  String phoneNo;
late  String username;
late  String userid;
late  String customerId;
late  String businessUnitId;
late  String appDeviceId;
late  String groupType;
late  String reference;
late  String vehicle;
late  String salesCommission;
late  String salary;
late  String insurance;
late  String socialSecurity;
late  String cashBoxAccount;
late  String debitAmount;
late  String storeId;
late  String supervisorId;
late  String salesmanagerId;
late  String address;
late  String img;
late  String status;

  EmployeData(
      {required this.id,
       required this.userId,
       required this.refId,
       required this.employeeNameEn,
       required this.employeeNameAr,
       required this.phoneNo,
       required this.username,
       required this.userid,
       required this.customerId,
       required this.businessUnitId,
       required this.appDeviceId,
       required this.groupType,
       required this.reference,
       required this.vehicle,
       required this.salesCommission,
       required this.salary,
       required this.insurance,
       required this.socialSecurity,
       required this.cashBoxAccount,
       required this.debitAmount,
       required this.storeId,
       required this.supervisorId,
       required this.salesmanagerId,
       required this.address,
       required this.img,
       required this.status});

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
late  String id;
late  String userId;
late  String employeeId;
late  String invoice;
late  String returnInvoice;
late  String order;
late  String payment;
late  String stockTaking;
late  String loadItems;
late  String unloadItems;
late  String takePhoto;
late  String beforeAfterPhoto;
late  String note;
late  String survey;
late  String loadRequestAcceptReject;
late  String unloadRequestAcceptReject;
late  String salesOrderRequestAcceptReject;
late  String salesOrderToPrice;
late  String requestToExceedCustomerCreditLimit;
late  String requestToExceedChequeDueDateLimit;
late  String requestToReturnInvoice;
late  String requestToOrdersApproval;
late  String requestToChangeInvoicePaymentType;
late  String requestToExceedCustomerInvoiceNumber;
late  String requestToVisitCustomerNotInRoute;
late  String requestForCustomerLoginWithoutVerification;
late  String employeeAddDrawersFromApp;
late  String addBonus;
late  String addItemDiscount;
late  String addVoucherDiscount;
late  String addCustomer;
late  String displayProductQuantity;
late  String createdAt;
late  String updatedAt;
late  String displayStores;

  EmployeePermissions(
      {required this.id,
       required this.userId,
       required this.employeeId,
       required this.invoice,
       required this.returnInvoice,
       required this.order,
       required this.payment,
       required this.stockTaking,
       required this.loadItems,
       required this.unloadItems,
       required this.takePhoto,
       required this.beforeAfterPhoto,
       required this.note,
       required this.survey,
       required this.loadRequestAcceptReject,
       required this.unloadRequestAcceptReject,
       required this.salesOrderRequestAcceptReject,
       required this.salesOrderToPrice,
       required this.requestToExceedCustomerCreditLimit,
       required this.requestToExceedChequeDueDateLimit,
       required this.requestToReturnInvoice,
       required this.requestToOrdersApproval,
       required this.requestToChangeInvoicePaymentType,
       required this.requestToExceedCustomerInvoiceNumber,
       required this.requestToVisitCustomerNotInRoute,
       required this.requestForCustomerLoginWithoutVerification,
       required this.employeeAddDrawersFromApp,
       required this.addBonus,
       required this.addItemDiscount,
       required this.addVoucherDiscount,
       required this.addCustomer,
       required this.displayProductQuantity,
       required this.createdAt,
       required this.updatedAt,
       required this.displayStores});

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
 late String userId;
 late String salesmanId;
 late String name;
 late String minCustomers;
 late String maxCustomers;
 late String routeId;
 late List<ListRoutesInfo> listRoutesInfo;

  AllRoutes(
      {required this.userId,
       required  this.salesmanId,
       required  this.name,
       required  this.minCustomers,
       required  this.maxCustomers,
       required  this.routeId,
       required  this.listRoutesInfo});

  AllRoutes.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    salesmanId = json['salesman_id'];
    name = json['name'];
    minCustomers = json['min_customers'];
    maxCustomers = json['max_customers'];
    routeId = json['route_id'];
    if (json['list_routes_info'] != null) {
      listRoutesInfo = [];
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
late  String userId;
late  String routeId;
late  String customerId;
late  String timeIn;
late  String timeOut;
late  String note;
late  String schedule;
late  String s1st;
late  String s2nd;
late  String s3rd;
late  String s4th;
late  String s5th;
late  String sunday;
late  String monday;
late  String tuesday;
late  String wednesday;
late  String thursday;
late  String friday;
late  String saturday;
late  String startDate;
late  String endDate;

  ListRoutesInfo(
      {required this.userId,
       required  this.routeId,
       required  this.customerId,
       required  this.timeIn,
       required  this.timeOut,
       required  this.note,
       required  this.schedule,
       required  this.s1st,
       required  this.s2nd,
       required  this.s3rd,
       required  this.s4th,
       required  this.s5th,
       required  this.sunday,
       required  this.monday,
       required  this.tuesday,
       required  this.wednesday,
       required  this.thursday,
       required  this.friday,
       required  this.saturday,
       required  this.startDate,
       required  this.endDate});

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
