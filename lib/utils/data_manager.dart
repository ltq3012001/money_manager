import 'dart:convert';

import 'package:flutter/services.dart';

class DataManager {
  static final DataManager _singleton = DataManager._internal();

  Map _transactionData = {};
  Map _categoryData = {};
  Map _walletData = {};

  factory DataManager() {
    return _singleton;
  }

  DataManager._internal();

  Future<void> loadData() async {
    await loadTransactionData();
    await loadCategoryData();
    await loadWalletData();
  }

  Future<void> loadTransactionData() async {
    final String response =
        await rootBundle.loadString('assets/sample_data.json');
    final data = await jsonDecode(response);
    _transactionData = data;
  }

  Future<void> loadCategoryData() async {
    final String response = await rootBundle.loadString('assets/category.json');
    final data = await jsonDecode(response);
    print(data);
    _categoryData = data;
  }

  Future<void> loadWalletData() async {
    final String response = await rootBundle.loadString('assets/wallets.json');
    final data = await jsonDecode(response);
    _walletData = data;
  }

  Future<void> saveTransactionData() async {}
  Future<void> saveCategoryData() async {}
  Future<void> saveWalletData() async {}

  Map getTransactionData() {
    return _transactionData;
  }

  Map getCategoryData() {
    return _categoryData;
  }

  Map getWalletData() {
    return _walletData;
  }
}
