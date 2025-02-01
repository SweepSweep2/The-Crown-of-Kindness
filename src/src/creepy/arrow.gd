extends Sprite2D


var bossvis
var lock = false

# Called when the node enters the scene tree for the first time.
func _ready():
	bossvis = $"../boss/ded".visible
	while !bossvis:
		bossvis = $"../boss/ded".visible
		await get_tree().create_timer(0).timeout
	
	if lock:
		visible = true
		await get_tree().create_timer(0.5).timeout
		visible = false
		await get_tree().create_timer(0.5).timeout
		_ready()
	else:
		lock = true
		$"../PowerUp".play()
		_ready()
