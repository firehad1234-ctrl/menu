extends Control
@export var audio_music: String
func _on_back_pressed() -> void:
		get_tree().change_scene_to_file("res://control.tscn")
var audio_bus_id
func _ready() -> void:
	audio_bus_id=AudioServer.get_bus_index("music")
func _on_music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(audio_bus_id,value)
