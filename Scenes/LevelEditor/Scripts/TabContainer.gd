extends TabContainer

@export_file("*meshlib") var pathToMeshlib: String
@onready var meshlib: MeshLibrary = load(pathToMeshlib)
# Called when the node enters the scene tree for the first time.
var meshlibName: StringName
var panels: Array[Panel]

func _ready():
	meshlibName = pathToMeshlib.get_file().replace(".meshlib","").capitalize()
	var p = Panel.new()
	p.name = meshlibName
	add_child(p)
	print(meshlib.get_item_list())

func add_preview_in_panel(p: Panel, ml: MeshLibrary):
	for mesh in ml.get_item_list():
		pass
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
