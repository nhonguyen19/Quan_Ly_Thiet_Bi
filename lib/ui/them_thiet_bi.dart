import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Them_Thiet_Bi extends StatefulWidget {
  @override
  _Them_Thiet_BiState createState() => _Them_Thiet_BiState();
}

class _Them_Thiet_BiState extends State<Them_Thiet_Bi> {
  late String _deviceName;
  late String _deviceType;
  int? _deviceQuantity;
  late String _deviceDescription;

  final _formKey = GlobalKey<FormState>();
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm thiết bị mới'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _imageFile != null
                    ? Card(
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 200.0,
                              width: double.infinity,
                            child: Image.file(_imageFile!),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                ElevatedButton(
                  onPressed: _getImage,
                  child: Text('Thêm ảnh'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Tên thiết bị'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tên thiết bị';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    if (value != null) {
                      setState(() => _deviceName = value);
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Loại thiết bị'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập loại thiết bị';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    if (value != null) {
                      setState(() => _deviceType = value);
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Số lượng'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập số lượng';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    if (value != null) {
                      setState(() => _deviceQuantity = int.tryParse(value));
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Mô tả'),
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mô tả';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    if (value != null) {
                      setState(() => _deviceDescription = value);
                    }
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Thêm mới'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final picker = ImagePicker();

  Future<void> _getImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery, // hoặc ImageSource.camera
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }
}
