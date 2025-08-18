import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../core/models.dart' as models;

/// 直接唤起“新增健康记录”的底部弹窗
/// 返回保存后的 HealthRecord；若取消则返回 null
Future<models.HealthRecord?> showAddHealthRecordSheet(
  BuildContext context, {
  required List<models.Pet> pets,
  String? presetPetId,
  models.HealthRecordType? presetType,
}) async {
  final formKey = GlobalKey<FormState>();
  models.HealthRecordType type =
      presetType ?? models.HealthRecordType.vaccination;
  DateTime date = DateTime.now();
  String title = '';
  String notes = '';
  String petId = presetPetId ?? (pets.isNotEmpty ? pets.first.id : '');
  double? weight;
  String clinic = '';

  final result = await showModalBottomSheet<models.HealthRecord>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (ctx) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom,
          left: AppTheme.spacingL,
          right: AppTheme.spacingL,
          top: AppTheme.spacingL,
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      '新增健康记录',
                      style: TextStyle(
                        fontSize: AppTheme.fontSizeL,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimaryColor,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.pop(ctx),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: AppTheme.spacingM),

                // 选择宠物
                DropdownButtonFormField<String>(
                  value: petId.isNotEmpty ? petId : null,
                  decoration: const InputDecoration(labelText: '选择宠物'),
                  items: pets
                      .map(
                        (p) => DropdownMenuItem(
                          value: p.id,
                          child: Text('${p.avatar}  ${p.name}'),
                        ),
                      )
                      .toList(),
                  onChanged: (v) => petId = v ?? petId,
                  validator: (v) => (v == null || v.isEmpty) ? '请选择宠物' : null,
                ),

                const SizedBox(height: AppTheme.spacingM),

                // 类型
                DropdownButtonFormField<models.HealthRecordType>(
                  value: type,
                  decoration: const InputDecoration(labelText: '记录类型'),
                  items: models.HealthRecordType.values
                      .map(
                        (t) => DropdownMenuItem(
                          value: t,
                          child: Text(models.HealthRecordUtils.getTypeLabel(t)),
                        ),
                      )
                      .toList(),
                  onChanged: (v) => type = v ?? type,
                ),

                const SizedBox(height: AppTheme.spacingM),

                // 日期
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: '日期',
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        controller: TextEditingController(
                          text: _formatDate(date),
                        ),
                        onTap: () async {
                          final picked = await showDatePicker(
                            context: ctx,
                            initialDate: date,
                            firstDate: DateTime(2018),
                            lastDate: DateTime(2100),
                          );
                          if (picked != null) {
                            date = picked;
                          }
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppTheme.spacingM),

                // 标题
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '标题（如：狂犬疫苗、常规体检、称重等）',
                  ),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? '请输入标题' : null,
                  onChanged: (v) => title = v.trim(),
                ),

                const SizedBox(height: AppTheme.spacingM),

                // 备注
                TextFormField(
                  decoration: const InputDecoration(labelText: '备注（可选）'),
                  maxLines: 3,
                  onChanged: (v) => notes = v.trim(),
                ),

                const SizedBox(height: AppTheme.spacingM),

                // 可选字段：体重/医院
                if (type == models.HealthRecordType.weight) ...[
                  TextFormField(
                    decoration: const InputDecoration(labelText: '体重 kg'),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    validator: (v) {
                      if (type == models.HealthRecordType.weight) {
                        final parsed = double.tryParse(v ?? '');
                        if (parsed == null) return '请输入有效体重';
                      }
                      return null;
                    },
                    onChanged: (v) => weight = double.tryParse(v),
                  ),
                ] else if (type == models.HealthRecordType.vetVisit ||
                    type == models.HealthRecordType.vaccination ||
                    type == models.HealthRecordType.medication) ...[
                  TextFormField(
                    decoration: const InputDecoration(labelText: '医院/机构（可选）'),
                    onChanged: (v) => clinic = v.trim(),
                  ),
                ] else ...[
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: '体重 kg（可选）',
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onChanged: (v) => weight = double.tryParse(v),
                        ),
                      ),
                      const SizedBox(width: AppTheme.spacingM),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: '医院/机构（可选）',
                          ),
                          onChanged: (v) => clinic = v.trim(),
                        ),
                      ),
                    ],
                  ),
                ],

                const SizedBox(height: AppTheme.spacingL),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() != true) return;
                      final rec = models.HealthRecord(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        petId: petId,
                        date: date,
                        type: type,
                        title: title,
                        notes: notes.isEmpty ? null : notes,
                        weight: weight,
                        clinic: clinic.isEmpty ? null : clinic,
                      );
                      Navigator.pop(ctx, rec);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: AppTheme.spacingM,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      '保存记录',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),

                const SizedBox(height: AppTheme.spacingM),
              ],
            ),
          ),
        ),
      );
    },
  );

  return result;
}

String _formatDate(DateTime d) {
  return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}
