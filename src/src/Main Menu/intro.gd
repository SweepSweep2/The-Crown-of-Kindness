extends Node

func _ready() -> void:
	print("This game was made with Godot! License:")
	print(Engine.get_license_text())
	print("More info can be found at licenses.txt")
	
	await get_tree().create_timer(1).timeout
	for i in range(1, 100):
		await get_tree().create_timer(0).timeout
		$Godot.modulate.a += get_process_delta_time()
		$LMMS.modulate.a += get_process_delta_time()
		$LMMSText.modulate.a += get_process_delta_time()
		$Icon.modulate.a += get_process_delta_time()
		$Aseprite.modulate.a += get_process_delta_time()
		$AsepriteText.modulate.a += get_process_delta_time()
		$JSFXR.modulate.a += get_process_delta_time()
		$SFXRText.modulate.a += get_process_delta_time()
	
	await get_tree().create_timer(1).timeout
	for i in range(1, 100):
		await get_tree().create_timer(0).timeout
		$Godot.modulate.a -= get_process_delta_time()
		$Icon.modulate.a -= get_process_delta_time()
		$LMMS.modulate.a -= get_process_delta_time()
		$LMMSText.modulate.a -= get_process_delta_time()
		$Aseprite.modulate.a -= get_process_delta_time()
		$AsepriteText.modulate.a -= get_process_delta_time()
		$JSFXR.modulate.a -= get_process_delta_time()
		$SFXRText.modulate.a -= get_process_delta_time()
	
	$Godot.queue_free()
	$Icon.queue_free()
	$LMMS.queue_free()
	$LMMSText.queue_free()
	$Aseprite.queue_free()
	$AsepriteText.queue_free()
	$JSFXR.queue_free()
	$SFXRText.queue_free()
	
	for i in range(1, 100):
		await get_tree().create_timer(0).timeout
		$Credits.modulate.a += get_process_delta_time()
	
	await get_tree().create_timer(1).timeout
	for i in range(1, 100):
		await get_tree().create_timer(0).timeout
		$Credits.modulate.a -= get_process_delta_time()
	
	$Credits.queue_free()
	await get_tree().create_timer(0.3).timeout
	$"../ReverseSymbal".play()
	await get_tree().create_timer(0.7).timeout
	
	for i in range(1, 80):
		await get_tree().create_timer(0).timeout
		$"../ColorRect".modulate.a -= get_process_delta_time()
	
	$"../ColorRect".queue_free()
	$"../Play".visible = true
	$"../Options".visible = true
	$"../Quit".visible = true
	
	await get_tree().create_timer(0.1).timeout
	if !Globals.gameCompleted:
		$"../Mainmenu".play()
	for i in range(1, 100):
		await get_tree().create_timer(0).timeout
		$"../ColorRect2".modulate.a -= get_process_delta_time()
	
	$"../ReverseSymbal".queue_free()
	queue_free()
