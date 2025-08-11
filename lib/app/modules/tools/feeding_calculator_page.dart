import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class FeedingCalculatorPage extends StatefulWidget {
  const FeedingCalculatorPage({super.key});

  @override
  State<FeedingCalculatorPage> createState() => _FeedingCalculatorPageState();
}

class _FeedingCalculatorPageState extends State<FeedingCalculatorPage> {
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _age = TextEditingController();
  String _pet = '狗狗';
  String _result = '';

  @override
  void dispose() {
    _weight.dispose();
    _age.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('喂养与运动计算器'),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.textPrimaryColor,
        elevation: 0.5,
      ),
      backgroundColor: AppTheme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            decoration: AppTheme.cardDecoration,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: _pet,
                          items: ['狗狗', '猫咪']
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                          onChanged: (v) => setState(() => _pet = v ?? _pet),
                          decoration: const InputDecoration(labelText: '宠物'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: _weight,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: '体重(kg)',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _age,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: '年龄(月)'),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 44,
                    child: ElevatedButton.icon(
                      onPressed: _calculate,
                      icon: const Icon(Icons.calculate),
                      label: const Text('计算'),
                      style: AppTheme.primaryButtonStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          if (_result.isNotEmpty)
            Container(
              decoration: AppTheme.cardDecoration,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(_result, style: AppTheme.bodyStyle),
              ),
            ),
        ],
      ),
    );
  }

  void _calculate() {
    final weight = double.tryParse(_weight.text.trim()) ?? 0;
    final ageMonths = int.tryParse(_age.text.trim()) ?? 0;
    if (weight <= 0 || ageMonths <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请输入有效的体重和年龄')));
      return;
    }
    // 简化计算：真实版本应按代谢能、阶段、活动量细分
    final isPuppy = ageMonths < 12;
    final feedGram = (_pet == '狗狗')
        ? (isPuppy ? weight * 40 : weight * 25)
        : (isPuppy ? weight * 30 : weight * 20);
    final exerciseMin = (_pet == '狗狗')
        ? (isPuppy ? 30 : 60)
        : (isPuppy ? 20 : 40);
    setState(() {
      _result =
          '建议日喂食: ${feedGram.toStringAsFixed(0)} 克\n建议日运动: $exerciseMin 分钟\n(以体重/年龄估算，建议结合体脂与活动量微调)';
    });
  }
}
