extends CanvasLayer

export var MUSIC: NodePath
export var MUSIC_MENU: NodePath
export var CLICK: NodePath
export var SETTINGS_ON: NodePath
export var SETTINGS_OFF: NodePath
export var MUSIC_ON: NodePath
export var MUSIC_OFF: NodePath
export var MUSIC_SOUND: NodePath
export var FX_SOUND: NodePath
export var ITCH_ON: NodePath

func _on_Button_Settings_toggled(button_pressed):
	get_node(CLICK).pitch_scale = rand_range(0.95, 1.05)
	get_node(CLICK).play()
	
	if button_pressed:
		$Panel_Menu.visible = true
		if not $Button_Music.pressed:
			get_node(MUSIC_MENU).play()
			get_node(MUSIC).stop()
	else:
		$Panel_Menu.visible = false
		get_node(MUSIC_MENU).stop()
		if not $Button_Music.pressed:
			get_node(MUSIC).play()

func _on_Button_Music_toggled(button_pressed):
	
	get_node(CLICK).pitch_scale = rand_range(0.95, 1.05)
	get_node(CLICK).play()
	
	if not button_pressed:
		if $Button_Settings.pressed:
			get_node(MUSIC_ON).play()
			get_node(MUSIC_MENU).play()
		else:
			get_node(MUSIC_ON).play()
			get_node(MUSIC).play()
	else:
		get_node(MUSIC).stop()
		get_node(MUSIC_MENU).stop()
		if $Button_Itch.pressed: return
		get_node(MUSIC_OFF).play()

func _on_Button_Itch_pressed():
	get_node(CLICK).pitch_scale = rand_range(0.95, 1.05)
	get_node(CLICK).play()
	OS.shell_open('https://nelsondev.itch.io/f-respects')
	get_node(ITCH_ON).play()
	$Button_Music.pressed = true

func _on_HSlider_Music_value_changed(value):
	var bus = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(bus, linear2db(value))
	get_node(MUSIC_SOUND).pitch_scale = value + 1.0
	get_node(MUSIC_SOUND).play()

func _on_HSlider_FX_value_changed(value):
	var bus = AudioServer.get_bus_index("FX")
	AudioServer.set_bus_volume_db(bus, linear2db(value))
	bus = AudioServer.get_bus_index("Interface")
	AudioServer.set_bus_volume_db(bus, linear2db(value))
	get_node(FX_SOUND).bus = "FX"
	get_node(FX_SOUND).pitch_scale = rand_range(0.90, 1.1)
	get_node(FX_SOUND).play()

const X = preload("res://assets/decals/cross.png")
const O = preload("res://assets/decals/crosspressed.png")

func _on_Button_Modifier_No_Cap_toggled(button_pressed):
	get_node(CLICK).pitch_scale = rand_range(0.95, 1.05)
	get_node(CLICK).play()
	if button_pressed:
		$Panel_Menu/Button_Modifier_No_Cap.icon = O
	else:
		$Panel_Menu/Button_Modifier_No_Cap.icon = X
		
func _on_Button_Modifier_Double_Speed_toggled(button_pressed):
	get_node(CLICK).pitch_scale = rand_range(0.95, 1.05)
	get_node(CLICK).play()
	if button_pressed:
		$Panel_Menu/Button_Modifier_Double_Speed.icon = O
	else:
		$Panel_Menu/Button_Modifier_Double_Speed.icon = X


func _on_Button_Modifier_Deadly_Ghosts_toggled(button_pressed):
	get_node(CLICK).pitch_scale = rand_range(0.95, 1.05)
	get_node(CLICK).play()
	if button_pressed:
		$Panel_Menu/Button_Modifier_Deadly_Ghosts.icon = O
	else:
		$Panel_Menu/Button_Modifier_Deadly_Ghosts.icon = X

func _on_Button_Modifier_Big_Hazards_toggled(button_pressed):
	get_node(CLICK).pitch_scale = rand_range(0.95, 1.05)
	get_node(CLICK).play()
	if button_pressed:
		$Panel_Menu/Button_Modifier_Big_Hazards.icon = O
	else:
		$Panel_Menu/Button_Modifier_Big_Hazards.icon = X
	
func _on_Button_Modifier_Small_Player_toggled(button_pressed):
	get_node(CLICK).pitch_scale = rand_range(0.95, 1.05)
	get_node(CLICK).play()
	if button_pressed:
		$Panel_Menu/Button_Modifier_Small_Player.icon = O
	else:
		$Panel_Menu/Button_Modifier_Small_Player.icon = X


