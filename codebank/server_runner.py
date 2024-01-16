from src.src_computer_vision_server.controller import JazzhandsController
from settings_config.SettingsReader import JazzHandsSettingsReader

if __name__ == "__main__":
    settings = JazzHandsSettingsReader().settings
    controller = JazzhandsController(settings)
    controller.mainloop()
