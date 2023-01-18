local status_ok, nvim_autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
	log.err("Can not load autopairs")
	return
end
nvim_autopairs.setup({})
nvim_autopairs.add_rules(require("nvim-autopairs.rules.endwise-ruby"))
nvim_autopairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
