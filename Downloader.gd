extends RefCounted


class_name Downloader

#var obj
var http : HTTPRequest
var texture : ImageTexture
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
	await http.request_completed
	print("Ready to role")
	return texture
	
func _request_complet(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray):
	if result != HTTPRequest.RESULT_SUCCESS:
		push_error("Image couldn't be downloaded. Try a different image.")

	var image = Image.new()
	var error = image.load_jpg_from_buffer(body)
	if error != OK:
		push_error("Couldn't load the image.")

	texture = ImageTexture.create_from_image(image)






	
