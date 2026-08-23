extends Control

var score = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		score+=1
		$Panel/HBoxContainer/RichTextLabel.text = str(score)
