import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  List<int> quantities = List.generate(5, (index) => 0);
  List<bool> isSelected = List.generate(5, (index) => false);

  final List<Map<String, String>> items = [
    {
      'image': 'assets/images/img.png',
      'title': 'item',
      'description': 'price',
      'price': '20.0'
    },
    {
      'image': 'assets/images/img (1).jpeg',
      'title': 'Item 2',
      'description': 'price',
      'price': '30.0'
    },
    {
      'image': 'assets/images/img (2).jpeg',
      'title': 'Item 3',
      'description': 'price',
      'price': '40.0'
    },
    {
      'image': 'assets/images/img (3).png',
      'title': 'Item 4',
      'description': 'price',
      'price': '25.0'
    },
    {
      'image': 'assets/images/img (4).png',
      'title': 'Item 5',
      'description': 'price',
      'price': '35.0'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double shopFee = 5.0;
    double subtotal = 0;

    for (int i = 0; i < quantities.length; i++) {
      if (isSelected[i]) {
        subtotal += quantities[i] * double.parse(items[i]['price']!);
      }
    }

    double total = subtotal + shopFee;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle shopping cart navigation
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(
                    value: isSelected[index],
                    onChanged: (bool? value) {
                      setState(() {
                        isSelected[index] = value!;
                      });
                    },
                  ),
                  title: Row(
                    children: [
                      Image.asset(
                        items[index]['image']!,
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index]['title']!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              items[index]['description']!,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '\$${items[index]['price']}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          setState(() {
                            if (quantities[index] > 0) quantities[index]--;
                          });
                        },
                      ),
                      Text(
                        quantities[index].toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: () {
                          setState(() {
                            quantities[index]++;
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Selected Items: ${quantities.where((q) => q > 0 && isSelected[quantities.indexOf(q)]).length}',
                    ),
                    Text('Shop Fee: \$${shopFee.toStringAsFixed(2)}'),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal:'),
                    Text('\$${total.toStringAsFixed(2)}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
