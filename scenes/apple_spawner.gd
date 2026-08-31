extends Node3D

@export var apple_scene: PackedScene
@onready var timer: Timer = $Timer
@onready var spawn_point: Node3D = $SpawnPoint

func _ready() -> void:
	timer.timeout.connect(spawn_apple)

func spawn_apple() -> void:
	var apple = apple_scene.instantiate()
	get_tree().current_scene.add_child(apple)
	apple.global_position = spawn_point.global_position
