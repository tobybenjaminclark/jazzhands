@ECHO OFF
pyinstaller --add-data="settings.ini;.", --add-data="codebank/src_level_editor/gui;./codebank/src_level_editor/gui" ./level_editor_runner.py -y
PAUSE