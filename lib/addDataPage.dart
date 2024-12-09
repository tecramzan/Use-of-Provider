import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ListMapProvider.dart';

class Adddatapage extends StatelessWidget {
  const Adddatapage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Add Note'),
      ),
      body: Center(
        child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.amber,
            ),
            onPressed: () {
              context
                  .read<Listmapprovider>()
                  .addData({'Name': 'Muhammad Ramzan', 'Id': '00012'});
            },
            icon: Icon(Icons.add)),
      ),
    );
  }
}
