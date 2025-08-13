import 'package:flutter/material.dart';
import '../../services/user_auth_service.dart';
import '../../theme/app_theme.dart';
import '../../theme/app_components.dart';
import 'register_page.dart';
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
  final _authService = UserAuthService();

  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _rememberPassword = false;
  int _loginMethod = 0; // 0: 密码登录, 1: 验证码登录

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.sunsetGradient,
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: AppTheme.spacingXL),
                    
                    // Logo和标题
                    _buildHeader(),
                    
                    const SizedBox(height: AppTheme.spacingXL),
                    
                    // 登录表单
                    _buildLoginForm(),
                    
                    const SizedBox(height: AppTheme.spacingL),
                    
                    // 登录按钮
                    _buildLoginButton(),
                    
                    const SizedBox(height: AppTheme.spacingM),
                    
                    // 第三方登录
                    _buildSocialLogin(),
                    
                    const SizedBox(height: AppTheme.spacingL),
                    
                    // 底部链接
                    _buildBottomLinks(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        // Logo
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: const Icon(
            Icons.pets,
            size: 40,
            color: Colors.white,
          ),
        ),
        
        const SizedBox(height: AppTheme.spacingM),
        
        // 标题
        const Text(
          '欢迎回到灵宠',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        
        const SizedBox(height: AppTheme.spacingS),
        
        const Text(
          '与你的宠物伙伴一起分享美好时光',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: AppTheme.glassmorphismDecoration,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // 登录方式切换
            _buildLoginMethodToggle(),
            
            const SizedBox(height: AppTheme.spacingL),
            
            // 手机号输入
            _buildPhoneInput(),
            
            const SizedBox(height: AppTheme.spacingM),
            
            // 密码/验证码输入
            _buildPasswordInput(),
            
            const SizedBox(height: AppTheme.spacingM),
            
            // 记住密码
            _buildRememberPassword(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginMethodToggle() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingS),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _loginMethod = 0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppTheme.spacingS,
                ),
                decoration: BoxDecoration(
                  color: _loginMethod == 0
                      ? AppTheme.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
                ),
                child: Text(
                  '密码登录',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _loginMethod == 0 ? Colors.white : AppTheme.textSecondaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _loginMethod = 1),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppTheme.spacingS,
                ),
                decoration: BoxDecoration(
                  color: _loginMethod == 1
                      ? AppTheme.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
                ),
                child: Text(
                  '验证码登录',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _loginMethod == 1 ? Colors.white : AppTheme.textSecondaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneInput() {
    return TextFormField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      decoration: AppTheme.searchInputDecoration.copyWith(
        hintText: '请输入手机号',
        prefixIcon: const Icon(Icons.phone, color: AppTheme.textSecondaryColor),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '请输入手机号';
        }
        if (!RegExp(r'^1[3-9]\d{9}$').hasMatch(value)) {
          return '请输入正确的手机号';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordInput() {
    if (_loginMethod == 0) {
      // 密码登录
      return TextFormField(
        controller: _passwordController,
        obscureText: _obscurePassword,
        decoration: AppTheme.searchInputDecoration.copyWith(
          hintText: '请输入密码',
          prefixIcon: const Icon(Icons.lock, color: AppTheme.textSecondaryColor),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
              color: AppTheme.textSecondaryColor,
            ),
            onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '请输入密码';
          }
          if (value.length < 6) {
            return '密码长度不能少于6位';
          }
          return null;
        },
      );
    } else {
      // 验证码登录
      return Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.number,
              decoration: AppTheme.searchInputDecoration.copyWith(
                hintText: '请输入验证码',
                prefixIcon: const Icon(Icons.security, color: AppTheme.textSecondaryColor),
              ),
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
          const SizedBox(width: AppTheme.spacingM),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _sendVerificationCode,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingM),
              ),
              child: const Text('获取验证码'),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildRememberPassword() {
    return Row(
      children: [
        Checkbox(
          value: _rememberPassword,
          onChanged: (value) => setState(() => _rememberPassword = value ?? false),
          activeColor: AppTheme.primaryColor,
        ),
        const Text(
          '记住密码',
          style: TextStyle(color: AppTheme.textSecondaryColor),
        ),
        const Spacer(),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
          ),
          child: const Text(
            '忘记密码？',
            style: TextStyle(color: AppTheme.primaryColor),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          ),
        ),
        child: _isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : const Text(
                '登录',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  Widget _buildSocialLogin() {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingM),
              child: Text(
                '其他登录方式',
                style: TextStyle(
                  color: AppTheme.textSecondaryColor,
                  fontSize: 14,
                ),
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),
        
        const SizedBox(height: AppTheme.spacingL),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSocialButton(
              icon: Icons.wechat,
              label: '微信',
              color: const Color(0xFF07C160),
              onTap: () => _handleSocialLogin('wechat'),
            ),
            _buildSocialButton(
              icon: Icons.chat,
              label: 'QQ',
              color: const Color(0xFF12B7F5),
              onTap: () => _handleSocialLogin('qq'),
            ),
            _buildSocialButton(
              icon: Icons.share,
              label: '微博',
              color: const Color(0xFFE6162D),
              onTap: () => _handleSocialLogin('weibo'),
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
                  color: color.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            label,
            style: const TextStyle(
              color: AppTheme.textSecondaryColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '还没有账号？',
          style: TextStyle(color: AppTheme.textSecondaryColor),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegisterPage()),
          ),
          child: const Text(
            '立即注册',
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

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
        // 验证码登录（这里简化处理，实际应该验证验证码）
        await _authService.login(
          phone: _phoneController.text.trim(),
          password: _passwordController.text, // 这里应该验证验证码
        );
      }

      // 登录成功，返回主页
      if (mounted) {
        Navigator.of(context).pop(true); // 返回true表示登录成功
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
        nickname: '${platform}用户',
      );

      if (mounted) {
        Navigator.of(context).pop(true);
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

  Future<void> _sendVerificationCode() async {
    if (_phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('请先输入手机号'),
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
}
