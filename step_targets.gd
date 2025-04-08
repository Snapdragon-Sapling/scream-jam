extends Node2D

@export var offset: float = 20

@onready var parent = $%CharacterContainer
@onready var previous_position = parent.global_position

func _process(delta):
	var velocity = parent.global_position - previous_position
	global_position = parent.global_position + velocity * offset
	
	previous_position = parent.global_position
