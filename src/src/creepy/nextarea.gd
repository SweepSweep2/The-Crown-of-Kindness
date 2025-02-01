extends Area2D


var bossvis

func _on_body_entered(body):
	bossvis = $"../boss/ded".visible
	if body.name == "Player" and bossvis:
		Globals.creepyPassed = true
		Globals.modulateBy = -0.03
		await get_tree().create_timer(0.5).timeout
		Globals.modulateBy = 0.03
		get_tree().change_scene_to_file("res://finalvillage/finalvillage.tscn")
