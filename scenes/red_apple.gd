extends RigidBody3D

func _on_body_entered(body: Node) -> void:
	if body is AnimatableBody3D:
		Score.money += 20
		var money_label = get_tree().get_nodes_in_group("money_label")
		if money_label.size()>0:
			var target_mlabel = money_label[0] as Label
			target_mlabel.text = "Money: " + str(Score.money)
