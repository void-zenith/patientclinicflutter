class Record {
  final String? date;
  final String? systolicBloodPressure;
  final String? diastolicBloodPressure;
  final String? respiratoryRate;
  final String? heartbeatRate;
  final String? bloodOxygenLevel;
  final String? doneBy;
  final String? recordTitle;
  final String? recordSummary;
  final bool? isCritical;

  Record(
      {this.date,
      this.recordTitle,
      this.systolicBloodPressure,
      this.diastolicBloodPressure,
      this.respiratoryRate,
      this.bloodOxygenLevel,
      this.heartbeatRate,
      this.doneBy,
      this.recordSummary,
      this.isCritical});

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'recordTitle': recordTitle,
      'systolicBloodPressure': systolicBloodPressure,
      'diastolicBloodPressure': diastolicBloodPressure,
      'respiratoryRate': respiratoryRate,
      'bloodOxygenLevel': bloodOxygenLevel,
      'heartbeatRate': heartbeatRate,
      'doneBy': doneBy,
      'recordSummary': recordSummary,
      'isCritical': isCritical
    };
  }

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      recordTitle: json['recordTitle'] as String,
      date: json['date'] as String,
      systolicBloodPressure: json['systolicBloodPressure'] as String,
      diastolicBloodPressure: json['diastolicBloodPressure'] as String,
      respiratoryRate: json['respiratoryRate'] as String,
      bloodOxygenLevel: json['bloodOxygenLevel'] as String,
      heartbeatRate: json['heartbeatRate'] as String,
      recordSummary: json['recordSummary'] as String,
    );
  }
}
