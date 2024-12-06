import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RekomCard extends StatelessWidget {
  final String foto;
  final String nama;
  final int harga;

  const RekomCard({
    super.key,
    required this.foto,
    required this.nama,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Container(
        height: 300,
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffC6E7FF),
        ),
        child: Column(
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
      ),
    );
  }
}
