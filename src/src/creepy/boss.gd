extends StaticBody2D


@export var health = 500

@onready var pillar1 = $"../pillars/pillar1"
@onready var pillar2 = $"../pillars/pillar2"
@onready var pillar3 = $"../pillars/pillar3"
@onready var pillar4 = $"../pillars/pillar4"

var p1vis
var p2vis
var p3vis
var p4vis

var damaging = false
var delay = 3

var bulletScene = preload("res://creepy/creepybullet.tscn")

func _ready():
	$sprite.visible = true
	$ded.visible = false
	await get_tree().create_timer(delay).timeout
	Globals.creepyStarted = true
	p1vis = pillar1.visible
	p2vis = pillar2.visible
	p3vis = pillar3.visible
	p4vis = pillar4.visible
	canDamage()
	if self.health > 0 and damaging:
		delay = 0.5
		self.position.x = randi_range(128, 487)
		self.position.y = randi_range(84, 234)
		for i in range(7):
			spawnBullets()
			await get_tree().create_timer(0.2).timeout
		_ready()
	elif self.health > 0 and not damaging:
		self.health += 50
		if self.health > 1000:
			self.health = 1000
		self.position.x = randi_range(128, 487)
		self.position.y = randi_range(84, 234)
		for i in range(7):
			spawnBullets()
			await get_tree().create_timer(0.4).timeout
		_ready()
	elif self.health <= 0:
		Globals.friendship += 75
		$collision.queue_free()
		$sprite.visible = false
		$ded.visible = true
		$"../AudioStreamPlayer2D".queue_free()

func canDamage():
	if not p1vis and not p2vis and not p3vis and not p4vis:
		damaging = true


func spawnBullets():
	var instance1 = bulletScene.instantiate()
	get_tree().get_current_scene().add_child.call_deferred(instance1)
	instance1.rotation_degrees = randi_range(0, 45)
	instance1.z_index = 2
	instance1.global_position = global_position
	var instance2 = bulletScene.instantiate()
	get_tree().get_current_scene().add_child.call_deferred(instance2)
	instance2.rotation_degrees = randi_range(45, 90)
	instance2.z_index = 2
	instance2.global_position = global_position
	var instance3 = bulletScene.instantiate()
	get_tree().get_current_scene().add_child.call_deferred(instance3)
	instance3.rotation_degrees = randi_range(90, 135)
	instance3.z_index = 2
	instance3.global_position = global_position
	var instance4 = bulletScene.instantiate()
	get_tree().get_current_scene().add_child.call_deferred(instance4)
	instance4.rotation_degrees = randi_range(135, 180)
	instance4.z_index = 2
	instance4.global_position = global_position
	var instance5 = bulletScene.instantiate()
	get_tree().get_current_scene().add_child.call_deferred(instance5)
	instance5.rotation_degrees = randi_range(180, 225)
	instance5.z_index = 2
	instance5.global_position = global_position
	var instance6 = bulletScene.instantiate()
	get_tree().get_current_scene().add_child.call_deferred(instance6)
	instance6.rotation_degrees = randi_range(225, 270)
	instance6.z_index = 2
	instance6.global_position = global_position
	var instance7 = bulletScene.instantiate()
	get_tree().get_current_scene().add_child.call_deferred(instance7)
	instance7.rotation_degrees = randi_range(270, 315)
	instance7.z_index = 2
	instance7.global_position = global_position
	var instance8 = bulletScene.instantiate()
	get_tree().get_current_scene().add_child.call_deferred(instance8)
	instance8.rotation_degrees = randi_range(315, 360)
	instance8.z_index = 2
	instance8.global_position = global_position
