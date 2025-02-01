extends ColorRect

func _process(delta: float) -> void:
	visible = true
	modulate.a -= Globals.modulateBy
	if modulate.a > 1:
		modulate.a = 1
	
	if modulate.a < 0:
		modulate.a = 0
