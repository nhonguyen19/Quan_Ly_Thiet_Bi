import 'package:flutter/material.dart';

class Don_Vi extends StatefulWidget {
  @override
  _Don_ViState createState() => _Don_ViState();
}

class _Don_ViState extends State<Don_Vi> {
 List< Map<String, Object>> devices =[ 
    {'name': 'Khoa công nghệ thông tin', 'description': 'Đây là khoa công nghệ thông tin', 'quantity': 5},
    {'name': 'Khoa điện điện tử', 'description': 'Đây là khoa điện điện tử', 'quantity': 3},
    {'name': 'Khoa công nghệ ô tô', 'description': 'Đây là khoa công nghệ ô tô', 'quantity': 7},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách đơn vị'),
      ),
      body: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (BuildContext context, int index) {
          final device = devices[index];
 
          return ListTile(
            leading: CircleAvatar(
              child: Image.asset('assets/khoacntt.png'),
            ),
            title: Text(device['name'].toString()),
            subtitle: Text(device['description'].toString()),
            trailing: Text('${device['quantity']}'),
          );
        },
      ),
    );
  }
}
