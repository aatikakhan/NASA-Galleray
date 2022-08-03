import '../model/data_object.dart';

class Arguments {
  final String url;
  final List<DataObject> obj;
  final int index;

  Arguments(this.url, this.obj, this.index);
}
