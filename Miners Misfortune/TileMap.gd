extends TileTools

@export var player : CharacterBody2D
@export var nextLevel : PackedScene

@onready var regularExits = cells_in_atlas([Vector2i(3,2)])
@onready var redExits = cells_in_atlas([Vector2i(4,2)])
@onready var blueExits = cells_in_atlas([Vector2i(5,2)])
@onready var allExits = regularExits+redExits+blueExits

var cellPlayerIsOn

func _ready():
	pass

func _process(_delta):
	_update_paths_and_exits()
	
	if len(allExits) == 0:
		get_tree().change_scene_to_packed(nextLevel)
		if nextLevel == null:
			get_tree().change_scene_to_file("res://Levels/Level 0.tscn")
func _update_paths_and_exits():
	cellPlayerIsOn = local_to_map(player.position)
	
	if cellPlayerIsOn in allExits:
		
		if cellPlayerIsOn in redExits:
			for cell in get_used_cells(0):
				if get_cell_atlas_coords(0,cell).y in [6,7,8]:
					update_cell_atlas(cell,0,0,Vector2i(1,1))
					
		if cellPlayerIsOn in blueExits:
			for cell in get_used_cells(0):
				if get_cell_atlas_coords(0,cell).y in [9,10,11]:
					update_cell_atlas(cell,0,0,Vector2i(1,1))
		
		update_cell_atlas(cellPlayerIsOn,0,0,Vector2i(3,3))
		update_cell_atlas(cellPlayerIsOn+Vector2i(0,1),0,0,Vector2i(3,4))
		
		allExits.erase(cellPlayerIsOn)
	
	
