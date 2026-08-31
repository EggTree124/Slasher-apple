extends AnimatableBody3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var slash: AudioStreamPlayer3D = $Cube/Slash
func _ready() -> void:
	add_to_group("knife")
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("swing"):
		if slash and slash.stream:
			slash.play()
			if animation_player and animation_player.has_animation("slash"):
				animation_player.play("slash")
