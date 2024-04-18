class ShoppingListWidget extends StatelessWidget {
  final ShoppingList shoppingList;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onAddProduct;

  const ShoppingListWidget({
    required this.shoppingList,
    required this.onDelete,
    required this.onEdit,
    required this.onAddProduct,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Format the date to display only hour and minute
    String formattedTime = DateFormat('HH:mm').format(shoppingList.date);

    return Card(
      child: ListTile(
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
            IconButton(
              icon: Icon(Icons.add),
              onPressed: onAddProduct,
            ),
          ],
        ),
      ),
    );
  }
}
