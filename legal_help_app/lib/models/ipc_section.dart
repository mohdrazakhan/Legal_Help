// lib/models/ipc_section.dart

class IpcSection {
  final String section;
  final String sectionTitle;
  final String sectionDesc;

  const IpcSection({
    required this.section,
    required this.sectionTitle,
    required this.sectionDesc,
  });

  // This new version checks for multiple possible key names from the JSON.
  factory IpcSection.fromJson(Map<String, dynamic> json) {
    return IpcSection(
      // Try to find the section number under 'Section', then 'section'.
      section: (json['Section'] ?? json['section'] ?? 'N/A').toString(),

      // Try to find the title under 'section_title', then 'title'.
      sectionTitle: (json['section_title'] ?? json['title'] ?? 'No Title')
          .toString(),

      // Try to find the description under 'section_desc', then 'description'.
      sectionDesc:
          (json['section_desc'] ?? json['description'] ?? 'No Description')
              .toString(),
    );
  }
}
