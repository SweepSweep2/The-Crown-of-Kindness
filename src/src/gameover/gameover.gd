extends Node2D


func _ready() -> void:
	Globals.health = Globals.maxHealth
	Globals.gameover = false
	Globals.villagersKilled = 0
	Globals.ledsBroken = 0
	Globals.redVillagersKilled = 0
	Globals.finalVillagersKilled = 0
	Globals.villagersDead = false
	Globals.finalbossobded = false
	Globals.friendship = 0.0
	

func _on_button_button_down() -> void:
	Globals.modulateBy = -0.03
	await get_tree().create_timer(0.5).timeout
	Globals.modulateBy = 0.03
	if Globals.finalVillagePassed:
		get_tree().change_scene_to_file("res://finalboss/finalboss.tscn")
	elif Globals.creepyPassed:
		get_tree().change_scene_to_file("res://finalvillage/finalvillage.tscn")
	elif Globals.redVillagePassed:
		Globals.creepyStarted = false
		get_tree().change_scene_to_file("res://creepy/creepy.tscn")
	elif Globals.circuitsPassed:
		get_tree().change_scene_to_file("res://redvillage/redvillage.tscn")
	elif Globals.pinkVillagePassed:
		get_tree().change_scene_to_file("res://circuits/circuits.tscn")
	else:
		Globals.pinkVillagePaused = true
		get_tree().change_scene_to_file("res://pinkvillage/pinkvillage.tscn")


func _on_button_2_button_down() -> void:
	Globals.modulateBy = -0.03
	await get_tree().create_timer(0.5).timeout
	Globals.modulateBy = 0.03
	Globals.maxHealth = 100
	Globals.health = Globals.maxHealth
	Globals.gameover = false
	Globals.villagersKilled = 0
	Globals.ledsBroken = 0
	Globals.redVillagersKilled = 0
	Globals.finalVillagersKilled = 0
	Globals.villagersDead = false
	Globals.finalbossobded = false
	
	Globals.pinkVillagePaused = true
	Globals.creepyStarted = false
	
	Globals.pinkVillagePassed = false
	Globals.circuitsPassed = false
	Globals.redVillagePassed = false
	Globals.creepyPassed = false
	Globals.finalVillagePassed = false
	Globals.stamina = 100
	Globals.maxStamina = 100
	Globals.speed = 75
	Globals.maxSpeed = 120
	Globals.friendship = 0.0
	Globals.maxFriendship = 100.0
	Globals.friendshipLevel = 0
	get_tree().change_scene_to_file("res://Main Menu/mainmenu.tscn")
