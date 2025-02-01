extends Control

@onready var stamina = $Stamina
@onready var health = $Health
@onready var friendship = $Friendship
@onready var staminaCounter = $"Stamina Counter"
@onready var healthCounter = $"Health Counter"
@onready var friendshipCounter = $"Friendship Counter"

func _process(delta: float) -> void:
	stamina.value = int((Globals.stamina / Globals.maxStamina) * 100)
	health.value = int((Globals.health / Globals.maxHealth) * 100)
	friendship.value = int((Globals.friendship / Globals.maxFriendship) * 100)
	staminaCounter.text = str(int(Globals.stamina)) + "/" + str(Globals.maxStamina)
	healthCounter.text = str(int(Globals.health)) + "/" + str(Globals.maxHealth)
	friendshipCounter.text = str(int((Globals.friendship / Globals.maxFriendship) * 100)) + "%"
