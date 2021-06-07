final String insert_cheque_tabelname="insert_cheque";
final String insert_cheque_Column_user_id="user_id";
final String insert_cheque_Column_employee_id="employee_id";
final String insert_cheque_Column_customer_id="customer_id";
final String insert_cheque_Column_supervisor_id="supervisor_id";
final String insert_cheque_Column_salesmanager_id="salesmanager_id";
final String insert_cheque_Column_payment_type="payment_type";
final String insert_cheque_Column_amount="amount";
final String insert_cheque_Column_customer_name="customer_name";
final String insert_cheque_Column_salesman_name="salesman_name";
final String insert_cheque_Column_payment_date="payment_date";
final String insert_cheque_Column_payment_no="payment_no";
final String insert_cheque_Column_reference_no="reference_no";
final String insert_cheque_Column_bank_id="bank_id";
final String insert_cheque_Column_branch_id="branch_id";
final String insert_cheque_Column_drawer_name="drawer_name";
final String insert_cheque_Column_cheque_no="cheque_no";
final String insert_cheque_Column_due_date="due_date";
final String insert_cheque_Column_note="note";


class Insert_cheque_DB {
  int user_id;
  int employee_id;
  int customer_id;
  int supervisor_id;
  int salesmanager_id;
  String payment_type;
  double amount;
  String customer_name;
  String salesman_name;
  String payment_date;
  String payment_no;
  String reference_no;
  int bank_id;
  int branch_id;
  String drawer_name;
  int cheque_no;
  String due_date;
  String note;

  Insert_cheque_DB(
      {this.user_id,
        this.employee_id,
        this.customer_id,
        this.supervisor_id,
        this.salesmanager_id,
        this.payment_type,
        this.amount,
        this.customer_name,
        this.salesman_name,
        this.payment_date,
        this.payment_no,
        this.reference_no,
        this.bank_id,
        this.branch_id,
        this.drawer_name,
        this.cheque_no,
        this.due_date,
        this.note});

  Insert_cheque_DB.fromJson(Map<String, dynamic> json) {
    user_id = json['user_id'];
    employee_id = json['employee_id'];
    customer_id = json['customer_id'];
    supervisor_id = json['supervisor_id'];
    salesmanager_id = json['salesmanager_id'];
    payment_type = json['payment_type'];
    amount = json['amount'];
    customer_name = json['customer_name'];
    salesman_name = json['salesman_name'];
    payment_date = json['payment_date'];
    payment_no = json['payment_no'];
    reference_no = json['reference_no'];
    bank_id = json['bank_id'];
    branch_id = json['branch_id'];
    drawer_name = json['drawer_name'];
    cheque_no = json['cheque_no'];
    due_date = json['due_date'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.user_id;
    data['employee_id'] = this.employee_id;
    data['customer_id'] = this.customer_id;
    data['supervisor_id'] = this.supervisor_id;
    data['salesmanager_id'] = this.salesmanager_id;
    data['payment_type'] = this.payment_type;
    data['amount'] = this.amount;
    data['customer_name'] = this.customer_name;
    data['salesman_name'] = this.salesman_name;
    data['payment_date'] = this.payment_date;
    data['payment_no'] = this.payment_no;
    data['reference_no'] = this.reference_no;
    data['bank_id'] = this.bank_id;
    data['branch_id'] = this.branch_id;
    data['drawer_name'] = this.drawer_name;
    data['cheque_no'] = this.cheque_no;
    data['due_date'] = this.due_date;
    data['note'] = this.note;
    return data;
  }
}
