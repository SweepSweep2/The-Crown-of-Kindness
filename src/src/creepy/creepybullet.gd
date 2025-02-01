extends Area2D


@export var speed = 100

func _physics_process(delta):
	position -= transform.x * speed * delta

func _on_body_entered(body):
	if body.name == "Player":
		Globals.health -= 5
		$"../AudioStreamPlayer2D3".play()
		queue_free()
	if body.name != "boss" and body.name != "pillar1" and body.name != "pillar2" and body.name != "pillar3" and body.name != "pillar4" and body.name != "pillar1broken" and body.name != "pillar1broken2" and body.name != "pillar1broken3" and body.name != "pillar1broken4":
		queue_free()
