extends Node

var stamina = 100.0
var health = 100.0
var maxHealth = 100.0
var maxStamina = 100.0
var friendship = 0.0
var maxFriendship = 100.0
var friendshipLevel = 0
var speed = 75
var maxSpeed = 120
var modulateBy = 0.01
var damageMultiplier = 1.00

var pinkVillagePaused = true
var villagersDead = false
var villagersKilled = 0
var pinkVillagePassed = false

var circuitsPassed = false
var ledsBroken = 0

var redVillagersKilled = 0
var redVillagePassed = false

var creepyStarted = false
var creepyPassed = false

var finalVillagersKilled = 0
var finalVillagePassed = false

var finalbossobded = false

var gameover = false

var gameCompleted = false

func _process(delta: float) -> void:
	if health <= 0 and not gameover:
		gameover = true
		get_tree().change_scene_to_file("res://gameover/gameover.tscn")
	
	if stamina > maxStamina:
		stamina = maxStamina
	elif stamina < 0:
		stamina = 0
	
	if villagersKilled > 7:
		villagersDead = true
	
	if villagersKilled > 15:
		pinkVillagePassed = true
	
	if ledsBroken > 7:
		circuitsPassed = true
	
	if redVillagersKilled > 15:
		redVillagePassed = true
		
	if finalVillagersKilled > 6:
		finalVillagePassed = true
	
	maxFriendship = (friendshipLevel + 1) * 100
	
	if friendship >= maxFriendship:
		friendshipLevel += 1
		friendship -= maxFriendship
		if friendshipLevel == 1:
			health += 10.0
			maxHealth += 10.0
		elif friendshipLevel == 2:
			stamina += 10.0
			maxStamina += 10.0
		elif friendshipLevel == 3:
			speed += 10.0
			maxSpeed += 25.0
		elif friendshipLevel == 4:
			damageMultiplier = 1.25
