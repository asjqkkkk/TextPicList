# ��ͷ

ͼ�Ļ������ƶ��˵�ʵ�ַ�����Ҫ�������֣�����ͨ��HTMLȥ��һ��WebView�ĸ��ı�������ͨ��ԭ���ķ�ʽȥʵ�֡�

ʹ��WebView����������Ȼ����ԭ��ʵ�֣�ͬʱ��������Ҫ�߱�һ����ǰ��֪ʶ�������������ǿ�ƽ̨;

�������ܵĿ��ǣ��Լ��Ҷ�ǰ��֪ʶ���˽�̶ȣ�������ֻ�ǽ���һ�����ͨ��ԭ���ķ�ʽȥʵ��ͼ�Ļ��š�

# ����

���ֻ��ϣ��㾭���ܿ���������ͼ��ʵ�ַ�ʽ���������ɵ����֣�

<img src="https://blog-pic-1256696029.cos.ap-guangzhou.myqcloud.com/Flutter%E5%9B%BE%E6%96%87%E6%B7%B7%E6%8E%92%E5%8E%9F%E7%94%9F%E5%AE%9E%E7%8E%B0%E6%96%B9%E6%A1%88/001.png" width = "600" height = "300" div align=center />

���ȥ����������չʾ��


<img src="https://blog-pic-1256696029.cos.ap-guangzhou.myqcloud.com/Flutter%E5%9B%BE%E6%96%87%E6%B7%B7%E6%8E%92%E5%8E%9F%E7%94%9F%E5%AE%9E%E7%8E%B0%E6%96%B9%E6%A1%88/002.png" width = "400" height = "720" div align=center />


����ʵ�ַ�ʽ�Ƚϼ򵥣�����������ͼƬ�ֿ�չʾ��������Ȼ����Ҫʵ�ֵ���ͼ�Ļ��ţ���һ�������Ը���һ�㡣

# ʾ��

������demo��Ч����

![image](https://blog-pic-1256696029.cos.ap-guangzhou.myqcloud.com/Flutter%E5%9B%BE%E6%96%87%E6%B7%B7%E6%8E%92%E5%8E%9F%E7%94%9F%E5%AE%9E%E7%8E%B0%E6%96%B9%E6%A1%88/003.gif)


�������demo���Կ�����ͨ��ԭ����ͼ�Ļ���ʵ����������ЩЧ����

    1.����ͼƬ�Ĳ���
    2.���ͼƬ�Ĳ���
    3.����ͼƬʱ�����ֽ����и�
    4.ɾ��ͼƬʱ�����ֽ��кϲ�


��ʵ���������Ӧ���ܹ����ó���һ�����µ�ʵ�ַ����ˣ���������������һ������ͼ�Ļ��ŵĽṹ��

��������Flutterʵ�֣�����ͼ�Ļ����õ�ListView�������android�Ļ������ʹ��RecyclerView(ios�Ļ��Ҳ�̫�˽����ԾͲ�˵��)����Ϊʵ��ͼ�Ļ�����Ҫ�Ƕ����ݵĴ�������ƽ̨�����Ʋ���

**��Ȼ��ListView�����Կ��ó�����ListView������ȫ������Image��TextField��ɣ�ÿ�������һ��Image��ʱ��ͬʱ����һ��TextField�������TextField�����������ϸ�TextField��������֡�**

��Ȼ֪���˽ṹ����ô��������һ�������ʵ�ֵİɡ�


# ʵ��

ͼ�Ļ��ŵ���Ҫ�߼�����������

    1.����
    2.ɾ��

�ڽ��в���֮ǰ���ȶ���һ������Ľṹ�����ڴ洢�ַ������ݣ���ʵֻ�Ƕ�MapEntry��һ�����޸ģ�


```
class TextEntry<K, V> {
  K key;
  V value;
  factory TextEntry(K key, V value) = TextEntry<K, V>._;
  TextEntry._(this.key, this.value);
  String toString() => "TextEntry($key: $value)";
}
```


Ȼ������һ�²����ʵ�֣�

### ����

```
class RichTextList<T>{

  List<TextEntry<T, String>> _list = [];

  void insertOne(int currentPosition, String beforeText, String selectText,
      String afterText, T t) {
    _list[currentPosition].value = beforeText;
    _list.insert(currentPosition + 1, TextEntry(t, ""));
    _list.insert(currentPosition + 2, new TextEntry(null, afterText));
  }

}
```
���ݵĲ����и������������£�

- currentPosition����ǰTextField���ڵ�λ��
- beforeText����ǰTextField�й��ǰ������
- selectText����ǰTextField��ѡ�е����֣�������û�н��д���
- afterText����ǰTextField�й��������
- t���㴫��ķ��Ͳ���

���Կ�����ÿ����һ�����ݣ������Զ�����һ��valueΪnull��TextEntry�������Entry�������ֵ����ݣ�

```
_list.insert(currentPosition + 2, new TextEntry(null, afterText));
```

����ͼ�Ļ��ŵĹؼ�������һ��ͳһ�����ݽṹ������������������ݽṹ����ת��Ҳ���������������valueΪ�յ�TextEntry��ʾ���֣������������㴫��ķ��Ͳ�����

�����ǲ�������Ĵ��룺


```
  void insert(int currentPosition, String beforeText, String selectText, String afterText, List<T> list){
    _list[currentPosition].value = beforeText;
    for(int i = 0; i < list.length; i++){
      _list.insert(currentPosition + 2*i + 1, TextEntry(list[i], ""));
      _list.insert(currentPosition + 2*i + 2, new TextEntry(null, i == list.length - 1?afterText:""));
    }
  }
```

��Ȼ��������ò����������������뵥���ġ�

Ȼ�����ɾ�����߼��ˣ�

### ɾ��

ɾ��Ҳ�ǳ��򵥣�


```
  void remove(int currentPosition) {
      String afterText = _list[currentPosition + 1].value;
      _list[currentPosition - 1].value += afterText;
      _list.removeAt(currentPosition + 1);
      _list.removeAt(currentPosition);
  }
```

ɾ������Ҫ�߼����ڰ���һ��TextField�е����ݲ�����һ��TextField��


���ĵ��߼���ž���������


�����е㲻����ľ��ǿ��ܻ���������ݽṹ��̫��ͬ������ת���Ĺ�����Ҫ�Լ�����ʵ�֣���Ȼ����㲻��ʹ�ó���ĽṹҲ�����Լ��Զ���һ�֣�����˵�������֣�


```
class CustomTypeList{
  TypeFlag flag;//Ĭ��Ϊ���֡���0�����֣�1��ͼƬ��2����Ƶ��3������
  var imageUrl;
  CustomTypeList({this.flag = TypeFlag.text, this.imageUrl = ""});
}

enum TypeFlag{
  text,
  image,
  video,
  music
}
```
ʵ��ʹ���п��԰�ö�������滻��intֵ��������Ϻ�˸��ѡ�

**ͨ��ListViewʵ��ͼ�Ļ�������һ��������������Խ��������κ����͵Ĳ��ֻ����һ�𣬿�����ͼƬ����������Ƶ��Ҳ���������֣�**

# ��β

��ƪ����û�а�ȫ���Ĵ��������������Ѿ���demo���ڲֿ����ˣ�С��������������ȥ���ز鿴��

