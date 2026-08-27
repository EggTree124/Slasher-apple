extends RigidBody3D

func _on_body_entered(body: Node) -> void:
	if body is AnimatableBody3D:
		Score.score += 1
		Score.money += 20
		var label = get_tree().get_nodes_in_group("score_label")
		var money_label = get_tree().get_nodes_in_group("money_label")
		if label.size()>0 and money_label.size()>0:
			var target_label = label[0] as Label
			var target_mlabel = money_label[0] as Label
			target_label.text = "Score: " + str(Score.score)
			target_mlabel.text = "Money: " + str(Score.money)
