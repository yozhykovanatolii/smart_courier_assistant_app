import 'package:dio/dio.dart';
import 'package:smart_courier_assistant_app/data/models/api/route_analysis_model.dart';
import 'package:smart_courier_assistant_app/exceptions/access_denied_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/invalid_credentials_exception.dart';
import 'package:smart_courier_assistant_app/exceptions/optimization_route_exception.dart';

class RecommendationAiClient {
  final Dio _dio;

  RecommendationAiClient(this._dio);

  Future<String> generateRouteRecommendation(
    RouteAnalysisModel analysis,
  ) async {
    try {
      final response = await _dio.post(
        '/routes/analysis',
        data: analysis.toJson(),
      );
      final jsonData = response.data as Map<String, dynamic>;
      return jsonData['recommendation'];
    } on DioException catch (exception) {
      final statusCode = exception.response?.statusCode;
      if (statusCode == 401) {
        throw InvalidCredentialsException();
      }
      if (statusCode == 403) {
        throw AccessDeniedException();
      }
      throw OptimizationRouteException();
    }
  }
}
