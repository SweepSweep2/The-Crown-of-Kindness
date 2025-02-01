extends CharacterBody2D

var sprinting = false
var speed = 75
var sprintLock = false
var shootLock = false
var instantiatedBullet
var collider
@onready var bullet = preload("res://Player/Bullet.tscn")
@onready var sprite = $Sprite2D

func get_input(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	
	if get_global_mouse_position().x > global_position.x:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	
	if Input.is_action_pressed("sprint") and input_direction:
		$Sprite2D.play("Sprinting")
	elif input_direction:
		$Sprite2D.play("Walking")
	else:
		$Sprite2D.play("Idle")
	
	if Input.is_action_pressed("sprint") and input_direction:
		if Globals.stamina > 0 and !sprintLock:
			speed += 5
			if speed > Globals.maxSpeed:
				speed = Globals.maxSpeed
			
			Globals.stamina -= 50 * delta
		else:
			speed -= 5
			if speed < Globals.speed:
				speed = Globals.speed
			
			sprintLock = true
			
			Globals.stamina += 10 * delta
	else:
		speed -= 5
		if speed < Globals.speed:
			speed = Globals.speed
		
		Globals.stamina += 10 * delta
		
		sprintLock = false
	
	if Input.is_action_pressed("shoot"):
		if !shootLock:
			$AudioStreamPlayer2D.play()
			instantiatedBullet = bullet.instantiate()
			get_tree().get_current_scene().add_child(instantiatedBullet)
			instantiatedBullet.global_position = $Node2D/Weapon.global_position
			instantiatedBullet.look_at(get_global_mouse_position())
			shootLock = true
	else:
		shootLock = false
		
	velocity = input_direction * speed

func _physics_process(delta):
	get_input(delta)
	move_and_slide()
	
