extends StaticBody2D

@export var health = 250
var dead = false

func _process(_delta):
	if self.health <= 0:
		if !dead:
			Globals.health += 25
			if Globals.health > Globals.maxHealth:
				Globals.health = Globals.maxHealth
			Globals.friendship += 25
			$"../../boss".delay -= 0.5
			$"../../Pillarbreak".play()
			$collision.queue_free()
		self.dead = true
		self.visible = false
	else:
		self.visible = true
