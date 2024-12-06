import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_car/widget/custom_card.dart';

class DetailPage extends StatelessWidget {
  final String nama;

  const DetailPage({
    super.key,
    required this.nama,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffefefe),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/cars");
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          "Detail Mobil",
          style: GoogleFonts.abrilFatface(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xfffefefe),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('cars') // Ganti dengan nama koleksi Anda
            .where('nama',
                isEqualTo: nama) // Ganti dengan field dan nilai yang sesuai
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No data found'));
          }

          // Menampilkan data dalam ListView
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var doc = snapshot.data!.docs[index];
              return Column(
                children: [
                  Image.asset(
                    doc['foto'],
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 15,
                    ),
                    child: Text(
                      doc['nama'],
                      style: GoogleFonts.merriweather(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      "Rp. ${doc['harga']}",
                      style: GoogleFonts.merriweather(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 15,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(),
                        left: BorderSide(),
                        right: BorderSide(),
                        bottom: BorderSide(),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 5,
                            top: 10,
                          ),
                          child: Text(
                            "Deskripsi Mobil",
                            style: GoogleFonts.merriweather(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomCard(
                                  text: doc['jenis bahan bakar'],
                                  title: "Bahan Bakar",
                                ),
                                CustomCard(
                                  text: doc['cc mesin'].toString(),
                                  title: "CC Mesin",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomCard(
                                  text: doc['transmisi'],
                                  title: "Transmisi",
                                ),
                                CustomCard(
                                  text: doc['jumlah kursi'].toString(),
                                  title: "Jumlah Kursi",
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 10,
                            bottom: 10,
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tipe Mobil",
                                    style: GoogleFonts.merriweather(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "Horsepower",
                                    style: GoogleFonts.merriweather(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "Torsi",
                                    style: GoogleFonts.merriweather(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "Tipe Chassis",
                                    style: GoogleFonts.merriweather(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "Merek Mobil",
                                    style: GoogleFonts.merriweather(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ":  ${doc['tipe mobil']}",
                                    style: GoogleFonts.merriweather(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    ":  ${doc['horsepower']} Hp",
                                    style: GoogleFonts.merriweather(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    ":  ${doc['torsi']} Nm",
                                    style: GoogleFonts.merriweather(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    ":  ${doc['tipe chassis']}",
                                    style: GoogleFonts.merriweather(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    ":  ${doc['merek mobil']}",
                                    style: GoogleFonts.merriweather(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
