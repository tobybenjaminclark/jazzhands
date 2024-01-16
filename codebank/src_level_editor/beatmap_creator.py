import json
from typing import Dict, List, Tuple, Union
import io


class BeatmapGenerator():

    path: str
    json_data: Dict[str,str]

    def __init__(self, settings):

        # Retrieve the settings.ini declarations.
        self.settings = settings

        self.INDENT = int(self.settings["JSON_INDENT"])

    def generate_file(self, path, events:List[Tuple[int,str,str]], file_name: str, song_name:str, description:str,background:str):
        # Generate a JSON beatmap file from the given events, file name, song name, description and background.

        self.path=path

        json_file:Dict[str,any] = self.create_json_file(events, file_name, song_name, description,background)
        self.write_json_to_file(json_file)

        # Retrieve the contents of the newly written file.
        new_json:Union[str,None] = self.parse_file_as_json(path)
        print(f"file contents: {new_json}")

    def create_json_file(self, events:List[Tuple[int,str,str]], file_name:str, song_name:str, description:str,background:str) -> Dict[str,any]:
        """
        Create the contents of a JazzHands beatmap from the supplied events and file_name and song_name.
        Convert the contents to json.
        Returns: the beatmap in json format.
        """

        level_data: Dict[str,any] = self.create_level_data(file_name, description, background, song_name,)

        event_list: List[Dict[str,any]] = []
        for event in events:
            current_event_data: Dict[str, any] = self.create_event_data(event)
            event: Dict[str,any] = self.create_event("beat", current_event_data)
            event_list.append(event)

        level: Dict[str,any] = self.create_level(level_data, event_list)
        json_file: Dict[str,any] = self.create_json(level)
        return json_file
    
    def write_json_to_file(self, json_contents:Dict[str,any]) -> None:
        """
        Write a JSON dictionary to the file, json_contents.
        """

        json_file:io.TextIOWrapper = open(self.path, 'w')
        json.dump(json_contents, json_file, indent = self.INDENT)
        json_file.close()
        return None

    def parse_file_as_json(self, path) -> Union[str, None]:
        """
        Parse the file specified in the path class variable as a JSON dictionary.
        Returns: a JSON dictionary containing the translated file contents.
        """

        try:
            file_contents: io.TextIOWrapper
            file_contents = open(path, encoding='utf-8')
            contents:Dict[str,any] = json.loads(file_contents.read())
            file_contents.close()
            return contents
        except Exception as e:
            print(e)
        return None
    
    def create_level_data(self, file_name:str, description:str, background:str, level_name:str) -> Dict[str,any]:
        """
        Create a LevelData object with the level_name, description, background, and song parameters.
        Convert the object to a JSON dictionary.
        Returns: a JSON dictionary containing the LevelData attributes.
        """

        level_data:LevelData = LevelData(level_name, description, background, file_name)
        level_data_json:Dict[str,any] = json.dumps(level_data.__dict__)
        return json.loads(level_data_json)
    
    def create_event(self, event_type:str, data:Dict[str,any])-> Dict[str,any]:
        """
        Create a Event object with the event_type and event_data parameters.
        Convert the object to a JSON dictionary.
        Returns: a JSON dictionary containing the Event attributes.
        """

        event:Event = Event(event_type, json.loads(data))
        event_json:Dict[str,any] = json.dumps(event.__dict__)
        return json.loads(event_json)
    
    def create_event_data(self, data_tuple:[Tuple[int,str,str]])-> Dict[str,any]:
        """
        Create a EventData object with the start_time, symbol and side parameters.
        Convert the object to a JSON dictionary.
        Returns: a JSON dictionary containing the EventData attributes.
        """



        event_data:EventData = EventData(*(data_tuple))
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
            json_data:Dict[str,any] = json.loads(data)
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

    def __init__(self, time: int, symbol: str, side: str):
        self.time = time
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

