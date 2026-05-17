class SelectedGuest {
  final String name;
  final String phone;

  const SelectedGuest({
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
    };
  }

  factory SelectedGuest.fromJson(Map<String, dynamic> json) {
    return SelectedGuest(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  @override
  String toString() => '$name|$phone';
}