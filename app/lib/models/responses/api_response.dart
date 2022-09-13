class APIResponse<T> {
  APIResponse._();
  factory APIResponse.success(T value) = SuccessState<T>;
  factory APIResponse.error(T msg) = ErrorState<T>;

}

class ErrorState<T> extends APIResponse<T> {
  ErrorState(this.msg) : super._();
  final T msg;
}

class SuccessState<T> extends APIResponse<T> {
  SuccessState(this.value) : super._();
  T value;
}
