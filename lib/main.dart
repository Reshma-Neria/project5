import 'package:flutter/material.dart';
import 'product_page.dart';
import 'third_page.dart'; // Import the third page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> images = [
    {
      'url': 'assets/images/img.png',
      'description': 'Image 1 Description about this image bra bra bra'
    },
    {
      'url': 'assets/images/img (1).jpeg',
      'description': 'Image 2 Description about this image bra bra bra'
    },
    {
      'url': 'assets/images/img (2).jpeg',
      'description': 'Image 3 Description about this image bar bra bra'
    },
    {
      'url': 'assets/images/img (3).png',
      'description': 'Image 4 Description about this photo brah brah '
    },
    {
      'url': 'assets/images/img (4).png',
      'description': 'Image 5 Description about this photo bra bra bra'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 252, 248, 248),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.menu,
                  color: Color.fromARGB(255, 12, 12, 12), size: 30.0),
              onPressed: () {
                // Handle menu action
              },
            ),
            IconButton(
              icon: Icon(Icons.person,
                  color: Color.fromARGB(255, 17, 17, 17), size: 30.0),
              onPressed: () {
                // Handle authentication/login action
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.black54),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (value) {
                      // Handle search input
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart,
                      color: Color.fromARGB(255, 19, 18, 18), size: 30.0),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Explore',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 350,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      // Navigate to ProductPage only if the first image is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductPage()),
                      );
                    }
                  },
                  child: Container(
                    width: 200,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 229, 230, 231),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 4.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      image: AssetImage(images[index]['url']!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 8.0),
                                child: Text(
                                  images[index]['description']!,
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 20, 20, 20),
                                    fontSize: 16.0,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Spacer(), // Pushes the "Best Selling" section to the bottom
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select Items',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigate to ThirdPage when the image is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThirdPage()),
              );
            },
            child: Container(
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 193, 194, 196),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Container(
                    width: 150, // Set desired image width
                    height: 150, // Set desired image height
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/img (5).png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Description Title',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 20, 20, 20),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Description about the image. This provides some context or information about the image shown on the left.',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: const Color.fromARGB(255, 20, 20, 20),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
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
