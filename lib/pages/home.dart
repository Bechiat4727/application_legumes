import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double total = 0;
  Map<String, int> produits = {}; // Dictionnaire pour stocker les produits et leurs quantités

  String? produit_default = "Fruits";

  // Fonction pour ajouter un produit
  void addProduit(String produitName, double price) {
    setState(() {
      total += price;
      if (produits.containsKey(produitName)) {
        produits[produitName] = produits[produitName]! + 1;
      } else {
        produits[produitName] = 1;
      }
    });
  }

  // Fonction pour enlever un produit
  void removeProduit(String produitName, double price) {
    setState(() {
      if (produits.containsKey(produitName) && produits[produitName]! > 0) {
        total -= price;
        produits[produitName] = produits[produitName]! - 1;
        if (produits[produitName] == 0) {
          produits.remove(produitName);
        }
      }
    });
  }

  // Fonction pour changer produit dans dropdown
  void ChangerProduit(String? nouveau_produit) {
    setState(() {
      produit_default = nouveau_produit;
    });
  }

  // Fonction pour afficher les produits
  String afficherProduits() {
    if (produits.isEmpty) {
      return "Null";
    } else {
      return produits.entries
          .map((entry) => "${entry.value}kg ${entry.key}")
          .join(", ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App Vente",
          style: TextStyle(color: Color.fromARGB(232, 89, 89, 224)),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 15, 15, 74),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text('Total : ${total.toStringAsFixed(2)} DZD',
              style: TextStyle(fontSize: 20)),
          const SizedBox(height: 8),
          Text('Produit : ${afficherProduits()}',
              style: TextStyle(fontSize: 18)),
          const SizedBox(height: 30),
          DropdownMenu<String>(
            initialSelection: produit_default,
            onSelected: ChangerProduit,
            dropdownMenuEntries: [
              DropdownMenuEntry(value: "Fruits", label: "Fruits"),
              DropdownMenuEntry(value: "legumes", label: "Legumes"),
            ],
          ),
          // Fruits Section
          if (produit_default == "Fruits") ...[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => addProduit('apple', 100),
                        child: Image.asset("img/apple.png",
                            width: 100, height: 100),
                      ),
                      FloatingActionButton(
                        onPressed: () => removeProduit('apple', 100),
                        backgroundColor: Colors.white,
                        child: Icon(Icons.minimize, color: Colors.black),
                        mini: true,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => addProduit('lemon', 80),
                        child: Image.asset("img/lemon.png",
                            width: 100, height: 100),
                      ),
                      FloatingActionButton(
                        onPressed: () => removeProduit('lemon', 80),
                        backgroundColor: Colors.white,
                        child: Icon(Icons.minimize, color: Colors.black),
                        mini: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => addProduit('mango', 120),
                        child: Image.asset("img/mango.png",
                            width: 100, height: 100),
                      ),
                      FloatingActionButton(
                        onPressed: () => removeProduit('mango', 120),
                        backgroundColor: Colors.white,
                        child: Icon(Icons.minimize, color: Colors.black),
                        mini: true,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => addProduit('strawberry', 90),
                        child: Image.asset("img/strawberry.png",
                            width: 100, height: 100),
                      ),
                      FloatingActionButton(
                        onPressed: () => removeProduit('strawberry', 90),
                        backgroundColor: Colors.white,
                        child: Icon(Icons.minimize, color: Colors.black),
                        mini: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
          // Legumes Section
          if (produit_default == "legumes") ...[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => addProduit('onion', 40),
                        child: Image.asset("img/onion.png",
                            width: 100, height: 100),
                      ),
                      FloatingActionButton(
                        onPressed: () => removeProduit('onion', 40),
                        backgroundColor: Colors.white,
                        child: Icon(Icons.minimize, color: Colors.black),
                        mini: true,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => addProduit('potato', 30),
                        child: Image.asset("img/potato.png",
                            width: 100, height: 100),
                      ),
                      FloatingActionButton(
                        onPressed: () => removeProduit('potato', 30),
                        backgroundColor: Colors.white,
                        child: Icon(Icons.minimize, color: Colors.black),
                        mini: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => addProduit('garlic', 70),
                        child: Image.asset("img/garlic.png",
                            width: 100, height: 100),
                      ),
                      FloatingActionButton(
                        onPressed: () => removeProduit('garlic', 70),
                        backgroundColor: Colors.white,
                        child: Icon(Icons.minimize, color: Colors.black),
                        mini: true,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => addProduit('pepper', 60),
                        child: Image.asset("img/pepper.png",
                            width: 100, height: 100),
                      ),
                      FloatingActionButton(
                        onPressed: () => removeProduit('pepper', 60),
                        backgroundColor: Colors.white,
                        child: Icon(Icons.minimize, color: Colors.black),
                        mini: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
