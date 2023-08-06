# HTMLParser
A simple html parser for godot using XMLParser.

# How to use
It creates a HTMLParser class that takes a BiteArray as input and convert it to html code.<br>
You get 2 functions for now :<br>
  1.`find_all(tag:String,atribute:String)`<br>
  2.`find_all_by_class(tag:String,class_str:String,property:String)`<br>

### TextureLoder.gd is a autolode singletone which can takes url and loads that image and convert it to a texture.<br>
`var texture = await TextureLoder.load_jpg(url:String)`
