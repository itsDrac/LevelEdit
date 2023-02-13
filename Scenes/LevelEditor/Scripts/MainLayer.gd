extends CanvasLayer

@onready var gui = $GUI
@onready var base = $Base
# Called when the node enters the scene tree for the first time.
func _ready():
	gui.meshlib_selected.connect(assigin_meshlib)
	gui.key_pressed.connect(func(key): base.move_key_pressed(key))
	gui.meshlibPanel.texture_button_clicked.connect(selected_mesh_id)

func assigin_meshlib(mesh: MeshLibrary):
	base.gridMap.mesh_library = mesh

func selected_mesh_id(mesh_id: int):
	base.add_mesh_in_map(mesh_id)

# Called every frame. 'delta' is the elapsed time since the previous frame.
