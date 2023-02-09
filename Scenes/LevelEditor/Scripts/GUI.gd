extends Control

@onready var w: Panel = $PanelContainer/MarginContainer/HBoxContainer/GridContainer/W
@onready var a: Panel = $PanelContainer/MarginContainer/HBoxContainer/GridContainer/A
@onready var s: Panel = $PanelContainer/MarginContainer/HBoxContainer/GridContainer/S
@onready var d: Panel = $PanelContainer/MarginContainer/HBoxContainer/GridContainer/D
@onready var z: SpinBox = $PanelContainer/MarginContainer/HBoxContainer/GridContainer/Z
var unpressedStyle: StyleBox = preload("res://Scenes/LevelEditor/unpressed_button.stylebox")
var pressedStyle: StyleBox = preload("res://Scenes/LevelEditor/pressed_button.stylebox")
  
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("forward"):
		w.add_theme_stylebox_override("panel", pressedStyle)
	elif event.is_action_pressed("backward"):
		s.add_theme_stylebox_override("panel", pressedStyle)
	elif event.is_action_pressed("left"):
		a.add_theme_stylebox_override("panel", pressedStyle)
	elif event.is_action_pressed("right"):
		d.add_theme_stylebox_override("panel", pressedStyle)
	
	if event.is_action_released("forward"):
		w.add_theme_stylebox_override("panel", unpressedStyle)
	elif event.is_action_released("backward"):
		s.add_theme_stylebox_override("panel", unpressedStyle)
	elif event.is_action_released("left"):
		a.add_theme_stylebox_override("panel", unpressedStyle)
	elif event.is_action_released("right"):
		d.add_theme_stylebox_override("panel", unpressedStyle)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
