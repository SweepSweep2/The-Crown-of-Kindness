extends CharacterBody2D

var speed = 50.0
var direction = 1
var collision

func _physics_process(delta):
	velocity.y = direction * speed

	collision = move_and_collide(velocity * delta)

func _on_wirebarriersneg_body_entered(body):
	if body == self:
		direction = 1

func _on_wirebarrierspos_body_entered(body):
	if body == self:
		direction = -1
