import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/ListMapProvider.dart';
import 'package:state_management/addDataPage.dart';

class Listpage extends StatelessWidget {
  const Listpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('ListPage'),
      ),
      body: Consumer<Listmapprovider>(builder: (_, provider, __) {
        var allData = provider.getData();
        return allData.isNotEmpty
            ? ListView.builder(
                itemCount: allData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${allData[index]['Name']}'),
                    subtitle: Text('${allData[index]['Id']}'),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              context.read<Listmapprovider>().updatedData(
                                  {'Name': 'Muhammad Ramzan', 'Id': '021564'},
                                  index);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              context.read<Listmapprovider>().removeData(index);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
            : Center(
                child: Text('No Contact yet!!'),
              );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => Adddatapage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
