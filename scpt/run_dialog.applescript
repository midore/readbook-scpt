script class_dialog
	
	# default dialog
	to default_d(tit, mess, buts, ico)
		try
			#tell application "Finder"
			#	activate
			display dialog mess buttons buts default button 1 with title tit with icon note
			return button returned of result
			#end tell
			
		on error the error_message number the error_number
			if the error_number is not -128 then
				set the error_text to "Error: " & the error_number & ". " & the error_message
				display dialog the error_text buttons {"Cancel"} default button 1
			else
				error number -128
			end if
		end try
	end default_d
	
	# textedit.app dialog
	to default_d_editor(tit, mess, buts, ico)
		try
			tell application "TextEdit"
				activate
				display dialog mess buttons buts default button 1 with title tit with icon ico
			end tell
			
		on error the error_message number the error_number
			if the error_number is not -128 then
				set the error_text to "Error: " & the error_number & ". " & the error_message
				display dialog the error_text buttons {"Cancel"} default button 1
			else
				error number -128
			end if
		end try
	end default_d_editor
	
	# cooose list dialog
	to choose_mydialog(ary)
		
		#try
		#tell application "Finder"
		#	activate
		set choice to (choose from list ary with title "Choose the Item") #buttons {"OK"}
		if choice is false then
			display dialog "User's Cancel" buttons {"Cancel"} default button 1 giving up after 1
			return false
		else
			return choice
		end if
		#end tell
		
		#on error the error_message number the error_number
		#	if error_number is -50 then
		#		return "listempty"
		#	else if the error_number is not -128 then
		#		set the error_text to "Error: " & the error_number & ". " & the error_message
		#		display dialog the error_text buttons {"Cancel"} default button 1
		#	else
		#		error number -128
		#	end if
		return choice
		#end try
	end choose_mydialog
	
	# text input dialog
	to input_mydialog(tit, mess, buts, deans)
		try
			#tell application "Finder"
			#		activate
			set choice to display dialog mess buttons buts default button 2 default answer deans with title tit
			set choose to item 2 of text of choice
			set userean to item 1 of text of choice
			return userean
			#	end tell
			
		on error the error_message number the error_number
			-- don't display error message if the user canceled a dialog within the [try] and [on error] lines above
			if the error_number is not -128 then
				set the error_text to "Error: " & the error_number & ". " & the error_message
				display dialog the error_text buttons {"Cancel"} default button 1
			else
				error number -128
			end if
			return false
		end try
		return true
	end input_mydialog
	
	# done or finish dialog
	to d_done(mess)
		try
			display dialog mess buttons {"Done"} default button 1 with title "Result" with icon 2 giving up after 1
			return button returned of result
			
		on error the error_message number the error_number
			if the error_number is not -128 then
				set the error_text to "Error: " & the error_number & ". " & the error_message
				display dialog the error_text buttons {"Cancel"} default button 1
			else
				error number -128
			end if
		end try
		
		#default_d("Result", mess, {"Done"}, 1)
	end d_done
	
	# EAN
	# {"9784797336610: xxxxxxxx"}
	to get_ean(str)
		set ean to (characters 1 thru 13 of item 1 of str) as string
	end get_ean
	
	# Title
	to get_title(str)
		set title to (characters 16 thru end of item 1 of str) as string
	end get_title
	
end script
