from codebank.src_computer_vision_server.controller import JazzhandsController
from src_settings_loader.SettingsReader import JazzHandsSettingsReader

if __name__ == "__main__":
    settings = JazzHandsSettingsReader().settings
    controller = JazzhandsController(settings)
    controller.mainloop()
