extends State
class_name IdleState

@export var player : CharacterBody2D
@export var playerBase : Sprite2D
@export var playerBaseAnimationPlayer : AnimationPlayer
@export var playerBaseAnimationTree : AnimationTree

var direction : int = 0

func Enter():
	DetectMovement()
	UpdateFacingDirection()
	playerBaseAnimationTree.set("parameters/walk/blend_position", direction)
	playerBaseAnimationPlayer.play("idle")
	
func Update(delta: float):
	pass
	
func Physics_Update(delta: float):
	DetectMovement()
	
func _on_walk_direction_changed(new_direction):
	new_direction = direction
	
func UpdateFacingDirection():
	if direction > 0:
		playerBase.flip_h = false
	elif direction < 0:
		playerBase.flip_h = true

func DetectMovement():
	if Input.is_action_just_pressed("down") or Input.is_action_just_pressed("up") or Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
		Transitioned.emit(State, "walk")
		Exit()
	
