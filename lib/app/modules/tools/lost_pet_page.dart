import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class LostPetPage extends StatefulWidget {
  const LostPetPage({super.key});

  @override
  State<LostPetPage> createState() => _LostPetPageState();
}

class _LostPetPageState extends State<LostPetPage> {
  final TextEditingController _petName = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  String _type = '狗狗';
  DateTime _lostTime = DateTime.now();
  String _city = '';

  @override
  void dispose() {
    _petName.dispose();
    _desc.dispose();
    _contact.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('紧急求助 · 寻宠'),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.textPrimaryColor,
        elevation: 0.5,
      ),
      backgroundColor: AppTheme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _section(
            '基础信息',
            Column(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: '宠物名称'),
                  controller: _petName,
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _type,
                  items: ['狗狗', '猫咪', '其他']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (v) => setState(() => _type = v ?? _type),
                  decoration: const InputDecoration(labelText: '类型'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _section(
            '走失信息',
            Column(
              children: [
                TextFormField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '走失时间',
                    suffixIcon: Icon(Icons.schedule),
                  ),
                  controller: TextEditingController(
                    text: _lostTime.toString().substring(0, 16),
                  ),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now().subtract(
                        const Duration(days: 7),
                      ),
                      lastDate: DateTime.now(),
                      initialDate: _lostTime,
                    );
                    if (date == null) return;
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(_lostTime),
                    );
                    if (time == null) return;
                    setState(
                      () => _lostTime = DateTime(
                        date.year,
                        date.month,
                        date.day,
                        time.hour,
                        time.minute,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(labelText: '城市/区域（用于同城推送）'),
                  onChanged: (v) => setState(() => _city = v),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _desc,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: '特征/走失地点/是否佩戴项圈等',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _section(
            '联系信息',
            TextField(
              controller: _contact,
              decoration: const InputDecoration(labelText: '联系电话/微信（至少一项）'),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 48,
            child: ElevatedButton.icon(
              onPressed: _submit,
              icon: const Icon(Icons.sos),
              label: const Text('一键发布寻宠'),
              style: AppTheme.primaryButtonStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(String title, Widget child) {
    return Container(
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTheme.subheadingStyle),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_contact.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请填写联系信息')));
      return;
    }
    // 这里后续接入：地图辐射提醒/同城推送/API 提交
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('寻宠信息已发布（$_city · 示例）')));
    Navigator.of(context).pop();
  }
}
