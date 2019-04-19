class TextEntry<K, V> {
  K key;
  V value;
  factory TextEntry(K key, V value) = TextEntry<K, V>._;
  TextEntry._(this.key, this.value);
  String toString() => "TextEntry($key: $value)";
}


class RichTextList<T>{

  List<TextEntry<T, String>> _list = [];

  void initial(){
    if(_list.length > 0) throw UnsupportedError("列表已被初始化过");
    _list.add(TextEntry(null, ""));

  }

  void initialList(List<TextEntry<T, String>> textPicList){
    if(_list.length > 0) throw UnsupportedError("列表已被初始化过");
    _list = List.from(textPicList);
  }



  void insertOne(int currentPosition, String beforeText, String selectText,
      String afterText, T t) {
    if(_list.length == 0) throw UnsupportedError("列表尚未初始化");
    if (currentPosition < 0) throw ArgumentError("数字[${currentPosition}]不合法");
    if (currentPosition >= _list.length) throw ArgumentError("[${currentPosition}]数组越界了");
    if(t == null) throw ArgumentError("插入数据不能为空");
    _list[currentPosition].value = beforeText;
    _list.insert(currentPosition + 1, TextEntry(t, ""));
    _list.insert(currentPosition + 2, new TextEntry(null, afterText));
  }

  void insert(int currentPosition, String beforeText, String selectText, String afterText, List<T> list){
    if(_list.length == 0) throw UnsupportedError("列表尚未初始化");
    if (currentPosition < 0) throw ArgumentError("数字[${currentPosition}]不合法");
    if (currentPosition >= _list.length) throw ArgumentError("[${currentPosition}]数组越界了");
    if(list == null) throw ArgumentError("插入列表不能为空");
    if(list.length == 0) return;
    _list[currentPosition].value = beforeText;
    for(int i = 0; i < list.length; i++){
      _list.insert(currentPosition + 2*i + 1, TextEntry(list[i], ""));
      _list.insert(currentPosition + 2*i + 2, new TextEntry(null, i == list.length - 1?afterText:""));
    }
  }

  void remove(int currentPosition) {
    if(_list.length == 0) throw UnsupportedError("列表尚未初始化");
    if (currentPosition >= _list.length) throw ArgumentError("长度超过了呀！");
    if (currentPosition <= 0) throw Exception("不应该删除第一个！");
    if (currentPosition < _list.length - 1) {
      String afterText = _list[currentPosition + 1].value;
      _list[currentPosition - 1].value += afterText;
      _list.removeAt(currentPosition + 1);
      _list.removeAt(currentPosition);
    } else if (currentPosition == _list.length - 1) throw UnsupportedError("不应该删除的是最后一个！");
  }


  List<TextEntry<T, String>> get list => _list;

  int get size => _list.length;

  void printListText(){
    for(TextEntry<T, String> t in _list){
      print("${t.value} \n");
    }
  }

  @override
  String toString() {
    return 'TextPicList{_textPicList: $_list}';
  }


}
