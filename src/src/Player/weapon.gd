extends Node2D

var mousePos

func _process(delta: float) -> void:
	mousePos = get_global_mouse_position()
	look_at(mousePos)
	
	if get_global_mouse_position().x > global_position.x:
		$Weapon.flip_v = false
	else:
		$Weapon.flip_v = true
