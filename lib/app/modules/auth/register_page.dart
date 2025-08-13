import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../../services/user_auth_service.dart';
import '../../theme/app_theme.dart';
import '../../theme/app_components.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nicknameController = TextEditingController();
  final _emailController = TextEditingController();
  final _verificationCodeController = TextEditingController();
  final _authService = UserAuthService();

  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeToTerms = false;
  bool _isCountingDown = false;
  int _countdown = 60;

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
    _confirmPasswordController.dispose();
    _nicknameController.dispose();
    _emailController.dispose();
    _verificationCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('注册账号'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
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
                    const SizedBox(height: AppTheme.spacingL),
                    
                    // 标题
                    _buildHeader(),
                    
                    const SizedBox(height: AppTheme.spacingXL),
                    
                    // 注册表单
                    _buildRegisterForm(),
                    
                    const SizedBox(height: AppTheme.spacingL),
                    
                    // 注册按钮
                    _buildRegisterButton(),
                    
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
          width: 60,
          height: 60,
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
            size: 30,
            color: Colors.white,
          ),
        ),
        
        const SizedBox(height: AppTheme.spacingM),
        
        const Text(
          '加入灵宠大家庭',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        
        const SizedBox(height: AppTheme.spacingS),
        
        const Text(
          '创建账号，开始你的宠物生活之旅',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterForm() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: AppTheme.glassmorphismDecoration,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // 昵称输入
            _buildNicknameInput(),
            
            const SizedBox(height: AppTheme.spacingM),
            
            // 手机号输入
            _buildPhoneInput(),
            
            const SizedBox(height: AppTheme.spacingM),
            
            // 验证码输入
            _buildVerificationCodeInput(),
            
            const SizedBox(height: AppTheme.spacingM),
            
            // 邮箱输入（可选）
            _buildEmailInput(),
            
            const SizedBox(height: AppTheme.spacingM),
            
            // 密码输入
            _buildPasswordInput(),
            
            const SizedBox(height: AppTheme.spacingM),
            
            // 确认密码输入
            _buildConfirmPasswordInput(),
            
            const SizedBox(height: AppTheme.spacingM),
            
            // 用户协议
            _buildTermsAgreement(),
          ],
        ),
      ),
    );
  }

  Widget _buildNicknameInput() {
    return TextFormField(
      controller: _nicknameController,
      decoration: AppTheme.searchInputDecoration.copyWith(
        hintText: '请输入昵称',
        prefixIcon: const Icon(Icons.person, color: AppTheme.textSecondaryColor),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '请输入昵称';
        }
        if (value.length < 2) {
          return '昵称长度不能少于2位';
        }
        if (value.length > 20) {
          return '昵称长度不能超过20位';
        }
        return null;
      },
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

  Widget _buildVerificationCodeInput() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _verificationCodeController,
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
            onPressed: _isCountingDown ? null : _sendVerificationCode,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingM),
            ),
            child: Text(_isCountingDown ? '${_countdown}s' : '获取验证码'),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailInput() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: AppTheme.searchInputDecoration.copyWith(
        hintText: '请输入邮箱（可选）',
        prefixIcon: const Icon(Icons.email, color: AppTheme.textSecondaryColor),
      ),
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return '请输入正确的邮箱格式';
          }
        }
        return null;
      },
    );
  }

  Widget _buildPasswordInput() {
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
        if (value.length > 20) {
          return '密码长度不能超过20位';
        }
        return null;
      },
    );
  }

  Widget _buildConfirmPasswordInput() {
    return TextFormField(
      controller: _confirmPasswordController,
      obscureText: _obscureConfirmPassword,
      decoration: AppTheme.searchInputDecoration.copyWith(
        hintText: '请确认密码',
        prefixIcon: const Icon(Icons.lock_outline, color: AppTheme.textSecondaryColor),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
            color: AppTheme.textSecondaryColor,
          ),
          onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '请确认密码';
        }
        if (value != _passwordController.text) {
          return '两次输入的密码不一致';
        }
        return null;
      },
    );
  }

  Widget _buildTermsAgreement() {
    return Row(
      children: [
        Checkbox(
          value: _agreeToTerms,
          onChanged: (value) => setState(() => _agreeToTerms = value ?? false),
          activeColor: AppTheme.primaryColor,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                color: AppTheme.textSecondaryColor,
                fontSize: 14,
              ),
              children: [
                const TextSpan(text: '我已阅读并同意'),
                TextSpan(
                  text: '《用户协议》',
                  style: const TextStyle(color: AppTheme.primaryColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => _showTermsDialog(),
                ),
                const TextSpan(text: '和'),
                TextSpan(
                  text: '《隐私政策》',
                  style: const TextStyle(color: AppTheme.primaryColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => _showPrivacyDialog(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: (_isLoading || !_agreeToTerms) ? null : _handleRegister,
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
                '注册',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  Widget _buildBottomLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '已有账号？',
          style: TextStyle(color: AppTheme.textSecondaryColor),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            '立即登录',
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('请先同意用户协议和隐私政策'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await _authService.register(
        phone: _phoneController.text.trim(),
        password: _passwordController.text,
        email: _emailController.text.trim().isEmpty ? null : _emailController.text.trim(),
        nickname: _nicknameController.text.trim(),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('注册成功！'),
            backgroundColor: AppTheme.successColor,
          ),
        );
        Navigator.pop(context, true); // 返回true表示注册成功
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
            content: Text('注册失败: $e'),
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
        type: VerificationCodeType.register,
      );

      if (mounted) {
        setState(() {
          _isCountingDown = true;
          _countdown = 60;
        });

        _startCountdown();

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

  void _startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted && _isCountingDown) {
        setState(() {
          _countdown--;
          if (_countdown <= 0) {
            _isCountingDown = false;
          }
        });
        if (_countdown > 0) {
          _startCountdown();
        }
      }
    });
  }

  void _showTermsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('用户协议'),
        content: const SingleChildScrollView(
          child: Text(
            '这里是用户协议的内容...\n\n'
            '1. 用户应遵守相关法律法规\n'
            '2. 用户应保护好自己的账号安全\n'
            '3. 用户不得发布违法违规内容\n'
            '4. 平台有权对违规用户进行处理\n'
            '5. 本协议最终解释权归平台所有',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('我知道了'),
          ),
        ],
      ),
    );
  }

  void _showPrivacyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('隐私政策'),
        content: const SingleChildScrollView(
          child: Text(
            '这里是隐私政策的内容...\n\n'
            '1. 我们收集的信息类型\n'
            '2. 信息的使用方式\n'
            '3. 信息的保护措施\n'
            '4. 信息的共享政策\n'
            '5. 用户的权利和义务',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('我知道了'),
          ),
        ],
      ),
    );
  }
}


