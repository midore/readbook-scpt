script class_list
	
	# "Add" or "Mod" 
	to dialog_mine_admd(mydia)
		set m to "Select"
		default_d("ListView", m, {"SortAdd", "SortEdit", "Cancel"}, "") of mydia
	end dialog_mine_admd
	
	
	# CHOOSE SELECT FROM RIST 
	to dialog_select_item(ary, mydia)
		set t to every paragraph of ary
		if (count of t) is 1 then
			return {ary}
		else
			set res to choose_mydialog(t) of mydia
			return res
		end if
		
		
	end dialog_select_item
	
	# item open => return ean
	to diallog_open(selectitem, mydia)
		# Title and ean
		set ean to get_ean(selectitem) of mydia
		set title to get_title(selectitem) of mydia
		# Open file
		set str to "Open the file:" & return & return & title
		default_d("Open Item", str, {"OK", "Cancel"}, 1) of mydia
		return ean
	end diallog_open
	
	# call from main
	to urnlist(d, comm, bda)
		# "Add" or "Mod" 
		set opt to dialog_mine_admd(d)
		
		# select sort
		if opt is "SortAdd" then
			# response
			set ary to runcommand("list", "", bda) of comm
			#display dialog "dd"
		else if opt is "SortEdit" then
			set ary to runcommand("last", "", bda) of comm
		end if
		
		if ary is "" then
			d_done("not found End itmes") of d
			return
		end if
		# 
		set selectitem to dialog_select_item(ary, d)
		
		# NOT User's Cancel
		if selectitem is not false then
			# OpenÅH get-EAN 
			set ean to diallog_open(selectitem, d)
			# Open run
			runcommand("open", ean, bda) of comm
		end if
		
	end urnlist
	
end script
