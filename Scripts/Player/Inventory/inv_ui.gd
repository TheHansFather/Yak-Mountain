extends Control

@onready var inv : Inv = preload("res://Scripts/Player/Inventory/PlayerInventory.tres")
@onready var slots : Array = $NinePatchRect/GridContainer.get_children()


var isOpened = false

func _ready():
	updateSlots()
	close()

func updateSlots():
	for i in range(min(inv.items.size(), slots.size())):
		slots[i].update(inv.items[i])

func _process(_delta):
	if Input.is_action_just_pressed("Inventory"):
		if isOpened:
			close()
		else:
			open()

func open():
	self.show()
	isOpened = true

func close():
	self.hide()
	isOpened = false
