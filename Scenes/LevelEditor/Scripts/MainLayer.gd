extends CanvasLayer

@onready var gui = $GUI
@onready var base = $Base
# Called when the node enters the scene tree for the first time.
func _ready():
	gui.meshlib_selected.connect(
		func(mesh): 
			base.mesh_changed.emit(mesh))
	gui.key_pressed.connect(
		func(key): 
			base.move_key_pressed(key))
	gui.meshlibPanel.texture_button_clicked.connect(
		func(mesh_id):
			base.add_mesh_in_map(mesh_id))
	gui.z_value_changed.connect(
		func(value):
			print(value)
			base.z_value = Vector3i(0,value,0))

func assigin_meshlib(mesh: MeshLibrary):
	base.mesh_changed.emit(mesh)

func selected_mesh_id(mesh_id: int):
	base.add_mesh_in_map(mesh_id)

# Called every frame. 'delta' is the elapsed time since the previous frame.
