function ColorMyPencils(color)
	color = color or "darcula-solid"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()
