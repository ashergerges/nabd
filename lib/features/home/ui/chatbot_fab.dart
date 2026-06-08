import 'package:flutter/material.dart';
import 'package:nabd/features/home/ui/company.dart';

import 'app_theme.dart';

class ChatbotFab extends StatefulWidget {
  const ChatbotFab({super.key});

  @override
  State<ChatbotFab> createState() => _ChatbotFabState();
}

class _ChatbotFabState extends State<ChatbotFab>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<_Message> _messages = [
    _Message(
        text: '👋 مرحباً! لدي 15 سؤالاً جاهزاً. اضغط على أي رقم للحصول على إجابة فورية.',
        isUser: false),
  ];

  final List<Map<String, String>> _quickQuestions = [
    {'num': '1', 'label': '1️⃣ أفضل شركة'},
    {'num': '2', 'label': '2️⃣ خلق القيمة'},
    {'num': '3', 'label': '3️⃣ أعلى عائد'},
    {'num': '4', 'label': '4️⃣ أقل عائد'},
    {'num': '5', 'label': '5️⃣ أكثر جاهزية'},
    {'num': '6', 'label': '6️⃣ أقل جاهزية'},
    {'num': '7', 'label': '7️⃣ شركات ضعيفة'},
    {'num': '8', 'label': '8️⃣ توزيع القطاعات'},
    {'num': '9', 'label': '9️⃣ إجمالي القيمة'},
    {'num': '10', 'label': '🔟 متوسط العائد'},
    {'num': '11', 'label': '1️⃣1️⃣ استراتيجيات'},
    {'num': '12', 'label': '1️⃣2️⃣ توقعات 2030'},
    {'num': '13', 'label': '1️⃣3️⃣ أكبر شركة'},
    {'num': '14', 'label': '1️⃣4️⃣ أصغر شركة'},
    {'num': '15', 'label': '1️⃣5️⃣ ملخص تنفيذي'},
  ];

  String _getAnswer(String num) {
    final companies = PortfolioData.companies;
    final totalBook = PortfolioData.totalBookValue;
    final totalFair = PortfolioData.totalFairValue;
    final totalCreated = PortfolioData.totalValueCreated;
    final sectors = PortfolioData.sectorStats;
    final sorted = [...companies]..sort((a, b) =>
        (b.readiness * b.valueCreated).compareTo(a.readiness * a.valueCreated));
    final best = sorted.first;
    final highROI = ([...companies]..sort((a, b) =>
            b.roi.compareTo(a.roi)))
        .first;
    final lowROI = ([...companies]..sort((a, b) => a.roi.compareTo(b.roi)))
        .first;
    final highReady =
        ([...companies]..sort((a, b) => b.readiness.compareTo(a.readiness)))
            .first;
    final lowReady =
        ([...companies]..sort((a, b) => a.readiness.compareTo(b.readiness)))
            .first;
    final largest =
        ([...companies]..sort((a, b) => b.fairValue.compareTo(a.fairValue)))
            .first;
    final smallest =
        ([...companies]..sort((a, b) => a.fairValue.compareTo(b.fairValue)))
            .first;
    final weak =
        companies.where((c) => c.readiness < 40 || c.valueCreated < 3).toList();
    final avgROI =
        (companies.fold(0.0, (s, c) => s + c.roi) / companies.length)
            .toStringAsFixed(1);
    final forecast2030 = (totalFair * 1.18 * 1.18 * 1.18 * 1.18).toInt();

    switch (num) {
      case '1':
        return '🏆 أفضل شركة للتخارج: ${best.name}\nجاهزية: ${best.readiness}% | خلق قيمة: ${best.valueCreated.toInt()}M\$ | العائد: ${best.roi.toStringAsFixed(1)}%\nاستراتيجية: ${best.exitStrategy} - ${best.exitTiming}';
      case '2':
        return '💰 إجمالي خلق القيمة: ${totalCreated.toInt()} مليون \$\nمن ${totalBook.toInt()}M\$ إلى ${totalFair.toInt()}M\$ (نمو ${((totalCreated / totalBook) * 100).toStringAsFixed(1)}%)';
      case '3':
        return '🏆 أعلى عائد: ${highROI.name}\nالعائد: ${highROI.roi.toStringAsFixed(1)}% | خلق قيمة: ${highROI.valueCreated.toInt()}M\$ | جاهزية: ${highROI.readiness}%';
      case '4':
        return '📉 أقل عائد: ${lowROI.name}\nالعائد: ${lowROI.roi.toStringAsFixed(1)}% | خلق قيمة: ${lowROI.valueCreated.toInt()}M\$ | جاهزية: ${lowROI.readiness}%';
      case '5':
        return '✅ أكثر شركة جاهزية: ${highReady.name}\nجاهزية: ${highReady.readiness}% | العائد: ${highReady.roi.toStringAsFixed(1)}%';
      case '6':
        return '⚠️ أقل شركة جاهزية: ${lowReady.name}\nجاهزية: ${lowReady.readiness}% | العائد: ${lowReady.roi.toStringAsFixed(1)}%';
      case '7':
        return weak.isEmpty
            ? '✅ لا توجد شركات ضعيفة حالياً'
            : '⚠️ الشركات التي تحتاج تدخل (${weak.length}):\n${weak.map((c) => '• ${c.name} (جاهزية ${c.readiness}%)').join('\n')}';
      case '8':
        return '📊 توزيع القطاعات:\n${sectors.entries.map((e) => '• ${e.key}: ${e.value['count']} شركات (${(((e.value['fairValue'] as double) / totalFair) * 100).toStringAsFixed(1)}%)').join('\n')}';
      case '9':
        return '💰 إجمالي قيمة المحفظة:\n• دفترية: ${totalBook.toInt()}M\$\n• عادلة: ${totalFair.toInt()}M\$\n• خلق قيمة: +${totalCreated.toInt()}M\$\n• عدد الشركات: ${companies.length}';
      case '10':
        return '📊 متوسط العائد: $avgROI%\n• أفضل: ${highROI.roi.toStringAsFixed(1)}% (${highROI.name})\n• أسوأ: ${lowROI.roi.toStringAsFixed(1)}% (${lowROI.name})';
      case '11':
        return '📋 استراتيجيات التخارج:\n${companies.map((c) => '• ${c.name}: ${c.exitStrategy} (${c.exitTiming})').join('\n')}';
      case '12':
        return '📈 توقعات 2030: ${forecast2030}M\$ (نمو سنوي 18%)\n2026: ${totalFair.toInt()}M\$ → 2030: ${forecast2030}M\$';
      case '13':
        return '🏢 أكبر شركة: ${largest.name}\nالقيمة: ${largest.fairValue.toInt()}M\$ | العائد: ${largest.roi.toStringAsFixed(1)}%';
      case '14':
        return '🏢 أصغر شركة: ${smallest.name}\nالقيمة: ${smallest.fairValue.toInt()}M\$ | العائد: ${smallest.roi.toStringAsFixed(1)}%';
      case '15':
        return '📊 ملخص تنفيذي:\n• ${companies.length} شركة | قيمة: ${totalFair.toInt()}M\$\n• خلق قيمة: +${totalCreated.toInt()}M\$ (${((totalCreated / totalBook) * 100).toStringAsFixed(1)}%)\n• أفضل شركة: ${best.name}\n• الشركات الجاهزة: ${companies.where((c) => c.readiness >= 70).length}';
      default:
        return 'اختر رقماً من 1 إلى 15';
    }
  }

  void _sendQuestion(String num, String label) {
    setState(() {
      _messages.add(_Message(text: label, isUser: true));
    });
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _messages.add(_Message(text: _getAnswer(num), isUser: false));
      });
      _scrollToBottom();
    });
  }

  void _sendText() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(_Message(text: text, isUser: true));
    });
    _controller.clear();
    // Try to detect intent
    String ans = '📌 اضغط على الأرقام 1-15 للأسئلة الجاهزة';
    if (text.contains('أفضل شركة')) ans = _getAnswer('1');
    else if (text.contains('خلق القيمة')) ans = _getAnswer('2');
    else if (text.contains('أعلى عائد')) ans = _getAnswer('3');
    else if (text.contains('أقل عائد')) ans = _getAnswer('4');
    else if (text.contains('جاهزية')) ans = _getAnswer('5');
    else if (text.contains('ضعيفة')) ans = _getAnswer('7');
    else if (text.contains('توزيع')) ans = _getAnswer('8');
    else if (text.contains('2030') || text.contains('توقعات')) ans = _getAnswer('12');
    else if (text.contains('ملخص')) ans = _getAnswer('15');

    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        _messages.add(_Message(text: ans, isUser: false));
      });
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        // Chat window
        if (_isOpen)
          Positioned(
            bottom: 80,
            left: 16,
            right: 16,
            child: Container(
              height: 480,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: AppRadius.card,
                border: Border.all(color: const Color(0xFFE2E8F0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Header
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF0A2A3A), AppColors.primary],
                      ),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Icon(Icons.smart_toy_outlined,
                                color: Colors.white, size: 18),
                            SizedBox(width: 8),
                            Text(
                              'المستشار الاستثماري - 15 سؤالاً',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => setState(() => _isOpen = false),
                          child: const Icon(Icons.close,
                              color: Colors.white, size: 20),
                        ),
                      ],
                    ),
                  ),
                  // Quick questions
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: const Color(0xFFF1F5F9),
                    child: SizedBox(
                      height: 80,
                      child: SingleChildScrollView(
                        child: Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: _quickQuestions
                              .map((q) => GestureDetector(
                                    onTap: () =>
                                        _sendQuestion(q['num']!, q['label']!),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: AppRadius.chip,
                                        border: Border.all(
                                            color: const Color(0xFFCBD5E1)),
                                      ),
                                      child: Text(
                                        q['label']!,
                                        style: const TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  // Messages
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(10),
                      itemCount: _messages.length,
                      itemBuilder: (_, i) {
                        final msg = _messages[i];
                        return Align(
                          alignment: msg.isUser
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.7,
                            ),
                            decoration: BoxDecoration(
                              color: msg.isUser
                                  ? AppColors.primary
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(16).copyWith(
                                bottomLeft: msg.isUser
                                    ? const Radius.circular(4)
                                    : const Radius.circular(16),
                                bottomRight: msg.isUser
                                    ? const Radius.circular(16)
                                    : const Radius.circular(4),
                              ),
                              border: msg.isUser
                                  ? null
                                  : Border.all(
                                      color: const Color(0xFFE2E8F0)),
                            ),
                            child: Text(
                              msg.text,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: msg.isUser
                                    ? Colors.white
                                    : AppColors.textDark,
                                fontSize: 12,
                                height: 1.5,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Input
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(color: Color(0xFFE2E8F0))),
                    ),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              hintText: 'أو اكتب سؤالك...',
                              hintTextDirection: TextDirection.rtl,
                              border: OutlineInputBorder(
                                borderRadius: AppRadius.button,
                                borderSide: const BorderSide(
                                    color: Color(0xFFCBD5E1)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: AppRadius.button,
                                borderSide: const BorderSide(
                                    color: Color(0xFFCBD5E1)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: AppRadius.button,
                                borderSide: const BorderSide(
                                    color: AppColors.primary),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              isDense: true,
                            ),
                            style: const TextStyle(fontSize: 13),
                            onSubmitted: (_) => _sendText(),
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: _sendText,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.send,
                                color: Colors.white, size: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        // FAB
        Positioned(
          bottom: 16,
          left: 16,
          child: GestureDetector(
            onTap: () => setState(() => _isOpen = !_isOpen),
            child: Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x441E5A8A),
                    blurRadius: 16,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Icon(
                _isOpen ? Icons.close : Icons.chat_bubble_outline,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Message {
  final String text;
  final bool isUser;
  _Message({required this.text, required this.isUser});
}
