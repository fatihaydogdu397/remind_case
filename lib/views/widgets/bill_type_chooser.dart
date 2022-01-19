import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:re_mind_case/app/extensions/context_extensions_shelf.dart';

//şahıs mı şirket mi diye seçtiğimiz radio tile

class BillTypeChooser extends StatefulWidget {
  const BillTypeChooser({
    Key? key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  State<BillTypeChooser> createState() => _BillTypeChooserState();
}

class _BillTypeChooserState extends State<BillTypeChooser> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.value != widget.groupValue) {
          widget.onChanged(widget.value);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: context.horizontalMedium,
            child: AutoSizeText(
              widget.label,
              style: context.headline5.copyWith(
                color: context.textColor,
              ),
            ),
          ),
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
        ],
      ),
    );
  }
}
