import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabd/core/router/app_router.dart';
import 'package:nabd/core/utils/constants/app_colors.dart';
import 'package:nabd/core/utils/constants/app_text_them.dart';
import 'package:nabd/core/utils/extensions/padding_extensions.dart';
import 'package:nabd/features/auth/ui/auth.dart';

import 'app_theme.dart';

class HeroHeader extends StatelessWidget {
  const HeroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 60.padTop+16.padHorizontal,
      padding: 20.padAll,
      decoration: BoxDecoration(
        gradient:  LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors:AppColors.heroHeader
        ),
        borderRadius: AppRadius.card,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 35,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Grid overlay
          Positioned.fill(
            child: ClipRRect(
              borderRadius: AppRadius.card,
              child: CustomPaint(painter: _GridPainter()),
            ),
          ),
          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // User info chip
                  Container(
                    padding:12.padHorizontal+7.padVertical,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.12),
                      borderRadius: AppRadius.chip,
                      border: Border.all(
                          color: Colors.white.withOpacity(0.25), width: 1),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children:  [
                        Icon(Icons.account_circle_outlined,
                            color: Colors.white, size: 16),
                        6.horizontalSpace,
                        Text(
                          'مدير الاستثمار',
                          style: AppTextTheme.bodyXSmall(context).copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Action buttons
                  Row(
                    children: [
                      _ActionBtn(
                          icon: Icons.print_outlined, onTap: () {}),
                      8.horizontalSpace,
                      _ActionBtn(
                          icon: Icons.file_download_outlined, onTap: () {}),
                      8.horizontalSpace,
                      _ActionBtn(
                          icon: Icons.logout,
                          onTap: () {
                            AuthService.logout();
                            context.router.replaceAll([
                              LoginRoute()
                            ], updateExistingRoutes: false);
                          },
                          color: AppColors.heroHeaderAction),
                    ],
                  ),
                ],
              ),
              16.verticalSpace,
              ShaderMask(
                shaderCallback: (bounds) =>  LinearGradient(
                  colors: [Colors.white,AppColors.heroHeaderLinear],
                ).createShader(bounds),
                child:  Text(
                  '📈 منصة نبض',
                  textDirection: TextDirection.rtl,
                  style: AppTextTheme.headingMedium(context).copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              4.verticalSpace,
              Text(
                'لوحة الأداء الاستثماري',
                textDirection: TextDirection.rtl,
                style:AppTextTheme.bodyXSmall(context).copyWith(
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Text(
                '🤖 15 سؤالاً جاهزاً | 5 مخططات تحليلية | استراتيجيات التخارج',
                textDirection: TextDirection.rtl,
                style:AppTextTheme.bodyXSmall(context).copyWith(
                  color: Colors.white.withOpacity(0.55),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;

  const _ActionBtn({required this.icon, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: 7.padAll,
        decoration: BoxDecoration(
          color: color ?? Colors.white.withOpacity(0.12),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.03)
      ..strokeWidth = 1;
    for (double x = 0; x < size.width; x += 30) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += 30) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_) => false;
}
