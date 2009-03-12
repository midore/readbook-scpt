script class_awsdata
	
	# dialog 
	to dialog_mine(mydia)
		input_mydialog("AWSItem", "Enter EAN and click OK", {"Cancel", "OK"}, "978-4-") of mydia
	end dialog_mine
	
	# list dialog 
	to dialog_select_item(ary, mydia)
		set t to every paragraph of ary
		set res to choose_mydialog(t) of mydia
		return res
	end dialog_select_item
	
	# res 
	to end_of_exist(res, mydia)
		default_d_editor("AWS Access Result", "File Exist in Local" & return & return & res, {"OK"}, 1) of mydia
	end end_of_exist
	
	to end_of_add(res, mydia)
		default_d_editor("AWS Access Result", "Successful: Item Added to list." & return & return & res, {"OK"}, 1) of mydia
	end end_of_add
	
	to end_of_error(mydia) ## AWS GET ERROR"
		d_done("AWS Error." & return & return) of mydia
	end end_of_error
	
	# call from main
	to runuseaws(d, comm, bda)
		set ean to dialog_mine(d)
		set s to count of ean
		# input miss
		if s < 9 then
			end_of_error(d)
			return
		end if
		
		# Result of Amazon
		set res to runcommand("amazon", ean, bda) of comm
		
		# Result is Empty
		if res is "" then
			end_of_error(d)
			return
		end if
		
		# res
		if "Error" is in res then
			end_of_error(d) # socket error or not exist ean.
			return
		else if "Exist" is in res then
			end_of_exist(res, d)
			return
		else
			# Success get data from Amzon
			end_of_add(res, d)
		end if
		return
	end runuseaws
	
end script
