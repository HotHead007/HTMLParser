extends RefCounted


class_name HTMLParser

var xmlParser:XMLParser
var bitcode 
func _init(data:PackedByteArray):
	bitcode=data
	xmlParser = XMLParser.new()
	

func find_all(tag:String,atribute:String):
		xmlParser.open_buffer(bitcode)
		'''
		Example :
			var parser = HTMLParser.new(body)
			print(parser.find_all("a","href"))
			print(parser.find_all_by_class("a","a-h text-nowrap","href"))
		'''
		var results = []
		while xmlParser.read() != ERR_FILE_EOF :
			if xmlParser.get_node_type() == XMLParser.NODE_TEXT:
				pass
				#print(xmlParser.get_node_type()," line: ",xmlParser.get_current_line())
			else:
				var tagName = xmlParser.get_node_name()
				#print(tagName)
				if tagName == tag and xmlParser.has_attribute(atribute):
					var href = xmlParser.get_named_attribute_value(atribute)
					if len(href)>1:
						results.append(href)
					else:
						print(xmlParser.get_node_name())
		return results
	
func find_all_by_class(tag:String,class_str:String,property:String):
		xmlParser.open_buffer(bitcode)
		var results = []
		while xmlParser.read() != ERR_FILE_EOF :
			if xmlParser.get_node_type() == XMLParser.NODE_TEXT:
				pass
			else:
				var tagName = xmlParser.get_node_name()
				#checkin if element has class
				if tagName == tag and xmlParser.get_named_attribute_value_safe("class") == class_str:
					var prop = xmlParser.get_named_attribute_value(property)
					if len(prop)>0:
						results.append(prop)
					else:
						print(xmlParser.get_node_name())
		return results
			
#func _ready():
	#var http = HTTPRequest.new()
	#add_child(http)
	#http.request_completed.connect(self._request_complet)
	#http.request("https://ww6.manganelo.tv/manga/manga-sf995462")
#
#
#func _request_complet(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray):
	#var parser = HTMLParser.new(body)
	#$Label.text = str(body.get_string_from_utf8())
	#print(parser.find_all_by_class("a","a-h text-nowrap","href"))
	#print("Resource ready")
