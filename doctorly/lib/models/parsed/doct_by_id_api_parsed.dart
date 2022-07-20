class DoctByIdApiParsed {
  int? id;
  User? user;
  String? description;
  String? image;
  int? experience;
  double? rating;
  int? noOfPatients;
  Specializations? specializations;
  Qualifications? qualifications;
  Slot? slot;

  DoctByIdApiParsed(
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

  DoctByIdApiParsed.fromJson(Map<String, dynamic> json) {
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
    slot = json['slot'] != null ? Slot.fromJson(json['slot']) : null;
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
      data['slot'] = slot!.toJson();
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
  List<SlotData>? slotData;

  Slot({this.slotData});

  Slot.fromJson(Map<String, dynamic> json) {
    if (json['slot_data'] != null) {
      slotData = <SlotData>[];
      json['slot_data'].forEach((v) {
        slotData!.add(SlotData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (slotData != null) {
      data['slot_data'] = slotData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SlotData {
  int? id;
  String? day;
  String? start;
  String? end;
  int? consultationFee;
  int? appointmentDuration;
  int? numSlots;

  SlotData(
      {this.id,
      this.day,
      this.start,
      this.end,
      this.consultationFee,
      this.appointmentDuration,
      this.numSlots});

  SlotData.fromJson(Map<String, dynamic> json) {
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
