-- C/C++. clangd is expected to be installed on your system (not via Mason).
return {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--query-driver=/usr/bin/c++,/usr/bin/g++",
	},
	init_options = {
		fallbackFlags = { "-std=c++20" },
	},
}
