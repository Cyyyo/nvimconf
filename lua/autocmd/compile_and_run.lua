-- /lua/autocmd.lua

local M = {}

function M.compile_and_run()
    local filetype = vim.bo.filetype
    local filename = vim.fn.expand("%")
    local basename = vim.fn.expand("%:r")

    local commands = {
        cpp = "g++ -std=c++17 -Wall -O2 " .. filename .. " -o " .. basename,
        c = "gcc -std=c11 -Wall -O2 " .. filename .. " -o " .. basename .. " && " .. basename,
        python = "python3 " .. filename,
        java = "javac " .. filename .. " && java " .. basename,
    }

    local cmd = commands[filetype]
    if cmd then
        vim.cmd("w")
        vim.cmd("ToggleTerm direction=float")
        vim.cmd("TermExec cmd='" .. cmd .. "'")
        if filetype == 'cpp' then
          vim.cmd("TermExec cmd='./" .. basename .. "'")
        elseif filetype == 'c' then
          vim.cmd("TermExec cmd='./" .. basename .. "'")
        end
    else
        print("Unsupported filetype: " .. filetype)
    end
end

_G.compile_and_run = M.compile_and_run

return M
