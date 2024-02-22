extends State
class_name IdleArmed

@export var player : CharacterBody2D

@export var weapon : Sprite2D

@export var playerBaseAnimationTree : AnimationTree
@export var outfitAnimationTree : AnimationTree
@export var weaponAnimationTree : AnimationTree


func Enter():
	print("entering idle_armed state")
	player.weapon_equipped = true
	weapon.visible = true
	UpdateAnimationParameters()
	
func Update(_delta: float):
	DetectWeapon()
	
func Physics_Update(_delta: float):
	DetectMovement()
	
func DetectMovement():
	if (player.weapon_equipped == true && Input.is_action_just_pressed("down") or
	Input.is_action_just_pressed("up") or
	Input.is_action_just_pressed("left") or
	Input.is_action_just_pressed("right")):
		print("leaving idle state")
		Transitioned.emit(self, "walk_armed")

func DetectWeapon():
	if Input.is_action_just_pressed("(un)equip"):
		Transitioned.emit(self, "idle")
	
func UpdateAnimationParameters():
	if player.velocity == Vector2.ZERO:
		playerBaseAnimationTree["parameters/conditions/idle"] = false
		playerBaseAnimationTree["parameters/conditions/is_moving"] = false
		playerBaseAnimationTree["parameters/conditions/armed_idle"] = true
		playerBaseAnimationTree["parameters/conditions/armed_is_moving"] = false
		
		outfitAnimationTree["parameters/conditions/idle"] = false
		outfitAnimationTree["parameters/conditions/is_moving"] = false
		outfitAnimationTree["parameters/conditions/armed_idle"] = true
		outfitAnimationTree["parameters/conditions/armed_is_moving"] = false
		
		weaponAnimationTree["parameters/conditions/has_weapon"] = true
		weaponAnimationTree["parameters/conditions/idle"] = true
		weaponAnimationTree["parameters/conditions/is_moving"] = false
