function live_server()
	local function command_exists(command)
		local handle = io.popen("command -v " .. command)
		local result = handle:read("*a")
		handle:close()
		return result ~= ""
	end

	if command_exists("live-server") then
		-- In case you have the notify plugin installed uncomment the following lines
		local notify = require("notify")
		notify("Starting live server...")
		vim.cmd("silent !live-server . >/dev/null 2>&1 &")
	-- local message = "Starting live server"
	-- vim.api.nvim_echo({{message}}, true, {})
	-- vim.cmd(":")
	else
		local notify = require("notify")
		notify("Live-server is not installed", "error")
	end
end

function stop_live_server()
	local notify = require("notify")
	notify("Stopping live server", "info")
	vim.cmd("silent !pkill -f live-server")
end

function start_grip()
	local function command_exists(command)
		local handle = io.popen("command -v " .. command)
		local result = handle:read("*a")
		handle:close()
		return result ~= ""
	end

	if command_exists("grip") then
		-- You can change the port as you wish
		local port = 5500
		vim.cmd("silent !grip -b % :" .. port .. ">/dev/null &")

		local address = "localhost"

		local message = "Grip starting at http://" .. address .. ":" .. port
		-- In case you have the notify plugin installed uncomment the following lines
		local notify = require("notify")
		vim.notify(message)
	-- vim.api.nvim_echo({{message}}, true, {})
	else
		local notify = require("notify")
		notify("Grip is not installed", "error")
	end
end

function stop()
	vim.cmd("silent !pkill -f grip")

	-- In case you have the notify plugin installed uncomment the following lines
	local notify = require("notify")
	vim.notify("Grip has stopped")
	-- local message = "Grip has stopped"
	-- vim.api.nvim_echo({{message}}, true, {})
end

vim.cmd("command Startg lua start_grip()") -- to start grip
vim.cmd("command Stopg lua stop()") -- to stop grip

function Save()
	vim.cmd("w")
	vim.notify("Saved file")
end

function test_function(buf)
	-- Obtener la ruta completa del archivo
	local file_path = vim.api.nvim_buf_get_name(buf)
	-- Extraer solo el nombre del archivo
	local file_name = vim.fn.fnamemodify(file_path, ":t")
	-- Obtener el tipo de archivo usando vim.api.nvim_buf_get_option
	local file_type = vim.api.nvim_buf_get_option(buf, "filetype")
	-- Imprimir el nombre y el tipo de archivo en la línea de estado
	-- print("El nombre del archivo es " .. file_name .. " y el tipo de archivo es " .. file_type)
	local notify = require("notify")
	notify(
		"Formatted " .. file_name .. " file \nType: " .. file_type,
		notify.setup({
			render = "compact",
		})
	)
	vim.cmd("silent :Format")
end

function tkinter()
	vim.cmd("TermExec cmd='DISPLAY=:1 PULSE_SERVER=localhost python %'")
end

vim.cmd("command Tkinter lua tkinter()")

function countAndCloseBuffers()
	local num_buffers = 0
	for _, buf in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
		num_buffers = num_buffers + 1
	end
	if num_buffers > 1 then
		vim.cmd(":bdelete")
	else
		vim.cmd(":x")
	end
end
