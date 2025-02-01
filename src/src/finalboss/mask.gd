extends Area2D


func _on_body_entered(body: Node2D) -> void:
	#insta kill
	Globals.health -= Globals.maxHealth
