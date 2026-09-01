extends Control

var speed_level = 0
var speed_upgrade_cost = 20

var income_level = 0
var income_upgrade_cost = 20

var spawn_level := 0
var spawn_upgrade_cost := 20

const SPAWN_TIME_DECREASE := 0.1
const MIN_SPAWN_TIME := 0.2

const MAX_SPAWN_LEVEL := 10

const SPEED_INCREASE := 0.10
const INCOME_INCREASE := 5.0

const COST_MULT := 1.5
const INCOME := 1.6

const MAX_SPEED_LEVEL := 10
const MAX_INCOME_LEVEL := 10

@onready var money: Label = $ColorRect/VBoxContainer/Money
@onready var button: Button = $ColorRect/VBoxContainer/Button
@onready var button_2: Button = $ColorRect/VBoxContainer/Button2
@onready var button_3: Button = $ColorRect/VBoxContainer/Button3
@onready var audio = $Pop
func _ready():
	update_ui()

func _on_button_pressed() -> void:
	audio.play()
	await get_tree().create_timer(0.2).timeout
	print("UPGRADE BUTTON PRESSED")
	if Score.money < speed_upgrade_cost:
		return
	var knife = get_tree().get_first_node_in_group("knife")
	if knife == null:
		return
	if speed_level >= MAX_SPEED_LEVEL:
		return
	Score.money -= speed_upgrade_cost
	speed_level += 1 
	var anim_player = knife.get_node("AnimationPlayer") as AnimationPlayer
	anim_player.speed_scale += SPEED_INCREASE
	speed_upgrade_cost = roundi(speed_upgrade_cost*COST_MULT)
		
	update_ui()

func _on_button_2_pressed() -> void:
	audio.play()
	await get_tree().create_timer(0.2).timeout
	if income_level >= MAX_INCOME_LEVEL:
		return
	
	if Score.money < income_upgrade_cost:
		return
	
	Score.money -= income_upgrade_cost
	
	income_level += 1
	Score.apple_value += INCOME_INCREASE
	income_upgrade_cost = roundi(income_upgrade_cost * COST_MULT)
	update_ui()

func _on_button_3_pressed() -> void:
	audio.play()
	await get_tree().create_timer(0.2).timeout
	if spawn_level >= MAX_SPAWN_LEVEL:
		return
	if Score.money < spawn_upgrade_cost:
		return
	var apple_timer = get_tree().get_first_node_in_group("apple_timer") as Timer
	if apple_timer == null:
		return
	Score.money -= spawn_upgrade_cost
	spawn_level += 1
	apple_timer.wait_time = max(
		MIN_SPAWN_TIME,
		apple_timer.wait_time - SPAWN_TIME_DECREASE
	)
	apple_timer.start()
	spawn_upgrade_cost = roundi(spawn_upgrade_cost * COST_MULT)
	update_ui()

func update_ui():
	if Score.money <= 0:
		money.text = "Money = $0" 
	else:
		money.text = "Money = $" + str(Score.money)
	
	button.text = "Speed Lv. %d - $%d" % [speed_level, speed_upgrade_cost]
	button_2.text = "Income Lv. %d - $%d" % [income_level,income_upgrade_cost]
	button_3.text = "Spawn Lv. %d - $%d" % [
		spawn_level,
		spawn_upgrade_cost
	]
	
