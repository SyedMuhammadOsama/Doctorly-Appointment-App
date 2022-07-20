class SlotsApiParsed {
  List<Data>? data;

  SlotsApiParsed({this.data});

  SlotsApiParsed.fromJson(Map<String, dynamic> json) {
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
  Slot? slot;
  String? occurringDate;
  int? slotsBooked;

  Data({this.slot, this.occurringDate, this.slotsBooked});

  Data.fromJson(Map<String, dynamic> json) {
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
