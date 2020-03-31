extends Node2D

var ball_scene = load("res://ball.tscn")
var balls = []
var start = 0
var past_time = 0

# a probablidade em % da pessoa se contaminar em um encontro
export var cont_prob = 80
# qnts % da pop começam doentes
export var sick_start = 10
# a velocidade com que se movem
export var speed = 100

func rand_vel(mx):
	return Vector2(randi()%mx - mx/2, randi()%mx - mx/2)

func _ready():
	past_time = OS.get_ticks_msec()
	start = past_time
	for i in range(400):
		var ball = ball_scene.instance()
		ball.prob = 20
		ball.position = Vector2(randi()%400, randi()%400)
		ball.linear_velocity = rand_vel(speed)
		
		if randi() % 100 < sick_start:
			ball.sick = true
		
		add_child(ball)
		#$Line2D.add_point(Vector2(randi()%100, randi()%100))
		balls.append(ball)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if OS.get_ticks_msec() - past_time > 100:
		
		var cnt = 0
		for b in balls:
			if b.sick:
				cnt += 1
				
		past_time = OS.get_ticks_msec()
		$Line2D.add_point(Vector2((past_time-start)*0.01,500 - cnt*1.2))
		
