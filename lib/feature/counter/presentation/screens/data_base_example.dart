import 'package:flutter/material.dart';
import '../../data/models/item_model.dart';
import '../../helper/helper_classes/data_base_helper.dart';

class DataBaseExample extends StatefulWidget {
  const DataBaseExample({super.key});

  @override
  DataBaseExampleState createState() => DataBaseExampleState();
}

class DataBaseExampleState extends State<DataBaseExample> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Item>? items = [];

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  void _refreshItems() async {
    final data = await dbHelper.queryAllItems();
    setState(() {
      items = data
          ?.map((item) => Item.fromMap(item))
          .toList();
    });
  }

  void _addItem() async {
    Item item = Item(name: 'New Item');
    await dbHelper.insertItem(item.toMap());
    _refreshItems();
  }

  void _updateItem(Item? item) async {
    item?.name = 'Updated Item';
    await dbHelper.updateItem(item?.toMap()??{});
    _refreshItems();
  }

  void _deleteItem(int? id) async {
    await dbHelper.deleteItem(id??-1);
    _refreshItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sqflite Example'),
      ),
      body: ListView.builder(
        itemCount: items?.length??0,
        itemBuilder: (context, index) {
          final item = items?[index];
          return ListTile(
            title: Text(item?.name??""),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _updateItem(item),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteItem(item?.id??-1),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}
