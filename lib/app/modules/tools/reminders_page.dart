import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class RemindersPage extends StatefulWidget {
  const RemindersPage({super.key});

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  final List<_Reminder> _reminders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('日历提醒'),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.textPrimaryColor,
        elevation: 0.5,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openCreateDialog,
        label: const Text('新建提醒'),
        icon: const Icon(Icons.add_alarm),
      ),
      backgroundColor: AppTheme.backgroundColor,
      body: _reminders.isEmpty
          ? Center(
              child: Text('暂无提醒，点击“新建提醒”添加', style: AppTheme.captionStyle),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(AppTheme.spacingM),
              itemCount: _reminders.length,
              itemBuilder: (_, i) => _buildReminderTile(_reminders[i], i),
            ),
    );
  }

  Widget _buildReminderTile(_Reminder r, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
      decoration: AppTheme.cardDecoration,
      child: ListTile(
        leading: Icon(r.icon, color: AppTheme.primaryColor),
        title: Text(r.title),
        subtitle: Text('${r.date.toString().substring(0, 16)} · ${r.note ?? ''}'),
        trailing: Switch(
          value: r.enabled,
          onChanged: (v) => setState(() => _reminders[index] = r.copyWith(enabled: v)),
        ),
        onTap: () => _openCreateDialog(editing: r, index: index),
      ),
    );
  }

  Future<void> _openCreateDialog({
    _Reminder? editing,
    int? index,
  }) async {
    final result = await showModalBottomSheet<_Reminder>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _ReminderEditor(reminder: editing),
    );
    if (result == null) return;
    setState(() {
      if (index != null) {
        _reminders[index] = result;
      } else {
        _reminders.add(result);
      }
    });
  }
}

class _ReminderEditor extends StatefulWidget {
  final _Reminder? reminder;
  const _ReminderEditor({required this.reminder});

  @override
  State<_ReminderEditor> createState() => _ReminderEditorState();
}

class _ReminderEditorState extends State<_ReminderEditor> {
  
  late TextEditingController _title;
  late TextEditingController _note;
  DateTime _date = DateTime.now().add(const Duration(hours: 1));
  String _type = '疫苗';

  final List<String> _types = ['疫苗', '驱虫', '体检', '洗护', '寄养', '美容'];

  @override
  void initState() {
    super.initState();
    _title = TextEditingController(text: widget.reminder?.title ?? '');
    _note = TextEditingController(text: widget.reminder?.note ?? '');
    _date = widget.reminder?.date ?? _date;
    _type = widget.reminder?.type ?? _type;
  }

  @override
  void dispose() {
    _title.dispose();
    _note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(bottom: viewInsets),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: AppTheme.cardShadow,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.reminder == null ? '新建提醒' : '编辑提醒', style: AppTheme.subheadingStyle),
            const SizedBox(height: 12),
            TextField(
              controller: _title,
              decoration: const InputDecoration(labelText: '标题'),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _type,
              items: _types.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() => _type = v ?? _type),
              decoration: const InputDecoration(labelText: '类型'),
            ),
            const SizedBox(height: 8),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: '时间',
                suffixIcon: const Icon(Icons.schedule),
              ),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now().subtract(const Duration(days: 1)),
                  lastDate: DateTime.now().add(const Duration(days: 365 * 3)),
                  initialDate: _date,
                );
                if (date == null) return;
                final time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(_date));
                if (time == null) return;
                setState(() => _date = DateTime(date.year, date.month, date.day, time.hour, time.minute));
              },
              controller: TextEditingController(text: _date.toString().substring(0, 16)),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _note,
              decoration: const InputDecoration(labelText: '备注（可选）'),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: AppTheme.secondaryButtonStyle,
                    child: const Text('取消'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final r = _Reminder(
                        title: _title.text.isEmpty ? '未命名提醒' : _title.text,
                        type: _type,
                        date: _date,
                        enabled: true,
                        note: _note.text.isEmpty ? null : _note.text,
                      );
                      Navigator.pop(context, r);
                    },
                    style: AppTheme.primaryButtonStyle,
                    child: const Text('保存'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Reminder {
  final String title;
  final String type;
  final DateTime date;
  final bool enabled;
  final String? note;
  IconData get icon => switch (type) {
        '疫苗' => Icons.vaccines,
        '驱虫' => Icons.bug_report,
        '体检' => Icons.health_and_safety,
        '洗护' => Icons.shower,
        '寄养' => Icons.home_work,
        '美容' => Icons.content_cut,
        _ => Icons.event,
      };

  const _Reminder({
    required this.title,
    required this.type,
    required this.date,
    required this.enabled,
    this.note,
  });

  _Reminder copyWith({bool? enabled}) => _Reminder(
        title: title,
        type: type,
        date: date,
        enabled: enabled ?? this.enabled,
        note: note,
      );
}


