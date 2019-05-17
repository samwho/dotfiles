function cheat
	curl cht.sh/(echo -ne "$argv" | hexdump -v -e '/1 "%02x"' | sed 's/\(..\)/%\1/g')
end
