class DoctorsApiParsed {
  List<Data>? data;

  DoctorsApiParsed({this.data});

  DoctorsApiParsed.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  User? user;
  String? description;
  String? image;
  int? experience;
  Specializations? specializations;
  Qualifications? qualifications;
  List<Slot>? slot;

  Data(
      {this.id,
      this.user,
      this.description,
      this.image,
      this.experience,
      this.specializations,
      this.qualifications,
      this.slot});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    description = json['description'];
    image = json['image'];
    experience = json['experience'];
    specializations = json['specializations'] != null
        ? new Specializations.fromJson(json['specializations'])
        : null;
    qualifications = json['qualifications'] != null
        ? new Qualifications.fromJson(json['qualifications'])
        : null;
    if (json['slot'] != null) {
      slot = <Slot>[];
      json['slot'].forEach((v) {
        slot!.add(new Slot.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['description'] = this.description;
    data['image'] = this.image;
    data['experience'] = this.experience;
    if (this.specializations != null) {
      data['specializations'] = this.specializations!.toJson();
    }
    if (this.qualifications != null) {
      data['qualifications'] = this.qualifications!.toJson();
    }
    if (this.slot != null) {
      data['slot'] = this.slot!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['registered_at'] = this.registeredAt;
    data['confirmed'] = this.confirmed;
    data['role'] = this.role;
    return data;
  }
}

class Specializations {
  int? id;
  String? name;

  Specializations({this.id, this.name});

  Specializations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qualification_name'] = this.qualificationName;
    data['procurement_year'] = this.procurementYear;
    data['institute_name'] = this.instituteName;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['day'] = this.day;
    data['start'] = this.start;
    data['end'] = this.end;
    data['consultation_fee'] = this.consultationFee;
    data['appointment_duration'] = this.appointmentDuration;
    data['num_slots'] = this.numSlots;
    return data;
  }
}
