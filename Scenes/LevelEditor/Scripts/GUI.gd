extends Control

#@onready var w: Panel = $PanelContainer/MarginContainer/HBoxContainer/GridContainer/W
@onready var r: Button = $PanelContainer/MarginContainer/HBoxContainer/MoveKeys/RButton
@onready var w: Button = $PanelContainer/MarginContainer/HBoxContainer/MoveKeys/WButton
@onready var a: Button = $PanelContainer/MarginContainer/HBoxContainer/MoveKeys/AButton
@onready var s: Button = $PanelContainer/MarginContainer/HBoxContainer/MoveKeys/SButton
@onready var d: Button = $PanelContainer/MarginContainer/HBoxContainer/MoveKeys/DButton 
@onready var z: SpinBox = $PanelContainer/MarginContainer/HBoxContainer/MoveKeys/Z
@onready var set = $PanelContainer/MarginContainer/HBoxContainer/FunctionKeys/SetButton

@onready var libSelectPanel = $SelectWindow
@onready var meshlibPanel = $PanelContainer/MarginContainer/HBoxContainer/MeshlibPanel

var selectedMeshlib: MeshLibrary

signal meshlib_selected(lib: MeshLibrary)
signal key_pressed(key: StringName)
signal z_value_changed(value)
# Called when the node enters the scene tree for the first time.
func _ready():
	libSelectPanel.mesh_selected.connect(lib_selected)
	z.value_changed.connect(func(value): z_value_changed.emit(value))

func _input(event):
	if event.is_action_pressed("forward"):
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
	elif event.is_action_pressed("enter"):
		set.button_pressed = true
		key_pressed.emit("set")
	elif event.is_action_pressed("reload"):
		r.button_pressed = true
		key_pressed.emit("r")
	
	if event.is_action_released("forward"):
		w.button_pressed = false
	elif event.is_action_released("backward"):
		s.button_pressed = false
	elif event.is_action_released("left"):
		a.button_pressed = false
	elif event.is_action_released("right"):
		d.button_pressed = false
	elif event.is_action_released("enter"):
		set.button_pressed = false
	elif event.is_action_released("reload"):
		r.button_pressed = false

func lib_selected(name):
	selectedMeshlib = load(libSelectPanel.MESHLIBPATH+name+".meshlib")
	libSelectPanel.visible = false
	anchors_preset = PRESET_BOTTOM_WIDE
	meshlibPanel.defin_meshlib(selectedMeshlib)
	meshlib_selected.emit(selectedMeshlib)
