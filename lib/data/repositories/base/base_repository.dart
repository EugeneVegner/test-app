abstract class BaseRepository {
  Exception handleError(Object e) {
    throw getError(e);
  }

  Exception getError(Object e) {
    final error = e as Exception;
    Exception currentError;
    currentError = error;
    return currentError;
  }
}
