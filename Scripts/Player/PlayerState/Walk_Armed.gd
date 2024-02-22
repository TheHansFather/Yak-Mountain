extends State
class_name WalkArmed

@export var player : CharacterBody2D

@export var playerBase : Sprite2D
@export var outfitBase : Sprite2D
@export var weapon : Sprite2D

@export var playerBaseAnimationTree : AnimationTree
@export var outfitAnimationTree : AnimationTree
@export var weaponAnimationTree : AnimationTree


var direction : int = 1
var last_direction : int = 1
var velocity : Vector2 = Vector2.ZERO

func Enter():
	print("entering walk State")
	player.weapon_equipped = true
	weapon.visible = true
	
func Update(_delta: float):
	UpdateAnimationParameters()
	UpdateFacingDirection()
	DetectWeapon()
	
func Physics_Update(_delta: float):
	PlayerMovement()
	NoMovement()

func PlayerMovement():
	if player.weapon_equipped == true:
		velocity = Input.get_vector("left", "right", "up", "down").normalized()
		velocity = velocity * player.speed
		player.velocity = velocity
		player.move_and_slide()
		
		if velocity.x > 0 :
			direction = 1
		elif velocity.x < 0:
			direction = -1
		elif velocity.x == 0:
			direction = 0
			
		if velocity.y != 0 && (direction == 0):
			direction = last_direction
	
func UpdateAnimationParameters():
	if player.velocity != Vector2.ZERO:
		playerBaseAnimationTree["parameters/conditions/is_moving"] = false
		playerBaseAnimationTree["parameters/conditions/idle"] = false
		playerBaseAnimationTree["parameters/conditions/armed_idle"] = false
		playerBaseAnimationTree["parameters/conditions/armed_is_moving"] = true
		
		outfitAnimationTree["parameters/conditions/is_moving"] = false
		outfitAnimationTree["parameters/conditions/idle"] = false
		outfitAnimationTree["parameters/conditions/armed_idle"] = false
		outfitAnimationTree["parameters/conditions/armed_is_moving"] = true
		
		weaponAnimationTree["parameters/conditions/has_weapon"] = true
		weaponAnimationTree["parameters/conditions/idle"] = false
		weaponAnimationTree["parameters/conditions/is_moving"] = true
		
		playerBaseAnimationTree.set("parameters/walk_1h/blend_position", direction)
		outfitAnimationTree.set("parameters/outfit_walk_1h/blend_position", direction)
		weaponAnimationTree.set("parameters/walk/blend_position", direction)

func UpdateFacingDirection():
	if direction > 0:
		playerBase.flip_h = false
		outfitBase.flip_h = false
		weapon.flip_h = false
		last_direction = direction
	elif direction < 0:
		playerBase.flip_h = true
		outfitBase.flip_h = true
		weapon.flip_h = true
		last_direction = direction

func set_last_direction(new_direction):
	if last_direction != new_direction:
		last_direction = new_direction

func NoMovement():
	if velocity == Vector2.ZERO:
		Transitioned.emit(self, "idle_armed")
		print("leaving walk state")

func DetectWeapon():
	if Input.is_action_just_pressed("(un)equip"):
		print("pressed")
		Transitioned.emit(self, "walk")












