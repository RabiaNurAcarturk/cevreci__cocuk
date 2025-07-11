import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  const TaskTile({
    Key? key,
    required this.title,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          color: isChecked ? Colors.grey : Colors.black,
          fontSize: 16,
        ),
      ),
      value: isChecked,
      onChanged: onChanged,
      activeColor: const Color.fromARGB(255, 255, 247, 4),
      controlAffinity: ListTileControlAffinity.leading,
      checkboxShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
