extends CharacterBody2D


#@onready var playerBase_sprite : Sprite2D = $playerBase
#@onready var outfitBase_sprite : Sprite2D = $outfitBase

@onready var playerBase_animation_tree : AnimationTree = $playerBaseAnimationTree
#@onready var state_machine : PlayerStateMachine = $PlayerStateMachine


var speed : int = 250
#var direction : int = 1
#var last_direction : int = 1

func _ready():
	#$weaponBase.visible = false
	playerBase_animation_tree.active = true

#func _process(delta):
	#PlayerMovement()
	#PlayerAnimation()
	#update_facing_position()
		#
#func PlayerMovement():
	#velocity = Input.get_vector("left", "right", "up", "down")
	#velocity = velocity.normalized() * speed
	#
	#move_and_slide()
	
	#if velocity.x > 0 :
		#direction = 1
	#elif velocity.x < 0:
		#direction = -1
	#elif velocity.x == 0:
		#direction = 0
	#if velocity.y != 0 && (direction == 0):
		#direction = last_direction
#func update_facing_position():
	#if direction > 0:
		#playerBase_sprite.flip_h = false
		#last_direction = direction
	#elif direction < 0:
		#playerBase_sprite.flip_h = true
		#last_direction = direction
#func PlayerAnimation():	
	
	#playerBase_animation_tree.set("parameters/walk/blend_position", direction)
	
	
	
