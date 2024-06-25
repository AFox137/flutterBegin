import 'package:flutter/material.dart';

class EditFieldWidget extends StatefulWidget {
  final Map<String, dynamic> field;
  final ValueChanged<Map<String, dynamic>> onUpdate;

  const EditFieldWidget({
    required this.field,
    required this.onUpdate,
  });

  @override
  _EditFieldWidgetState createState() => _EditFieldWidgetState();
}

class _EditFieldWidgetState extends State<EditFieldWidget> {
  late TextEditingController _nameController;
  late String _selectedType;
  late bool _isRequired;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.field['name']);
    _selectedType = widget.field['type'];
    _isRequired = widget.field['required'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Campo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre del Campo'),
            ),
            DropdownButton<String>(
              value: _selectedType,
              items: ['String', 'Integer', 'Boolean', 'Date']
                  .map((type) => DropdownMenuItem<String>(
                        value: type,
                        child: Text(type),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedType = value;
                  });
                }
              },
            ),
            CheckboxListTile(
              title: Text('Requerido'),
              value: _isRequired,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _isRequired = value;
                  });
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                widget.onUpdate({
                  'name': _nameController.text,
                  'type': _selectedType,
                  'required': _isRequired,
                });
                Navigator.pop(context);
              },
              child: Text('Actualizar Campo'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
