enum ApiResultStatus { success, failure }

class ApiResult<T> {
  final ApiResultStatus status;
  final T? data;
  final String? errorMessage;

  ApiResult.success(this.data)
      : status = ApiResultStatus.success,
        errorMessage = null;
  ApiResult.failure(this.errorMessage)
      : status = ApiResultStatus.failure,
        data = null;
}
