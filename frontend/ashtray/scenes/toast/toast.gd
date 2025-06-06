extends Control

signal finished

@export var duration := 5.0

var label
var message_text := ""

func _ready():
	label = $PanelContainer/MarginContainer/Label
	
	label.text = message_text
	
	get_tree().create_timer(duration).timeout.connect(_dismiss)

func set_message(text: String):
	message_text = text
	
	if label:
		label.text = text

func _dismiss():
	emit_signal("finished")
	queue_free()
