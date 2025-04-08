extends Node2D

@export var step_target: Node2D
@export var step_distance: float = 50
@export var step_height: float = -50
@export var next_leg: Node2D

var is_stepping: bool = false
var can_step: bool = false

func _physics_process(delta):
	if abs(global_position.distance_to(step_target.global_position)) > step_distance && can_step && !is_stepping:
		step()
	elif can_step && !is_stepping:
		can_step = false
		next_leg.can_step = true

func step():
	var target_position = step_target.global_position
	var midpoint = (global_position + step_target.global_position) / 2
	
	midpoint.y += step_height
	
	is_stepping = true
	var t = get_tree().create_tween()
	t.tween_property(self, "global_position", midpoint, 0.1)
	t.tween_property(self, "global_position", target_position, 0.1)
	t.tween_callback(func(): is_stepping = false)
	t.tween_callback(func(): can_step = false)
	t.tween_callback(func(): next_leg.can_step = true)
