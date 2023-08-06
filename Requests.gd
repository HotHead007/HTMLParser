extends Node


class_name Requests

#var obj
var http : HTTPRequest
var HTML : HTMLParser
func _init(node:Node,threaded:bool = true):
	print("init")
	#obj = node
	http = HTTPRequest.new()
	node.add_child(http)
	http.use_threads = threaded
	http.request_completed.connect(self._request_complet)

	
func Get(url:String):
	http.cancel_request()
	http.request(url)
	#await http.request_completed
	
func _request_complet(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray):
	HTML = HTMLParser.new(body)
	print(HTML.find_all_by_class("a","a-h text-nowrap","href"))
	print("Resource ready")


	
