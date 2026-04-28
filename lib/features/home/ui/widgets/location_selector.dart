
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/home/data/models/city_model.dart';
import '../../../../gen/assets.gen.dart';

class LocationSelector extends StatefulWidget {
  final CityModel? initialLocation;
  final List<CityModel> locations;
  final ValueChanged<CityModel>? onLocationChanged;

  const LocationSelector({
    super.key,
    required this.initialLocation,
    required this.locations,
    this.onLocationChanged,
  });

  @override
  State<LocationSelector> createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {

  @override
  void initState() {
    super.initState();
  }

  void _showLocationPicker() async {
    final result = await showDialog<CityModel>(
      context: context,
      useSafeArea: true,
      barrierColor: AppColors.black.withOpacity(0.5),
      builder: (context) => _LocationPickerDialog(
        currentLocation: widget.initialLocation,
        locations: widget.locations,
      ),
    );

    if (result != null) {
      widget.onLocationChanged?.call(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: _showLocationPicker,
      child: Container(
        padding: 12.padHorizontal+6.padVertical,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.svg.uilArrow.svg(height: 24.h),
            6.horizontalSpace,
            Text(
              widget.initialLocation?.name??"الكل",
              style: AppTextTheme.bodyMedium(context),
            ),
            6.horizontalSpace,
            Assets.svg.miLocation.svg(height: 24.h),

          ],
        ),
      ),
    );
  }
}

class _LocationPickerDialog extends StatefulWidget {
  final CityModel? currentLocation;
  final List<CityModel> locations;

  const _LocationPickerDialog({
    required this.currentLocation,
    required this.locations,
  });

  @override
  State<_LocationPickerDialog> createState() => _LocationPickerDialogState();
}

class _LocationPickerDialogState extends State<_LocationPickerDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  CityModel? _selectedLocation;

  @override
  void initState() {
    super.initState();
    _selectedLocation = widget.currentLocation;

    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _controller.forward();
  }


  void _selectLocation(CityModel location) async {
    setState(() => _selectedLocation = location);
    await Future.delayed(const Duration(milliseconds: 150));
    await _controller.reverse();
    if (mounted) {
      Navigator.of(context).pop(location);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            constraints:  BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            margin: 20.padVertical,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary100,
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: widget.locations.length,
                itemBuilder: (context, index) {
                  final location = widget.locations[index];
                  final isSelected = location == _selectedLocation;

                  return OnTap(
                    onTap: () => _selectLocation(location),
                    child: Container(
                      padding: 20.padHorizontal+14.padVertical,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary100
                            : Colors.transparent,
                        border: Border(
                          bottom: BorderSide(
                            color: index < widget.locations.length - 1
                                ? AppColors.neutral30
                                : Colors.transparent,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                                location.name??"",
                                style:AppTextTheme.bodyMedium(context)),
                          ),
                          if (isSelected)
                            Icon(
                              Icons.check,
                              size: 18,
                              color: AppColors.primary,
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}


class LocationSelectorWidget extends StatelessWidget {
  const LocationSelectorWidget({super.key, required this.onChange, required this.locations, required this.selectedLocation});
  final Function(CityModel) onChange;
  final List<CityModel> locations;
  final CityModel? selectedLocation;
  @override
  Widget build(BuildContext context) {
    return  LocationSelector(
      initialLocation: selectedLocation,
      locations: locations,
      onLocationChanged: (location) {
        onChange(location);
        print('Selected: $location');
      },
    );
  }
}
