
class Rutes {
  final String route_id;
  final String agency_id;
  final String route_short_name;
  final String route_long_name;

  Rutes({this.agency_id,this.route_id,this.route_long_name,this.route_short_name});

  factory Rutes.fromJson(Map<String, dynamic> json) {
    return new Rutes(
      route_id: json['route_id'] as String,
      agency_id: json['agency_id'] as String,
      route_short_name: json['route_short_name'] as String,
      route_long_name: json['route_long_name'] as String,
    );
  }
}