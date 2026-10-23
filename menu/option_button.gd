extends OptionButton
var resolutions:Dictionary={
	"1920x1080": Vector2i(1920,1080),
	"1600x900":Vector2i(1600,900),
	"1280x720":Vector2i(1280,720),
	"640x480":Vector2i(640,480)}
func _ready() -> void:
		add_resolution()
		item_selected.connect(_on_resolution_selected)
		select_current_resolution()
func add_resolution() -> void:
	clear()
	for res_name in resolutions.keys():
		add_item(res_name)

func _on_resolution_selected(index: int) -> void:
	var res_name = get_item_text(index)
	var target_size = resolutions[res_name]
	DisplayServer.window_set_size(target_size)
	center_window()
	
func center_window() -> void:
	var screen_id = DisplayServer.window_get_current_screen()
	var screen_rect = DisplayServer.screen_get_usable_rect(screen_id)
	var window_size = DisplayServer.window_get_size()
 
	var center_position = screen_rect.position + (screen_rect.size / 2) - (window_size / 2)
	DisplayServer.window_set_position(center_position)

func select_current_resolution() -> void:
	var current_size = DisplayServer.window_get_size()
	var index = 0
	for res_size in resolutions.values():
		if res_size == current_size:
			selected = index
			return
		index += 1
