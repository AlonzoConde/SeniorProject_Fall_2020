class Task {
  String name;
  String location;
  String description;
  String date;
  String progress;
  String assignedTo;

  Task(this.name, this.date, this.description, this.location, this.assignedTo,
      this.progress);

  Task.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        location = json["location"],
        description = json["description"],
        date = json["date"],
        progress = json["progress"],
        assignedTo = json["assignedTo"];

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "location": location,
      "description": description,
      "date": date,
      "progress": progress,
      "String assignedTo": assignedTo
    };
  }
}
