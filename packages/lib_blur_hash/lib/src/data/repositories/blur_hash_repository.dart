import 'dart:isolate';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image/image.dart' as img;
import 'package:lib_blur_hash/src/domain/repositories/i_blur_hash_repository.dart';
import 'package:lib_core/lib_core.dart';

class BlurHashRepository extends IBlurHashRepository {
  @override
  Future<Either<IFailure, String>> getHashImage(
      {required String urlImage}) async {
    try {
      final imageFile = await DefaultCacheManager().getSingleFile(urlImage);

      final data = imageFile.readAsBytesSync();
      final image = img.decodeImage(data.toList());
      // final blurHash = BlurHash.encode(image!, numCompX: 4, numCompY: 3);
      final blur = await compute(BlurHash.encode, image!);

      return Right(blur.hash);
    } catch (e) {
      return const Left(HashFailure());
    }
  }
}
