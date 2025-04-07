extends CharacterBody2D

var inputs = {
	"up": null,
	"down": null,
	"left": null,
	"right": null,
	"jump": null,
	"volley": null,
	"smash": null,
	"lob": null,
}

@export_subgroup("Nodes")
@export var gravity_component: GravityComponent
@export var jump_component: JumpComponent
@export var input_component: InputComponent
@export var movement_component: MovementComponent
@export var animation_component: AnimationComponent
@export var volley_component: VolleyComponent
@export var smash_component: SmashComponent
@export var lob_component: LobComponent

var team: String
var is_hitting: bool = false
var is_dashing: bool = false
var is_airbourne: bool = false
var is_running: bool = false

var dead: bool = false


func _physics_process(delta: float) -> void:
	if dead:
		return
	gravity_component.handle_gravity(self, delta)
	movement_component.handle_horizontal_movement(self, input_component.input_horizontal)
	animation_component.handle_move_animation(input_component.input_horizontal)
	jump_component.handle_jump(self,input_component.get_jump_input())
	volley_component.handle_hitbox(self,input_component.get_volley_input())
	smash_component.handle_hitbox(self,input_component.get_smash_input())
	lob_component.handle_hitbox(self,input_component.get_lob_input())
	move_and_slide()


func _on_flippable_sprite_animation_finished() -> void:
	volley_component.animation_finished()
	smash_component.animation_finished()
	lob_component.animation_finished()
	#print("done")


func die():
	#print("Kaboom! You dead.")
	#dead = true
	pass
	
