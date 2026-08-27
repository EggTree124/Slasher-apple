extends Control

func _on_button_pressed() -> void:
	var knife = get_tree().get_first_node_in_group("knife")
	if knife:
		var anim_player = knife.get_node("AnimationPlayer") as AnimationPlayer
		anim_player.speed_scale+=0.01
