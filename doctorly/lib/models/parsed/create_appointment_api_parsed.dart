class CreateAppointmentApiParsed {
  Patient? patient;
  Timings? timings;
  String? expectedTime;

  CreateAppointmentApiParsed({this.patient, this.timings, this.expectedTime});

  CreateAppointmentApiParsed.fromJson(Map<String, dynamic> json) {
    patient =
        json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    timings =
        json['timings'] != null ? Timings.fromJson(json['timings']) : null;
    expectedTime = json['expected_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (patient != null) {
      data['patient'] = patient!.toJson();
    }
    if (timings != null) {
      data['timings'] = timings!.toJson();
    }
    data['expected_time'] = expectedTime;
    return data;
  }
}

class Patient {
  int? id;
  String? name;
  int? age;
  String? gender;
  String? symptoms;
  User? user;

  Patient(
      {this.id, this.name, this.age, this.gender, this.symptoms, this.user});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    symptoms = json['symptoms'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['age'] = age;
    data['gender'] = gender;
    data['symptoms'] = symptoms;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? registeredAt;
  bool? confirmed;
  String? role;

  User(
      {this.id,
      this.name,
      this.email,
      this.registeredAt,
      this.confirmed,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    registeredAt = json['registered_at'];
    confirmed = json['confirmed'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['registered_at'] = registeredAt;
    data['confirmed'] = confirmed;
    data['role'] = role;
    return data;
  }
}

class Timings {
  Slot? slot;
  String? occurringDate;
  int? slotsBooked;

  Timings({this.slot, this.occurringDate, this.slotsBooked});

  Timings.fromJson(Map<String, dynamic> json) {
    slot = json['slot'] != null ? Slot.fromJson(json['slot']) : null;
    occurringDate = json['occurring_date'];
    slotsBooked = json['slots_booked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (slot != null) {
      data['slot'] = slot!.toJson();
    }
    data['occurring_date'] = occurringDate;
    data['slots_booked'] = slotsBooked;
    return data;
  }
}

class Slot {
  int? id;
  String? day;
  String? start;
  String? end;
  int? consultationFee;
  int? appointmentDuration;
  int? numSlots;

  Slot(
      {this.id,
      this.day,
      this.start,
      this.end,
      this.consultationFee,
      this.appointmentDuration,
      this.numSlots});

  Slot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    start = json['start'];
    end = json['end'];
    consultationFee = json['consultation_fee'];
    appointmentDuration = json['appointment_duration'];
    numSlots = json['num_slots'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['day'] = day;
    data['start'] = start;
    data['end'] = end;
    data['consultation_fee'] = consultationFee;
    data['appointment_duration'] = appointmentDuration;
    data['num_slots'] = numSlots;
    return data;
  }
}
