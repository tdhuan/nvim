local status_ok, auto_tag = pcall(require, "nvim-ts-autotag")
if not status_ok then
	return
end

auto_tag.setup({})
