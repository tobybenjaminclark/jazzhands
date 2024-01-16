import configparser
from typing import Dict

class JazzHandsSettingsReader():

    SETTINGS_PATH: str          # a constant defining the relative location of the settings.ini file.
    settings: Dict[str, any]    # a dictionary containing the settings parsed from settings.ini.

    
    def __init__(self):
        """
        Initialise the settings dictionary containing the contents of the settings.ini.
        """

        self.SETTINGS_PATH = "src_settings_loader/settings.ini"
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