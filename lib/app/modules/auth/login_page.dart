import 'package:flutter/material.dart';
import 'dart:async';
import '../../core/components/index.dart';
import '../../services/user_auth_service.dart';
import '../../theme/app_theme.dart';
import '../../routes/navigation_controller.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _verificationCodeController = TextEditingController();
  final _authService = UserAuthService();

  // 统一使用 AppTheme 的色板与渐变

  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _rememberPassword = false;
  int _loginMethod = 1; // 默认使用验证码一键登录/注册
  bool _isFormValid = false; // 表单实时校验
  int _codeCountdown = 0; // 验证码倒计时（秒）
  Timer? _codeTimer;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  Animation<double>? _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // 初始化动画控制器
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // 立即初始化所有动画
    _initializeAnimations();

    // 立即启动动画
    _animationController.forward();

    // 监听字段变化：实时更新按钮可用状态
    _phoneController.addListener(_onFieldsChanged);
    _passwordController.addListener(_onFieldsChanged);
    _verificationCodeController.addListener(_onFieldsChanged);
    _isFormValid = _computeFormValid();
  }

  void _initializeAnimations() {
    // 初始化所有动画，使用默认值作为后备
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _codeTimer?.cancel();
    _animationController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _verificationCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.getAuthBackgroundGradient(context),
        ),
        child: SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => FocusScope.of(context).unfocus(),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    padding: const EdgeInsets.all(AppTheme.spacingM),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 480),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: AppTheme.spacingL),

                              // Logo和标题
                              _buildHeader(),

                              const SizedBox(height: AppTheme.spacingM),

                              // 登录方式切换 + 表单
                              _buildLoginForm(),

                              const SizedBox(height: AppTheme.spacingS),

                              // 登录按钮
                              _buildLoginButton(),

                              const SizedBox(height: AppTheme.spacingS),

                              // 第三方登录
                              _buildSocialLogin(),

                              const SizedBox(height: AppTheme.spacingL),
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
        ),
      ),
    );
  }

  Widget _buildHeader() {
    // 安全检查：确保动画已初始化
    if (!_animationController.isAnimating &&
        !_animationController.isCompleted) {
      return KeyedSubtree(
        key: const ValueKey('password'),
        child: Column(
          children: [
            // Logo
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(
                  AppTheme.borderRadiusXLarge,
                ),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.3),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const Icon(Icons.pets, size: 50, color: Colors.white),
            ),

            const SizedBox(height: AppTheme.spacingL),

            // 标题
            const Text(
              '欢迎回到灵宠',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: AppTheme.spacingS),

            const Text(
              '与你的宠物伙伴一起分享美好时光',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      );
    }

    return ScaleTransition(
      scale: _scaleAnimation ?? const AlwaysStoppedAnimation(1.0),
      child: Column(
        children: [
          // Logo
          AuthComponents.modernLogo(icon: Icons.pets, size: 56, iconSize: 28),

          const SizedBox(height: AppTheme.spacingM),

          // 标题
          AuthComponents.modernTitle(text: '欢迎回到灵宠', fontSize: 24),

          const SizedBox(height: AppTheme.spacingXS),

          AuthComponents.modernSubtitle(text: '与你的宠物伙伴一起分享美好时光', fontSize: 13),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingL,
        vertical: AppTheme.spacingM,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusXLarge),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // 登录方式切换（密码 / 验证码）
            _buildLoginMethodToggle(),

            const SizedBox(height: AppTheme.spacingM),

            // 手机号输入
            _buildPhoneInput(),

            const SizedBox(height: AppTheme.spacingS),

            // 密码/验证码输入（带切换动画）
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.easeOutCubic,
              switchOutCurve: Curves.easeInCubic,
              child: _buildPasswordInput(),
            ),

            const SizedBox(height: AppTheme.spacingS),
            const SizedBox(height: AppTheme.spacingS),

            // 记住密码
            _buildRememberPassword(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginMethodToggle() {
    return ToggleButtons(
      isSelected: [_loginMethod == 0, _loginMethod == 1],
      onPressed: (index) => _onToggleLoginMethod(index),
      borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
      selectedColor: Colors.white,
      color: Colors.white.withValues(alpha: 0.9),
      fillColor: AppTheme.accentColor.withValues(alpha: 0.22),
      borderColor: Colors.white.withValues(alpha: 0.28),
      selectedBorderColor: Colors.white.withValues(alpha: 0.5),
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppTheme.spacingS,
            horizontal: AppTheme.spacingM,
          ),
          child: Text('密码登录'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppTheme.spacingS,
            horizontal: AppTheme.spacingM,
          ),
          child: Text('验证码登录'),
        ),
      ],
    );
  }

  Widget _buildPhoneInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '手机号',
          style: TextStyle(
            color: AppTheme.textSecondaryColor,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppTheme.spacingXS),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.15),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              filled: false,
              hintText: '请输入手机号码',
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Container(
                margin: const EdgeInsets.only(right: AppTheme.spacingS),
                child: Icon(Icons.phone_rounded, color: Colors.white, size: 22),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingL,
                vertical: AppTheme.spacingM,
              ),
            ),
            cursorColor: Colors.white,
            onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '请输入手机号码';
              }
              if (!RegExp(r'^1[3-9]\d{9}$').hasMatch(value)) {
                return '请输入正确的手机号码格式';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordInput() {
    if (_loginMethod == 0) {
      // 密码登录
      return KeyedSubtree(
        key: const ValueKey('password'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '密码',
              style: TextStyle(
                color: AppTheme.textSecondaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppTheme.spacingXS),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.15),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                textInputAction: TextInputAction.done,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  filled: false,
                  hintText: '请输入登录密码',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Container(
                    margin: const EdgeInsets.only(right: AppTheme.spacingS),
                    child: Icon(
                      Icons.lock_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  suffixIcon: Container(
                    margin: const EdgeInsets.only(right: AppTheme.spacingS),
                    child: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                      onPressed: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacingL,
                    vertical: AppTheme.spacingM,
                  ),
                ),
                cursorColor: Colors.white,
                onFieldSubmitted: (_) {
                  if (!_isLoading &&
                      _formKey.currentState?.validate() == true) {
                    _handleLogin();
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入登录密码';
                  }
                  if (value.length < 6) {
                    return '密码长度不能少于6位';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      );
    } else {
      // 验证码登录
      return KeyedSubtree(
        key: const ValueKey('code'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '验证码',
              style: TextStyle(
                color: AppTheme.textSecondaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppTheme.spacingXS),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(
                        AppTheme.borderRadiusLarge,
                      ),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.15),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: _verificationCodeController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        filled: false,
                        hintText: '请输入验证码',
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: Container(
                          margin: const EdgeInsets.only(
                            right: AppTheme.spacingS,
                          ),
                          child: Icon(
                            Icons.verified_user_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                        suffixIcon: Container(
                          margin: const EdgeInsets.only(
                            right: AppTheme.spacingS,
                          ),
                          child: const SizedBox.shrink(),
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppTheme.spacingL,
                          vertical: AppTheme.spacingM,
                        ),
                      ),
                      cursorColor: Colors.white,
                      onFieldSubmitted: (_) {
                        if (!_isLoading &&
                            _formKey.currentState?.validate() == true) {
                          _handleLogin();
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请输入验证码';
                        }
                        if (value.length != 6) {
                          return '验证码为6位数字';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(width: AppTheme.spacingM),
                SizedBox(
                  width: 120,
                  height: 44,
                  child: OutlinedButton(
                    onPressed:
                        (_isLoading || _codeCountdown > 0 || !_isPhoneValid)
                        ? null
                        : _sendVerificationCode,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(
                        color: Colors.white.withValues(alpha: 0.9),
                        width: 1.2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppTheme.borderRadiusMedium,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: AppTheme.spacingM,
                      ),
                    ),
                    child: Text(
                      _codeCountdown > 0 ? '${_codeCountdown}s后重试' : '获取验证码',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }

  Widget _buildRememberPassword() {
    return Row(
      children: [
        // 记住密码选项 - 更大更易点击
        GestureDetector(
          onTap: () => setState(() => _rememberPassword = !_rememberPassword),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                curve: Curves.easeInOut,
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusSmall,
                  ),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.8),
                    width: 1.6,
                  ),
                ),
                child: _rememberPassword
                    ? const Icon(Icons.check, color: Colors.white, size: 14)
                    : null,
              ),
              const SizedBox(width: AppTheme.spacingS),
              const Text(
                '记住密码',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        // 忘记密码按钮 - 简洁文本链接
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
          ),
          child: const Text(
            '忘记密码？',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        gradient: AppTheme.oceanGradient,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        boxShadow: [
          BoxShadow(
            color: AppTheme.secondaryColor.withValues(alpha: 0.35),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: (_isLoading || !_isFormValid) ? null : _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          ),
        ),
        child: _isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : const Text(
                '登录',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
      ),
    );
  }

  // 已将游客登录移至第三方登录区域

  Widget _buildSocialLogin() {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingM,
              ),
              child: Text(
                '其他登录方式',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 14,
                ),
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),

        const SizedBox(height: AppTheme.spacingL),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildSocialButton(
              icon: Icons.wechat,
              label: '微信登录',
              color: const Color(0xFF07C160),
              onTap: () => _handleSocialLogin('wechat'),
            ),
            _buildSocialButton(
              icon: Icons.phone_android,
              label: '手机登录',
              color: AppTheme.accentColor,
              onTap: () => setState(() => _loginMethod = 1),
            ),
            _buildSocialButton(
              icon: Icons.person_outline,
              label: '游客登录',
              color: AppTheme.secondaryColor,
              onTap: _isLoading ? () {} : _handleGuestLogin,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // 已移除注册入口

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      if (_loginMethod == 0) {
        // 密码登录
        await _authService.login(
          phone: _phoneController.text.trim(),
          password: _passwordController.text,
        );
      } else {
        // 验证码一键登录/注册
        await _authService.loginOrRegisterWithVerificationCode(
          phone: _phoneController.text.trim(),
          verificationCode: _verificationCodeController.text,
        );
      }

      // 登录成功，跳转到主页面
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const NavigationController()),
        );
      }
    } on AuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('登录失败: $e'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _handleSocialLogin(String platform) async {
    setState(() => _isLoading = true);

    try {
      // 模拟第三方登录
      await _authService.socialLogin(
        platform: platform,
        token: 'mock_token_${DateTime.now().millisecondsSinceEpoch}',
        username: '${platform}用户',
      );

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const NavigationController()),
        );
      }
    } on AuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('登录失败: $e'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _handleGuestLogin() async {
    setState(() => _isLoading = true);

    try {
      await _authService.guestLogin();

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const NavigationController()),
        );
      }
    } on AuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('游客模式登录失败: $e'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _sendVerificationCode() async {
    if (_phoneController.text.isEmpty || !_isPhoneValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('请先输入有效的手机号'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
      return;
    }

    try {
      await _authService.sendVerificationCode(
        phone: _phoneController.text.trim(),
        type: VerificationCodeType.login,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('验证码已发送'),
            backgroundColor: AppTheme.successColor,
          ),
        );
        setState(() {
          _codeCountdown = 60;
        });
        _codeTimer?.cancel();
        _codeTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
          if (!mounted) {
            timer.cancel();
            return;
          }
          setState(() {
            if (_codeCountdown > 0) {
              _codeCountdown--;
            }
            if (_codeCountdown == 0) {
              timer.cancel();
            }
          });
        });
      }
    } on AuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    }
  }

  // 切换登录方式时同步校验
  void _onToggleLoginMethod(int method) {
    setState(() {
      _loginMethod = method;
      _isFormValid = _computeFormValid();
    });
  }

  // 输入变化时实时计算表单是否可提交
  void _onFieldsChanged() {
    final next = _computeFormValid();
    if (next != _isFormValid) {
      setState(() => _isFormValid = next);
    }
  }

  bool get _isPhoneValid {
    return RegExp(r'^1[3-9]\d{9}$').hasMatch(_phoneController.text.trim());
  }

  bool _computeFormValid() {
    final phoneOk = _isPhoneValid;
    if (_loginMethod == 0) {
      return phoneOk && _passwordController.text.length >= 6;
    } else {
      return phoneOk && _verificationCodeController.text.length == 6;
    }
  }
}
