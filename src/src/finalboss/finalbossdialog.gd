extends Node2D


func _ready() -> void:
	$image1.visible = false
	$image2.visible = false
	for i in range(100):
		$dialog.modulate.a += 0.01
		await get_tree().create_timer(0).timeout
	await get_tree().create_timer(5).timeout
	for i in range(100):
		$dialog.modulate.a -= 0.01
		await get_tree().create_timer(0).timeout
	$dialog.queue_free()
	
	await get_tree().create_timer(3).timeout
	
	for i in range(100):
		$dialog2.modulate.a += 0.01
		await get_tree().create_timer(0).timeout
	await get_tree().create_timer(10).timeout
	for i in range(100):
		$dialog2.modulate.a -= 0.01
		await get_tree().create_timer(0).timeout
	$dialog2.queue_free()
	
	await get_tree().create_timer(3).timeout
	
	for i in range(100):
		$dialog3.modulate.a += 0.01
		await get_tree().create_timer(0).timeout
	await get_tree().create_timer(5).timeout
	for i in range(100):
		$dialog3.modulate.a -= 0.01
		await get_tree().create_timer(0).timeout
	$dialog3.queue_free()
	
	await get_tree().create_timer(3).timeout
	
	for i in range(100):
		$dialog4.modulate.a += 0.01
		await get_tree().create_timer(0).timeout
	await get_tree().create_timer(5).timeout
	for i in range(100):
		$dialog4.modulate.a -= 0.01
		await get_tree().create_timer(0).timeout
	$dialog4.queue_free()
		
	await get_tree().create_timer(3).timeout
	
	for i in range(100):
		$dialog5.modulate.a += 0.01
		await get_tree().create_timer(0).timeout
	await get_tree().create_timer(5).timeout
	for i in range(100):
		$dialog5.modulate.a -= 0.01
		await get_tree().create_timer(0).timeout
	$dialog5.queue_free()
		
	await get_tree().create_timer(3).timeout
	
	$image1.visible = true
	$image2.visible = true
	$Player.visible = false
	$Crown.visible = false
	
	for i in range(100):
		$dialog6.modulate.a += 0.01
		await get_tree().create_timer(0).timeout
	await get_tree().create_timer(10).timeout
	for i in range(100):
		$dialog6.modulate.a -= 0.01
		await get_tree().create_timer(0).timeout
	$dialog6.queue_free()
	
	await get_tree().create_timer(3).timeout
	
	for i in range(100):
		$dialog7.modulate.a += 0.01
		await get_tree().create_timer(0).timeout
	await get_tree().create_timer(10).timeout
	for i in range(100):
		$dialog7.modulate.a -= 0.01
		await get_tree().create_timer(0).timeout
	$dialog7.queue_free()
	
	await get_tree().create_timer(3).timeout
	
	for i in range(100):
		$dialog8.modulate.a += 0.01
		await get_tree().create_timer(0).timeout
	await get_tree().create_timer(10).timeout
	for i in range(100):
		$dialog8.modulate.a -= 0.01
		await get_tree().create_timer(0).timeout
	$dialog8.queue_free()
	
	await get_tree().create_timer(3).timeout
	
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
	Globals.modulateBy = -0.03
	Globals.gameCompleted = true
	Globals.stamina = 100
	Globals.maxStamina = 100
	Globals.speed = 75
	Globals.maxSpeed = 120
	Globals.friendship = 0.0
	Globals.maxFriendship = 100.0
	Globals.friendshipLevel = 0
	await get_tree().create_timer(0.5).timeout
	Globals.modulateBy = 0.03
	get_tree().change_scene_to_file("res://Main Menu/mainmenu.tscn")
