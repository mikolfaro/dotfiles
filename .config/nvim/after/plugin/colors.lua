function ColorMyPencils(color)
	color = color or "darcula"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()
