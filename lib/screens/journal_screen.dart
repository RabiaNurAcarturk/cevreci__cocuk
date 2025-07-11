import 'package:flutter/material.dart';

class JournalScreen extends StatefulWidget {
  static const String routeName = '/journal';

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _feelingController = TextEditingController();

  final List<Map<String, String>> _journalEntries = [];

  void _saveEntry() {
    final taskText = _taskController.text.trim();
    final feelingText = _feelingController.text.trim();

    if (taskText.isEmpty || feelingText.isEmpty) return;

    setState(() {
      _journalEntries.insert(0, {
        'task': taskText,
        'feeling': feelingText,
        'time': DateTime.now().toLocal().toString().split('.')[0],
      });
      _taskController.clear();
      _feelingController.clear();
    });

    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _taskController.dispose();
    _feelingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: 'Bugün ne yaptın?',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.task),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 12),
            TextField(
              controller: _feelingController,
              decoration: InputDecoration(
                labelText: 'Neler hissettin?',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.emoji_emotions),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _saveEntry,
              icon: Icon(Icons.save),
              label: Text('Kaydet'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 247, 4),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: _journalEntries.isEmpty
                  ? Center(child: Text('Henüz günlük kaydı yok.'))
                  : ListView.builder(
                      itemCount: _journalEntries.length,
                      itemBuilder: (context, index) {
                        final entry = _journalEntries[index];
                        return Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            title: Text('📌 ${entry['task']}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 4),
                                Text('📝 ${entry['feeling']}'),
                                SizedBox(height: 4),
                                Text(
                                  '🕒 ${entry['time']}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}