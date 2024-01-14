from tkinter import PhotoImage, Tk, Button, Frame, Label, Scale, Checkbutton, IntVar, Canvas, filedialog
from pygame import mixer
import librosa
from typing import Tuple, Dict
from beatmap_creator import BeatmapGenerator
import os
import shutil

class Player():

    SONG_LIST_PATH: str
    ASSET_PATH: str
    mixer: mixer
    ispaused: bool
    events: Dict[int, Tuple[int,str,str]] # id, timestamp, name, hand
    image_id: int
    
    def __init__(self, song_path:str, asset_path:str, json_path:str):

        self.SONG_LIST_PATH = song_path
        self.ASSET_PATH = asset_path
        self.JSON_PATH = json_path
        

        self.create_window()
        self.play_song()

    def initialise_timestamps(self) -> None:
        """
        Initialise the timestamps describing the start and the end of the song.
        """
        duration_ms = int(librosa.get_duration(path=self.song_path) * 1000)
        self.end_time.config(text = duration_ms)
        self.music_slider.config(from_ = 0, to = duration_ms)
                
    def play_song(self) -> None:
        """
        Load and play the song specified in self.path.
        """

        # Initialise the mixer and load / play the specified song.
        self.mixer = mixer
        self.mixer.init()
        self.mixer.music.load(self.song_path)
        self.mixer.music.play()
        
        # Signal the timestamp to increase.
        self.play_time()
    
    def pause_song(self):
        """
        Pause / unpause the song.
        """
        if self.ispaused:
            self.mixer.music.unpause()
        elif not self.ispaused:
            self.mixer.music.pause()
        self.ispaused = not self.ispaused

    
    def play_time(self):
        """
        Update the timestamp to match the current position in the track.
        """
        if self.ispaused:
            pass
        else:
            self.music_slider.set(int(self.music_slider.get()))
            self.start_time.config(text = int(self.music_slider.get()))
            self.music_slider.set(int(self.music_slider.get()) + 100)


        self.loop = self.start_time.after(100, self.play_time)

    def updateMusic(self, event):
        self.mixer.music.set_pos(int(self.music_slider.get() / 1000))

    def create_selection_frame(self):
        selection_frame = Frame(self.window, bg="#cf6b93")
        self.closed_fist = PhotoImage(file = f"{self.ASSET_PATH}/closed_fist.png").subsample(2)
        self.open_palm = PhotoImage(file = f"{self.ASSET_PATH}/open_palm.png").subsample(2)
        self.pointing_up = PhotoImage(file = f"{self.ASSET_PATH}/pointing_up.png").subsample(2)
        self.thumbs_down = PhotoImage(file = f"{self.ASSET_PATH}/thumbs_down.png").subsample(2)
        self.thumbs_up = PhotoImage(file = f"{self.ASSET_PATH}/thumbs_up.png").subsample(2)
        self.victory = PhotoImage(file = f"{self.ASSET_PATH}/victory.png").subsample(2)

        frame_label = Label(master = selection_frame, text = 'Place a Symbol', fg = "white", bg = "#cf6b93", padx = 10)
        frame_label.pack(side="top", fill="x", expand=True)

        
        closed_fist_btn = Button(master = selection_frame, image = self.closed_fist, borderwidth = 0, relief = "flat", bg = "#cf6b93", command = lambda:self.add_command(self.closed_fist, "CLOSED_FIST"))
        closed_fist_btn.pack(side="left")
        open_palm_btn = Button(master = selection_frame, image = self.open_palm, borderwidth = 0, relief = "flat", bg = "#cf6b93", command = lambda:self.add_command(self.open_palm, "OPEN_PALM"))
        open_palm_btn.pack(side="left")
        pointing_up_btn = Button(master = selection_frame, image = self.pointing_up, borderwidth = 0, relief = "flat", bg = "#cf6b93", command = lambda:self.add_command(self.pointing_up, "POINTING_UP"))
        pointing_up_btn.pack(side="left")
        thumbs_down_btn = Button(master = selection_frame, image = self.thumbs_down, borderwidth = 0, relief = "flat", bg = "#cf6b93", command = lambda:self.add_command(self.thumbs_down, "THUMBS_DOWN"))
        thumbs_down_btn.pack(side="left")
        thumbs_up_btn = Button(master = selection_frame, image = self.thumbs_up, borderwidth = 0, relief = "flat",bg = "#cf6b93", command = lambda:self.add_command(self.thumbs_up, "THUMBS_UP"))
        thumbs_up_btn.pack(side="left")
        victory_btn = Button(master = selection_frame, image = self.victory, borderwidth = 0, relief = "flat",bg = "#cf6b93", command = lambda:self.add_command(self.victory, "VICTORY"))
        victory_btn.pack(side="left")

        

        selection_frame.pack(side="left")

    def add_command(self, image, command):
        
        # Resize the image.
        image_resized = image.subsample(2)

        # Store the image in an array to bypass garbage collection.
        self.command_images.append(image_resized)

        if(self.left_chosen.get()):
            self.place_symbol(image_resized, self.left_frame, self.left_canvas, command, "LEFT")
        if(self.right_chosen.get()):
            self.place_symbol(image_resized, self.right_frame, self.right_canvas, command, "RIGHT")


    def place_symbol(self, image, frame, canvas, command, handedness):
        # Calculate the relative position of the image.
        pos_x, pos_y = self.get_slider_position()
        canvas_image_id = canvas.create_image(pos_x, pos_y + frame.winfo_height() / 2, image=image)

        canvas.tag_bind(canvas_image_id, '<ButtonPress-1>', lambda e:self.on_hand_click(e, canvas, f"{handedness}_{canvas_image_id}"))

        self.canvas_images.append(canvas_image_id)

        timestamp = self.start_time.cget("text")
        self.events[f"{handedness}_{canvas_image_id}"] = (timestamp, command, handedness)

    def load_song(self):
        self.song_path = filedialog.askopenfilename(initialdir=self.SONG_LIST_PATH)
        self.file_name = self.song_path.split('/')[-1]
        self.song_name = self.file_name.split('.')[0]

        


        


    def on_hand_click(self, event, canvas, canvas_id):
        # Extract the tag of the clicked item
        item_tag = canvas.gettags(event.widget.gettags('current'))[0]
        
        # Delete the image with the specified tag
        canvas.delete(item_tag)

        self.events[canvas_id] = None
    
    def create_options_frame(self):
        options_frame = Frame(master = self.window, bg="#262626")

        choose_song_btn = Button(master=options_frame, text="Choose Song", bg = "#262626", command = self.populate_window, fg="white")
        choose_song_btn.pack(side="left")

        combo_frame = Frame(master = options_frame, bg="#262626")
        self.left_chosen = IntVar()
        left_box = Checkbutton(master=combo_frame, text='Left',variable=self.left_chosen, onvalue=1, offvalue=0, fg="white", selectcolor="black", bg="#262626")
        left_box.pack(side="left")

        self.right_chosen = IntVar()
        right_box = Checkbutton(master=combo_frame, text='Right',variable=self.right_chosen, onvalue=1, offvalue=0, fg="white", selectcolor="black", bg="#262626")
        right_box.pack(side="left")
        combo_frame.pack(side="left")

        self.pause_img = PhotoImage(file = f"{self.ASSET_PATH}/pause.png")
        pause_btn = Button(master = options_frame, image = self.pause_img, borderwidth = 0, bg = "#262626", command = self.pause_song)
        pause_btn.pack(side="left")

        done_btn = Button(master=options_frame, text="Done", relief = "flat", bg = "#262626", command = self.store_event_data, fg="white")
        done_btn.pack(side="left")

        options_frame.pack(side="left")

    def store_event_data(self):

        # Prompt the user to choose a playlist folder to store the selected song.
        current_song_folder = filedialog.askdirectory(initialdir=self.JSON_PATH)

        current_working_dir = f"{current_song_folder}/{self.song_name}"

        if os.path.exists(current_working_dir): 
            shutil.rmtree(current_working_dir)
        
        os.mkdir(current_working_dir)

        # store the song in that folder
        shutil.copy(self.song_path, current_working_dir)

        json_file_path = f"{current_working_dir}/beatmap_{self.song_name}.json"

        self.generator = BeatmapGenerator(json_file_path)

        data_arr = []
        for key,value in self.events.items():
            if value is not None:
                data_arr.append(value)

        
        self.generator.generate_file(data_arr, self.file_name, self.song_name)
        

    def get_slider_position(self):
        slider_value = self.music_slider.get()
        slider_x = self.music_slider.winfo_x() + (slider_value / (self.music_slider['to'] - self.music_slider['from'])) * self.music_slider.winfo_width()
        slider_y = self.music_slider.winfo_y() + self.music_slider.winfo_height() / 2
        return slider_x, slider_y


    def create_slider_frame(self):
        
        slider_frame = Frame(self.window, bg = "#262626")

        self.start_time = Label(master = slider_frame, text = '', fg = "white", anchor = "w", bg = "#262626", padx = 10)
        self.end_time = Label(master = slider_frame, text = '', fg = "white", anchor = "e", bg = "#262626", padx = 10)
        self.start_time.pack(side="left")
        self.end_time.pack(side="right")
    
        self.music_slider = Scale(master = slider_frame, from_ = 0, to = 100, orient = "horizontal", bg = "#262626", relief = "flat", length = 270, showvalue = False)
        self.music_slider.bind("<ButtonRelease-1>", self.updateMusic)
        self.music_slider.pack(fill="x", expand=True,side="bottom")

        slider_frame.pack(side="bottom", fill="x")

    def create_hand_frames(self):
        
        self.right_frame = Frame(self.window, bg="#262626")
        self.right_frame.pack_propagate(0)
        right_label = Label(master = self.right_frame, text = "Right", fg = "white", anchor = "w", bg = "#262626", padx = 10)
        right_label.pack(side="left")
        self.right_frame.pack(side="bottom", fill="both", expand=True)
        self.right_canvas = Canvas(master=self.right_frame, bg="#262626", highlightthickness=0)
        self.right_canvas.pack(fill="both")

        self.left_frame = Frame(self.window, bg="#262626")
        self.left_frame.pack_propagate(0)
        left_label = Label(master = self.left_frame, text = "Left", fg = "white", anchor = "w", bg = "#262626", padx = 10)
        left_label.pack(side="left")
        self.left_frame.pack(side = "bottom", fill="both", expand=True)
        self.left_canvas = Canvas(master=self.left_frame, bg="#262626", highlightthickness=0)
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
        self.load_song()
        self.create_slider_frame()
        self.create_hand_frames()
        self.create_selection_frame()
        self.create_options_frame()
        self.initialise_timestamps()

        self.play_song()


    def create_window(self):
        self.window = Tk()
        self.window.title("Music Player")
        self.window.config(bg = "#262626")
        self.window.geometry("1500x500")

        self.populate_window()


        



if __name__ == "__main__":
    SOUND_PATH = r"audiobank/gamebank/tutorialbank/songs/"
    ASSET_PATH = r"codebank/src_computer-vision-server/gui"
    JSON_PATH = r"levelbank"
    player = Player(SOUND_PATH, ASSET_PATH, JSON_PATH)
    player.window.mainloop()
