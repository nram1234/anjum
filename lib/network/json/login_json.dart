class Login_json {
  User user;
  Permissions permissions;
  String token;

  Login_json({this.user, this.permissions, this.token});

  Login_json.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    permissions = json['permissions'] != null
        ? new Permissions.fromJson(json['permissions'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.permissions != null) {
      data['permissions'] = this.permissions.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int id;
  int userId;
  String refId;
  String employeeNameEn;
  String employeeNameAr;
  String phoneNo;
  String username;
  String password;
  String email;
  int type;
  String customerId;
  String businessUnitId;
  String appDeviceId;
  String groupType;
  String reference;
  String vehicle;
  String collectPercent;
  String salesCommission;
  String salary;
  String insurance;
  String socialSecurity;
  String cashBoxAccount;
  String debitAmount;
  String storeId;
  String supervisorId;
  int salesmanagerId;
  String address;
  String image;
  String status;
  String onlineStatus;
  String createdAt;
  String updatedAt;

  User(
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

  User.fromJson(Map<String, dynamic> json) {
    id = json['id']??"";
    userId = json['user_id']??"";
    refId = json['ref_id']??"";
    employeeNameEn = json['employee_name_en']??"";
    employeeNameAr = json['employee_name_ar']??"";
    phoneNo = json['phone_no']??"";
    username = json['username']??"";
    password = json['password']??"";
    email = json['email']??"";
    type = json['type']??"";
    customerId = json['customer_id']??"";
    businessUnitId = json['business_unit_id']??"";
    appDeviceId = json['app_device_id']??"";
    groupType = json['group_type']??"";
    reference = json['reference']??"";
    vehicle = json['vehicle']??"";
    collectPercent = json['collect_percent']??"";
    salesCommission = json['sales_commission']??"";
    salary = json['salary']??"";
    insurance = json['insurance']??"";
    socialSecurity = json['social_security']??"";
    cashBoxAccount = json['cash_box_account']??"";
    debitAmount = json['debit_amount']??"";
    storeId = json['store_id']??"";
    supervisorId = json['supervisor_id']??"";
    salesmanagerId = json['salesmanager_id']??"";
    address = json['address']??"";
    image = json['image']??"";
    status = json['status']??"";
    onlineStatus = json['online_status']??"";
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
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

class Permissions {
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

  Permissions(
      {this.invoice,
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
        this.displayProductQuantity});

  Permissions.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    return data;
  }
}