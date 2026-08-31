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

@onready var money: Label = $VBoxContainer/Money
@onready var button: Button = $VBoxContainer/Button
@onready var button_2: Button = $VBoxContainer/Button2
@onready var button_3: Button = $VBoxContainer/Button3

func _ready():
	update_ui()

func _on_button_pressed() -> void:
	print("UPGRADE BUTTON PRESSED")
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
	if income_level >= MAX_INCOME_LEVEL:
		return
	
	if Score.money < income_upgrade_cost:
		return
	
	income_level ++ 1
	Score.apple_value += INCOME_INCREASE
	income_upgrade_cost = roundi(income_upgrade_cost * COST_MULT)
	update_ui()

func _on_button_3_pressed() -> void:
	if spawn_level >= MAX_SPAWN_LEVEL:
		return

	if Score.money < spawn_upgrade_cost:
		return

	var apple_timer = get_tree().get_first_node_in_group("apple_timer") as Timer

	if apple_timer == null:
		return

	# Pay for upgrade
	Score.money -= spawn_upgrade_cost

	# Increase upgrade level
	spawn_level += 1

	# Make apples spawn faster
	apple_timer.wait_time = max(
		MIN_SPAWN_TIME,
		apple_timer.wait_time - SPAWN_TIME_DECREASE
	)

	# Apply new spawn time immediately
	apple_timer.start()

	# Increase future upgrade cost
	spawn_upgrade_cost = roundi(spawn_upgrade_cost * COST_MULT)

	update_ui()

func update_ui():
	money.text = "Money = $" + str(Score.money)
	
	button.text = "Speed Lv. %d - $%d" % [speed_level, speed_upgrade_cost]
	button_2.text = "Income Lv. %d - $%d" % [income_level,income_upgrade_cost]
	button_3.text = "Spawn Lv. %d - $%d" % [
		spawn_level,
		spawn_upgrade_cost
	]
