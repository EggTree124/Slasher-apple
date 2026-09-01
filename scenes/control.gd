extends Control

@onready var button: Button = $VBoxContainer/Button
@onready var button_2: Button = $VBoxContainer/Button2
@onready var audio = $"../Pop"

func _on_button_pressed() -> void:
	audio.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_button_2_pressed() -> void:
	audio.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().quit()
