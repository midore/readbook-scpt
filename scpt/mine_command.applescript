script class_command
	
	to my_bin_path(alias_dir)
		"cd " & (POSIX path of alias_dir as text) & "bin" & ";./readbook-run-scpt.rb "
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
		"as a " & "'" & ean & "'"
	end additem
	
	to listview()
		"as list 10"
	end listview
	
	to listview_mod()
		"as last 10"
	end listview_mod
	
	to search(w)
		"as s " & w
	end search
	
	to update(ean)
		"as u " & ean
	end update
	
	to update_all()
		"as u all"
	end update_all
	
	to openitem(ean)
		"as a " & "'" & ean & "'"
	end openitem
	
	to mhelp()
		"h"
	end mhelp
	
end script
