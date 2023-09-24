extends Node2D

signal damage_taken



func _on_area_2d_area_entered(area):
	print("Player hit by enemy")
	damage_taken.emit()
