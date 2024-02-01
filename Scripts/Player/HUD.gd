extends Control

func _ready():
	updateUI()
	
	
func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		PlayerState.health = min(PlayerState.health + 10, PlayerState.maxHealth)
		updateUI()
	if Input.is_action_just_pressed("ui_left"):
		PlayerState.health = max(PlayerState.health - 10, 0)
		updateUI()

func updateUI():
	#print("Health: " + str(PlayerState.health) + " / " + str(PlayerState.maxHealth))
	#print("Hunger: " + str(PlayerState.hunger) + " / " + str(PlayerState.maxHunger))
	
	
	$HealthBar.max_value = PlayerState.maxHealth
	$HealthBar.value = PlayerState.health
	$HungerBar.max_value = PlayerState.maxHunger
	$HungerBar.value = PlayerState.hunger
	


func _on_vitals_update_ui():
	updateUI()
