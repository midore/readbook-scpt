script class_dialog
	
	# Default Dialog
	to default_d(tit, mess, buts, ico)
		display dialog mess buttons buts default button 1 with title tit with icon note
		return button returned of result
	end default_d
	
	# Textedit.app dialog
	to default_d_editor(tit, mess, buts, ico)
		tell application "TextEdit"
			activate
			display dialog mess buttons buts default button 1 with title tit with icon ico
		end tell
	end default_d_editor
	
	# Choose List
	to choose_mydialog(ary)
		set choice to (choose from list ary with title "Choose the Item")
		if choice is false then
			display dialog "User's Cancel" buttons {"See you..."} default button 1 giving up after 2 with title "stop"
			return false
		else
			return choice
		end if
		return choice
	end choose_mydialog
	
	# Input Str
	to input_mydialog(tit, mess, buts, deans)
		set choice to display dialog mess buttons buts default button 2 default answer deans with title tit
		set choose to item 2 of text of choice
		set keyword to item 1 of text of choice
		return keyword
	end input_mydialog
	
	# Done or Finish
	to d_done(mess)
		display dialog mess buttons {"Done"} default button 1 with title "Result" with icon 2 giving up after 1
		return button returned of result
	end d_done
	
	# Get EAN {"9784797336610: xxxxxxxx"}
	to get_ean(str)
		set n to get_colon(str)
		set ean to (characters 1 thru (n - 1) of item 1 of str) as string
	end get_ean
	
	# Get Title
	to get_title(str)
		set n to get_colon(str)
		set title to (characters (n + 1) thru end of item 1 of str) as string
	end get_title
	
	# Get :
	to get_colon(str)
		set n to offset of ":" in str
	end get_colon
	
end script
