script class_command
	
	to my_bin_path(alias_dir)
		"cd " & (POSIX path of alias_dir as text) & "bin"
	end my_bin_path
	
	to do_my_script(str)
		do shell script str
	end do_my_script
	
	to runcommand(str_cmd, ean, alias_dir)
		set mbp to my_bin_path(alias_dir)
		if str_cmd is "last" then
			do_my_script(mbp & listview_mod())
		else if str_cmd is "list" then
			set ary to do_my_script(mbp & listview())
		else if str_cmd is "allupdate" then
			do_my_script(mbp & update_all())
		else if str_cmd is "open" then # depend on ruby script
			do_my_script(mbp & additem(ean))
		else if str_cmd is "search" then
			do_my_script(mbp & search(ean))
		else if str_cmd is "amazon" then
			do_my_script(mbp & additem(ean))
		end if
	end runcommand
	
	to additem(ean)
		";./readbook-run-scpt.rb as a " & "'" & ean & "'"
	end additem
	
	to listview()
		";./readbook-run-scpt.rb as list 10 "
	end listview
	
	to listview_mod()
		";./readbook-run-scpt.rb as last 10"
	end listview_mod
	
	to search(w)
		";./readbook-run-scpt.rb as s " & w
	end search
	
	to update(ean)
		";./readbook-run-scpt.rb as u " & ean
	end update
	
	to update_all()
		";./readbook-run-scpt.rb as u all"
	end update_all
	
	to openitem(ean)
		";./readbook-run-scpt.rb as a " & "'" & ean & "'"
	end openitem
	
	to mhelp()
		#";./readbook-run-scpt.rb h"
	end mhelp
	
end script
