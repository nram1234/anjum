class Get_Reports_json {
  String message;
  int codenum;
  bool status;
  Result result;

  Get_Reports_json({this.message, this.codenum, this.status, this.result});

  Get_Reports_json.fromJson(Map<String, dynamic> json) {
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
  Reports reports;

  Result({this.reports});

  Result.fromJson(Map<String, dynamic> json) {
    reports =
    json['reports'] != null ? new Reports.fromJson(json['reports']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reports != null) {
      data['reports'] = this.reports.toJson();
    }
    return data;
  }
}

class Reports {
  String totalInvoice;
  String totalSales;
  String totalReturnInvoice;
  String totalCash;
  String totalCheque;
  String totalInvoiceValue;
  String totalSalesValue;
  String totalReturnInvoiceValue;
  String totalCashValue;
  String totalChequeValue;

  Reports(
      {this.totalInvoice,
        this.totalSales,
        this.totalReturnInvoice,
        this.totalCash,
        this.totalCheque,
        this.totalInvoiceValue,
        this.totalSalesValue,
        this.totalReturnInvoiceValue,
        this.totalCashValue,
        this.totalChequeValue});

  Reports.fromJson(Map<String, dynamic> json) {
    totalInvoice = json['total_invoice'].toString();
    totalSales = json['total_sales'].toString();
    totalReturnInvoice = json['total_return_invoice'].toString();
    totalCash = json['total_cash'].toString();
    totalCheque = json['total_cheque'].toString();
    totalInvoiceValue = json['total_invoice_value'].toString();
    totalSalesValue = json['total_sales_value'].toString();
    totalReturnInvoiceValue = json['total_return_invoice_value'].toString();
    totalCashValue = json['total_cash_value'].toString();
    totalChequeValue = json['total_cheque_value'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_invoice'] = this.totalInvoice;
    data['total_sales'] = this.totalSales;
    data['total_return_invoice'] = this.totalReturnInvoice;
    data['total_cash'] = this.totalCash;
    data['total_cheque'] = this.totalCheque;
    data['total_invoice_value'] = this.totalInvoiceValue;
    data['total_sales_value'] = this.totalSalesValue;
    data['total_return_invoice_value'] = this.totalReturnInvoiceValue;
    data['total_cash_value'] = this.totalCashValue;
    data['total_cheque_value'] = this.totalChequeValue;
    return data;
  }
}
