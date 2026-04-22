import 'package:flutter/material.dart';

class HomeModuleTile extends StatelessWidget {
  const HomeModuleTile({
    super.key,
    required this.title,
    required this.description,
    required this.enabled,
  });

  final String title;
  final String description;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        trailing: Icon(
          enabled ? Icons.toggle_on : Icons.toggle_off,
          color: enabled ? Colors.green : Colors.grey,
        ),
      ),
    );
  }
}
