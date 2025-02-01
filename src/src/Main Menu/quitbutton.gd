extends TextureButton

func _on_button_down() -> void:
	$"../QuitText".position.y += 2


func _on_button_up() -> void:
	$"../QuitText".position.y -= 2


func _on_pressed() -> void:
	$"../BlipSelect".play()
	get_tree().quit()
