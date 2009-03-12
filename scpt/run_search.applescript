script class_search
	
	# dialog
	to dialog_mine(mydia)
		set str to "Enter Keyword and click OK"
		input_mydialog("SearchItem", str, {"Cancel", "OK"}, "ruby") of mydia
	end dialog_mine
	
	# list dialog
	to dialog_select_item(ary, mydia)
		set t to every paragraph of ary
		set res to choose_mydialog(t) of mydia
		return res
	end dialog_select_item
	
	# res
	to endof_mess(mydia)
		d_done("Not found") of mydia
	end endof_mess
	
	# item open
	to diallog_openorupdate(selectitem, mydia)
		# Title and ean
		set ean to get_ean(selectitem) of mydia
		set title to get_title(selectitem) of mydia
		# Open file
		set str to "Open the file:" & return & return & title
		default_d("Selecte Item Open", str, {"OK", "Cancel"}, 1) of mydia
		return ean
	end diallog_openorupdate
	
	# call from main
	to runsearch(d, comm, bda)
		set w to dialog_mine(d)
		# command run
		set ary to runcommand("search", w, bda) of comm
		# res
		set cnt to count of every paragraph of ary
		# item choose
		if cnt is 1 then
			# {"9784797336610: xxxxx"}
			set selectitem to paragraph 1 of ary
			set selectitem to {selectitem}
		else if cnt is 0 then
			endof_mess(d)
			return "zero"
		else
			set selectitem to dialog_select_item(ary, d)
		end if
		
		# NOT User's Cancel
		if selectitem is not false then
			# Open
			set ean to diallog_openorupdate(selectitem, d)
			# Open run
			runcommand("open", ean, bda) of comm
		end if
		
	end runsearch
	
end script
