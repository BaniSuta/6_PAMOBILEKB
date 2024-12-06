import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCar extends StatelessWidget {
  final String foto;
  final String nama;
  final int harga;

  const CardCar({
    super.key,
    required this.foto,
    required this.nama,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            foto,
            fit: BoxFit.fill,
          ),
          Text(
            nama,
            style: GoogleFonts.merriweather(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Harga: Rp. $harga',
              style: GoogleFonts.merriweather(
                fontSize: 14,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
