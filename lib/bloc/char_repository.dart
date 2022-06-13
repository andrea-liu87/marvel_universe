import 'package:marvel_universe/data/http_helper.dart';
import 'package:marvel_universe/model/comic_char.dart';

class CharRepositoryImpl implements CharRepository {

  HttpHelper service = HttpHelper();

  @override
  Future<List<ComicChar>> fetchAllChar() {
    return service.getData();
  }

}

abstract class CharRepository {
  Future<List<ComicChar>> fetchAllChar();
}

class NetworkError extends Error {}