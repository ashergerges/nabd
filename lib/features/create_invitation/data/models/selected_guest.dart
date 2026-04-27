class SelectedGuest {
  final String name;
  final String phone;

  const SelectedGuest({required this.name, required this.phone});

  @override
  String toString() => '$name|$phone';
}
