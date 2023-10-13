extends Area2D
class_name DoorComponent

var _player_ref: Character = null

@export_category("Objects")
@export_category("Variables")
@export var _teleport_position: Vector2
@export var _animation: AnimationPlayer = null

func _on_body_entered(_body) -> void:
	#Player entrando na região da porta
	if _body is Character:
		_player_ref = _body
		_animation.play("open")

func _on_animation_finished(_anim_name: String) -> void:
	#Player é teleportado para a posição ao passar pela porta
	if _anim_name == "open":
		_player_ref.global_position = _teleport_position
		_animation.play("close")
