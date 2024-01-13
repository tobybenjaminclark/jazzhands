from tkinter import PhotoImage, Tk, Button, Frame, Label, Scale, StringVar, ttk
from pygame import mixer
import librosa

class Player():

    song_path: str
    mixer: mixer
    ispaused: bool
    
    def __init__(self, path:str):

        self.song_path = path
        print(self.song_path.split('/')[-1].split('.')[0])
        self.ispaused = False
        self.command_images = []
        self.commands = []

        self.create_window()
        self.play_song()

    def initialise_timestamps(self) -> None:
        """
        Initialise the timestamps describing the start and the end of the song.
        """
        duration_ms = int(librosa.get_duration(filename=self.song_path) * 1000)
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

        self.closed_fist = PhotoImage(file = r"src_computer-vision-server/gui/closed_fist.png").subsample(2)
        self.open_palm = PhotoImage(file = r"src_computer-vision-server/gui/open_palm.png").subsample(2)
        self.pointing_up = PhotoImage(file = r"src_computer-vision-server/gui/pointing_up.png").subsample(2)
        self.thumbs_down = PhotoImage(file = r"src_computer-vision-server/gui/thumbs_down.png").subsample(2)
        self.thumbs_up = PhotoImage(file = r"src_computer-vision-server/gui/thumbs_up.png").subsample(2)
        self.victory = PhotoImage(file = r"src_computer-vision-server/gui/victory.png").subsample(2)

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

        if(self.chosen_hand.get() == "Left"):
            self.place_symbol(image_resized, self.left_frame)
            self.commands.append({"start_time": self.get_slider_position(), "symbol": command, "side": "LEFT"})
        elif(self.chosen_hand.get() == "Right"):
            self.place_symbol(image_resized, self.right_frame)
            self.commands.append({"start_time": self.get_slider_position(), "symbol": command, "side": "RIGHT"})
        elif(self.chosen_hand.get() == "Both"):
            self.place_symbol(image_resized, self.left_frame)
            self.place_symbol(image_resized, self.right_frame)
            self.commands.append({"start_time": self.get_slider_position(), "symbol": command, "side": "LEFT"})
            self.commands.append({"start_time": self.get_slider_position(), "symbol": command, "side": "RIGHT"})


    def place_symbol(self, image, frame):
        # Calculate the relative position of the image.
        pos_x, pos_y = self.get_slider_position()
        rel_x = pos_x / self.left_frame.winfo_width()

        # Display the image on the screen.
        label = Label(master = frame, image = self.command_images[-1], bg="#262626")
        label.place(relx = rel_x)

        
    
    def create_options_frame(self):
        options_frame = Frame(master = self.window, bg="#262626")

        combo_frame = Frame(master = options_frame, bg="#262626")
        
        self.chosen_hand = StringVar() 
        hand_chosen = ttk.Combobox(master = combo_frame, textvariable = self.chosen_hand) 
        hand_chosen['values'] = ('Left', 'Right', 'Both') 
        hand_chosen.current(2)
        hand_chosen.pack(side="bottom")

        combo_label = Label(master = combo_frame, bg = "#262626", fg="white", text="Chosen Hand:")
        combo_label.pack(side="top")

        combo_frame.pack(side="left")

        self.pause_img = PhotoImage(file = r"src_computer-vision-server/gui/pause.png")
        pause_btn = Button(master = options_frame, image = self.pause_img, borderwidth = 0, relief = "flat", bg = "#262626", command = self.pause_song)
        pause_btn.pack(side="left")

        options_frame.pack(side="left")
        

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
        right_label = Label(master = self.right_frame, text = "Right", fg = "white", anchor = "w", bg = "#262626", padx = 10)
        right_label.pack(side="left")
        self.right_frame.pack(side="bottom", fill="both", expand=True)

        self.left_frame = Frame(self.window, bg="#262626")
        left_label = Label(master = self.left_frame, text = "Left", fg = "white", anchor = "w", bg = "#262626", padx = 10)
        left_label.pack(side="left")
        self.left_frame.pack(side = "bottom", fill="both", expand=True)

    def create_window(self):
        self.window = Tk()
        self.window.title("Music Player")
        self.window.config(bg = "#262626")
        self.window.geometry("1500x500")

        self.create_slider_frame()
        self.create_hand_frames()
        self.create_selection_frame()
        self.create_options_frame()

        

        self.initialise_timestamps()

        



if __name__ == "__main__":
    path = r"src_jazzhands/Jazzhands/sounds/tutorialbank/snd_bazaar.wav"
    player = Player(path)
    player.window.mainloop()
