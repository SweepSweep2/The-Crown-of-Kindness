extends CharacterBody2D

var bulletScene = preload("res://pinkvillage/pinkbullets.tscn")

var speed = 50.0
var direction = -1
@export var villagerType = 1

@export var health = 100


func _ready():
	$villager.play(str(villagerType) + "normal")
	if self.health > 0:
		for i in range(4):
			if self.health <= 0:
				break
			spawnBullets()
			for a in range(10):
				await get_tree().create_timer(0.01).timeout
				if self.health <= 0:
					break
		for i in range(100):
			await get_tree().create_timer(0.01).timeout
			if self.health <= 0:
				break
		_ready()
	elif self.health <= 0:
		$"../../kill".play()
		Globals.villagersKilled += 1
		Globals.friendship += 5
		$collision.queue_free()
		name = "villagerdead"
		$villager.play(str(villagerType) + "dead")

func spawnBullets():
	var instance1 = bulletScene.instantiate()
	get_tree().get_current_scene().add_child.call_deferred(instance1)
	if direction == 1: instance1.rotation_degrees = randi_range(0, -40)
	elif direction == -1: instance1.rotation_degrees = randi_range(180, 220)
	instance1.z_index = 2
	instance1.global_position = global_position

func _physics_process(delta):
	if self.health > 0:
		velocity.x = direction * speed
		move_and_collide(velocity * delta)
	elif self.health <= 0:
		pass
	
func _on_left_body_entered(body):
	if body == self:
		direction = 1
		$villager.flip_h = true

func _on_right_body_entered(body):
	if body == self:
		direction = -1
		$villager.flip_h = false
