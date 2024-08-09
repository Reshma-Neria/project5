import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.grey[200], // Set background color to match description section
      body: Column(
        children: [
          Stack(
            children: [
              // Image section with circular bottom-left corner
              Center(
                child: ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.9, // 90% of screen width
                    height: MediaQuery.of(context).size.height *
                        0.4, // Adjust height as needed
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/img.png'), // Update with the correct image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20.0,
                left: 10.0,
                child: IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: const Color.fromARGB(255, 29, 28, 28), size: 30.0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                top: 20.0,
                left: MediaQuery.of(context).size.width / 2 - 30.0,
                child: Text(
                  'Product',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 20, 20, 20),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 20.0,
                right: 10.0,
                child: IconButton(
                  icon: Icon(Icons.shopping_cart,
                      color: const Color.fromARGB(255, 15, 15, 15), size: 30.0),
                  onPressed: () {
                    // Handle shopping cart action
                  },
                ),
              ),
            ],
          ),
          // Red love icon in line with the separation
          Container(
            color: Colors
                .grey[200], // Background color to match the description section
            child: Row(
              children: [
                Expanded(child: Container()), // Spacer
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 40.0, // Adjust size as needed
                ),
                SizedBox(width: 16.0), // Space between the icon and description
              ],
            ),
          ),
          // Description section
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Title',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Price=..... Condition=.....',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black, // Updated property name
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      icon: Icon(Icons.add, color: Colors.white),
                      label: Text('Add to cart',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        // Handle add to cart action
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom clipper for creating a circular cut-out on the bottom left
class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(
        size.width, size.height - 50); // Adjust the radius of the circle
    path.arcToPoint(
      Offset(size.width - 50, size.height),
      radius: Radius.circular(50),
    );
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
