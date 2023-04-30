// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:photoreboot/src/features/home/data/enums/document_group_category.dart';
import 'package:photoreboot/src/features/home/data/models/document_infos.dart';

class DocumentsGroup {
  final DocumentsGroupInfos infos;
  final List<String> documents;
  DocumentsGroup({
    required this.infos,
    required this.documents,
  });
}

List<DocumentsGroup> documentsGroups = [
  DocumentsGroup(
    documents: [
      'birth_certificate.pdf',
      'proof_of_address.pdf',
      'criminal_record.pdf',
      'medical_certificate.pdf',
      'nationality_certificate.pdf',
      'residence_certificate.pdf',
      'school_certificate.pdf',
      'work_certificate.pdf',
      'identity_card_copy.pdf',
    ],
    infos: DocumentsGroupInfos(
      category: DocgroupCategory.exams,
      name: 'Exams Documents',
      filesCount: 9,
      summary: 'Documents for public service exams application',
    ),
  ),
  DocumentsGroup(
    documents: [
      'work_contract.pdf',
      'pay_slips.pdf',
      'training_certificates.pdf',
      'recommendation_letters.pdf',
      'performance_reviews.pdf',
    ],
    infos: DocumentsGroupInfos(
      category: DocgroupCategory.work,
      name: 'Work Documents',
      filesCount: 5,
      summary: 'Documents related to work and employment',
    ),
  ),
  DocumentsGroup(
    documents: [
      'school_transcripts.pdf',
      'diplomas.pdf',
      'test_scores.pdf',
      'recommendation_letters.pdf',
    ],
    infos: DocumentsGroupInfos(
      category: DocgroupCategory.school,
      name: 'School Documents',
      filesCount: 4,
      summary: 'Documents related to education and school',
    ),
  ),
  DocumentsGroup(
    documents: [
      'medical_reports.pdf',
      'prescriptions.pdf',
      'vaccination_records.pdf',
      'insurance_card_copy.pdf',
      'medical_insurance.pdf',
    ],
    infos: DocumentsGroupInfos(
      category: DocgroupCategory.medical,
      name: 'Medical Documents',
      filesCount: 5,
      summary: 'Documents related to health and medical care',
    ),
  ),
  DocumentsGroup(
    documents: [
      'passport.pdf',
      'visa.pdf',
      'travel_insurance.pdf',
      'travel_itinerary.pdf',
    ],
    infos: DocumentsGroupInfos(
      category: DocgroupCategory.travel,
      name: 'Travel Documents',
      filesCount: 4,
      summary: 'Documents related to travel and tourism',
    ),
  ),
  DocumentsGroup(
    documents: [
      'marriage_certificate.pdf',
      'divorce_certificate.pdf',
      'death_certificate.pdf',
      'will.pdf',
      'power_of_attorney.pdf',
    ],
    infos: DocumentsGroupInfos(
      category: DocgroupCategory.civil,
      name: 'Civil Documents',
      filesCount: 5,
      summary: 'Documents related to civil status and legal affairs',
    ),
  ),
];
