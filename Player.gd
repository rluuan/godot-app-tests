extends KinematicBody2D

var motion = Vector2()

const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -550
const UP = Vector2(0, -1)

var touch_left = false
var touch_right = false
var touch_up = false

func _physics_process(delta):
	
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right") or touch_right:
		motion.x = SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = false
		
	elif Input.is_action_pressed("ui_left") or touch_left:
		motion.x = -SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = true
		
	else:
		motion.x = 0
		$Sprite.play("Idle")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up") or touch_up:
			motion.y = JUMP_HEIGHT
	else:
		$Sprite.play("Jump")
	
	motion = move_and_slide(motion, UP)


func _on_left_pressed():
	touch_left = true

func _on_left_released():
	touch_left = false

func _on_right_pressed():
	touch_right = true

func _on_right_released():
	touch_right = false

func _on_jump_pressed():
	touch_up = true

func _on_jump_released():
	touch_up = false





