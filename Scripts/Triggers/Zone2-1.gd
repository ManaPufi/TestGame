extends Area2D

@onready var Zone2 = $"../../Camera's/Zone2"
@onready var Zone3 = $"../../Camera's/Zone3"

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and Zone2.enabled == true:
		Zone2.enabled = false
		Zone3.enabled = true
	
	elif body.name == "Player" and Zone3.enabled == true:
		Zone3.enabled = false
		Zone2.enabled = true
