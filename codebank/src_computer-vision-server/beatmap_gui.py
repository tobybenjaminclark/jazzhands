from tkinter import PhotoImage, Event, Tk, Button, Frame, Label, Scale, Checkbutton, IntVar, Canvas, filedialog, simpledialog, OptionMenu, StringVar
from pygame import mixer
import librosa
from typing import Tuple, Dict, List, Union
from beatmap_creator import BeatmapGenerator
import os
import shutil

from SettingsReader import JazzHandsSettingsReader

class Player(JazzHandsSettingsReader):



    SONG_LIST_PATH: str                     # The initial path for the Choose Songs dialog to open.
    ASSET_PATH: str                         # The path where all tkinter assets are stored.
    JSON_PATH: str                          # The initial path for the Export dialog to open.
    BACKGROUND_COLOUR: str                  # The background colour for the GUI.

    mixer: mixer                            # The pygame mixer which allows the music to play.
    ispaused: bool                          # Boolean tracking whether the song is currently paused.
    events: Dict[int, Tuple[int,str,str]]   # A dictionary storing the timestamp, name, hand of a symbol at the id.

    song_path:str                           # The path to the chosen song.
    file_name:str                           # The file name of the current song.
    end_time:Label                          # The label storing the duration of the song in ms.
    current_time:Label                      # The label storing the current time of the song in ms.
    music_slider:Scale                      # The Scale displaying the current position in the song.

    closed_fist:PhotoImage                  # A PhotoImage storing the CLOSED_FIST asset to bypass garbage collection.
    open_palm:PhotoImage                    # A PhotoImage storing the OPEN_PALM asset to bypass garbage collection.
    pointing_up:PhotoImage                  # A PhotoImage storing the POINTING_UP asset to bypass garbage collection.
    thumbs_down:PhotoImage                  # A PhotoImage storing the THUMBS_DOWN asset to bypass garbage collection.
    thumbs_up:PhotoImage                    # A PhotoImage storing the THUMBS_UP asset to bypass garbage collection.
    victory:PhotoImage                      # A PhotoImage storing the VICTORY asset to bypass garbage collection.

    command_images:List[PhotoImage]         # A list storing the images of all placed commands to bypass garbage collection.

    def __init__(self):

        # Retrieve the settings.ini declarations.
        super().__init__()

        self.generator = BeatmapGenerator()

        self.song_path=None

        self.SONG_LIST_PATH = self.settings["SOUND_PATH"]
        self.ASSET_PATH = self.settings["ASSET_PATH"]
        self.JSON_PATH = self.settings["JSON_PATH"]
        self.BACKGROUND_COLOUR = f"#{self.settings['GUI_BACKGROUND_COLOUR']}"
        

        self.create_window()

    def initialise_timestamps(self) -> None:
        """
        Initialise the timestamps describing the start and the end of the song.
        """


        duration_ms: int = 0
        if self.song_path:
            duration_ms: int = int(librosa.get_duration(path=self.song_path) * 1000)
        self.end_time.config(text = duration_ms)
        self.music_slider.config(from_ = 0, to = duration_ms)
                
    def play_song(self) -> None:
        """
        Load and play the song specified in self.song_path.
        """

        if self.song_path:

            # Initialise the mixer and load / play the specified song.
            self.mixer:mixer = mixer
            self.mixer.init()
            self.mixer.music.load(self.song_path)
            self.mixer.music.play()
            
            # Signal the timestamp to increase.
            self.play_time()
    
    def pause_song(self) -> None:
        """
        Pause / unpause the song.
        """
        if self.ispaused:
            self.mixer.music.unpause()
        elif not self.ispaused:
            self.mixer.music.pause()
        self.ispaused = not self.ispaused

    
    def play_time(self) -> None:
        """
        Update the timestamp to match the current position in the track.
        """
        if self.ispaused:
            # Do nothing, the timestamp should not be changed if the song is paused.
            pass
        else:
            self.music_slider.set(int(self.music_slider.get()))
            self.current_time.config(text = int(self.music_slider.get()))
            self.music_slider.set(int(self.music_slider.get()) + 100)


        self.current_time.after(100, self.play_time)

    def updateMusic(self) -> None:
        """
        Update the position of the track to reflect the position of the slider.
        """
        if self.song_path:
            self.mixer.music.set_pos(int(self.music_slider.get() / 1000))

    def create_selection_frame(self) -> None:
        """
        Create the frame allowing the user to select a symbol.
        """

        selection_frame:Frame = Frame(self.window, bg="#cf6b93")

        self.closed_fist:PhotoImage = PhotoImage(file = f"{self.ASSET_PATH}/closed_fist.png").subsample(2)
        self.open_palm:PhotoImage = PhotoImage(file = f"{self.ASSET_PATH}/open_palm.png").subsample(2)
        self.pointing_up:PhotoImage = PhotoImage(file = f"{self.ASSET_PATH}/pointing_up.png").subsample(2)
        self.thumbs_down:PhotoImage = PhotoImage(file = f"{self.ASSET_PATH}/thumbs_down.png").subsample(2)
        self.thumbs_up:PhotoImage = PhotoImage(file = f"{self.ASSET_PATH}/thumbs_up.png").subsample(2)
        self.victory:PhotoImage = PhotoImage(file = f"{self.ASSET_PATH}/victory.png").subsample(2)

        frame_label:Label = Label(master = selection_frame, text = 'Place a Symbol', fg = "white", bg = "#cf6b93", padx = 10)
        frame_label.pack(side="top", fill="x", expand=True)

        
        closed_fist_btn:Button = Button(master = selection_frame, image = self.closed_fist, borderwidth = 0, relief = "flat", bg = "#cf6b93", command = lambda:self.add_command(self.closed_fist, "CLOSED_FIST"))
        closed_fist_btn.pack(side="left")
        open_palm_btn:Button = Button(master = selection_frame, image = self.open_palm, borderwidth = 0, relief = "flat", bg = "#cf6b93", command = lambda:self.add_command(self.open_palm, "OPEN_PALM"))
        open_palm_btn.pack(side="left")
        pointing_up_btn:Button = Button(master = selection_frame, image = self.pointing_up, borderwidth = 0, relief = "flat", bg = "#cf6b93", command = lambda:self.add_command(self.pointing_up, "POINTING_UP"))
        pointing_up_btn.pack(side="left")
        thumbs_down_btn:Button = Button(master = selection_frame, image = self.thumbs_down, borderwidth = 0, relief = "flat", bg = "#cf6b93", command = lambda:self.add_command(self.thumbs_down, "THUMBS_DOWN"))
        thumbs_down_btn.pack(side="left")
        thumbs_up_btn:Button = Button(master = selection_frame, image = self.thumbs_up, borderwidth = 0, relief = "flat",bg = "#cf6b93", command = lambda:self.add_command(self.thumbs_up, "THUMBS_UP"))
        thumbs_up_btn.pack(side="left")
        victory_btn:Button = Button(master = selection_frame, image = self.victory, borderwidth = 0, relief = "flat",bg = "#cf6b93", command = lambda:self.add_command(self.victory, "VICTORY"))
        victory_btn.pack(side="left")

        

        selection_frame.pack(side="left")

    def add_command(self, image:PhotoImage, command:str) -> None:
        
        # Resize the image.
        image_resized:PhotoImage = image.subsample(2)

        # Store the image in an array to bypass garbage collection.
        self.command_images.append(image_resized)

        slider_val = self.music_slider.get()
        slider_pos = self.get_slider_position(slider_val)
        timestamp:int = self.current_time.cget("text")


        if(self.left_chosen.get()):
            self.place_symbol(image_resized, self.left_canvas, command, "LEFT", slider_pos,timestamp)
        if(self.right_chosen.get()):
            self.place_symbol(image_resized, self.right_canvas, command, "RIGHT", slider_pos,timestamp)


    def place_symbol(self, image:PhotoImage, canvas:Canvas, command:str, handedness:str, pos_x:float, timestamp:int) -> None:
        """
        Place a symbol, image, at the current timestamp in the left or right canvas.
        """
        if pos_x == 0:
            return
        

        canvas_image_id:int = canvas.create_image(pos_x, canvas.winfo_height() / 2, image=image)

        canvas.tag_bind(canvas_image_id, '<ButtonPress-1>', lambda e:self.on_hand_click(e, canvas, f"{handedness}_{canvas_image_id}"))

        self.canvas_images.append(canvas_image_id)

        self.events[f"{handedness}_{canvas_image_id}"] = (timestamp, command, handedness)

    def load_song(self) -> None:
        """
        Open a filedialog allowing the user to select a song.
        """
        self.song_path = filedialog.askopenfilename(initialdir=self.SONG_LIST_PATH)
        self.file_name = self.song_path.split('/')[-1]

        self.populate_window()
        


        


    def on_hand_click(self, event:Event, canvas:Canvas, canvas_id:int):
        # Extract the tag of the clicked item
        item_tag = canvas.gettags(event.widget.gettags('current'))[0]
        
        # Delete the image with the specified tag
        canvas.delete(item_tag)

        self.events[canvas_id] = None
    
    def change_name_text(self):
        # Prompt the user for a new name
        new_name = simpledialog.askstring("Change Song Name", "Enter new song name:")
        if new_name:
            self.name_textbox.config(text=new_name)

    def change_description_text(self):
        # Prompt the user for a new name
        new_description = simpledialog.askstring("Change Song Description", "Enter new description:")
        if new_description:
            self.description_textbox.config(text=new_description)


    def create_options_frame(self):
        options_frame = Frame(master = self.window, bg=self.BACKGROUND_COLOUR)

        combo_frame = Frame(master = options_frame, bg=self.BACKGROUND_COLOUR)
        self.left_chosen = IntVar()
        left_box = Checkbutton(master=combo_frame, text='Left',variable=self.left_chosen, onvalue=1, offvalue=0, fg="white", selectcolor="black", bg=self.BACKGROUND_COLOUR)
        left_box.pack(side="left")

        self.right_chosen = IntVar()
        right_box = Checkbutton(master=combo_frame, text='Right',variable=self.right_chosen, onvalue=1, offvalue=0, fg="white", selectcolor="black", bg=self.BACKGROUND_COLOUR)
        right_box.pack(side="left")
        combo_frame.pack(side="left")

        name_frame = Frame(master = options_frame, bg=self.BACKGROUND_COLOUR)

        self.name_textbox = Button(master = name_frame, width=20, command = self.change_name_text,text="Name", bg = self.BACKGROUND_COLOUR, fg="white")
        self.name_textbox.pack(side="bottom")


        name_label = Label(master = name_frame, text = 'Name:', fg = "white", anchor = "w", bg = self.BACKGROUND_COLOUR)
        name_label.pack(side="top")

        name_frame.pack(side="left")

        description_frame = Frame(master = options_frame, bg=self.BACKGROUND_COLOUR)

        self.description_textbox = Button(master=description_frame, command=self.change_description_text,text="Description",width=50, bg = self.BACKGROUND_COLOUR, fg="white")
        self.description_textbox.pack(side="bottom")

        # Set the focus to the Entry widget
        self.description_textbox.focus_set()

        description_label = Label(master = description_frame, text = 'Description:', fg = "white", anchor = "w", bg = self.BACKGROUND_COLOUR)
        description_label.pack(side="top")

        description_frame.pack(side="left")

        background_frame = Frame(master=options_frame,bg=self.BACKGROUND_COLOUR)

        background_options=["Tutorial", "Rock", "Techno"]

        self.background_var = StringVar(background_frame)
        self.background_var.set(background_options[0])

        choose_background_dropdown = OptionMenu(background_frame, self.background_var, *background_options)
        choose_background_dropdown.config(bg=self.BACKGROUND_COLOUR,fg="white",highlightthickness=0)
        choose_background_dropdown.pack(side="bottom")

        background_label = Label(background_frame, text="Background:", bg=self.BACKGROUND_COLOUR, fg="white")
        background_label.pack(side="top")

        background_frame.pack(side="left")

        choose_song_btn = Button(master=options_frame, text="Choose Song", bg = self.BACKGROUND_COLOUR, command = self.load_song, fg="white")
        choose_song_btn.pack(side="left")

        self.pause_img = PhotoImage(file = f"{self.ASSET_PATH}/pause.png")
        pause_btn = Button(master = options_frame, image = self.pause_img, borderwidth = 0, bg = self.BACKGROUND_COLOUR, command = self.pause_song)
        pause_btn.pack(side="left")

        done_btn = Button(master=options_frame, text="Export", bg = self.BACKGROUND_COLOUR, command = self.store_event_data, fg="white")
        done_btn.pack(side="left")

        open_beatmap_btn = Button(master=options_frame, text="Open Beatmap", bg = self.BACKGROUND_COLOUR, command = self.open_beatmap, fg="white")
        open_beatmap_btn.pack(side="left")

        options_frame.pack(side="left")

    def open_beatmap(self):
        """
        Open a filedialog allowing the user to select a beatmap.
        """
        beatmap_path = filedialog.askopenfilename(initialdir=self.JSON_PATH)
        beatmap_location = beatmap_path.rsplit('/', 1)[0]
        
        beatmap_dict = self.generator.parse_file_as_json(beatmap_path)
        beatmap_song = beatmap_dict["level_data"]["song"]
        beatmap_song_location = f"{beatmap_location}/{beatmap_song}"

        self.song_path = beatmap_song_location
        self.file_name = beatmap_song

        self.populate_window()



        for event in beatmap_dict["events"]:
            event_type = event["event_type"]
            event_data = event["event_data"]

            time = event_data["time"]
            symbol = event_data["symbol"]
            side = event_data["side"]

            canvas = None
            if side=="LEFT":
                canvas = self.left_canvas
            elif side=="RIGHT":
                canvas = self.right_canvas

            image = self.get_image_from_command_name(symbol)
            image_resized:PhotoImage = image.subsample(2)
            self.canvas_images.append(image_resized)

            slider_pos = self.get_slider_position(time)
            print(f"slider pos: {slider_pos}")
            self.place_symbol(image_resized,canvas,symbol,side, slider_pos, time)
        

        self.description_textbox["text"] = beatmap_dict["level_data"]["description"]
        self.name_textbox["text"] = beatmap_dict["level_data"]["level_name"]


    def get_image_from_command_name(self, command:str) -> Union[PhotoImage, None]:

        if command=="OPEN_PALM":
            return self.open_palm
        elif command=="CLOSED_FIST":
            return self.closed_fist
        elif command=="POINTING_UP":
            return self.pointing_up
        elif command=="THUMBS_DOWN":
            return self.thumbs_down
        elif command=="THUMBS_UP":
            return self.thumbs_up
        elif command=="VICTORY":
            return self.victory
        raise("Invalid command")

    def store_event_data(self):

        # Prompt the user to choose a playlist folder to store the selected song.
        current_song_folder = filedialog.askdirectory(initialdir=self.JSON_PATH)

        song_name = self.name_textbox["text"]
        song_name_no_spaces = song_name.replace(" ","_")
        description = self.description_textbox["text"]
        background=self.background_var.get().upper()

        current_working_dir = f"{current_song_folder}/{song_name_no_spaces}"

        if os.path.exists(current_working_dir): 
            shutil.rmtree(current_working_dir)
        
        os.mkdir(current_working_dir)

        # store the song in that folder
        shutil.copy(self.song_path, current_working_dir)

        json_file_path = f"{current_working_dir}/beatmap.json"


        data_arr = []
        for key,value in self.events.items():
            if value is not None:
                data_arr.append(value)

        
        self.generator.generate_file(json_file_path, data_arr, self.file_name, song_name, description,background)
        

    def get_slider_position(self, slider_value:int):

        print(f"slider val: {slider_value}")
        print(self.music_slider.winfo_x())
        print(self.end_time["text"])
        print(self.music_slider.winfo_width())


        # slider value can either be the current value of the slider or the value from the file

        if (self.music_slider['to'] - self.music_slider['from']) == 0:
            return 0
        
        
        slider_x = self.music_slider.winfo_x() + (slider_value / self.end_time["text"]) * self.music_slider.winfo_width()
        return slider_x


    def create_slider_frame(self):
        
        slider_frame = Frame(self.window, bg = self.BACKGROUND_COLOUR)

        self.current_time = Label(master = slider_frame, text = '', fg = "white", anchor = "w", bg = self.BACKGROUND_COLOUR)
        self.end_time = Label(master = slider_frame, text = '', fg = "white", anchor = "e", bg = self.BACKGROUND_COLOUR)
        self.current_time.pack(side="left")
        self.end_time.pack(side="right")
    
        self.music_slider = Scale(master = slider_frame, from_ = 0, to = 100, orient = "horizontal", bg = self.BACKGROUND_COLOUR, relief = "flat", length = 270, showvalue = False)
        self.music_slider.bind("<ButtonRelease-1>", lambda e:self.updateMusic())
        self.music_slider.pack(fill="x", expand=True,side="bottom")

        slider_frame.pack(side="bottom", fill="x")

    def create_hand_frames(self):
        
        self.right_frame = Frame(self.window, bg=self.BACKGROUND_COLOUR)
        self.right_frame.pack_propagate(0)
        right_label = Label(master = self.right_frame, text = "Right", fg = "white", anchor = "w", bg = self.BACKGROUND_COLOUR)
        right_label.pack(side="left")
        self.right_frame.pack(side="bottom", fill="both", expand=True)
        self.right_canvas = Canvas(master=self.right_frame, bg=self.BACKGROUND_COLOUR, highlightthickness=0)
        self.right_canvas.pack(fill="both")

        self.left_frame = Frame(self.window, bg=self.BACKGROUND_COLOUR)
        self.left_frame.pack_propagate(0)
        left_label = Label(master = self.left_frame, text = "Left", fg = "white", anchor = "w", bg = self.BACKGROUND_COLOUR)
        left_label.pack(side="left")
        self.left_frame.pack(side = "bottom", fill="both", expand=True)
        self.left_canvas = Canvas(master=self.left_frame, bg=self.BACKGROUND_COLOUR, highlightthickness=0)
        self.left_canvas.pack(fill="both")


    def initialise_frame_info(self):
        self.command_images = []
        self.events = {}
        self.canvas_images = []
        self.image_id = 0
        self.ispaused = False


    def populate_window(self):
        for widget in self.window.winfo_children():
            widget.destroy()

        self.initialise_frame_info()
        self.create_slider_frame()
        self.create_hand_frames()
        self.create_selection_frame()
        self.create_options_frame()
        self.initialise_timestamps()

        self.play_song()

        self.window.update_idletasks()


    def create_window(self):
        self.window = Tk()
        self.window.title("Music Player")
        self.window.config(bg = self.BACKGROUND_COLOUR)
        self.window.geometry("1500x500")

        self.populate_window()


        



if __name__ == "__main__":

    player = Player()
    player.window.mainloop()
