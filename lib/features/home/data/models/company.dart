class Company {
  final String name;
  final String sector;
  final double bookValue;
  final double fairValue;
  final double expectedExit;
  final String exitStrategy;
  final String exitTiming;
  final int readiness;
  final int ownership;

  Company({
    required this.name,
    required this.sector,
    required this.bookValue,
    required this.fairValue,
    required this.expectedExit,
    required this.exitStrategy,
    required this.exitTiming,
    required this.readiness,
    required this.ownership,
  });

  double get valueCreated => fairValue - bookValue;
  double get roi => (valueCreated / bookValue) * 100;

  RecommendationType get recommendationType {
    if (readiness >= 80 && valueCreated >= 10) return RecommendationType.positive;
    if (readiness >= 70 && valueCreated >= 5) return RecommendationType.positive;
    if (valueCreated >= 10 && readiness >= 50) return RecommendationType.positive;
    if (readiness >= 50 && readiness < 70) return RecommendationType.warning;
    if (readiness < 40 && valueCreated < 3) return RecommendationType.negative;
    return RecommendationType.warning;
  }

  String get recommendationText {
    if (readiness >= 80 && valueCreated >= 10) return '✅ فرصة مثالية للتخارج';
    if (readiness >= 70 && valueCreated >= 5) return '🟢 جاهزية عالية';
    if (valueCreated >= 10 && readiness >= 50) return '💰 خلق قيمة ممتاز';
    if (readiness >= 50 && readiness < 70) return '🟡 يحتاج تحسين';
    if (readiness < 40 && valueCreated < 3) return '🔴 أداء ضعيف';
    return '📊 أداء مستقر';
  }

  String get recommendationAction {
    if (readiness >= 80 && valueCreated >= 10) return 'ابدأ الإجراءات فوراً';
    if (readiness >= 70 && valueCreated >= 5) return 'تواصل مع المستثمرين';
    if (valueCreated >= 10 && readiness >= 50) return 'استغل الزخم الحالي';
    if (readiness >= 50 && readiness < 70) return 'حسن البيانات المالية';
    if (readiness < 40 && valueCreated < 3) return 'اجتماع عاجل مع الإدارة';
    return 'متابعة دورية';
  }
}

enum RecommendationType { positive, warning, negative }

class PortfolioData {
  static final List<Company> companies = [
    Company(
      name: 'مجموعة غازي الراجحي القابضة',
      sector: 'قابضة',
      bookValue: 50,
      fairValue: 78,
      expectedExit: 95,
      exitStrategy: 'IPO + توزيع أرباح',
      exitTiming: '2027',
      readiness: 65,
      ownership: 28,
    ),
    Company(
      name: 'شركة هميم (تقنية)',
      sector: 'تقنية',
      bookValue: 12,
      fairValue: 18,
      expectedExit: 25,
      exitStrategy: 'IPO',
      exitTiming: '2027',
      readiness: 45,
      ownership: 25,
    ),
    Company(
      name: 'مستشفى المنار (رعاية)',
      sector: 'رعاية',
      bookValue: 10,
      fairValue: 22,
      expectedExit: 30,
      exitStrategy: 'بيع استراتيجي',
      exitTiming: '2026-Q4',
      readiness: 72,
      ownership: 30,
    ),
    Company(
      name: 'أجيال للعقار',
      sector: 'عقار',
      bookValue: 8,
      fairValue: 10,
      expectedExit: 15,
      exitStrategy: 'إعادة تمويل',
      exitTiming: '2028',
      readiness: 30,
      ownership: 20,
    ),
    Company(
      name: 'طاقة خضراء',
      sector: 'طاقة',
      bookValue: 5,
      fairValue: 6,
      expectedExit: 12,
      exitStrategy: 'استحواذ صناعي',
      exitTiming: '2026',
      readiness: 88,
      ownership: 15,
    ),
    Company(
      name: 'ابتكارات التقنية',
      sector: 'تقنية',
      bookValue: 6,
      fairValue: 9,
      expectedExit: 20,
      exitStrategy: 'IPO',
      exitTiming: '2027',
      readiness: 55,
      ownership: 22,
    ),
    Company(
      name: 'رعاية المتقدمة',
      sector: 'رعاية',
      bookValue: 3,
      fairValue: 5,
      expectedExit: 10,
      exitStrategy: 'بيع استراتيجي',
      exitTiming: '2026',
      readiness: 65,
      ownership: 18,
    ),
    Company(
      name: 'مدينة الغذاء',
      sector: 'أغذية',
      bookValue: 4,
      fairValue: 6,
      expectedExit: 11,
      exitStrategy: 'بيع استراتيجي',
      exitTiming: '2027',
      readiness: 50,
      ownership: 12,
    ),
  ];

  static double get totalBookValue =>
      companies.fold(0, (s, c) => s + c.bookValue);
  static double get totalFairValue =>
      companies.fold(0, (s, c) => s + c.fairValue);
  static double get totalValueCreated => totalFairValue - totalBookValue;
  static double get totalExpectedExit =>
      companies.fold(0, (s, c) => s + c.expectedExit);

  static Map<String, Map<String, dynamic>> get sectorStats {
    final map = <String, Map<String, dynamic>>{};
    for (final c in companies) {
      map.putIfAbsent(
          c.sector, () => {'count': 0, 'bookValue': 0.0, 'fairValue': 0.0});
      map[c.sector]!['count'] = (map[c.sector]!['count'] as int) + 1;
      map[c.sector]!['bookValue'] =
          (map[c.sector]!['bookValue'] as double) + c.bookValue;
      map[c.sector]!['fairValue'] =
          (map[c.sector]!['fairValue'] as double) + c.fairValue;
    }
    return map;
  }

  static List<Company> get bestExitCompany => [...companies]
    ..sort((a, b) =>
        (b.readiness * b.valueCreated).compareTo(a.readiness * a.valueCreated))
    ..first;

  static double get avgROI =>
      companies.fold(0.0, (s, c) => s + c.roi) / companies.length;

  static double forecastYear(int yearsFromNow) =>
      totalFairValue * (1.18 * yearsFromNow);
}
