abstract class Groupable {
  DateTime get deadline;
  int get priority;
  bool get done;
}

abstract class Sortable {
  void sort();
}

abstract class Storable {
  void saveState();
}

abstract class Serializable {
  Map<String, dynamic> toJson();
}