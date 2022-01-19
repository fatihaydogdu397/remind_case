import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:re_mind_case/app/base/base_view.dart';
import 'package:re_mind_case/app/components/custom_appbar.dart';
import 'package:re_mind_case/app/extensions/context_extensions_shelf.dart';
import 'package:re_mind_case/views/add_bill_info/add_bill_info_view.dart';
import 'package:re_mind_case/views/widgets/bill_list_item.dart';

import '../bill_info_viewmodel.dart';

//ilk gördüğümüz faturaların listelendiği sayfa

class BillInfo extends StatefulWidget {
  const BillInfo({Key? key}) : super(key: key);

  @override
  _BillInfoState createState() => _BillInfoState();
}

class _BillInfoState extends State<BillInfo> {
  bool _isRadioSelected = false;
  @override
  Widget build(BuildContext context) {
    return BaseView<BillInfoViewModel>(
        onDispose: (a) {},
        onModelReady: (a) {},
        builder: (context, model, _) {
          return Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: CustomAppbar(
                title: "Fatura Bilgilerim",
              ),
            ),
            backgroundColor: context.primaryColor,
            body: SafeArea(
              child: Padding(
                padding: context.mediumSymmetric,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: context.buttonEnableColor),
                      borderRadius: context.lowCircular),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...List.generate(model.billInfoList.length, (index) {
                        return BillListItem(
                          index: index,
                          model: model,
                          label: model.billInfoList[index]['name'],
                          padding: context.horizontalMedium,
                          groupValue: _isRadioSelected,
                          value: index == 0 ? true : false,
                          onChanged: (bool newValue) {
                            setState(() {
                              _isRadioSelected = newValue;
                            });
                          },
                        );
                      }),
                      addBillInfoButton(context)
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget addBillInfoButton(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: context.horizontalMedium,
          child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddBillInfoView()));
              },
              child: AutoSizeText(
                'Yeni Fatura Bilgisi Ekle',
                style: context.headline5.copyWith(
                    color: context.textColor,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              )),
        ),
      ],
    );
  }
}
