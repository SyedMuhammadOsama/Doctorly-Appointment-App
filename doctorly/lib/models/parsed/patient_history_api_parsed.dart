class PatientHistoryApiParsed {
  List<Data>? data;

  PatientHistoryApiParsed({this.data});

  PatientHistoryApiParsed.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  Patient? patient;
  Doctor? doctor;
  Timings? timings;

  Data({this.id, this.patient, this.doctor, this.timings});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patient =
        json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    timings =
        json['timings'] != null ? Timings.fromJson(json['timings']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    if (patient != null) {
      data['patient'] = patient!.toJson();
    }
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    if (timings != null) {
      data['timings'] = timings!.toJson();
    }
    return data;
  }
}

class Patient {
  int? id;
  String? name;
  int? age;
  String? gender;
  User? user;

  Patient({this.id, this.name, this.age, this.gender, this.user});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['age'] = age;
    data['gender'] = gender;
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

class Doctor {
  int? id;
  User? user;
  String? description;
  String? image;
  int? experience;
  double? rating;
  int? noOfPatients;
  Specializations? specializations;
  Qualifications? qualifications;
  List<Slot>? slot;

  Doctor(
      {this.id,
      this.user,
      this.description,
      this.image,
      this.experience,
      this.rating,
      this.noOfPatients,
      this.specializations,
      this.qualifications,
      this.slot});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    description = json['description'];
    image = json['image'];
    experience = json['experience'];
    rating = json['rating'];
    noOfPatients = json['no_of_patients'];
    specializations = json['specializations'] != null
        ? Specializations.fromJson(json['specializations'])
        : null;
    qualifications = json['qualifications'] != null
        ? Qualifications.fromJson(json['qualifications'])
        : null;
    if (json['slot'] != null) {
      slot = <Slot>[];
      json['slot'].forEach((v) {
        slot!.add(Slot.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['description'] = description;
    data['image'] = image;
    data['experience'] = experience;
    data['rating'] = rating;
    data['no_of_patients'] = noOfPatients;
    if (specializations != null) {
      data['specializations'] = specializations!.toJson();
    }
    if (qualifications != null) {
      data['qualifications'] = qualifications!.toJson();
    }
    if (slot != null) {
      data['slot'] = slot!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Specializations {
  int? id;
  String? name;
  String? image;

  Specializations({this.id, this.name, this.image});

  Specializations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}

class Qualifications {
  List<String>? qualificationName;
  List<String>? procurementYear;
  List<String>? instituteName;

  Qualifications(
      {this.qualificationName, this.procurementYear, this.instituteName});

  Qualifications.fromJson(Map<String, dynamic> json) {
    qualificationName = json['qualification_name'].cast<String>();
    procurementYear = json['procurement_year'].cast<String>();
    instituteName = json['institute_name'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['qualification_name'] = qualificationName;
    data['procurement_year'] = procurementYear;
    data['institute_name'] = instituteName;
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
