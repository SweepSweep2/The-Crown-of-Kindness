extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(10.6).timeout
	play()
