extends Area2D


@export var speed = 100

func _physics_process(delta):
	position -= transform.x * speed * delta

func _on_body_entered(body):
	if body.name == "Player":
		Globals.health -= 3
		$"../hurt".play()
		queue_free()
	if body.name == "mapborders":
		queue_free()
