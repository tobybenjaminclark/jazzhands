from codebank.src_computer_vision_server.controller import JazzhandsController
from codebank.src_settings_loader.SettingsReader import JazzHandsSettingsReader
import os
import sys
import logging

if __name__ == "__main__":
    print("hello")
    settings = JazzHandsSettingsReader().settings
    controller = JazzhandsController(settings)
    controller.mainloop()

    