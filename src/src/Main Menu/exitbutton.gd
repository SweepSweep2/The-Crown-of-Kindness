extends TextureButton

func _on_button_down() -> void:
	$"../X".global_position.y += 2

func _on_button_up() -> void:
	$"../X".global_position.y -= 2

func _on_pressed() -> void:
	$"../BlipSelect".play()
	$"..".visible = false
