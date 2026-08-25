extends RigidBody3D

func _on_body_entered(body: Node) -> void:
	if body is AnimatableBody3D:
		Score.score += 1
		var label = get_tree().get_nodes_in_group("score_label")
		if label.size()>0:
			var target_label = label[0] as Label
			target_label.text = str(Score.score)
