(*
 readbook-scpt
 created by midorex@gmail.com
 URL: http://www.midore.net
 System: OS X 10.5.6
 AppleScript Version:"2.0.1"
 lastdate: 2009-01-29
*)

script class_mymain
	
	# ReadBook of HOME as alias
	to base_dir_a()
		
		tell application "Finder"
			####################################
			# USE 'PATH TO ME'
			####################################
			
			set s to name of startup disk
			set pstr to (path to me) as alias
			set the source_folder to (the folder of pstr) as alias
			set the rdb_folder to (the folder of source_folder)
			set dir_myapp to rdb_folder as text
			
			####################################
			# IF CAN'T USE 'PATH TO ME'
			####################################
			# you need to edit.
			# example;
			# Path of your ReadBok-0.2 is 
			# /Users/home/xxx/yyy/ReadBook-0.2
			# edit this line and comment out.
			# set dir_myapp to "startupdiskname:Users:yourname:xxx:yyy:ReadBook-0.2:"
			
			####################################
			# complie test
			# display dialog dir_myapp
			
		end tell
		return dir_myapp
	end base_dir_a
	
	# load file
	to my_load(f)
		load script (alias f)
	end my_load
	
	to path_run_update(bda)
		bda & "scpt:run_allupdate.scpt"
	end path_run_update
	
	to path_run_view(bda)
		bda & "scpt:run_list.scpt"
	end path_run_view
	
	to path_run_search(bda)
		bda & "scpt:run_search.scpt"
	end path_run_search
	
	to path_run_aws(bda)
		bda & "scpt:run_useaws.scpt"
	end path_run_aws
	
	to path_dialog(bda)
		bda & "scpt:run_dialog.scpt"
	end path_dialog
	
	to path_command(bda)
		bda & "scpt:mine_command.scpt"
	end path_command
	
	# Dialog
	to mine_dialog(bda)
		class_dialog of my_load(path_dialog(bda))
	end mine_dialog
	
	# List
	to mine_list(bda)
		class_list of my_load(path_run_view(bda))
	end mine_list
	
	# ALL Update
	to mine_update(bda)
		class_allupdate of my_load(path_run_update(bda))
	end mine_update
	
	# Search
	to mine_search(bda)
		class_search of my_load(path_run_search(bda))
	end mine_search
	
	# AWS
	to mine_aws(bda)
		class_awsdata of my_load(path_run_aws(bda))
	end mine_aws
	
	# Command
	to mine_command(bda)
		class_command of my_load(path_command(bda))
	end mine_command
	
end script

on run
	#try
	tell class_mymain
		# items_amazon Path
		set bda to base_dir_a()
		# Load Command		
		set comm to mine_command(bda)
		# Load Dialog
		set d to mine_dialog(bda)
		# Main Dialog
		set c to default_d("Main", return & "menu1=>List or Search" & return & "menu2=>Add or Update", {"menu 1", "menu 2", "Cancel"}, "") of d
		if c is "menu 1" then
			set choice to default_d("Main", "Select", {"List", "Search", "Cancel"}, "") of d
		else if c is "menu 2" then
			set choice to default_d("Main", "Select", {"Add", "Update", "Cancel"}, "") of d
		end if
		
		# Selected choice
		if choice is "List" then
			urnlist(d, comm, bda) in mine_list(bda)
		else if choice is "Search" then
			runsearch(d, comm, bda) in mine_search(bda)
		else if choice is "Add" then
			runuseaws(d, comm, bda) in mine_aws(bda)
		else if choice is "Update" then
			runallupdate(d, comm, bda) in mine_update(bda)
		end if
		return
	end tell
	
	#on error error_message number the error_number
	#	set the error_text to "Error: " & the error_number & ". " & the error_message
	#	display dialog "User's Cancel" buttons {"Cancel"} default button 1 giving up after 3 with title "Main"
	#end try
	return
end run
