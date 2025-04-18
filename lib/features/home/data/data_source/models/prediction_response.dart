class PredictionResponse{
  final double confidence;
  final String predictedClass;

  PredictionResponse({
    required this.confidence,
    required this.predictedClass,
  });

  factory PredictionResponse.fromJson(Map<String, dynamic> predictionJson) => PredictionResponse(
      confidence: predictionJson['confidence'],
      predictedClass: predictionJson['predicted_class']
  );
}