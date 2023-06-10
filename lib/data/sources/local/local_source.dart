abstract class LocalSource {
  Future<void> generate();
  Future<List<String>> fetchAll();
  Future<void> add();
  Future<void> remove(int index);
}
