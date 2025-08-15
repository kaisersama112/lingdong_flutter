import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../core/models.dart' as models;
import '../core/error_handler.dart';
import '../services/pet_service.dart';
import 'package:flutter/services.dart';

class PetManagementPage extends StatefulWidget {
  final models.Pet? pet; // 如果是编辑模式，传入宠物信息

  const PetManagementPage({
    super.key,
    this.pet,
  });

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
  String _selectedGender = '公';
  DateTime _selectedBirthDate = DateTime.now().subtract(const Duration(days: 365));
  Color _selectedColor = AppTheme.primaryColor;
  String _selectedAvatar = '🐕';

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
      _selectedGender = widget.pet!.gender;
      _selectedBirthDate = widget.pet!.birthDate;
      _selectedColor = widget.pet!.color;
      _selectedAvatar = widget.pet!.avatar;
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
          
          // 宠物类型选择
          DropdownButtonFormField<String>(
            value: _selectedType,
            decoration: const InputDecoration(
              labelText: '宠物类型',
              border: OutlineInputBorder(),
            ),
            items: _typeAvatars.keys.map((type) {
              return DropdownMenuItem(
                value: type,
                child: Text(type),
              );
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
                    color: isSelected ? _selectedColor.withValues(alpha: 0.1) : Colors.grey[100],
                    borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                    border: Border.all(
                      color: isSelected ? _selectedColor : Colors.grey[300]!,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      avatar,
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
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
            value: _selectedGender,
            decoration: const InputDecoration(
              labelText: '性别',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.wc),
            ),
            items: const [
              DropdownMenuItem(value: '公', child: Text('公')),
              DropdownMenuItem(value: '母', child: Text('母')),
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
                          ? const Icon(Icons.check, color: Colors.white, size: 20)
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
        avatar: _selectedAvatar,
        identityCode: widget.pet?.identityCode ?? _petService.generateIdentityCode(),
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
