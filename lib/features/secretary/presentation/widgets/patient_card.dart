import 'package:flutter/material.dart';
import 'package:foresight_care/domain/entities/patient.dart';
import 'package:intl/intl.dart';

class PatientCard extends StatelessWidget {
  final Patient? patient;
  final VoidCallback? onDetailsPressed;
  final String? semanticsLabel;

  const PatientCard({
    super.key,
    this.patient,
    this.onDetailsPressed,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    if (patient == null) {
      return _buildPlaceholderCard('Patient data not available');
    }

    final safePatient = patient!;
    
    final nomPatient = _getSafeString(safePatient.nomPatient);
    final prenPatient = _getSafeString(safePatient.prenPatient);
    
    if (nomPatient.isEmpty && prenPatient.isEmpty) {
      return _buildPlaceholderCard('Patient name missing');
    }
    
    return Semantics(
      label: semanticsLabel ?? _buildDefaultSemanticsLabel(safePatient),
      child: Container(
        constraints: const BoxConstraints(minHeight: 98),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 8,
              color: const Color(0xFFD6D6D6).withOpacity(0.15),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              _buildAvatar(safePatient),
              
              const SizedBox(width: 16),
              
              Expanded(
                child: _buildPatientInfo(safePatient),
              ),
              
              const SizedBox(width: 12),
              
              _buildDetailsButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholderCard(String message) {
    return Container(
      height: 98,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_outline,
              size: 32,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontFamily: 'League Spartan',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(Patient patient) {
    final initials = _getPatientInitials(patient);
    
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF13A4AB),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          initials,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
          semanticsLabel: 'Initiales du patient: $initials',
        ),
      ),
    );
  }

  Widget _buildPatientInfo(Patient patient) {
    final displayName = _getDisplayName(patient);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          displayName,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.2,
            color: Color(0xFF103459),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          semanticsLabel: 'Nom du patient: $displayName',
        ),
        
        const SizedBox(height: 4),
        
        _buildPatientDetailsRow(patient),
      ],
    );
  }

  Widget _buildPatientDetailsRow(Patient patient) {
    return Row(
      children: [
        _buildInfoItem(
          Icons.cake_outlined,
          _getAgeGroup(patient),
          'Tranche d\'âge',
        ),
        
        const SizedBox(width: 16),
        
        Expanded(
          child: _buildSecondaryInfo(patient),
        ),
      ],
    );
  }

  Widget _buildSecondaryInfo(Patient patient) {
    if (patient.telephone != null && patient.telephone! > 0) {
      return _buildInfoItem(
        Icons.phone_outlined,
        _formatPhoneNumber(patient.telephone!),
        'Téléphone',
      );
    } else if (patient.cinCnam != null && patient.cinCnam! > 0) {
      return _buildInfoItem(
        Icons.badge_outlined,
        '${patient.cinCnam}',
        'CIN/CNAM',
      );
    } else if (patient.numDossier != null && patient.numDossier!.isNotEmpty) {
      return _buildInfoItem(
        Icons.folder_outlined,
        'Dossier: ${patient.numDossier}',
        'Numéro de dossier',
      );
    } else {
      return _buildInfoItem(
        Icons.info_outline,
        'Infos manquantes',
        'Informations de contact manquantes',
      );
    }
  }

  Widget _buildInfoItem(IconData icon, String text, String semanticsDescription) {
    return Flexible(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 12,
            color: const Color(0xFF13A4AB),
            semanticLabel: semanticsDescription,
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                height: 1.4,
                color: Color(0xFF717171),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              semanticsLabel: '$semanticsDescription: $text',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsButton() {
    return SizedBox(
      height: 32,
      child: ElevatedButton(
        onPressed: onDetailsPressed ?? () {
          debugPrint('Patient details pressed but no callback provided');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF13A4AB),
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: const Text(
          'Détails',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  String _getSafeString(String? value) {
    return value?.trim() ?? '';
  }

  String _getDisplayName(Patient patient) {
    final nom = _getSafeString(patient.nomPatient);
    final prenom = _getSafeString(patient.prenPatient);
    
    if (nom.isNotEmpty && prenom.isNotEmpty) {
      return '$prenom $nom';
    } else if (nom.isNotEmpty) {
      return nom;
    } else if (prenom.isNotEmpty) {
      return prenom;
    } else {
      return 'Patient sans nom';
    }
  }

  String _getPatientInitials(Patient patient) {
    final nom = _getSafeString(patient.nomPatient);
    final prenom = _getSafeString(patient.prenPatient);
    
    final nomInitial = nom.isNotEmpty ? nom[0].toUpperCase() : '';
    final prenomInitial = prenom.isNotEmpty ? prenom[0].toUpperCase() : '';
    
    if (nomInitial.isNotEmpty && prenomInitial.isNotEmpty) {
      return '$prenomInitial$nomInitial';
    } else if (nomInitial.isNotEmpty) {
      return nomInitial;
    } else if (prenomInitial.isNotEmpty) {
      return prenomInitial;
    } else {
      return '??';
    }
  }

  String _getAgeGroup(Patient patient) {
    try {
      switch (patient.ageInt) {
        case AgeRange.age18to29:
          return '18-29 ans';
        case AgeRange.age30to39:
          return '30-39 ans';
        case AgeRange.age40to49:
          return '40-49 ans';
        case AgeRange.age50to59:
          return '50-59 ans';
        case AgeRange.age60Plus:
          return '60+ ans';
        default:
          return 'Âge non défini';
      }
    } catch (e) {
      return 'Âge inconnu';
    }
  }

  String _formatPhoneNumber(int phone) {
    try {
      final phoneStr = phone.toString();
      if (phoneStr.length == 8) {
        return '${phoneStr.substring(0, 2)} ${phoneStr.substring(2, 4)} ${phoneStr.substring(4, 6)} ${phoneStr.substring(6, 8)}';
      } else if (phoneStr.length == 10) {
        return '${phoneStr.substring(0, 3)} ${phoneStr.substring(3, 6)} ${phoneStr.substring(6, 10)}';
      } else {
        return phoneStr;
      }
    } catch (e) {
      return phone.toString();
    }
  }

  String _buildDefaultSemanticsLabel(Patient patient) {
    final displayName = _getDisplayName(patient);
    final ageGroup = _getAgeGroup(patient);
    return 'Patient $displayName, $ageGroup';
  }
} 