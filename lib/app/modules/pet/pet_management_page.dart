import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../core/models.dart' as models;
import '../../core/error_handler.dart';
import '../../services/pet_service.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class PetManagementPage extends StatefulWidget {
  final models.Pet? pet; // 如果是编辑模式，传入宠物信息

  const PetManagementPage({super.key, this.pet});

  @override
  State<PetManagementPage> createState() => _PetManagementPageState();
}

class _PetManagementPageState extends State<PetManagementPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  final _weightController = TextEditingController();
  final _descriptionController = TextEditingController();

  // 表单数据
  String _selectedType = '狗狗';
  String _selectedGender = '雄';
  DateTime _selectedBirthDate = DateTime.now().subtract(
    const Duration(days: 365),
  );
  Color _selectedColor = AppTheme.primaryColor;
  String _selectedAvatar = '🐕';
  String? _avatarDataUrl; // 当为图片上传时，使用 dataURL 存储

  // 宠物服务
  final PetService _petService = PetService();

  // 宠物类型和头像映射
  late Map<String, List<String>> _typeAvatars;
  late List<Color> _colorOptions;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeData();
    _initializeForm();
  }

  void _initializeData() {
    _typeAvatars = _petService.getTypeAvatars();
    _colorOptions = _petService.getColorOptions();
  }

  void _initializeForm() {
    if (widget.pet != null) {
      // 编辑模式：填充现有数据
      _nameController.text = widget.pet!.name;
      _breedController.text = widget.pet!.breed;
      _weightController.text = widget.pet!.weight.toString();
      _descriptionController.text = '';
      _selectedType = widget.pet!.type;
      _selectedGender = _normalizeGender(widget.pet!.gender);
      _selectedBirthDate = widget.pet!.birthDate;
      _selectedColor = widget.pet!.color;
      if (widget.pet!.avatar.startsWith('data:image')) {
        _avatarDataUrl = widget.pet!.avatar;
        _selectedAvatar = '🐕';
      } else {
        _selectedAvatar = widget.pet!.avatar;
      }
    }
  }

  /// 标准化性别值，将各种可能的性别值映射为下拉菜单支持的值
  String _normalizeGender(String gender) {
    switch (gender) {
      case '公':
      case '雄':
      case 'male':
      case 'Male':
      case 'M':
        return '雄';
      case '母':
      case '雌':
      case 'female':
      case 'Female':
      case 'F':
        return '雌';
      default:
        return '雄'; // 默认值
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _breedController.dispose();
    _weightController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditMode = widget.pet != null;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(isEditMode ? '编辑宠物信息' : '添加宠物'),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.textPrimaryColor,
        elevation: 0,
        actions: [
          if (isEditMode)
            IconButton(
              onPressed: _showDeleteDialog,
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              tooltip: '删除宠物',
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppTheme.spacingL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 宠物头像选择
              _buildAvatarSection(),
              const SizedBox(height: AppTheme.spacingL),

              // 基本信息
              _buildBasicInfoSection(),
              const SizedBox(height: AppTheme.spacingL),

              // 详细信息
              _buildDetailInfoSection(),
              const SizedBox(height: AppTheme.spacingL),

              // 保存按钮
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarSection() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '选择宠物头像',
            style: TextStyle(
              fontSize: AppTheme.fontSizeL,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          const SizedBox(height: AppTheme.spacingM),

          // 头像预览 + 操作按钮
          Row(
            children: [
              _buildAvatarPreview(),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: Wrap(
                  spacing: AppTheme.spacingS,
                  runSpacing: AppTheme.spacingS,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _isLoading ? null : _pickAvatarImage,
                      icon: const Icon(Icons.photo_library_outlined),
                      label: const Text('上传图片'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    if (_avatarDataUrl != null)
                      OutlinedButton.icon(
                        onPressed: _isLoading
                            ? null
                            : () {
                                setState(() {
                                  _avatarDataUrl = null;
                                });
                              },
                        icon: const Icon(Icons.emoji_emotions_outlined),
                        label: const Text('改用表情'),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),

          // 宠物类型选择
          DropdownButtonFormField<String>(
            value: _selectedType,
            decoration: const InputDecoration(
              labelText: '宠物类型',
              border: OutlineInputBorder(),
            ),
            items: _typeAvatars.keys.map((type) {
              return DropdownMenuItem(value: type, child: Text(type));
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedType = value!;
                _selectedAvatar = _typeAvatars[value]!.first;
              });
            },
          ),
          const SizedBox(height: AppTheme.spacingM),

          // 头像选择网格
          if (_avatarDataUrl == null)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: AppTheme.spacingM,
                mainAxisSpacing: AppTheme.spacingM,
                childAspectRatio: 1,
              ),
              itemCount: _typeAvatars[_selectedType]!.length,
              itemBuilder: (context, index) {
                final avatar = _typeAvatars[_selectedType]![index];
                final isSelected = avatar == _selectedAvatar;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedAvatar = avatar;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? _selectedColor.withValues(alpha: 0.1)
                          : Colors.grey[100],
                      borderRadius: BorderRadius.circular(
                        AppTheme.borderRadiusMedium,
                      ),
                      border: Border.all(
                        color: isSelected ? _selectedColor : Colors.grey[300]!,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Center(
                      child: Text(avatar, style: const TextStyle(fontSize: 32)),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _buildAvatarPreview() {
    final double size = 64;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _selectedColor.withValues(alpha: 0.15),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: _selectedColor.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipOval(
        child: _avatarDataUrl != null
            ? _buildImageFromDataUrl(_avatarDataUrl!, size)
            : Center(
                child: Text(
                  _selectedAvatar,
                  style: const TextStyle(fontSize: 32),
                ),
              ),
      ),
    );
  }

  Widget _buildImageFromDataUrl(String dataUrl, double size) {
    try {
      final parts = dataUrl.split(',');
      final base64Str = parts.length > 1 ? parts[1] : parts.first;
      final bytes = base64Decode(base64Str);
      return Image.memory(bytes, width: size, height: size, fit: BoxFit.cover);
    } catch (_) {
      return Center(
        child: Icon(Icons.broken_image, color: _selectedColor, size: 28),
      );
    }
  }

  Widget _buildBasicInfoSection() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '基本信息',
            style: TextStyle(
              fontSize: AppTheme.fontSizeL,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          const SizedBox(height: AppTheme.spacingM),

          // 宠物名称
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: '宠物名称 *',
              hintText: '请输入宠物的名字',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.pets),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return '请输入宠物名称';
              }
              return null;
            },
          ),
          const SizedBox(height: AppTheme.spacingM),

          // 品种
          TextFormField(
            controller: _breedController,
            decoration: const InputDecoration(
              labelText: '品种',
              hintText: '例如：金毛寻回犬、英国短毛猫',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.category),
            ),
          ),
          const SizedBox(height: AppTheme.spacingM),

          // 性别选择
          DropdownButtonFormField<String>(
            value: _normalizeGender(_selectedGender),
            decoration: const InputDecoration(
              labelText: '性别',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.wc),
            ),
            items: const [
              DropdownMenuItem(value: '雄', child: Text('雄')),
              DropdownMenuItem(value: '雌', child: Text('雌')),
            ],
            onChanged: (value) {
              setState(() {
                _selectedGender = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDetailInfoSection() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '详细信息',
            style: TextStyle(
              fontSize: AppTheme.fontSizeL,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          const SizedBox(height: AppTheme.spacingM),

          // 出生日期
          InkWell(
            onTap: _selectBirthDate,
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: '出生日期',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.cake),
              ),
              child: Text(
                '${_selectedBirthDate.year}-${_selectedBirthDate.month.toString().padLeft(2, '0')}-${_selectedBirthDate.day.toString().padLeft(2, '0')}',
                style: TextStyle(
                  color: AppTheme.textPrimaryColor,
                  fontSize: AppTheme.fontSizeM,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppTheme.spacingM),

          // 体重
          TextFormField(
            controller: _weightController,
            decoration: const InputDecoration(
              labelText: '体重 (kg)',
              hintText: '例如：25.5',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.monitor_weight),
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                final weight = double.tryParse(value);
                if (weight == null || weight <= 0) {
                  return '请输入有效的体重';
                }
              }
              return null;
            },
          ),
          const SizedBox(height: AppTheme.spacingM),

          // 主题色选择
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '主题色',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeM,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textPrimaryColor,
                ),
              ),
              const SizedBox(height: AppTheme.spacingS),
              Wrap(
                spacing: AppTheme.spacingS,
                runSpacing: AppTheme.spacingS,
                children: _colorOptions.map((color) {
                  final isSelected = color == _selectedColor;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = color;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? Colors.black : Colors.transparent,
                          width: isSelected ? 3 : 0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: color.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 20,
                            )
                          : null,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),

          // 描述
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              labelText: '描述 (可选)',
              hintText: '添加一些关于宠物的描述...',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.description),
            ),
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    final isEditMode = widget.pet != null;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _savePet,
        style: ElevatedButton.styleFrom(
          backgroundColor: _selectedColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingL),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          ),
          elevation: 2,
        ),
        child: _isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                isEditMode ? '保存修改' : '添加宠物',
                style: const TextStyle(
                  fontSize: AppTheme.fontSizeL,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  Future<void> _selectBirthDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedBirthDate,
      firstDate: DateTime(2010),
      lastDate: now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: _selectedColor,
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedBirthDate = picked;
      });
    }
  }

  Future<void> _savePet() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // 模拟保存过程
      await Future.delayed(const Duration(seconds: 1));

      // 创建宠物对象
      final pet = models.Pet(
        id: widget.pet?.id ?? _petService.generatePetId(),
        name: _nameController.text.trim(),
        type: _selectedType,
        breed: _breedController.text.trim(),
        avatar: _avatarDataUrl ?? _selectedAvatar,
        identityCode:
            widget.pet?.identityCode ?? _petService.generateIdentityCode(),
        color: _selectedColor,
        birthDate: _selectedBirthDate,
        weight: double.tryParse(_weightController.text) ?? 0.0,
        gender: _selectedGender,
      );

      // 保存宠物信息到数据库
      await _petService.savePet(pet);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.pet != null ? '宠物信息已更新' : '宠物添加成功'),
            backgroundColor: AppTheme.successColor,
          ),
        );

        Navigator.pop(context, pet);
      }
    } catch (e) {
      if (mounted) {
        AppErrorHandler.handleError(context, '保存失败：$e');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _pickAvatarImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? picked = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        imageQuality: 85,
      );
      if (picked == null) return;

      final bytes = await picked.readAsBytes();
      // 简单根据文件名推断 mime
      final name = picked.name.toLowerCase();
      String mime = 'image/jpeg';
      if (name.endsWith('.png')) mime = 'image/png';
      if (name.endsWith('.webp')) mime = 'image/webp';

      final dataUrl = 'data:$mime;base64,${base64Encode(bytes)}';
      setState(() {
        _avatarDataUrl = dataUrl;
      });
    } catch (e) {
      if (mounted) {
        AppErrorHandler.handleError(context, '选择图片失败：$e');
      }
    }
  }

  Future<void> _showDeleteDialog() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除宠物'),
        content: Text('确定要删除宠物"${widget.pet!.name}"吗？此操作不可撤销。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('删除'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _deletePet();
    }
  }

  Future<void> _deletePet() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // 模拟删除过程
      await Future.delayed(const Duration(seconds: 1));

      // 从数据库删除宠物
      await _petService.deletePet(widget.pet!.id);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('宠物已删除'),
            backgroundColor: AppTheme.successColor,
          ),
        );

        Navigator.pop(context, 'deleted');
      }
    } catch (e) {
      if (mounted) {
        AppErrorHandler.handleError(context, '删除失败：$e');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}

/// 以底部弹窗方式打开宠物编辑器
Future<models.Pet?> showPetEditorModal(
  BuildContext context, {
  models.Pet? pet,
}) {
  return showModalBottomSheet<models.Pet>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppTheme.borderRadiusLarge),
              topRight: Radius.circular(AppTheme.borderRadiusLarge),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 12,
                offset: Offset(0, -4),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: SizedBox(
              height: MediaQuery.of(ctx).size.height * 0.9,
              child: PetManagementPage(pet: pet),
            ),
          ),
        ),
      );
    },
  );
}
