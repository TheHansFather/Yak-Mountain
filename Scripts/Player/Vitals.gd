extends Node2D

signal updateUI

var needFood = false

#################################################
#testing

#func _process(delta):
	#if Input.is_action_just_pressed("ui_up"):
		#gainHealth(25)
		
	#if Input.is_action_just_pressed("ui_down"):
		#gainHunger(50)
		#print("My mans ate a literal pile of dogshit")

#end testing
##################################################



## Health ## 

func getDamage(damage):
	PlayerState.health = max(PlayerState.health - damage, 0)
	updateUI.emit()
	if PlayerState.health == 0:
		playerDeath()


func gainHealth(gainedHealth):
	PlayerState.health = min(PlayerState.health + gainedHealth, PlayerState.maxHealth)
	updateUI.emit()





## Hunger ##

func loseHunger(hungerToLose):
	PlayerState.hunger = max(PlayerState.hunger - hungerToLose, 0)
	updateUI.emit()
	if PlayerState.hunger == 0 and !needFood:
		needFood = true
		$"../Timers/HungerDamageTimer".start()
		updateUI.emit()


func gainHunger(gainedHunger):
	PlayerState.hunger = min(PlayerState.hunger + gainedHunger, PlayerState.maxHunger)
	updateUI.emit()
	needFood = false





## Death ##

func playerDeath():
	pass



## Timers ##

func _on_hunger_timer_timeout():
	loseHunger(10)


func _on_hunger_damage_timer_timeout():
	getDamage(10)
	needFood = false
	
