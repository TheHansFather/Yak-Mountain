extends CharacterBody2D

@export var playerBaseAnimationTree : AnimationTree
@export var outfitBaseAnimationTree : AnimationTree
@export var weaponBaseAnimationTree : AnimationTree

@export var inventory : Inv

#@export var outfitBase : Sprite2D

var speed : int = 250
var weapon_equipped : bool = false

func _ready():
	playerBaseAnimationTree.active = true
	outfitBaseAnimationTree.active = true
	weaponBaseAnimationTree.active = true
	
	
	#outfitBase.visible = false
