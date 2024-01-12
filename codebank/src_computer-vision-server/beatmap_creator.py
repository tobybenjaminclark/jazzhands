import json
from typing import List

class JSONGenerator():
    def __init__(self):

        path = r"src_jazzhands/Jazzhands/datafiles/tutorialbank/beatmap_bazaar.json"
        
        with open(path, encoding='utf-8') as file_contents:
            contents = json.loads(file_contents.read())
            print(contents)
            

class LevelData():
    """
    Class to store LevelData objects.
    """

    level_name: str
    description: str
    background: str
    song: str

    def __init__(self, level_name:str, description:str, background:str, song:str):
        self.level_name = level_name
        self.description = description
        self.background = background
        self.song = song

class EventData():
    """
    Class to store EventData objects.
    """

    start_time: int
    symbol: str
    side: str

    def __init__(self, start_time: int, symbol: str, side: str):
        self.start_time = start_time
        self.symbol = symbol
        self.side = side


class Event():
    """
    Class to store Event objects.
    """

    event_type: str
    event_data: List[EventData]

    def __init__(self, event_type: str, event_data: List[EventData]):
        self.event_type = event_type
        self.event_data = event_data


class Level():
    """
    Class to store Level objects.
    """

    level_data: LevelData
    events: List[Event]

    def __init__(self, level_data: LevelData, events: Event):
        self.level_data = level_data
        self.events = events

json_generator = JSONGenerator()