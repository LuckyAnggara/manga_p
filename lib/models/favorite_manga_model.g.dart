// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_manga_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteMangaModelAdapter extends TypeAdapter<FavoriteMangaModel> {
  @override
  final int typeId = 0;

  @override
  FavoriteMangaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteMangaModel(
      image: fields[2] as String?,
      linkId: fields[0] as String?,
      title: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteMangaModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.linkId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteMangaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
