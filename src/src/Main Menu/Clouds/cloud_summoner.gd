extends Node2D

var cloud = preload("res://Main Menu/Clouds/Cloud.tscn")
var instantiatedCloud

var randnum
var randScale

func _ready() -> void:
	while true:
		await get_tree().create_timer(randf() + 0.01).timeout
		
		randnum = randi() % 3
		
		instantiatedCloud = cloud.instantiate()
		
		if randnum == 0:
			instantiatedCloud.texture = load("res://Main Menu/Clouds/cloud1.png")
		elif randnum == 1:
			instantiatedCloud.texture = load("res://Main Menu/Clouds/cloud2.png")
		elif randnum == 2:
			instantiatedCloud.texture = load("res://Main Menu/Clouds/cloud3.png")
		
		instantiatedCloud.global_position = Vector2(400, randi() % 160)
		
		randScale = randf_range(0.5, 1.0)
		instantiatedCloud.scale = Vector2(randScale, randScale)
		
		if get_tree():
			if get_tree().get_current_scene():
				get_tree().get_current_scene().add_child.call_deferred(instantiatedCloud)
