

class CustomTypeList{
  TypeFlag flag;//默认为文字——0：文字，1：图片，2：视频，3：音乐
  var imageUrl;
  CustomTypeList({this.flag = TypeFlag.text, this.imageUrl = ""});
}

enum TypeFlag{
  text,
  image,
  video,
  music
}
