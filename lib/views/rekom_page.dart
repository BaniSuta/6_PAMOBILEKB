import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:super_car/provider/controller.dart';
import 'package:super_car/views/detail_page.dart';
import 'package:super_car/widget/card_car.dart';

class RekomPage extends StatefulWidget {
  const RekomPage({super.key});

  @override
  State<RekomPage> createState() => _RekomPageState();
}

class _RekomPageState extends State<RekomPage> {
  @override
  Widget build(BuildContext context) {
    final predictionProvider = Provider.of<PredictionProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFFFEFEFE),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Rekomendasi Mobil",
          style: GoogleFonts.abrilFatface(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFFEFEFE),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: predictionProvider.predictionMessages.length,
        itemBuilder: (context, index) {
          late final List<String> predictionItems =
              predictionProvider.predictionMessages.toList();
          final item = predictionItems[index];

          return FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('cars')
                  .where('nama', isEqualTo: item)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
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
                    return InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(nama: dataItem['nama'])),
                        );
                      },
                      child: CardCar(
                          foto: dataItem['foto'],
                          nama: dataItem['nama'],
                          harga: dataItem['harga']),
                    );
                  }).toList(),
                );
              });
        },
      ),
    );
  }
}
