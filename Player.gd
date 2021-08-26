extends KinematicBody2D

export var MAX_SPEED = 300


var current_anim = ""
func _ready():
	pass

func _physics_process(_delta):
	var motion = Vector2()

	if Input.is_action_pressed("ui_left"):
		motion += Vector2(-1, 0)
	if Input.is_action_pressed("ui_right"):
		motion += Vector2(1, 0)
	if Input.is_action_pressed("ui_up"):
		motion += Vector2(0, -1)
	if Input.is_action_pressed("ui_down"):
		motion += Vector2(0, 1)
			
			
			
	var new_anim = "down"
	if motion.y < 0:
		new_anim = "up"
	elif motion.y > 0:
		new_anim = "down"
	elif motion.x < 0:
		new_anim = "left"
	elif motion.x > 0:
		new_anim = "right"
		
		
	if new_anim != current_anim:
		current_anim = new_anim
		$AnimatedSprite.animation = new_anim
		
	if motion.length() > 0: 
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	move_and_slide(motion * MAX_SPEED)
