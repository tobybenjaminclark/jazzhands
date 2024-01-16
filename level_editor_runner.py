from codebank.src_level_editor.beatmap_gui import Player
from src_settings_loader.SettingsReader import JazzHandsSettingsReader

if __name__ == "__main__":
    settings = JazzHandsSettingsReader().settings
    player = Player(settings)
    player.window.mainloop()
