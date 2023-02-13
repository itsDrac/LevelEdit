extends Control

#@onready var w: Panel = $PanelContainer/MarginContainer/HBoxContainer/GridContainer/W
@onready var w: Button = $PanelContainer/MarginContainer/HBoxContainer/GridContainer/WButton
@onready var a: Button = $PanelContainer/MarginContainer/HBoxContainer/GridContainer/AButton
@onready var s: Button = $PanelContainer/MarginContainer/HBoxContainer/GridContainer/SButton
@onready var d: Button = $PanelContainer/MarginContainer/HBoxContainer/GridContainer/DButton 
@onready var z: SpinBox = $PanelContainer/MarginContainer/HBoxContainer/GridContainer/Z
@onready var libSelectPanel = $SelectWindow
@onready var meshlibPanel = $PanelContainer/MarginContainer/HBoxContainer/MeshlibPanel

var selectedMeshlib: MeshLibrary

signal meshlib_selected(lib: MeshLibrary)
signal key_pressed(key: StringName)

# Called when the node enters the scene tree for the first time.
func _ready():
	libSelectPanel.mesh_selected.connect(lib_selected)

func _input(event):
	if event.is_action_pressed("forward"):
#		w.add_theme_stylebox_override("panel", pressedStyle)
		w.button_pressed = true
		key_pressed.emit("w")
	elif event.is_action_pressed("backward"):
		s.button_pressed = true
		key_pressed.emit("s")
	elif event.is_action_pressed("left"):
		a.button_pressed = true
		key_pressed.emit("a")
	elif event.is_action_pressed("right"):
		d.button_pressed = true
		key_pressed.emit("d")
	
	if event.is_action_released("forward"):
#		w.add_theme_stylebox_override("panel", unpressedStyle)
		w.button_pressed = false
	elif event.is_action_released("backward"):
		s.button_pressed = false
	elif event.is_action_released("left"):
		a.button_pressed = false
	elif event.is_action_released("right"):
		d.button_pressed = false

func lib_selected(name):
	selectedMeshlib = load(libSelectPanel.MESHLIBPATH+name+".meshlib")
	libSelectPanel.visible = false
	anchors_preset = PRESET_BOTTOM_WIDE
	meshlibPanel.defin_meshlib(selectedMeshlib)
	meshlib_selected.emit(selectedMeshlib)
