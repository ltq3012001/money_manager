enum TransactionType { outFlow, inFlow }

enum ItemCategoryType { fashion, grocery, payments }

class UserInfo {
  final String name;
  final String totalBalance;
  final String inFlow;
  final String outFlow;
  final List<Transaction> transactions;
  const UserInfo(
      {required this.name,
      required this.totalBalance,
      required this.inFlow,
      required this.outFlow,
      required this.transactions});
}

class Transaction {
  final TransactionType transactionType;
  final ItemCategoryType categoryType;
  final String itemCategoryName;
  final String itemName;
  final String amount;
  final String date;

  const Transaction(this.transactionType, this.categoryType,
      this.itemCategoryName, this.itemName, this.amount, this.date);
}

const List<Transaction> transactions = [
  Transaction(TransactionType.inFlow, ItemCategoryType.fashion,
      "itemCategoryName", "itemName", "amount", "date"),
  Transaction(TransactionType.outFlow, ItemCategoryType.fashion,
      "itemCategoryName", "itemName", "amount", "date"),
];

const UserInfo userInfo = UserInfo(
    name: "name",
    totalBalance: "totalBalance",
    inFlow: "inFlow",
    outFlow: "outFlow",
    transactions: transactions);
