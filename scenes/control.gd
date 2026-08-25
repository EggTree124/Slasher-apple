extends Control
@onready var rich_text_label: Label = $Panel/HBoxContainer/RichTextLabel
@onready var button_2: Button = $Panel/HBoxContainer/Button2

func _ready() -> void:
	add_to_group("hud")

func _on_button_2_pressed() -> void:
	var knife = get_tree().get_first_node_in_group("knife")
	if knife:
		var anim_player = knife.get_node("AnimationPlayer") as AnimationPlayer
		anim_player.speed_scale += 0.01
