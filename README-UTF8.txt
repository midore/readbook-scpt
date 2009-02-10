scpt-for-readbook
--for readbook scpt--

author: midorex@gmail.com
URL: http://www.midore.net

# dependency

System: OS X 10.5.6
AppleScript Version:"2.0.1"
ruby 1.9.1
git clone git://github.com/midore/readbook

# === setup
# in your /Application/Terminal.app
% vi readbook-scpt/readbook-run-scpt.rb
# edit line 1. shebung
#!/pathto/ruby1.9.1/bin/ruby -E utf-8

% chmod +x readbook-scpt/readbook-run-scpt.rb
% mv readbook-scpt/readbook-run-scpt.rb  pathto/readbook-xx/bin/
% mv readbook-scpt/scpt/ pathto/readbook-xx/

# === .applescipt files of readbook-scpt
% cd pathto/readbook-xx/scpt/
% ls -la
# =>
README-UTF8.txt
mine_main.applescript
min_command.applescript
run_allupdate.applescript
run_dialog.applescript
run_list.applescript
run_search.applescript
run_useaws.applescript

# === Compile .applescipt files

# These .applescript Files needs to Compile with Application/AppleScript/ScriptEditor.app, 
# use: http://github.com/midore/compile-applescript

# manual compile
# ALL .applescript Files Open

% cd readbook-xx/scpt
% open *.applescript

# in your /Application/AppleScript/ScriptEditor.app
# command + K
# compile a file.
# save file as .scpt ( save option format = scpt ) to in pathto/readbook-xx/scpt/

% ls -la pathto/readbook-xx/scpt/
# =>
# mine_main.scpt
# min_command.scpt
# run_allupdate.scpt
# run_dialog.scpt
# run_list.scpt
# run_search.scpt
# run_useaws.scpt

# === Run

# Run file 'mine_main.scpt'

% open pathto/readbook-xx/scpt/mine_main.scpt

# in your /Application/AppleScript/ScriptEditor.app
# command + R
# run script
# Plese Select Menu Buttun or Cancel Button.

# === SetUP ScriptsMenue

% open pathto/readbook-xx/scpt/mine_main.scpt

# Save file 'mine_main.app' as application  ( save option format = application ) in pathto/readbook-xx/scpt/
# Attention: must save to 'pathto/readbook-xx/scpt/mine_main.app'

# in your Finder.app
# select file 'pathto/readbook-xx/scpt/mine_main.app' 
# command + L 
# maked alias file (pathto/readbook-xx/scpt/mine_main.app.alias)
# alias file move to ~/Library/Scripts/

% ls ~/Library/Scripts
# =>
# mine_main.app.alias 

# If Not exist ~/Library/Scripts Directory.
% mkdir ~/Library/Scripts

# start /Application/AppleScript/AppleScriptUtility.app
# check on MenuBar.
# click 'mine_main.app.alias' of ScriptMenu 

# === AppleScript Error.

# if AppleSciptError is "sh: ./readbook-run-scpt.rb: Permission denied."
% chmod +x pathto/readbook-xx/bin/readbook-run-scpt.rb

# if Error is " Error: sorry, i use ruby 1.9.1 "
# You need install ruby 1.9.1 or
% vi pathto/readbook-xx/bin/readbook-run-scpt.rb 
# line 1 and line 2.
# =>
 #!/pathto/your/ruby1.9.1/bin/ruby -E utf-8
 # coding: utf-8 -*-

