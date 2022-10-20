import 'dart:developer';

import 'package:dart_week_copa/app/core/exceptions/repository_exception.dart';
import 'package:dart_week_copa/app/core/rest/custom_dio.dart';
import 'package:dart_week_copa/app/models/groups_stickers.dart';
import 'package:dio/dio.dart';

import './stickers_repository.dart';

class StickersRepositoryImpl implements StickersRepository {
  final CustomDio dio;
  StickersRepositoryImpl({
    required this.dio,
  });
  @override
  Future<List<GroupsStickers>> getMyAlbum() async {
    try {
      final result = await dio.auth().get('/api/countries');
      return result.data.map((g) => GroupsStickers.fromMap(g)).toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar Tickers', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar album do usuario');
    }
  }
}
