extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Globals.gameCompleted:
		await get_tree().create_timer(7).timeout
		play()
