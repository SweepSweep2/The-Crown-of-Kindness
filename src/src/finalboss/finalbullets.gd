extends Area2D

@export var speed = 100

func _physics_process(delta):
	position -= transform.x * speed * delta

func _on_body_entered(body):
	if body.name != "finalboss" and body.get_parent().name != "finalbossob":
		queue_free()
	if body.name == "Player":
		Globals.health -= 8
		$"../HitHurt(2)".play()
		queue_free()

func _on_area_entered(area):
	if area.name == "bulletbarriers": queue_free()
