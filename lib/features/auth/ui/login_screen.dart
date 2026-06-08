import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:nabd/core/router/app_router.dart';
import 'package:nabd/features/auth/ui/auth.dart';
import 'package:nabd/features/home/ui/app_theme.dart';
import 'package:nabd/main_common.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool _rememberMe = false;
  bool _isLoading = false;
  String? _errorMessage;

  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(begin: const Offset(0, 0.15), end: Offset.zero)
        .animate(CurvedAnimation(parent: _animController, curve: Curves.easeOut));
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    setState(() => _errorMessage = null);
    FocusScope.of(context).unfocus();

    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      setState(() => _errorMessage = 'الرجاء إدخال اسم المستخدم وكلمة المرور');
      return;
    }

    setState(() => _isLoading = true);

    // Simulate brief network delay for UX
    await Future.delayed(const Duration(milliseconds: 600));

    final user = AuthService.login(username, password);

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (user != null) {
      getIt<AppRouter>().replaceAll([
        HomeBottomTabsRoute()
      ], updateExistingRoutes: false);
    } else {
      setState(() {
        _errorMessage = '❌ اسم المستخدم أو كلمة المرور غير صحيحة';
      });
    }
  }

  void _fillDemo(String username, String password) {
    _usernameController.text = username;
    _passwordController.text = password;
    setState(() => _errorMessage = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0B1120), Color(0xFF111827)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: FadeTransition(
                opacity: _fadeAnim,
                child: SlideTransition(
                  position: _slideAnim,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 420),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.98),
                      borderRadius: const BorderRadius.all(Radius.circular(32)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.45),
                          blurRadius: 50,
                          offset: const Offset(0, 25),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(32),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Logo
                          _buildLogo(),
                          const SizedBox(height: 28),

                          // Error banner
                          if (_errorMessage != null) ...[
                            _buildError(),
                            const SizedBox(height: 16),
                          ],

                          // Username
                          _buildLabel('اسم المستخدم', Icons.person_outline),
                          const SizedBox(height: 8),
                          _buildTextField(
                            controller: _usernameController,
                            hint: 'أدخل اسم المستخدم',
                            icon: Icons.person_outline,
                            textDirection: TextDirection.rtl,
                          ),
                          const SizedBox(height: 18),

                          // Password
                          _buildLabel('كلمة المرور', Icons.lock_outline),
                          const SizedBox(height: 8),
                          _buildPasswordField(),
                          const SizedBox(height: 16),

                          // Remember me + Forgot
                          _buildCheckboxRow(),
                          const SizedBox(height: 22),

                          // Login button
                          _buildLoginButton(),
                          const SizedBox(height: 24),

                          // Divider
                          const Divider(color: Color(0xFFE2E8F0)),
                          const SizedBox(height: 16),

                          // Demo users
                          _buildDemoSection(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF1E40AF), Color(0xFF0F172A)],
          ).createShader(bounds),
          child: const Icon(
            Icons.show_chart,
            size: 56,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'منصة نبض',
          textDirection: TextDirection.rtl,
          style: AppTextStyles.heading.copyWith(
            fontSize: 24,
            color: const Color(0xFF0B1120),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'لوحة الأداء الاستثماري',
          textDirection: TextDirection.rtl,
          style: AppTextStyles.label.copyWith(fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildError() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFEE2E2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFCA5A5)),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          const Icon(Icons.error_outline, color: Color(0xFF991B1B), size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _errorMessage!,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                color: Color(0xFF991B1B),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text, IconData icon) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Icon(icon, size: 15, color: AppColors.textMuted),
        const SizedBox(width: 6),
        Text(
          text,
          textDirection: TextDirection.rtl,
          style: AppTextStyles.body.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextDirection textDirection = TextDirection.ltr,
  }) {
    return TextField(
      controller: controller,
      textDirection: TextDirection.rtl,
      textInputAction: TextInputAction.next,
      onSubmitted: (_) => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        hintText: hint,
        hintTextDirection: TextDirection.rtl,
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF1E40AF), width: 2),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      textDirection: TextDirection.rtl,
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => _handleLogin(),
      decoration: InputDecoration(
        hintText: 'أدخل كلمة المرور',
        hintTextDirection: TextDirection.rtl,
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: AppColors.textMuted,
            size: 20,
          ),
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF1E40AF), width: 2),
        ),
      ),
    );
  }

  Widget _buildCheckboxRow() {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          textDirection: TextDirection.rtl,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                value: _rememberMe,
                onChanged: (v) => setState(() => _rememberMe = v ?? false),
                activeColor: const Color(0xFF1E40AF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'تذكرني',
              style: AppTextStyles.body.copyWith(fontSize: 13),
            ),
          ],
        ),
        TextButton(
          onPressed: () => _showForgotDialog(),
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: const Text(
            'نسيت كلمة المرور؟',
            style: TextStyle(
              color: Color(0xFF1E40AF),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 52,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleLogin,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF1E40AF), Color(0xFF0F172A)],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: _isLoading
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.5,
                    ),
                  )
                : const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.login, color: Colors.white, size: 18),
                      SizedBox(width: 8),
                      Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildDemoSection() {
    final demos = [
      {'username': 'admin', 'password': 'admin123', 'label': '👑 مدير النظام'},
      {'username': 'user', 'password': 'user123', 'label': '👤 مستخدم عادي'},
      {'username': 'viewer', 'password': 'view123', 'label': '👁️ مشاهد فقط'},
    ];

    return Column(
      children: [
        Text(
          'حسابات تجريبية',
          style: AppTextStyles.label.copyWith(fontSize: 13),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: demos.map((d) {
            return GestureDetector(
              onTap: () => _fillDemo(d['username']!, d['password']!),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFCBD5E1)),
                ),
                child: Text(
                  d['label']!,
                  style: const TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        Text(
          'للاختبار: admin / admin123',
          style: AppTextStyles.label.copyWith(fontSize: 11),
        ),
      ],
    );
  }

  void _showForgotDialog() {
    showDialog(
      context: context,
      builder: (_) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('نسيت كلمة المرور؟'),
          content: const Text('للحصول على مساعدة، تواصل مع مدير النظام.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('حسناً',
                  style: TextStyle(color: Color(0xFF1E40AF))),
            ),
          ],
        ),
      ),
    );
  }
}
