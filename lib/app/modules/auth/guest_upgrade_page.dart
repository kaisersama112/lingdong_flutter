import 'package:flutter/material.dart';
import '../../services/user_auth_service.dart';
import '../../theme/app_theme.dart';
import '../../routes/navigation_controller.dart';

class GuestUpgradePage extends StatefulWidget {
  const GuestUpgradePage({super.key});

  @override
  State<GuestUpgradePage> createState() => _GuestUpgradePageState();
}

class _GuestUpgradePageState extends State<GuestUpgradePage> {
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

  @override
  void initState() {
    super.initState();
    // 预填充当前游客的昵称
    if (_authService.currentUser != null) {
      _nicknameController.text = _authService.currentUser!.nickname;
    }
  }

  @override
  void dispose() {
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
        title: const Text('升级为正式账号'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.primaryGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppTheme.spacingL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 游客升级说明
                _buildUpgradeInfo(),
                
                const SizedBox(height: AppTheme.spacingXL),
                
                // 升级表单
                _buildUpgradeForm(),
                
                const SizedBox(height: AppTheme.spacingL),
                
                // 升级按钮
                _buildUpgradeButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUpgradeInfo() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha:0.2),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        border: Border.all(
          color: Colors.orange.withValues(alpha:0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.star,
            color: Colors.orange,
            size: 40,
          ),
          const SizedBox(height: AppTheme.spacingM),
          const Text(
            '升级为正式账号',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: AppTheme.spacingS),
          const Text(
            '升级后您将获得完整功能，数据永久保存',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpgradeForm() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha:0.15),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
        border: Border.all(
          color: Colors.white.withValues(alpha:0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        border: Border.all(
          color: Colors.white.withValues(alpha:0.2),
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: _nicknameController,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: '请输入昵称',
          hintStyle: TextStyle(
            color: Colors.white.withValues(alpha:0.4),
            fontSize: 16,
          ),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.white.withValues(alpha:0.8),
            size: 20,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingM,
          ),
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
      ),
    );
  }

  Widget _buildPhoneInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha:0.1),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        border: Border.all(
          color: Colors.white.withValues(alpha:0.2),
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: _phoneController,
        keyboardType: TextInputType.phone,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: '请输入手机号',
          hintStyle: TextStyle(
            color: Colors.white.withValues(alpha:0.4),
            fontSize: 16,
          ),
          prefixIcon: Icon(
            Icons.phone,
            color: Colors.white.withValues(alpha:0.8),
            size: 20,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingM,
          ),
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
      ),
    );
  }

  Widget _buildVerificationCodeInput() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha:0.1),
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
              border: Border.all(
                color: Colors.white.withValues(alpha:0.2),
                width: 1,
              ),
            ),
            child: TextFormField(
              controller: _verificationCodeController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintText: '请输入验证码',
                hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha:0.4),
                  fontSize: 16,
                ),
                prefixIcon: Icon(
                  Icons.security,
                  color: Colors.white.withValues(alpha:0.8),
                  size: 20,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingM,
                  vertical: AppTheme.spacingM,
                ),
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
        ),
        const SizedBox(width: AppTheme.spacingM),
        Container(
          width: 120,
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.primaryColor,
                AppTheme.primaryColor.withValues(alpha:0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryColor.withValues(alpha:0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: _isCountingDown ? null : _sendVerificationCode,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
              ),
            ),
            child: Text(
              _isCountingDown ? '${_countdown}s' : '获取验证码',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha:0.1),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        border: Border.all(
          color: Colors.white.withValues(alpha:0.2),
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: '请输入邮箱（可选）',
          hintStyle: TextStyle(
            color: Colors.white.withValues(alpha:0.4),
            fontSize: 16,
          ),
          prefixIcon: Icon(
            Icons.email,
            color: Colors.white.withValues(alpha:0.8),
            size: 20,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingM,
          ),
        ),
        validator: (value) {
          if (value != null && value.isNotEmpty) {
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return '请输入正确的邮箱格式';
            }
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha:0.1),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        border: Border.all(
          color: Colors.white.withValues(alpha:0.2),
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: _passwordController,
        obscureText: _obscurePassword,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: '请输入密码',
          hintStyle: TextStyle(
            color: Colors.white.withValues(alpha:0.4),
            fontSize: 16,
          ),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.white.withValues(alpha:0.8),
            size: 20,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.white.withValues(alpha:0.8),
              size: 20,
            ),
            onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingM,
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
      ),
    );
  }

  Widget _buildConfirmPasswordInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha:0.1),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        border: Border.all(
          color: Colors.white.withValues(alpha:0.2),
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: _confirmPasswordController,
        obscureText: _obscureConfirmPassword,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: '请确认密码',
          hintStyle: TextStyle(
            color: Colors.white.withValues(alpha:0.4),
            fontSize: 16,
          ),
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Colors.white.withValues(alpha:0.8),
            size: 20,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.white.withValues(alpha:0.8),
              size: 20,
            ),
            onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingM,
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
      ),
    );
  }

  Widget _buildTermsAgreement() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha:0.1),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        border: Border.all(
          color: Colors.white.withValues(alpha:0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha:0.1),
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
            ),
            child: Checkbox(
              value: _agreeToTerms,
              onChanged: (value) => setState(() => _agreeToTerms = value ?? false),
              activeColor: AppTheme.primaryColor,
              checkColor: Colors.white,
              side: BorderSide(
                color: Colors.white.withValues(alpha:0.3),
                width: 1,
              ),
            ),
          ),
          const SizedBox(width: AppTheme.spacingS),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.white.withValues(alpha:0.8),
                  fontSize: 14,
                ),
                children: [
                  const TextSpan(text: '我已阅读并同意'),
                  TextSpan(
                    text: '《用户协议》',
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(text: '和'),
                  TextSpan(
                    text: '《隐私政策》',
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpgradeButton() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.primaryColor,
            AppTheme.primaryColor.withValues(alpha:0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withValues(alpha:0.4),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: (_isLoading || !_agreeToTerms) ? null : _handleUpgrade,
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
                '立即升级',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
      ),
    );
  }

  Future<void> _handleUpgrade() async {
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
      await _authService.upgradeGuestToUser(
        phone: _phoneController.text.trim(),
        password: _passwordController.text,
        email: _emailController.text.trim().isEmpty ? null : _emailController.text.trim(),
        nickname: _nicknameController.text.trim(),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('升级成功！'),
            backgroundColor: AppTheme.successColor,
          ),
        );
        // 升级成功后跳转到主页面
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const NavigationController(),
          ),
          (route) => false,
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
            content: Text('升级失败: $e'),
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
}
