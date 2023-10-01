class PredModel {
  final double preavg;
  final double preass;
  final double avg;
  final double latest;

  PredModel(
      {required this.preass,
      required this.preavg,
      required this.avg,
      required this.latest});

  Map<String, dynamic> FJson() {
    var json = {
      "PreAVGCost": preavg,
      "PrevAssignedCost": preass,
      "AVGCost": avg,
      "LatestDateCost": latest,
      "A": 0,
      "B": 0,
      "C": 0,
      "D": 0,
      "E": 0,
      "F": 0,
      "G": 0
    };
    return json;
  }

  factory PredModel.fromJson(Map<String, dynamic> json) {
    return PredModel(
      preavg: json["preavg"],
      preass: json["preass"],
      avg: json["avg"],
      latest: json["latest"],
    );
  }
}
