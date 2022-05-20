import 'package:news/modules/sources.dart';

class SourcesResponse {

  String status;
  List<Sources> sources;

	SourcesResponse.fromJsonMap(Map<String, dynamic> map): 
		status = map["status"],
		sources = List<Sources>.from(map["sources"].map((it) => Sources.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['status'] = status;
		data['sources'] = sources != null ? 
			this.sources.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
