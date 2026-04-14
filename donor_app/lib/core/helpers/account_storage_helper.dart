import 'dart:convert';

import 'package:donor_app/core/helpers/constants.dart';
import 'package:donor_app/core/helpers/shared_pref_helper.dart';
import 'package:donor_app/features/auth/domain/params/account.dart';

class AccountStorageHelper {
  Future<List<Account>> getAccounts() async {
    final data = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.accounts,
    );

    if (data.isEmpty) return [];

    final List decoded = jsonDecode(data);

    return decoded.map((e) => Account.fromJson(e)).toList();
  }

  void _saveAccounts(List<Account> accounts) async {
    final jsonList = accounts.map((e) => e.toJson()).toList();

    await SharedPrefHelper.setSecuredString(
      SharedPrefKeys.accounts,
      jsonEncode(jsonList),
    );
  }

  Future<void> addAccount(String email, String password) async {
    final accounts = await getAccounts();

    accounts.removeWhere((e) => e.email == email);

    accounts.add(Account(email: email, password: password));

    _saveAccounts(accounts);
  }
}
