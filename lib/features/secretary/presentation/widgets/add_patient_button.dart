import 'package:flutter/material.dart';

class AddPatientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? semanticsLabel;

  const AddPatientButton({
    super.key,
    required this.onPressed,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E96BE),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add,
              size: 20,
              semanticLabel: 'Ajouter',
            ),
            const SizedBox(width: 8),
            const Text(
              'Ajouter un nouveau patient',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 