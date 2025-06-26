extends Area2D

@onready var Zone1 = $"../../Camera's/Zone1"
@onready var Zone2 = $"../../Camera's/Zone2"

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and Zone1.enabled == true:
		Zone1.enabled = false
		Zone2.enabled = true
	
	elif body.name == "Player" and Zone2.enabled == true:
		Zone2.enabled = false
		Zone1.enabled = true
