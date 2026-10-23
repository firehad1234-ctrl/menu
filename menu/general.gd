extends HSlider
var bus
func _ready() -> void:
	bus=AudioServer.get_bus_index("Master")
	
func _on_value_changed(value: float) -> void:
	var db=linear_to_db(value)
	AudioServer.set_bus_volume_db(bus, db)
