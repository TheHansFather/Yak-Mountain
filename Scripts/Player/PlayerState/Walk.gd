extends State
class_name WalkState

@export var player : CharacterBody2D
@export var playerBase : Sprite2D
@export var playerBaseAnimationPlayer : AnimationPlayer
@export var playerBaseAnimationTree : AnimationTree

signal direction_changed(new_direction:int)

var direction : int = 1
var last_direction : int = 1
var velocity = Input.get_vector("left", "right", "up", "down")

func Enter():
	PlayerMovement()
	UpdateFacingDirection()
	UpdateAnimation()
	## Set label emit here for testing state changes
	
func Update(delta: float):
	UpdateAnimation()
	UpdateFacingDirection()
	
func Physics_Update(delta: float):
	PlayerMovement()
	NoMovement()

func PlayerMovement():
	velocity = Input.get_vector("left", "right", "up", "down")
	velocity = player.velocity.normalized() * player.speed
	
	player.move_and_slide()
	
	if velocity.x > 0 :
		direction = 1
	elif velocity.x < 0:
		direction = -1
	elif velocity.x == 0:
		direction = 0
		
	if velocity.y != 0 && (direction == 0):
		direction = last_direction
	
func UpdateAnimation():
	playerBaseAnimationTree.set("parameters/walk/blend_position", direction)
	
func UpdateFacingDirection():
	if direction > 0:
		playerBase.flip_h = false
		last_direction = direction
	elif direction < 0:
		playerBase.flip_h = true
		last_direction = direction

func set_last_direction(new_direction):
	if last_direction != new_direction:
		last_direction = new_direction
		emit_signal("direction_changed", new_direction)

func NoMovement():
	if Vector2.ZERO:
		Transitioned.emit(State, "idle")
	









