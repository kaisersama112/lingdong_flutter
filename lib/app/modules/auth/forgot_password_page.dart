import 'package:flutter/material.dart';
import '../../services/user_auth_service.dart';
import '../../theme/app_theme.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _verificationCodeController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authService = UserAuthService();

  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isCountingDown = false;
  int _countdown = 60;
  int _currentStep = 0; // 0: 输入手机号, 1: 输入验证码, 2: 设置新密码

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

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _phoneController.dispose();
    _verificationCodeController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.getAuthBackgroundGradient(context),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  padding: const EdgeInsets.all(AppTheme.spacingL),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: AppTheme.spacingL),

                        // 标题
                        _buildHeader(),

                        const SizedBox(height: AppTheme.spacingL),

                        // 步骤指示器
                        _buildStepIndicator(),

                        const SizedBox(height: AppTheme.spacingM),

                        // 表单内容
                        _buildFormContent(),

                        const SizedBox(height: AppTheme.spacingM),

                        // 操作按钮
                        _buildActionButton(),
                      ],
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
    return Column(
      children: [
        // 图标
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
          ),
          child: const Icon(Icons.lock_reset, size: 24, color: Colors.white),
        ),

        const SizedBox(height: AppTheme.spacingS),

        const Text(
          '重置密码',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: AppTheme.spacingXS),

        Text(
          _getStepDescription(),
          style: const TextStyle(fontSize: 13, color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildStepIndicator() {
    return Row(
      children: [
        _buildStepItem(0, '手机号'),
        _buildStepLine(),
        _buildStepItem(1, '验证码'),
        _buildStepLine(),
        _buildStepItem(2, '新密码'),
      ],
    );
  }

  Widget _buildStepItem(int step, String label) {
    final isActive = _currentStep >= step;
    final isCurrent = _currentStep == step;

    return Expanded(
      child: Column(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: isActive
                  ? const Color(0xFF34D399)
                  : Colors.white.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(16),
              border: isCurrent
                  ? Border.all(color: Colors.white, width: 1.5)
                  : null,
            ),
            child: Icon(
              isActive ? Icons.check : Icons.circle,
              color: Colors.white,
              size: 14,
            ),
          ),
          const SizedBox(height: AppTheme.spacingXS),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.white70,
              fontSize: 11,
              fontWeight: isCurrent ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepLine() {
    return Container(
      height: 2,
      color: _currentStep > 0
          ? const Color(0xFF34D399)
          : Colors.white.withValues(alpha: 0.3),
    );
  }

  Widget _buildFormContent() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
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
            if (_currentStep == 0) ...[
              _buildPhoneInput(),
            ] else if (_currentStep == 1) ...[
              _buildVerificationCodeInput(),
            ] else if (_currentStep == 2) ...[
              _buildNewPasswordInput(),
              const SizedBox(height: AppTheme.spacingS),
              _buildConfirmPasswordInput(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneInput() {
    return TextFormField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      cursorColor: Colors.white,
      decoration: AppTheme.searchInputDecoration.copyWith(
        filled: false,
        hintText: '请输入手机号',
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        prefixIcon: const Icon(Icons.phone, color: Colors.white),
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
    return Column(
      children: [
        Text(
          '验证码已发送至 ${_phoneController.text}',
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
        const SizedBox(height: AppTheme.spacingS),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _verificationCodeController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                cursorColor: Colors.white,
                decoration: AppTheme.searchInputDecoration.copyWith(
                  filled: false,
                  hintText: '请输入验证码',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                  prefixIcon: const Icon(Icons.security, color: Colors.white),
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
            const SizedBox(width: AppTheme.spacingS),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: _isCountingDown ? null : _sendVerificationCode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0EA5E9),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppTheme.spacingS,
                  ),
                ),
                child: Text(
                  _isCountingDown ? '${_countdown}s' : '重新发送',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNewPasswordInput() {
    return TextFormField(
      controller: _newPasswordController,
      obscureText: _obscurePassword,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      cursorColor: Colors.white,
      decoration: AppTheme.searchInputDecoration.copyWith(
        filled: false,
        hintText: '请输入新密码',
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        prefixIcon: const Icon(Icons.lock, color: Colors.white),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '请输入新密码';
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
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      cursorColor: Colors.white,
      decoration: AppTheme.searchInputDecoration.copyWith(
        filled: false,
        hintText: '请确认新密码',
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        prefixIcon: const Icon(Icons.lock_outline, color: Colors.white),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
          onPressed: () => setState(
            () => _obscureConfirmPassword = !_obscureConfirmPassword,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '请确认新密码';
        }
        if (value != _newPasswordController.text) {
          return '两次输入的密码不一致';
        }
        return null;
      },
    );
  }

  Widget _buildActionButton() {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        gradient: AppTheme.oceanGradient,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        boxShadow: [
          BoxShadow(
            color: AppTheme.secondaryColor.withValues(alpha: 0.35),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleAction,
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
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                _getActionButtonText(),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
      ),
    );
  }

  String _getStepDescription() {
    switch (_currentStep) {
      case 0:
        return '请输入您的手机号，我们将发送验证码';
      case 1:
        return '请输入收到的验证码';
      case 2:
        return '请设置您的新密码';
      default:
        return '';
    }
  }

  String _getActionButtonText() {
    switch (_currentStep) {
      case 0:
        return '下一步';
      case 1:
        return '下一步';
      case 2:
        return '重置密码';
      default:
        return '';
    }
  }

  Future<void> _handleAction() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      switch (_currentStep) {
        case 0:
          await _sendVerificationCode();
          setState(() => _currentStep = 1);
          break;
        case 1:
          // 验证验证码（这里简化处理）
          setState(() => _currentStep = 2);
          break;
        case 2:
          await _resetPassword();
          break;
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
            content: Text('操作失败: $e'),
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
    await _authService.sendVerificationCode(
      phone: _phoneController.text.trim(),
      type: VerificationCodeType.resetPassword,
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
  }

  Future<void> _resetPassword() async {
    await _authService.resetPassword(
      phone: _phoneController.text.trim(),
      newPassword: _newPasswordController.text,
      verificationCode: _verificationCodeController.text,
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('密码重置成功！'),
          backgroundColor: AppTheme.successColor,
        ),
      );
      Navigator.pop(context, true);
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
