import json
from typing import Dict, List, Union, TextIO

class BeatmapGenerator():

    path: str
    json_data: Dict[str,str]

    def __init__(self, path:str):

        self.INDENT = 2

        self.path = path
        json_file = self.create_json_file()
        self.write_json_to_file(json_file)
        new_json = self.parse_file_as_json()
        print(json_file)
        print(new_json)

    def create_json_file(self):
        """
        Create the contents of a JazzHands beatmap.
        Convert the contents to json.
        Returns: the beatmap in json format.
        """

        level_data: Dict[str,any] = self.create_level_data("book", "tutorial level 2", "example.png", "example_song")
        event_data: Dict[str, any] = self.create_event_data(1000, "OPEN_HAND", "LEFT")
        event: Dict[str,any] = self.create_event("beat", event_data)
        events: List[Dict[str,any]] = [event]
        level: Dict[str,any] = self.create_level(level_data, events)
        json_file: Dict[str,any] = self.create_json(level)
        return json_file
    
    def write_json_to_file(self, json_contents:Dict[str,any]) -> None:
        """
        Write a JSON dictionary to the file, json_contents.
        """

        json_file = open(self.path, 'w')
        json.dump(json_contents, json_file, indent = self.INDENT)
        json_file.close()
        return None

    def parse_file_as_json(self) -> Union[str, None]:
        """
        Parse the file specified in the path class variable as a JSON dictionary.
        Returns: a JSON dictionary containing the translated file contents.
        """

        try:
            file_contents: TextIO
            file_contents = open(self.path, encoding='utf-8')
            contents:Dict[str,any] = json.loads(file_contents.read())
            file_contents.close()
            return contents
        except Exception as e:
            print(e)
        return None
    
    def create_level_data(self, level_name:str, description:str, background:str, song:str) -> Dict[str,any]:
        """
        Create a LevelData object with the level_name, description, background, and song parameters.
        Convert the object to a JSON dictionary.
        Returns: a JSON dictionary containing the LevelData attributes.
        """

        level_data:LevelData = LevelData(level_name, description, background, song)
        level_data_json:Dict[str,any] = json.dumps(level_data.__dict__)
        return level_data_json
    
    def create_event(self, event_type:str, data:Dict[str,any])-> Dict[str,any]:
        """
        Create a LevelData object with the event_type and event_data parameters.
        Convert the object to a JSON dictionary.
        Returns: a JSON dictionary containing the Event attributes.
        """

        event:Event = Event(event_type, json.loads(data))
        event_json:Dict[str,any] = json.dumps(event.__dict__)
        return event_json
    
    def create_event_data(self, start_time:int, symbol:str, side:str)-> Dict[str,any]:
        """
        Create a EventData object with the start_time, symbol and side parameters.
        Convert the object to a JSON dictionary.
        Returns: a JSON dictionary containing the EventData attributes.
        """

        event_data:EventData = EventData(start_time, symbol, side)
        event_data_json:Dict[str,any] = json.dumps(event_data.__dict__)
        return event_data_json
    
    def create_level(self, level_data:Dict[str,any], events:Dict[str,any])-> Dict[str,any]:
        """
        Create a Level object with the level_data and events parameters.
        Convert the object to a JSON dictionary.
        Returns: a JSON dictionary containing the Level attributes.
        """

        level:Level = Level(level_data, events)
        level_json:Dict[str,any] = json.dumps(level.__dict__)
        return level_json
    
    def create_json(self, data:any) -> Union[Dict[str,any], None]:
        """
        Attempts to parse the data parameter as a JSON dictionary.
        On success: returns the data in JSON format.
        On failure: returns None
        """

        try:
            json_data = json.loads(data)
            return json_data
        except Exception as e:
            print(e)
            return None



            

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
    event_data: Dict[str,any]

    def __init__(self, event_type: str, event_data: Dict[str,any]):
        self.event_type = event_type
        self.event_data = event_data


class Level():
    """
    Class to store Level objects.
    """

    level_data: LevelData
    events: Dict[str,any]

    def __init__(self, level_data: LevelData, events: Dict[str,any]):
        self.level_data = level_data
        self.events = events


path = r"src_jazzhands/Jazzhands/datafiles/tutorialbank/beatmap_book.json"
json_generator = BeatmapGenerator(path)