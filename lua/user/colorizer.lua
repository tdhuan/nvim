local status_ok, colorizer = pcall(require, "colorizer")

if not status_ok then
	return
end

colorizer.setup({
	"*", -- Highlight all files, but customize some others.
	css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
	typescriptreact = { RRGGBBAA = true, rgb_fn = true, hsl_fn = true, css = true, css_fn = true },
	javascriptreact = { RRGGBBAA = true, rgb_fn = true, hsl_fn = true, css = true, css_fn = true },
	javascript = { RRGGBBAA = true, rgb_fn = true, hsl_fn = true, css = true, css_fn = true },
	html = { names = true }, -- Disable parsing "names" like Blue or Gray
})
