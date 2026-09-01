extends RigidBody3D
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node) -> void:
	if body is AnimatableBody3D:
		Score.money += Score.apple_value
		var money_label = get_tree().get_nodes_in_group("money_label")
		if money_label.size()>0:
			var target_mlabel = money_label[0] as Label
			target_mlabel.text = "Money = $" + str(Score.money)
		timer.start()

func _on_timer_timeout() -> void:
	queue_free()
