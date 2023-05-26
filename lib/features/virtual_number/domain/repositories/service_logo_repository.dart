import 'dart:typed_data';

abstract class ServiceLogoRepository{
  Future<Uint8List> getImage();
}