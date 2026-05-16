import 'package:flutter/material.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';

class PriceRangeSlider extends StatefulWidget {
  final double min;
  final String coin;
  final double max;
  final RangeValues initialValue;
  final Function(double, double) returnValue;
  const PriceRangeSlider({
    super.key,
    required this.min,
    required this.max,
    required this.returnValue,
    required this.initialValue, required this.coin,
  });

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  RangeValues _value = const RangeValues(0, 0);
  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant PriceRangeSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      setState(() {
        _value = widget.initialValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${widget.coin} ${widget.min}", style: AppTextTheme.bodyMedium(context)),
            Text("${widget.coin} ${widget.max}", style: AppTextTheme.bodyMedium(context)),
          ],
        ),
        RangeSlider(
          padding: 0.padHorizontal+10.padVertical,
          labels: RangeLabels(
            _value.start.toString(),
            _value.end.toString(),
          ),
          values: _value,
          min: widget.min,
          max: widget.max,
          activeColor: AppColors.primary,
          inactiveColor: AppColors.neutral30,
          divisions: 2000,
          onChanged: (RangeValues newValue) {
            widget.returnValue(newValue.start, newValue.end);
            setState(() {
              _value = newValue;
            });
          },
        ),
      ],
    );
  }
}
