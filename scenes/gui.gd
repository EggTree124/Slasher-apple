extends Control
@onready var button: Button = $VBoxContainer/Button
@onready var button_2: Button = $VBoxContainer/Button2
@onready var button_3: Button = $VBoxContainer/Button3

func _on_button_pressed() -> void:
	var knife = get_tree().get_first_node_in_group("knife")
	if knife:
		var anim_player = knife.get_node("AnimationPlayer") as AnimationPlayer
		anim_player.speed_scale += 0.01
