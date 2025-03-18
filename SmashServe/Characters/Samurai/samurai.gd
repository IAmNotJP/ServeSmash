extends CharacterBody2D

@export_subgroup("Nodes")
@export var gravity_component: GravityComponent
@export var input_component: InputComponent
@export var movement_component: MovementComponent
@export var animation_component: AnimationComponent

var team: String = 'red'
var is_hitting: bool = false
var is_dashing: bool = false


func _physics_process(delta: float) -> void:
	gravity_component.handle_gravity(self,delta)
	movement_component.handle_horizontal_movement(self, input_component.input_horizontal)
	animation_component.handle_move_animation(input_component.input_horizontal)
	move_and_slide()
