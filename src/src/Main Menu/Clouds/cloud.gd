extends Sprite2D

var speed = randi() % 15 + 25

func _ready() -> void:
	await get_tree().create_timer(15).timeout
	queue_free()

func _process(delta: float) -> void:
	global_position.x -= delta * speed
