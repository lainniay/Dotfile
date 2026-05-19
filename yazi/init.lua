-- ~/.config/yazi/init.lua

require("git"):setup()

if os.getenv("NVIM") then
	require("toggle-pane"):entry("min-preview")
end

require("starship"):setup({
	hide_flags = true,
	flags_after_prompt = true,
	show_right_prompt = true,
	config_file = "~/.config/yazi/starship.toml",
	hide_count = true,
	count_separator = " ",
})
