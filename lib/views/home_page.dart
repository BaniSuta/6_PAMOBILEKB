import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:super_car/provider/controller.dart';
import 'package:super_car/views/category_page.dart';
import 'package:super_car/widget/rekom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Call predict() only once when the widget is first created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final predictionProvider =
          Provider.of<PredictionProvider>(context, listen: false);
      predictionProvider.predict();
    });
  }

  @override
  Widget build(BuildContext context) {
    final predictionProvider = Provider.of<PredictionProvider>(context);

    final TextEditingController _searchController = TextEditingController();

    final List<Map<String, String>> Merek = [
      {
        'image': 'assets/Merek/bmw.png',
        'teks': 'BMW',
      },
      {
        'image': 'assets/Merek/chevrolet.jpg',
        'teks': 'Chevrolet',
      },
      {
        'image': 'assets/Merek/daihatsu.png',
        'teks': 'Daihatsu',
      },
      {
        'image': 'assets/Merek/ford.jpg',
        'teks': 'Ford',
      },
      {
        'image': 'assets/Merek/honda.png',
        'teks': 'Honda',
      },
      {
        'image': 'assets/Merek/hyundai.jpg',
        'teks': 'Hyundai',
      },
      {
        'image': 'assets/Merek/isuzu.png',
        'teks': 'Isuzu',
      },
      {
        'image': 'assets/Merek/kia.jpg',
        'teks': 'Kia',
      },
      {
        'image': 'assets/Merek/mazda.png',
        'teks': 'Mazda',
      },
      {
        'image': 'assets/Merek/mercedes-benz.png',
        'teks': 'Mercedes-Benz',
      },
      {
        'image': 'assets/Merek/mitsubishi.png',
        'teks': 'Mitsubishi',
      },
      {
        'image': 'assets/Merek/nissan.png',
        'teks': 'Nissan',
      },
      {
        'image': 'assets/Merek/porsche.png',
        'teks': 'Porsche',
      },
      {
        'image': 'assets/Merek/renault.jpg',
        'teks': 'Renault',
      },
      {
        'image': 'assets/Merek/suziki.png',
        'teks': 'Suzuki',
      },
      {
        'image': 'assets/Merek/toyota.png',
        'teks': 'Toyota',
      },
      {
        'image': 'assets/Merek/volkswagen.png',
        'teks': 'Volkswagen',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xfffefefe),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelStyle: GoogleFonts.merriweather(),
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0), // Border radius
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0), // Border radius
                  borderSide:
                      const BorderSide(color: Color(0xffD4F6FF), width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0), // Border radius
                  borderSide:
                      const BorderSide(color: Color(0xffC6E7FF), width: 2.0),
                ),
              ),
            ),
          ),
          CarouselSlider(
            items: [
              SizedBox(
                width: 350,
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/carousel1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 350,
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/carousel2.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 350,
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/carousel3.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              height: 250,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              enlargeCenterPage: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Merek Mobil",
              style: GoogleFonts.abrilFatface(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var merek in Merek)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CategoryPage(merek: merek['teks']!),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                merek['image']!,
                                fit: BoxFit.fill,
                                width: 80,
                                height: 80,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rekomendasi Mobil",
                  style: GoogleFonts.abrilFatface(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/rekom');
                  },
                  child: Text(
                    "See All",
                    style: GoogleFonts.abrilFatface(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: predictionProvider.predictionMessages
                    .take(5) // Limit to first 5 items
                    .map((item) {
                  return FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('cars')
                          .where('nama', isEqualTo: item)
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Text('No data found');
                        }

                        final data = snapshot.data!.docs.map((doc) {
                          return {
                            'nama': doc['nama'],
                            'harga': doc['harga'],
                            'foto': doc['foto'],
                          };
                        }).toList();

                        return Column(
                          children: data.map<Widget>((dataItem) {
                            return RekomCard(
                                foto: dataItem['foto'],
                                nama: dataItem['nama'],
                                harga: dataItem['harga']);
                          }).toList(),
                        );
                      });
                }).toList(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: GoogleFonts.merriweather(),
        unselectedLabelStyle: GoogleFonts.merriweather(),
        onTap: (value) {
          if (value == 2) {
            Navigator.pushNamed(context, "/profile");
          } else if (value == 1) {
            Navigator.pushNamed(context, "/cars");
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: "Cars",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
