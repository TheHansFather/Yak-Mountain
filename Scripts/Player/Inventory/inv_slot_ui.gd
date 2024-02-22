extends Panel

@onready var itemVisual : Sprite2D = $CenterContainer/Panel/itemDisplay

func update(item : InvItem):
	if !item:
		itemVisual.hide()
	else:
		itemVisual.show()
		itemVisual.texture = item.texture
