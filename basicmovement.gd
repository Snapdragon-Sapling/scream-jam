extends CharacterBody2D

@export var SPEED = 200


func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = 0

	#get the average positions of leg targets 1&2 and leg targets 3&4
	#use those two positions to construct a plane:
	#var dvec = point_A.direction_to(point_B)
	#var normal = vector2(dvec.y, -dvec.x)
		#(that negative might need to be swapped if that's the wrong way)
	#if dot product of normal and body normal are greater than (wiggle room):
	#rotate body normal to align with normal by rotation speed

	move_and_slide()
