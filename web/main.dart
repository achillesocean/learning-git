import 'package:web/web.dart' as web;
import 'dart:io';

class Product {
  String name;
  double price;
  String description;

  Product(this.name, this.price, this.description);
  
}

class ProductManager {
  List<Product> products = [];

  void addProduct() {
    print('Enter product name:');
    String? name = stdin.readLineSync();

    if (name == null) {
      print('Product name cannot be empty.');
      return;
    }

    print('Enter product price:');
    double? price = double.parse(stdin.readLineSync() ?? '0.0');
    
    if (price == 0) {
      print('Product price cannot be zero.');
      return;
    }

    print('Enter product description:');
    String? description = stdin.readLineSync();

    if (description == null || description.isEmpty) { // the isEmpty property is used to check if the string is empty of characters.
      print('Product description cannot be empty.');
      return;
    }
    Product product = Product(name, price, description);

    products.add(product);
  }

  void displayProducts() {
    for (Product product in products) {
      print('Name: ${product.name}');
      print('Price: ${product.price}');
      print('Description: ${product.description}');
      print('');
    }
  }

  void displayOneProduct() {
    print('Enter product name:');
    String? name = stdin.readLineSync();

    while (name == null) {
      if (name == 'Return') {
        return;
      }
      print('Product name cannot be empty.');
      return;
    }

    for (Product product in products) {
      if (product.name == name) {
        print('Name: ${product.name}');
        print('Price: $product.price');
        print('Description: ${product.description}');
        print('');
      }
    }
  }

  void removeProduct() {
    print('Enter product name:');
    String? name = stdin.readLineSync();

    while (name == null) {
      if (name == 'Return') {
        return;
      }
      print('Product name cannot be empty.');
      return;
    }

    for (Product product in products) {
      if (product.name == name) {
        products.remove(product);
        print('Product removed successfully.');
        return;
      }
    }
  }

  void editProduct() {
    print('Enter product name:');
    String? name = stdin.readLineSync();  
    
    while (name == null) {
      if (name == 'Return') {
        return;
      }
      print('Product name cannot be empty.');
      name = stdin.readLineSync();
    }

    for (Product product in products) {
      if (product.name == name) {
        print('Enter new product name:');
        String? newName = stdin.readLineSync();
        product.name = newName ?? product.name;
        print('Enter new product price:');
        double? newPrice = double.parse(stdin.readLineSync() ?? '0.0');
        product.price = newPrice ?? product.price;
        print('Enter new product description:');
        String? newDescription = stdin.readLineSync();
        product.description = newDescription ?? product.description;
        print('Product edited successfully.');
        return;
      }
    }
  }
} 

void main() {
  ProductManager productManager = ProductManager();

  // Adding products
  productManager.addProduct(); // Test case: Add the first product
  productManager.addProduct(); // Test case: Add the second product
  productManager.addProduct(); // Test case: Add the third product
  productManager.addProduct(); // Test case: Add the fourth product
  productManager.addProduct(); // Test case: Add the fifth product


  // Display all products
  print('Displaying all products:');
  productManager.displayProducts();

  // Display a specific product
  print('Displaying a specific product:');
  productManager.displayOneProduct();

  // Edit a product
  print('Editing a product:');
  productManager.editProduct();

  // Display all products after editing
  print('Displaying all products after editing:');
  productManager.displayProducts();

  // Remove a product
  print('Removing a product:');
  productManager.removeProduct();

  // Display all products after removal
  print('Displaying all products after removal:');
  productManager.displayProducts();
}

