import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/app_text_field.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/features/venues/ui/widgets/price_range.dart';
import 'package:nawy/gen/locale_keys.g.dart';
class PriceSection extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final double minLimit;
  final double maxLimit;
  final String coin;
  final ValueChanged<RangeValues> onChanged;

  const PriceSection({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
    required this.coin,
    this.minLimit = 0,
    this.maxLimit = 5000,
  });

  @override
  State<PriceSection> createState() => _PriceSectionState();
}

class _PriceSectionState extends State<PriceSection> {
  late TextEditingController minController;
  late TextEditingController maxController;
  late FocusNode minFocusNode;
  late FocusNode maxFocusNode;
  late RangeValues currentRange;

  @override
  void initState() {
    super.initState();

    final min = widget.minValue.clamp(widget.minLimit, widget.maxLimit);
    final max = widget.maxValue.clamp(widget.minLimit, widget.maxLimit);

    currentRange = RangeValues(
      min <= max ? min : widget.minLimit,
      max >= min ? max : widget.maxLimit,
    );

    minController = TextEditingController(
      text: currentRange.start.toInt().toString(),
    );
    maxController = TextEditingController(
      text: currentRange.end.toInt().toString(),
    );

    // Setup focus listeners
    minFocusNode = FocusNode();
    maxFocusNode = FocusNode();

    minFocusNode.addListener(_onMinFocusChange);
    maxFocusNode.addListener(_onMaxFocusChange);
  }

  @override
  void didUpdateWidget(covariant PriceSection oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Don't update if user is actively editing
    if (minFocusNode.hasFocus || maxFocusNode.hasFocus) {
      return;
    }

    final newMin = widget.minValue.clamp(widget.minLimit, widget.maxLimit);
    final newMax = widget.maxValue.clamp(widget.minLimit, widget.maxLimit);

    final newRange = RangeValues(
      newMin <= newMax ? newMin : widget.minLimit,
      newMax >= newMin ? newMax : widget.maxLimit,
    );

    if (newRange.start != currentRange.start ||
        newRange.end != currentRange.end) {
      currentRange = newRange;
      _updateControllers();
    }
  }

  void _updateControllers() {
    if (!minFocusNode.hasFocus) {
      minController.value = TextEditingValue(
        text: currentRange.start.toInt().toString(),
        selection: TextSelection.collapsed(
          offset: currentRange.start.toInt().toString().length,
        ),
      );
    }

    if (!maxFocusNode.hasFocus) {
      maxController.value = TextEditingValue(
        text: currentRange.end.toInt().toString(),
        selection: TextSelection.collapsed(
          offset: currentRange.end.toInt().toString().length,
        ),
      );
    }
  }

  void _emitChange() {
    widget.onChanged(currentRange);
  }

  void _onSliderChanged(double min, double max) {
    final newMin = min.clamp(widget.minLimit, widget.maxLimit);
    final newMax = max.clamp(widget.minLimit, widget.maxLimit);

    setState(() {
      currentRange = RangeValues(newMin, newMax);
      _updateControllers();
    });

    _emitChange();
  }

  void _onMinFocusChange() {
    if (!minFocusNode.hasFocus) {
      // User finished editing, now validate
      final value = minController.text;
      double parsed = double.tryParse(value) ?? widget.minLimit;
      parsed = parsed.clamp(widget.minLimit, currentRange.end);

      setState(() {
        currentRange = RangeValues(parsed, currentRange.end);
        _updateControllers();
      });

      _emitChange();
    }
  }

  void _onMaxFocusChange() {
    if (!maxFocusNode.hasFocus) {
      // User finished editing, now validate
      final value = maxController.text;
      double parsed = double.tryParse(value) ?? widget.maxLimit;
      parsed = parsed.clamp(currentRange.start, widget.maxLimit);

      setState(() {
        currentRange = RangeValues(currentRange.start, parsed);
        _updateControllers();
      });

      _emitChange();
    }
  }

  void _onMinChanged(String? value) {
    // Allow typing without validation
  }

  void _onMaxChanged(String? value) {
    // Allow typing without validation
  }

  @override
  void dispose() {
    minFocusNode.removeListener(_onMinFocusChange);
    maxFocusNode.removeListener(_onMaxFocusChange);
    minFocusNode.dispose();
    maxFocusNode.dispose();
    minController.dispose();
    maxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.priceRange.tr(),
            style: AppTextTheme.bodyLarge(context)),
        24.verticalSpace,
        PriceRangeSlider(
          coin: widget.coin,
          initialValue: currentRange,
          max: widget.maxLimit,
          min: widget.minLimit,
          returnValue: (min, max) {
            _onSliderChanged(min, max);
          },
        ),
        16.verticalSpace,
        Row(
          children: [
            Expanded(
              child: Text(
                LocaleKeys.from.tr(),
                style: AppTextTheme.bodyLarge(context),
              ),
            ),
            24.horizontalSpace,
            Expanded(
              child: Text(
                LocaleKeys.to.tr(),
                style: AppTextTheme.bodyLarge(context),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Focus(
                focusNode: minFocusNode,
                child: AppTextField(
                  keyBord: TextInputType.number,
                  fileInputController: minController,
                  textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  label: "${widget.coin} ${widget.minLimit.toInt()}",
                  onChange: _onMinChanged,
                ),
              ),
            ),
            24.horizontalSpace,
            Expanded(
              child: Focus(
                focusNode: maxFocusNode,
                child: AppTextField(
                  keyBord: TextInputType.number,
                  fileInputController: maxController,
                  textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  label: "${widget.coin} ${widget.maxLimit.toInt()}",
                  onChange: _onMaxChanged,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
