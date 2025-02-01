extends Sprite2D

var lock = false

func _ready() -> void:
	while !Globals.pinkVillagePassed:
		await get_tree().create_timer(0).timeout
	
	if lock:
		visible = true
		await get_tree().create_timer(0.5).timeout
		visible = false
		await get_tree().create_timer(0.5).timeout
		_ready()
	else:
		$"../PowerUp".play()
		lock = true
		_ready()
