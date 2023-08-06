extends Node



func load_jpg(url:String):
	var http = HTTPRequest.new()
	add_child(http)
	http.use_threads = true
	http.request_completed.connect(self._request_complet)
	http.request(url)
	var response = await http.request_completed
	var x = _request_complet(response[0],response[1],response[2],response[3])
	remove_child(http)
	return x
	
func _request_complet(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray):
	if result != HTTPRequest.RESULT_SUCCESS:
		push_error("Image couldn't be downloaded. Try a different image.")
	var image = Image.new()
	var error = image.load_jpg_from_buffer(body)
	if error != OK:
		push_error("Couldn't load the image.")
	print(image)
	return ImageTexture.create_from_image(image)

#func _request_complet(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray):
	#if result != HTTPRequest.RESULT_SUCCESS:
		#push_error("Image couldn't be downloaded. Try a different image.")
	#var image = Image.new()
	#var error = image.load_jpg_from_buffer(body)
	#if error != OK:
		#push_error("Couldn't load the image.")
	#texture = ImageTexture.create_from_image(image)
	#print(image)
