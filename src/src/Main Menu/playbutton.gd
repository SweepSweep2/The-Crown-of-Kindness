extends TextureButton

func _on_button_down() -> void:
	$"../PlayText".position.y += 2

func _on_button_up() -> void:
	$"../PlayText".position.y -= 2

func _on_pressed() -> void:
	$"../BlipSelect".play()
	$"../Play Music".play()
	$"../Mainmenu".queue_free()
	$"../ColorRect4".visible = true
	for i in range(1, 90):
		await get_tree().create_timer(0).timeout
		$"../ColorRect4".modulate.a += get_process_delta_time() * 0.75
	
	$"../BlipSelect".queue_free()
	
	await get_tree().create_timer(0.5).timeout
	$"../ColorRect4".queue_free()
	$"../ColorRect5".visible = true
	$"../Name".visible = true
	await get_tree().create_timer(3).timeout
	$"../Name".visible = false
	$"../Jam".visible = true
	await get_tree().create_timer(3).timeout
	$"../Jam".visible = false
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://pinkvillage/pinkvillage.tscn")
