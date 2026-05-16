import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nawy/core/services/dialogs/message_service.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/features/profile/cubits/update_profile/update_profile_cubit.dart';
import 'package:nawy/gen/locale_keys.g.dart';

class CircleProfileImagePicker extends StatefulWidget {
  final String? initialImageUrl;
  final double size;
  final Function(String) onImageUploaded;

  const CircleProfileImagePicker({
    super.key,
    this.initialImageUrl,
    this.size = 200,
    required this.onImageUploaded,
  });

  @override
  State<CircleProfileImagePicker> createState() =>
      _CircleProfileImagePickerState();
}

class _CircleProfileImagePickerState extends State<CircleProfileImagePicker> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1080,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });

        // Call the callback with the file path
        widget.onImageUploaded(pickedFile.path);
      }
    } catch (e) {
      MessageService.showToast(
        msg: '${LocaleKeys.failedToPickImage.tr()} $e',
        state: ToastStates.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
      builder: (context, state) {
        final isUploading = state is Loading;

        return Stack(
          alignment: Alignment.center,
          children: [
            // Circle Image
            Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.white,
                  width: 4,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipOval(
                child: _selectedImage != null
                    ? Image.file(
                  _selectedImage!,
                  fit: BoxFit.cover,
                )
                    : widget.initialImageUrl != null &&
                    widget.initialImageUrl!.isNotEmpty
                    ? Image.network(
                  widget.initialImageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildPlaceholder();
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return _buildPlaceholder();
                  },
                )
                    : _buildPlaceholder(),
              ),
            ),

            // Camera Icon Button
            Positioned(
              bottom: 0,
              left: widget.size * 0.05,
              child: GestureDetector(
                onTap: isUploading ? null : _pickImage,
                child: Container(
                  width: widget.size * 0.25,
                  height: widget.size * 0.25,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white,
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: isUploading
                      ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.white,
                      ),
                    ),
                  )
                      : Icon(
                    Icons.camera_alt,
                    color: AppColors.white,
                    size: widget.size * 0.12,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[300],
      child: Icon(
        Icons.person,
        size: widget.size * 0.5,
        color: Colors.grey[600],
      ),
    );
  }
}