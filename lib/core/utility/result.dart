import '../error/failures.dart';

abstract class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class FailureResult<T> extends Result<T> {
  final Failure failure;
  const FailureResult(this.failure);
}

extension ResultExtension<T> on Result<T> {
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is FailureResult<T>;

  T get data => (this as Success<T>).data;
  Failure get failure => (this as FailureResult<T>).failure;

  void fold(Function(T data) onSuccess, Function(Failure failure) onFailure) {
    if (this is Success<T>) {
      onSuccess((this as Success<T>).data);
    } else {
      onFailure((this as FailureResult<T>).failure);
    }
  }
}
