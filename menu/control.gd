extends Control
@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var options: Panel = $options
func _ready() -> void:
	v_box_container.visible=true
	options.visible=false
func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")

func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file("res://continue.tscn")

func _on_options_pressed() -> void:
	v_box_container.visible=false
	options.visible=true
	
func _on_quit_pressed() -> void:
	get_tree().quit()
	
func _on_back_pressed() -> void:
		get_tree().change_scene_to_file("res://control.tscn")
