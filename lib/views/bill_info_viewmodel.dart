import 'package:re_mind_case/app/base/base_model.dart';
import 'package:re_mind_case/app/enums/billing_type.dart';
import 'dart:core';

//proje çok büyük olmadığı için tek providerla çalıştım

class BillInfoViewModel extends BaseModel {
  List<Map<String, dynamic>> billInfoList = [];

  BillingType _billingType = BillingType.Person;

  //faturalandırma tipini enumlardan çekiyoruz add bill info sayfasında kullanımı verildi.
  BillingType get billingType => _billingType;
  bool get isPerson => _billingType == BillingType.Person;
  bool get isCompany => _billingType == BillingType.Company;

  void setBillingType(BillingType type) {
    _billingType = type;
    notifyListeners();
  }

  //şirket veya şahıs için kesilen faturaları kaydettiğimiz fonksiyon
  addBillInfo(String name, String id, String country, String city,
      String county, String address) {
    var item = {
      'name': name,
      'id': id,
      'country': country,
      'city': city,
      'county': county,
      'address': address
    };
    billInfoList.add(item);
    for (var i = 0; i < billInfoList.length; i++) {}
    notifyListeners();
  }

  //fatura listesinden seçtiğimiz itemi silmek için kullandığım fonksiyon
  deleteBillInfo(int index) {
    billInfoList.removeAt(index);
    notifyListeners();
  }
}
