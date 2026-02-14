extends Node
class_name SettingsManager

# Global settings

var music_volume = 0.5
var sfx_volume = 0.5

func _ready():
	load_cfg()  # Load settings when the game starts

# --- Methods ---
func set_music_volume(volume):
	music_volume = volume
	# Here you would typically update the actual music volume in your audio system

func set_sfx_volume(volume):
	sfx_volume = volume
	# Here you would typically update the actual SFX volume in your audio system

# --- Saving and loading settings ---
func save_cfg(path := "user://settings.cfg"):
	var config = ConfigFile.new()
	config.set_value("audio", "music_volume", music_volume)
	config.set_value("audio", "sfx_volume", sfx_volume)
	config.save(path)

func load_cfg(path := "user://settings.cfg"):
	var config = ConfigFile.new()
	var err = config.load(path)
	if err == OK:
		music_volume = config.get_value("audio", "music_volume", music_volume)
		sfx_volume = config.get_value("audio", "sfx_volume", sfx_volume)
		# Here you would typically update the actual volumes in your audio system
	else:
		print("No settings file found, using default values.")
		save_cfg()  # Save default settings if no file exists

func clear_cfg(path := "user://settings.cfg"):
	var config = ConfigFile.new()
	music_volume = 0.5
	sfx_volume = 0.5
	config.save(path)  # This will create an empty config file, effectively clearing settings