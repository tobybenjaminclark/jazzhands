import configparser
from typing import Dict
import sys
from os import path
import os

class JazzHandsSettingsReader():

    SETTINGS_PATH: str          # a constant defining the relative location of the settings.ini file.
    settings: Dict[str, any]    # a dictionary containing the settings parsed from settings.ini.

    def resource_path(self, relative_path):
        """ Get absolute path to resource, works for dev and for PyInstaller """
        try:
            # PyInstaller creates a temp folder and stores path in _MEIPASS
            base_path = sys._MEIPASS
        except Exception:
            base_path = os.environ.get("_MEIPASS2",os.path.abspath("."))

        return os.path.join(base_path, relative_path)

    
    def __init__(self):
        """
        Initialise the settings dictionary containing the contents of the settings.ini.
        """

        self.SETTINGS_PATH = "settings.ini"

        if getattr(sys, 'frozen', False):
            self.SETTINGS_PATH = self.resource_path(self.SETTINGS_PATH)

        print(self.SETTINGS_PATH)

        self.settings = self.read_settings()

    def read_settings(self) -> Dict[str, any]:
        """
        Read and parse the contents of the settings.ini file. 
        Returns a dictionary containing the settings retrieved from settings.ini.
        """

        config = configparser.ConfigParser()
        config.read(self.SETTINGS_PATH)

        for key in config["DEFAULT"]:
            print(f"key: {key}. val: {config['DEFAULT'][key]}. type: {type(config['DEFAULT'][key])}")
        return config["DEFAULT"]
    