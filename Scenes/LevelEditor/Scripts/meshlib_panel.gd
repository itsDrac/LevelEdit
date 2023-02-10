extends Panel
class_name MeshlibPanel

@onready
@export_node_path("HBoxContainer") var hbox_path
signal texture_button_clicked (id: int)
# Called when the node enters the scene tree for the first time.
func _ready():
#	hbox = $MarginContainer/ScrollContainer/HBoxContainer
	print(hbox_path)
#	connect("ready",func(): print("Panel ready"))

func add_preview(id: int, texture: Texture2D):
	print("here")
	var tb = TextureButton.new()
	tb.custom_minimum_size = Vector2(150,150)
#	tb.toggle_mode = true
	tb.button_pressed = true if id == 1 else false
	tb.stretch_mode = TextureButton.STRETCH_KEEP
	tb.texture_normal = texture
#	await hbox.ready
#	hbox.add_child(tb)
	tb.connect("pressed",func (): tb.emit_signal("texture_button_click", id))
	
	

func texture_button_click(id):
	print(id," Texture Button clicked")

