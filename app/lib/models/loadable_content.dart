class LoadableContent<T> {
  bool hasData;
  bool hasError;
  String? errorText;
  T? data;

  LoadableContent(
      {required this.hasError,
      required this.hasData,
      this.errorText,
      this.data});

  LoadableContent.empty()
      : hasData = false,
        hasError = false;

  LoadableContent.error(this.errorText)
      : hasData = false,
        hasError = true;

  LoadableContent.data(this.data)
      : hasData = true,
        hasError = false;
}
