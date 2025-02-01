extends TextureButton

func _on_button_down() -> void:
	$"../OptionsText".position.y += 2

func _on_button_up() -> void:
	$"../OptionsText".position.y -= 2

func _on_pressed() -> void:
	$"../BlipSelect".play()
	$"../Settings".visible = true
