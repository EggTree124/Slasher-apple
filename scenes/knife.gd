extends AnimatableBody3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	add_to_group("knife")
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		animation_player.play("slash")
