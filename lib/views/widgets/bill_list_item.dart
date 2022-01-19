import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:re_mind_case/app/extensions/context_extensions_shelf.dart';
import 'package:re_mind_case/views/bill_info_viewmodel.dart';

//ilk sayfada gördüğümüz eklenen faturanın list itemi

class BillListItem extends StatefulWidget {
  const BillListItem({
    Key? key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
    required this.model,
    required this.index,
  }) : super(key: key);
  final BillInfoViewModel model;
  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final ValueChanged<bool> onChanged;
  final int index;

  @override
  State<BillListItem> createState() => _BillListItemState();
}

class _BillListItemState extends State<BillListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.value != widget.groupValue) {
          widget.onChanged(widget.value);
        }
      },
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Padding(
                padding: context.horizontalLow,
                child: Radio<bool>(
                  activeColor: context.buttonEnableColor,
                  groupValue: widget.groupValue,
                  value: widget.value,
                  onChanged: (bool? newValue) {
                    widget.onChanged(newValue!);
                  },
                ),
              ),
              AutoSizeText(
                widget.label,
                style: context.headline5.copyWith(
                  color: context.textColor,
                ),
              ),
              const Spacer(),
              deleteBillInfoButton(context, widget.model, widget.index)
            ],
          ),
          Divider(
            color: context.buttonEnableColor,
            thickness: 1,
            height: 0,
          )
        ],
      ),
    );
  }

  Widget deleteBillInfoButton(
      BuildContext context, BillInfoViewModel model, int index) {
    return TextButton(
        onPressed: () {
          model.deleteBillInfo(index);
        },
        child: AutoSizeText(
          'Sil',
          style: context.headline5.copyWith(
              color: context.textColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ));
  }
}
