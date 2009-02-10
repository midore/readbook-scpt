script class_allupdate
	
	# dialog
	to dialog_mine(mydia)
		default_d("AllUpdate", "ALL Update OK ?", {"OK", "Cancel"}, "") of mydia
	end dialog_mine
	
	# response
	to end_mine(res, mydia)
		if res is not "" then
			default_d("UpdatedResult", "Success: Items Update !" & return & return & res, {"Done"}, "") of mydia
			return "allupdated"
		else
			d_done("None Update Items") of mydia
			return "not allupdated"
		end if
		return res
	end end_mine
	
	to runallupdate(d, comm, bda)
		# run dialog
		dialog_mine(d)
		# command run
		set res to runcommand("allupdate", "", bda) of comm
		# res
		end_mine(res, d)
		return
	end runallupdate
	
end script
