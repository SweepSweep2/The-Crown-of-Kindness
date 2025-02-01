extends Node2D

var first = true
var second = true
var third = true

var firstA = true
var secondA = true

func _on_first_body_entered(body):
	if body.name == "Player":
		if first == true:
			first = false
			for i in range(100):
				$"../Player/dialog".modulate.a += 0.01
				$"../Player/ColorRect".modulate.a += 0.01
				await get_tree().create_timer(0).timeout
			
			await get_tree().create_timer(5).timeout
			
			for i in range(100):
				$"../Player/dialog".modulate.a -= 0.01
				$"../Player/ColorRect".modulate.a -= 0.01
				await get_tree().create_timer(0).timeout
			
			$"../Player/ColorRect".queue_free()
			$"../Player/dialog".queue_free()
			firstA = false


func _on_second_body_entered(body):
	if body.name == "Player":
		if second == true and firstA == false:
			second = false
			for i in range(100):
				$"../Player/dialog2".modulate.a += 0.01
				$"../Player/ColorRect2".modulate.a += 0.01
				await get_tree().create_timer(0).timeout
			
			await get_tree().create_timer(5).timeout
			
			for i in range(100):
				$"../Player/dialog2".modulate.a -= 0.01
				$"../Player/ColorRect2".modulate.a -= 0.01
				await get_tree().create_timer(0).timeout
			
			$"../Player/ColorRect2".queue_free()
			$"../Player/dialog2".queue_free()
			secondA = false


func _on_third_body_entered(body):
	if body.name == "Player":
		if third == true and secondA == false and firstA == false:
			third = false
			for i in range(100):
				$"../Player/dialog3".modulate.a += 0.01
				$"../Player/ColorRect3".modulate.a += 0.01
				await get_tree().create_timer(0).timeout
			
			await get_tree().create_timer(5).timeout
			
			for i in range(100):
				$"../Player/dialog3".modulate.a -= 0.01
				$"../Player/ColorRect3".modulate.a -= 0.01
				if get_tree():
					await get_tree().create_timer(0).timeout
			
			if get_tree():
				if get_tree().get_current_scene():
					$"../Player/ColorRect3".queue_free()
					$"../Player/dialog3".queue_free()
