extends State
class_name Idle

@export var player : CharacterBody2D

@export var playerBaseAnimationTree : AnimationTree
@export var outfitAnimationTree : AnimationTree
@export var weaponAnimationTree : AnimationTree

@export var weapon : Sprite2D 


func Enter():
	print("entering idle state")
	player.weapon_equipped = false
	weapon.visible = false
	UpdateAnimationParameters()
	
func Update(_delta: float):
	DetectWeapon()
	
func Physics_Update(_delta: float):
	DetectMovement()
	
func DetectMovement():
	if (Input.is_action_just_pressed("down") or
	Input.is_action_just_pressed("up") or
	Input.is_action_just_pressed("left") or
	Input.is_action_just_pressed("right")):
		print("leaving idle state")
		Transitioned.emit(self, "walk")

func DetectWeapon():
	if Input.is_action_just_pressed("(un)equip"):
		print("pressed")
		Transitioned.emit(self, "idle_armed")
	
func UpdateAnimationParameters():
	if player.velocity == Vector2.ZERO:
		playerBaseAnimationTree["parameters/conditions/idle"] = true
		playerBaseAnimationTree["parameters/conditions/is_moving"] = false
		playerBaseAnimationTree["parameters/conditions/armed_idle"] = false
		playerBaseAnimationTree["parameters/conditions/armed_is_moving"] = false
		
		outfitAnimationTree["parameters/conditions/idle"] = true
		outfitAnimationTree["parameters/conditions/is_moving"] = false
		outfitAnimationTree["parameters/conditions/armed_idle"] = false
		outfitAnimationTree["parameters/conditions/armed_is_moving"] = false
		
		weaponAnimationTree["parameters/conditions/has_weapon"] = false
		weaponAnimationTree["parameters/conditions/idle"] = false
		weaponAnimationTree["parameters/conditions/is_moving"] = false
	
	
	
	
	
	
	
	
