@ECHO OFF
pyinstaller --add-data="settings.ini;.", --add-data="codebank/src_computer_vision_server/gesture_recognizer.task;./codebank/src_computer_vision_server/gesture_recognizer.task" ./server_runner.py -y
PAUSE