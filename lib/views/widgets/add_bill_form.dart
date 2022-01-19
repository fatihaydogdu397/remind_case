import 'package:flutter/material.dart';
import 'package:re_mind_case/app/components/custom_button.dart';
import 'package:re_mind_case/app/components/custom_textformfield.dart';
import 'package:re_mind_case/app/enums/billing_type.dart';
import 'package:re_mind_case/app/extensions/context_extensions_shelf.dart';
import 'package:re_mind_case/views/bill_info/bill_info.dart';
import 'package:re_mind_case/views/bill_info_viewmodel.dart';

//fatura ekleme formunu bu şekilde ayırdım parametre olarak providerı alıyor

class AddBillForm extends StatefulWidget {
  final BillInfoViewModel model;
  const AddBillForm({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<AddBillForm> createState() => _AddBillFormState();
}

class _AddBillFormState extends State<AddBillForm> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController idCtrl = TextEditingController();
  TextEditingController countryCtrl = TextEditingController();
  TextEditingController cityCtrl = TextEditingController();
  TextEditingController countyCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: context.bottomLow,
          child: CustomTextFormField(
            textEditingController: nameCtrl,
            hintTextKey: widget.model.billingType == BillingType.Person
                ? 'Ad ve Soyad'
                : 'Şirket Ünvanı',
            onChanged: (c) {},
          ),
        ),
        Padding(
          padding: context.bottomLow,
          child: CustomTextFormField(
            textEditingController: idCtrl,
            hintTextKey: widget.model.billingType == BillingType.Person
                ? 'Kimlik Numarası'
                : 'Vergi Dairesi',
            onChanged: (c) {},
          ),
        ),
        Padding(
          padding: context.bottomLow,
          child: CustomTextFormField(
            textEditingController: countryCtrl,
            hintTextKey: widget.model.billingType == BillingType.Person
                ? 'Ülke'
                : 'Vergi Numarası',
            onChanged: (c) {},
          ),
        ),
        Padding(
          padding: context.bottomLow,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: context.rightLow,
                  child: CustomTextFormField(
                    textEditingController: cityCtrl,
                    hintTextKey: 'İl',
                    onChanged: (c) {},
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: context.leftLow,
                  child: CustomTextFormField(
                    textEditingController: countyCtrl,
                    hintTextKey: 'İlçe',
                    onChanged: (c) {},
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: context.bottomLow,
          child: CustomTextFormField(
            textEditingController: addressCtrl,
            hintTextKey: 'Adres',
            onChanged: (c) {},
          ),
        ),
        Padding(
            padding: context.bottomLow,
            child: CustomButton(
              action: () {
                widget.model.addBillInfo(
                    nameCtrl.text,
                    idCtrl.text,
                    countryCtrl.text,
                    cityCtrl.text,
                    countryCtrl.text,
                    addressCtrl.text);
                nameCtrl.clear();
                idCtrl.clear();
                countryCtrl.clear();
                cityCtrl.clear();
                countyCtrl.clear();
                addressCtrl.clear();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => BillInfo()));
              },
              buttonTextKey: 'Kaydet'.toUpperCase(),
              backgroundColor: context.buttonEnableColor,
              textStyle: context.headline4.copyWith(
                  color: context.secondaryColor, fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
