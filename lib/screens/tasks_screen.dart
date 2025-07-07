import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  static const String routeName = '/tasks';

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final List<String> tasks = [
    'Bugün 1 bardak fazla su iç',
    'Çöpleri ayır',
    'Musluğu açık bırakma',
    'Elektrikleri gereksiz yere açma',
    'Bir arkadaşına çevreyi korumayı anlat',
  ];

  final Set<int> completedIndexes = {};

  void toggleTask(int index) {
    setState(() {
      if (completedIndexes.contains(index)) {
        completedIndexes.remove(index);
      } else {
        completedIndexes.add(index);
      }

      if (completedIndexes.length == 5) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('🎉 Tebrikler!'),
            content: Text('5 görevi tamamladın! Yeşil Yıldız Rozeti kazandın!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Tamam'),
              )
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        itemCount: tasks.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) {
          final isCompleted = completedIndexes.contains(index);

          return Dismissible(
            key: Key(index.toString()),
            direction: isCompleted ? DismissDirection.none : DismissDirection.endToStart,
            onDismissed: (_) => toggleTask(index),
            background: Container(
              color: Colors.green.shade200,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.check, color: Colors.white),
            ),
            child: CheckboxListTile(
              title: Text(
                tasks[index],
                style: TextStyle(
                  decoration: isCompleted ? TextDecoration.lineThrough : null,
                  color: isCompleted ? Colors.grey : Colors.black,
                ),
              ),
              value: isCompleted,
              onChanged: (_) => toggleTask(index),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.green.shade700,
              checkboxShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          );
        },
      ),
    );
  }
}
