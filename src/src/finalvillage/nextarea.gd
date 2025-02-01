extends Area2D


func _on_body_entered(body):
	if body.name == "Player" and Globals.finalVillagePassed:
		Globals.modulateBy = -0.03
		await get_tree().create_timer(0.5).timeout
		Globals.modulateBy = 0.03
		get_tree().change_scene_to_file("res://finalboss/finalboss.tscn")
