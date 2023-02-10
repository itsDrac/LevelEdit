extends TabContainer

@export_file("*meshlib") var pathToMeshlib: String
@onready var meshlib: MeshLibrary = load(pathToMeshlib)
var panalChild: MeshlibPanel
# Called when the node enters the scene tree for the first time.
var meshlibName: StringName
var panels: Array[Panel]

func _ready():
	meshlibName = pathToMeshlib.get_file().replace(".meshlib","").capitalize()
	print(meshlib.get_item_list())
	connect("ready",func(): print("Tab Container ready function executed"))
	create_panalChild(meshlibName)


func create_panalChild(name: StringName):
	panalChild = MeshlibPanel.new()
	panalChild.name = name
	add_child(panalChild)
	print(panalChild.hbox_path)
	await panalChild.ready
	panalChild.connect("ready",func():print("child ready"))
	add_preview_in_panel(panalChild, meshlib)

func add_preview_in_panel(p: MeshlibPanel, ml: MeshLibrary):
	for mesh in ml.get_item_list():
		p.add_preview(mesh,ml.get_item_preview(mesh))

