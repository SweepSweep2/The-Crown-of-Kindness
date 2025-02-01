extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while !Globals.villagersDead:
		await get_tree().create_timer(0).timeout
	await get_tree().create_timer(1).timeout
	
	for i in range(100):
		modulate.a += 0.01
		$"../ColorRect3".modulate.a += 0.01
		await get_tree().create_timer(0).timeout
	
	await get_tree().create_timer(5).timeout
	
	for i in range(100):
		modulate.a -= 0.01
		$"../ColorRect3".modulate.a -= 0.01
		await get_tree().create_timer(0).timeout
	
	$"../ColorRect3".queue_free()
	queue_free()
