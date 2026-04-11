import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/gen/locale_keys.g.dart';
import 'dart:ui' as ui;

import '../../../../core/utils/common_widgets/shimmer_widget.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_text_them.dart';

class CustomReadMoreText extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final int trimLines;
  final String? showMoreText;
  final String? showLessText;
  final TextStyle? linkStyle;
  final Color? linkColor;
  final TextAlign? textAlign;
  final ui.TextDirection? textDirection;
  final String delimiter;
  final double textScaleFactor;

  const CustomReadMoreText({
    super.key,
    required this.text,
    this.textStyle,
    this.trimLines = 3,
    this.showMoreText,
    this.showLessText,
    this.linkStyle,
    this.linkColor,
    this.textAlign,
    this.textDirection,
    this.delimiter = '... ',
    this.textScaleFactor = 1.0,
  });

  @override
  State<CustomReadMoreText> createState() => _CustomReadMoreTextState();
}

class _CustomReadMoreTextState extends State<CustomReadMoreText> {
  bool _isExpanded = false;
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = _toggleExpanded;
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() => _isExpanded = !_isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;
    final effectiveTextStyle = widget.textStyle ?? defaultTextStyle;
    final linkColor = widget.linkColor ?? AppColors.primary;
    final linkStyle =
        widget.linkStyle ??
        AppTextTheme.linkMedium(context).copyWith(color: linkColor);

    final availableWidth = MediaQuery.of(context).size.width;

    final textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: effectiveTextStyle),
      maxLines: widget.trimLines,
      textDirection: widget.textDirection ?? ui.TextDirection.ltr,
      textScaler: TextScaler.linear(widget.textScaleFactor),
    );

    textPainter.layout(maxWidth: availableWidth);
    final needsTrim = textPainter.didExceedMaxLines;

    String displayText = widget.text;
    if (!_isExpanded && needsTrim) {
      displayText = _getTrimmedText(
        context,
        widget.text,
        widget.trimLines,
        effectiveTextStyle,
        linkStyle,
        availableWidth,
      );
    }

    List<TextSpan> textSpans = [
      TextSpan(text: displayText, style: effectiveTextStyle),
    ];

    if (needsTrim) {
      if (_isExpanded) {
        textSpans.add(
          TextSpan(
            text: '\n',
            style: linkStyle,
            recognizer: _tapGestureRecognizer,
          ),
        );
        textSpans.add(
          TextSpan(
            text: widget.showLessText??LocaleKeys.readLess.tr(),
            style: linkStyle,
            recognizer: _tapGestureRecognizer,
          ),
        );
      } else {
        textSpans.add(
          TextSpan(text: widget.delimiter, style: effectiveTextStyle),
        );
        textSpans.add(
          TextSpan(
            text: '\n',
            style: linkStyle,
            recognizer: _tapGestureRecognizer,
          ),
        );
        textSpans.add(
          TextSpan(
            text: widget.showMoreText??LocaleKeys.readMore.tr(),
            style: linkStyle,
            recognizer: _tapGestureRecognizer,
          ),
        );
      }
    }

    return Text.rich(
      TextSpan(children: textSpans),
      textAlign: widget.textAlign,
      textDirection: widget.textDirection,
      textScaler: TextScaler.linear(widget.textScaleFactor),
    );
  }

  String _getTrimmedText(
    BuildContext context,
    String text,
    int maxLines,
    TextStyle textStyle,
    TextStyle linkStyle,
    double maxWidth,
  ) {
    if (maxLines <= 0 || text.isEmpty) return text;

    int min = 0;
    int max = text.length;
    String trimmedText = text;

    while (min < max) {
      final mid = (min + max) ~/ 2;
      final testText = text.substring(0, mid);

      final textPainter = TextPainter(
        text: TextSpan(
          children: [
            TextSpan(text: testText, style: textStyle),
            TextSpan(text: widget.delimiter, style: textStyle),
            TextSpan(text: widget.showMoreText??LocaleKeys.readMore.tr(), style: linkStyle),
          ],
        ),
        maxLines: maxLines,
        textDirection: widget.textDirection ?? ui.TextDirection.ltr,
        textScaler: TextScaler.linear(widget.textScaleFactor),
      );

      textPainter.layout(maxWidth: maxWidth);

      if (textPainter.didExceedMaxLines) {
        max = mid;
      } else {
        trimmedText = testText;
        min = mid + 1;
      }
    }

    return trimmedText.trim();
  }
}


class CustomReadMoreShimmer extends StatelessWidget {
  const CustomReadMoreShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(3, (index)=>ShimmerWidget.rectangular(width: double.infinity, height: 10.w, shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r)
        ))
        ),
        ShimmerWidget.rectangular(width: 100, height: 10.w, shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r)
        ))
      ],
    );
  }
}
