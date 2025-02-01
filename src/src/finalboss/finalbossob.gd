extends StaticBody2D


@export var health = 200

var bulletScene = preload("res://finalboss/finalbullets.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$crown.visible = false
	$boss.visible = true
	$boss.frame = 0
	if self.health > 0 and $"../../finalboss".health > 0:
		for i in range(4):
			$boss.frame = 1
			spawnBullets()
			if get_tree():
				if get_tree().get_current_scene():
					for a in range(50):
						await get_tree().create_timer(0.01).timeout
						if self.health <= 0:
							break
					if self.health <= 0:
						break
		$boss.frame = 0
		if get_tree():
			if get_tree().get_current_scene():
				for i in range(randf_range(0.1, 1.0)):
					await get_tree().create_timer(0.01).timeout
					if self.health <= 0:
						break
		_ready()
	if self.health <= 0:
		Globals.finalbossobded = true
		Globals.friendship += 35
		$collision.queue_free()
		$"../../Explosion(4)".play()
		$crown.visible = true
		$boss.visible = false


func spawnBullets():
	if get_tree():
		if get_tree().get_current_scene():
			var instance1 = bulletScene.instantiate()
			get_tree().get_current_scene().add_child.call_deferred(instance1)
			instance1.rotation_degrees = randi_range(0, 90)
			instance1.z_index = 2
			instance1.global_position = global_position
			var instance2 = bulletScene.instantiate()
			get_tree().get_current_scene().add_child.call_deferred(instance2)
			instance2.rotation_degrees = randi_range(90, 180)
			instance2.z_index = 2
			instance2.global_position = global_position
			var instance3 = bulletScene.instantiate()
			get_tree().get_current_scene().add_child.call_deferred(instance3)
			instance3.rotation_degrees = randi_range(180, 270)
			instance3.z_index = 2
			instance3.global_position = global_position
			var instance4 = bulletScene.instantiate()
			get_tree().get_current_scene().add_child.call_deferred(instance4)
			instance4.rotation_degrees = randi_range(270, 360)
			instance4.z_index = 2
			instance4.global_position = global_position
