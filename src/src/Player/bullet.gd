extends Node2D

var moveVelocity

func _process(delta: float) -> void:
	moveVelocity = Vector2(100, 0).rotated(rotation)
	global_position += moveVelocity * delta

func _on_area_entered(area: Area2D) -> void:
	for i in range(8):
		if area.name == "led" + str(i + 1):
			$"../AudioStreamPlayer2D5".play()
			if area.active:
				area.health -= 0.5 * Globals.damageMultiplier
			else:
				area.health -= 1 * Globals.damageMultiplier
			queue_free()

func _on_body_entered(body: Node2D) -> void:
	for i in range(8):
		if body.name == "resistor" + str(i + 1):
			queue_free()
	if body.name == "mapbarriers":
		queue_free()
	if body.name == "mapborders":
		queue_free()
	for i in range(4):
		if body.name == "pillar" + str(i + 1):
			if !body.dead:
				if Globals.creepyStarted:
					body.health -= 10 * Globals.damageMultiplier
				$"../AudioStreamPlayer2D2".play()
				queue_free()
	if body.name == "boss":
		$"../AudioStreamPlayer2D2".play()
		if Globals.creepyStarted:
			body.health -= 10 * Globals.damageMultiplier
		queue_free()
	for i in range(8):
		if body.name == "villager" + str(i + 1):
			$"../hit".play()
			body.health -= 10 * Globals.damageMultiplier
			queue_free()
	for i in range(8):
		if body.name == "housevil" + str(i + 1):
			$"../hit".play()
			body.health -= 10 * Globals.damageMultiplier
			queue_free()
	for i in range(12):
		if body.name == "finalbossob" + str(i + 1):
			body.health -= 10 * Globals.damageMultiplier
			$"../HitHurt(3)".play()
			queue_free()
	if body.name == "finalboss":
		body.health -= 10 * Globals.damageMultiplier
		queue_free()
		$"../HitHurt(3)".play()
