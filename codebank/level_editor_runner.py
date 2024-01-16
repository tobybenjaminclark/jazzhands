from src.src_level_editor.beatmap_gui import Player
from settings_config.SettingsReader import JazzHandsSettingsReader

if __name__ == "main":
    settings = JazzHandsSettingsReader()
    player = Player(settings.settings)