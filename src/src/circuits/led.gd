extends Area2D


@onready var led = $led
@export var health = 10
var active = false

var bulletScene = preload("res://circuits/ledbullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	while self.health > 0:
		for i in range(randi() % 300):
			await get_tree().create_timer(0.01).timeout
			if self.health <= 0:
				break
		if self.health <= 0:
			break
		active = true
		led.self_modulate.b = 0
		for i in range(10):
			if self.health >= 0:
				spawnBullets()
				for a in range(40):
					await get_tree().create_timer(0.01).timeout
					if self.health <= 0:
						break
				if self.health <= 0:
					break
			else:
				led.self_modulate.b = 1
				break
		if self.health >= 0:
			for a in range(100):
				await get_tree().create_timer(0.01).timeout
				if self.health <= 0:
					break
			if self.health <= 0:
				break
		led.self_modulate.b = 1
		active = false
	led.self_modulate.b = 1
	$led.texture = load("res://circuits/leddarkborken.png")
	name = "BrokenLED"
	Globals.friendship += 12
	Globals.ledsBroken += 1
	$"../../AudioStreamPlayer2D4".play()

func spawnBullets():
	var instance1 = bulletScene.instantiate()
	add_child(instance1)
	instance1.rotation = randi_range(45, 90)
	instance1.z_index = 2
	var instance2 = bulletScene.instantiate()
	add_child(instance2)
	instance2.rotation = randi_range(45, 90)
	instance2.z_index = 2
	var instance3 = bulletScene.instantiate()
	add_child(instance3)
	instance3.rotation = randi_range(-45, -90)
	instance3.z_index = 2
