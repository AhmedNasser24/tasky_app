import 'package:tasky_app/core/services/api_services.dart';

import '../secrets/end_point.dart';

class DataService {
  final ApiServices _apiServices = ApiServices();
   fetchTasks() async{
    var response = await _apiServices.get(endPoint: EndPoint.getTasks);
    
  }
}