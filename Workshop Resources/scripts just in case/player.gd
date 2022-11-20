extends KinematicBody2D

#elvis variables
var velocity := Vector2.ZERO
onready var sprite = $AnimatedSprite
onready var start_position = global_position


func _process(_delta: float) -> void:
	velocity.x = 0
	if Input.is_action_pressed("right"):
		velocity.x = 500 
		sprite.flip_h = false		
	elif Input.is_action_pressed("left"):
		velocity.x = -500
		sprite.flip_h = true
	#animations
	if is_on_floor():
		if abs(velocity.x) > 0.1:
			sprite.animation = "run"
		else:
			sprite.animation = "idle"
	#if we are grounded and we jump
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		#jump
		sprite.animation = "jump"
		velocity.y = -1000
	#chaeck that we haven;t fallen too far down
	if position.y > 900:
		respawn()
	
	
func _physics_process(_delta: float) -> void:
	#gravity
	velocity.y += 50
	velocity = move_and_slide(velocity,Vector2.UP)
	
	
func respawn():
	#reset position to the startposition
	global_position = start_position
