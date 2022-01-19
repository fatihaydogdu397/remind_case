import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:re_mind_case/app/base/base_view.dart';
import 'package:re_mind_case/app/components/custom_appbar.dart';
import 'package:re_mind_case/app/enums/billing_type.dart';
import 'package:re_mind_case/app/extensions/context_extensions_shelf.dart';
import 'package:re_mind_case/views/bill_info_viewmodel.dart';
import 'package:re_mind_case/views/widgets/add_bill_form.dart';
import 'package:re_mind_case/views/widgets/bill_type_chooser.dart';

//yeni fatura ekleme sayfası

class AddBillInfoView extends StatefulWidget {
  const AddBillInfoView({Key? key}) : super(key: key);

  @override
  _AddBillInfoViewState createState() => _AddBillInfoViewState();
}

class _AddBillInfoViewState extends State<AddBillInfoView> {
  bool _isRadioSelected = false;
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController idCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView<BillInfoViewModel>(
        onModelReady: (BillInfoViewModel model) {},
        onDispose: (BillInfoViewModel model) {},
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: context.primaryColor,
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: CustomAppbar(title: 'Fatura Bilgisi Ekle')),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: context.mediumSymmetric,
                  child: Column(
                    children: [
                      billTypeWidget(context, model),
                      Padding(
                        padding: context.mediumEdgeInsets,
                        child: Row(
                          children: [
                            AutoSizeText(
                              'Fatura Bilgisi',
                              style: context.headline4.copyWith(
                                color: context.textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AddBillForm(model: model)
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget billTypeWidget(BuildContext context, BillInfoViewModel model) {
    return Container(
      decoration: BoxDecoration(
          color: context.secondaryColor,
          border: Border.all(width: 1, color: context.buttonEnableColor),
          borderRadius: context.lowCircular),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BillTypeChooser(
            label: 'Şahıs',
            padding: context.horizontalLow,
            value: false,
            groupValue: _isRadioSelected,
            onChanged: (bool newValue) {
              setState(() {
                _isRadioSelected = newValue;
                model.setBillingType(BillingType.Person);
              });
            },
          ),
          Divider(
            color: context.buttonEnableColor,
            thickness: 1,
            height: 0,
          ),
          BillTypeChooser(
            label: 'Şirket',
            padding: context.horizontalLow,
            value: true,
            groupValue: _isRadioSelected,
            onChanged: (bool newValue) {
              setState(() {
                _isRadioSelected = newValue;
                model.setBillingType(BillingType.Company);
              });
            },
          ),
        ],
      ),
    );
  }
}
