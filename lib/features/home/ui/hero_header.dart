import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nabd/core/router/app_router.dart';
import 'package:nabd/features/auth/ui/auth.dart';

import 'app_theme.dart';

class HeroHeader extends StatelessWidget {
  const HeroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 60, 16, 0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF0A1A2A),
            Color(0xFF0F2A3A),
            Color(0xFF1A3A4A),
          ],
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.12),
                      borderRadius: AppRadius.chip,
                      border: Border.all(
                          color: Colors.white.withOpacity(0.25), width: 1),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.account_circle_outlined,
                            color: Colors.white, size: 16),
                        SizedBox(width: 6),
                        Text(
                          'مدير الاستثمار',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
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
                      const SizedBox(width: 8),
                      _ActionBtn(
                          icon: Icons.file_download_outlined, onTap: () {}),
                      const SizedBox(width: 8),
                      _ActionBtn(
                          icon: Icons.logout,
                          onTap: () {
                            AuthService.logout();
                            context.router.replaceAll([
                              LoginRoute()
                            ], updateExistingRoutes: false);
                          },
                          color: const Color(0xFFC0392B)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.white, Color(0xFFE0E8FF)],
                ).createShader(bounds),
                child: const Text(
                  '📈 منصة نبض',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'لوحة الأداء الاستثماري',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '🤖 15 سؤالاً جاهزاً | 5 مخططات تحليلية | استراتيجيات التخارج',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.55),
                  fontSize: 11,
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
        padding: const EdgeInsets.all(7),
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
