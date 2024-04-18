import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package

// Define a data model for the shopping list
class ShoppingList {
  final String name;
  final DateTime date;

  ShoppingList({required this.name, required this.date});
}

class PrincipalView extends StatefulWidget {
  const PrincipalView({Key? key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  List<ShoppingList> shoppingLists = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        title: const Text('Lista de Compras',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text('Perfil', style: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ListTile(
                leading: Icon(Icons.info_outline),
                title: const Text('Sobre'),
                onTap: () {
                  Navigator.pushNamed(context, "t4");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ListTile(
                leading: Icon(Icons.logout),
                title: const Text('Sair'),
                onTap: () {
                  Navigator.pushNamed(context, "t0");
                },
              ),
            ),
          ],
        ),
      ),
      body: shoppingLists.isEmpty
          ? Center(
              child: Text('Clica em + para criar uma nova lista de compras'),
            )
          : ListView.builder(
              itemCount: shoppingLists.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Navigate to a new page to add products to the shopping list
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AddProductsPage(shoppingList: shoppingLists[index]),
                      ),
                    );
                  },
                  child: ShoppingListWidget(
                    shoppingList: shoppingLists[index],
                    onDelete: () {
                      setState(() {
                        shoppingLists.removeAt(index);
                      });
                    },
                    onEdit: () {
                      // Implement edit functionality here
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          String updatedName = shoppingLists[index].name;
                          return AlertDialog(
                            title: Text('Editar Lista de Compras'),
                            content: TextField(
                              onChanged: (value) {
                                updatedName = value;
                              },
                              decoration:
                                  InputDecoration(hintText: 'Nome atualizado'),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Cancelar'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Update'),
                                onPressed: () {
                                  setState(() {
                                    shoppingLists[index] = ShoppingList(
                                      name: updatedName,
                                      date: shoppingLists[index].date,
                                    );
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show a dialog to enter the name of the new shopping list
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String newListName = '';
              return AlertDialog(
                title: Text('Adicionar nova lista de compras'),
                content: TextField(
                  onChanged: (value) {
                    newListName = value;
                  },
                  decoration:
                      InputDecoration(hintText: 'Nome da Lista de Compras'),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Adicionar'),
                    onPressed: () {
                      setState(() {
                        shoppingLists.add(ShoppingList(
                            name: newListName, date: DateTime.now()));
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ShoppingListWidget extends StatelessWidget {
  final ShoppingList shoppingList;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ShoppingListWidget({
    required this.shoppingList,
    required this.onDelete,
    required this.onEdit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Format the date to display only hour and minute
    String formattedTime = DateFormat('HH:mm').format(shoppingList.date);

    return ListTile(
      title: Text(shoppingList.name),
      subtitle: Text(formattedTime), // Display only hour and minute
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: onEdit,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}

class AddProductsPage extends StatelessWidget {
  final ShoppingList shoppingList;

  const AddProductsPage({required this.shoppingList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Produtos'),
      ),
      body: Center(
        child: Text('Add products for ${shoppingList.name} here'),
      ),
    );
  }
}
