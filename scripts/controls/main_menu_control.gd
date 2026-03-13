extends Node

# MainMenuControl handles the main menu interactions.

# Needed:
# - Start Button
# - Settings Button
# - Credits Button
# - Exit Button
# - Background Image

# Z-Indices:

const Z_INDICES = {
	"background": -10,
	"buttons": 0
}

func set_z_indices():
	background_image.z_index = Z_INDICES["background"]
	start_button.z_index = Z_INDICES["buttons"]
	settings_button.z_index = Z_INDICES["buttons"]
	exit_button.z_index = Z_INDICES["buttons"]

# Buttons
# Text for now, change to TextureButton later for drawn feel.

@export var start_button: Button
@export var settings_button: Button
@export var credits_button: Button
@export var exit_button: Button

func verify():
	assert(start_button, "StartButton not found in MainMenuControl.")
	assert(settings_button, "SettingsButton not found in MainMenuControl.")
	assert(credits_button, "CreditsButton not found in MainMenuControl.")
	assert(exit_button, "ExitButton not found in MainMenuControl.")

# Background image

@export var background_image: TextureRect

# Inputs

func connect_buttons():
	start_button.pressed.connect(_on_start_button_pressed)
	settings_button.pressed.connect(_on_settings_button_pressed)
	credits_button.pressed.connect(_on_credits_button_pressed)
	exit_button.pressed.connect(_on_exit_button_pressed)

func _on_start_button_pressed():
	ScenesManager.start_game()

func _on_settings_button_pressed():
	print("Settings button pressed. (Not implemented yet)")

func _on_credits_button_pressed():
	print("Credits button pressed. (Not implemented yet)")

func _on_exit_button_pressed():
	get_tree().quit()

# Ready

func _ready():
	verify()
	set_z_indices()
	connect_buttons()
