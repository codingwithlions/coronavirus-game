extends RigidBody2D

var sick = false
var recovered = false

var prob = 20

# Called when the node enters the scene tree for the first time.
func rand_vel(mx):
	return Vector2(randi()%mx - mx/2, randi()%mx - mx/2)

func _ready():
	
	if sick:
		$Timer.start()
	
	if sick:
		$Sprite.modulate = Color(0, 1, 0)
	else:
		$Sprite.modulate = Color(1, 1, 1)
	

func _process(delta):
	for item in get_colliding_bodies():
		if not item.get("sick") == null: # if item has sick
			pass
			if item.sick:
				#pass
				if randi()%100 < prob and not recovered:
					$Timer.start()
					$Sprite.modulate = Color(0, 1, 0)
					sick = true


func _on_Timer_timeout():
	recovered = true
	sick = false
	$Sprite.modulate = Color(0.2, 0.2, 0.2)
