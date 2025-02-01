extends CharacterBody2D


var bulletScene = preload("res://redvillage/redbullets.tscn")

@export var health = 100

func _ready():
	if self.health > 0:
		spawnBullets()
		for i in range(300):
			await get_tree().create_timer(0.01).timeout
			if self.health <= 0:
				break
		_ready()
	elif self.health <= 0:
		$"../../kill".play()
		Globals.friendship += 15
		Globals.redVillagersKilled += 1
		$villager.frame = 3
		
		$collision.queue_free()

func spawnBullets():
	var instance1 = bulletScene.instantiate()
	get_tree().get_current_scene().add_child.call_deferred(instance1)
	instance1.rotation_degrees = randi_range(0, 60)
	instance1.z_index = 2
	instance1.global_position = global_position
	var instance2 = bulletScene.instantiate()
	get_tree().get_current_scene().add_child.call_deferred(instance2)
	instance2.rotation_degrees = randi_range(60, 120)
	instance2.z_index = 2
	instance2.global_position = global_position
	var instance3 = bulletScene.instantiate()
	get_tree().get_current_scene().add_child.call_deferred(instance3)
	instance3.rotation_degrees = randi_range(120, 180)
	instance3.z_index = 2
	instance3.global_position = global_position
	var instance4 = bulletScene.instantiate()
	get_tree().get_current_scene().add_child.call_deferred(instance4)
	instance4.rotation_degrees = randi_range(180, 240)
	instance4.z_index = 2
	instance4.global_position = global_position
	var instance5 = bulletScene.instantiate()
	get_tree().get_current_scene().add_child.call_deferred(instance5)
	instance5.rotation_degrees = randi_range(240, 300)
	instance5.z_index = 2
	instance5.global_position = global_position
	var instance6 = bulletScene.instantiate()
	get_tree().get_current_scene().add_child.call_deferred(instance6)
	instance6.rotation_degrees = randi_range(300, 360)
	instance6.z_index = 2
	instance6.global_position = global_position
