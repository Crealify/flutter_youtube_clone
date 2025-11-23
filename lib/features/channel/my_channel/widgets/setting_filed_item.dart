// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String identifier;
  final VoidCallback onpressed;
  final String value;


  const SettingsItem({
    Key? key,
    required this.identifier,
    required this.value,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16,),
      child: ListTile(
        title: Text(identifier, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
        trailing: const Icon(Icons.edit),
        onTap: onpressed,
      ),
    );
  }
}
