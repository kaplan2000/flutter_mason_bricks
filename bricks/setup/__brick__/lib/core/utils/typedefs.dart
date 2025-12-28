import 'package:fpdart/fpdart.dart';
import 'package:{{name}}/core/failure/failure.dart';

/// Type alias for a result that can be either a [Failure] or a value of type [T].
/// Used for synchronous operations that may fail.
typedef Result<T> = Either<Failure, T>;

/// Type alias for an asynchronous result that can be either a [Failure] or a value of type [T].
/// Used for asynchronous operations (e.g., API calls, database queries) that may fail.
typedef AsyncResult<T> = Future<Either<Failure, T>>;

/// Type alias for a result that represents an operation with no return value.
/// Used for operations that may fail but don't return data on success.
typedef VoidResult = Either<Failure, Unit>;

/// Type alias for an asynchronous operation with no return value.
/// Used for async operations that may fail but don't return data on success.
typedef AsyncVoidResult = Future<Either<Failure, Unit>>;

