-- stylua: ignore
---@diagnostic disable: undefined-global

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
if vim.g.neovide == true then
  vim.g.neovide_cursor_animation_length = 0
  vim.keymap.set({ "n" }, "<F11>", function()
    if vim.g.neovide_fullscreen == false then
      vim.g.neovide_fullscreen = true
    else
      vim.g.neovide_fullscreen = false
    end
  end, {
    silent = true
  })
end

if vim.g.vscode == true then
  print("VSCode mode detected")
  local vscode = require("vscode")
  vim.notify = vscode.notify

  -- Add this line to test if this part of the code is being executed
  vim.fn.VSCodeNotify("console.log", "polish.lua is being executed in VSCode")

  -- local function manage_editor_size(count, to)
  --   count = count or 1
  --   for _ = 1, count do
  --     vim.fn.VSCodeNotify(
  --       to == "increase" and "workbench.action.increaseViewSize" or "workbench.action.decreaseViewSize"
  --     )
  --   end
  -- end

  -- local function vscode_commentary(line1, line2)
  --   if not line1 or not line2 then
  --     vim.o.operatorfunc = "v:lua.require'vscode'.vscode_commentary"
  --     return "g@"
  --   end
  --   vim.fn.VSCodeCallRange("editor.action.commentLine", line1, line2, 0)
  -- end

  -- local function open_vscode_commands_in_visual_mode()
  --   vim.cmd "normal! gv"
  --   local mode = vim.fn.visualmode()
  --   if mode == "V" then
  --     local start_line = vim.fn.line "v"
  --     local end_line = vim.fn.line "."
  --     vim.fn.VSCodeNotifyRange("workbench.action.showCommands", start_line, end_line, 1)
  --   else
  --     local start_pos = vim.fn.getpos "v"
  --     local end_pos = vim.fn.getpos "."
  --     vim.fn.VSCodeNotifyRangePos(
  --       "workbench.action.showCommands",
  --       start_pos[2],
  --       end_pos[2],
  --       start_pos[3],
  --       end_pos[3],
  --       1
  --     )
  --   end
  -- end

  -- Better Navigation
  vim.keymap.set(
    { "n", "x" },
    "<C-j>",
    function() vim.fn.VSCodeNotify "workbench.action.navigateDown" end,
    { silent = true }
  )
  vim.keymap.set(
    { "n", "x" },
    "<C-k>",
    function() vim.fn.VSCodeNotify "workbench.action.navigateUp" end,
    { silent = true }
  )
  vim.keymap.set(
    { "n", "x" },
    "<C-h>",
    function() vim.fn.VSCodeNotify "workbench.action.navigateLeft" end,
    { silent = true }
  )
  vim.keymap.set(
    { "n", "x" },
    "<C-l>",
    function() vim.fn.VSCodeNotify "workbench.action.navigateRight" end,
    { silent = true }
  )

  vim.keymap.set("n", "gr", function() vim.fn.VSCodeNotify "editor.action.goToReferences" end, { silent = true })

  -- Bind C-/ to vscode commentary
  -- vim.keymap.set("x", "<C-/>", vscode_commentary, { expr = true })
  -- vim.keymap.set("n", "<C-/>", function() return vscode_commentary() .. "_" end, { expr = true })

  -- vim.keymap.set(
  --   "n",
  --   "<C-w>_",
  --   function() vim.fn.VSCodeNotify "workbench.action.toggleEditorWidths" end,
  --   { silent = true }
  -- )

  -- vim.keymap.set("n", "<Space>e", "<cmd>lua require('vscode').call('workbench.action.toggleSidebarVisibility')<CR>",
  --   { silent = true })

  -- vim.keymap.set("x", "<C-P>", open_vscode_commands_in_visual_mode, { silent = true })

  -- vim.keymap.set({ "x", "n", "o" }, "gc", "<Plug>VSCodeCommentary", { silent = true })
  -- vim.keymap.set("n", "gcc", "<Plug>VSCodeCommentaryLine", { silent = true })

  -- Navigate between editor tabs in VSCode
  -- vim.keymap.set("n", "<C-f>", function()
  --   vim.fn.VSCodeNotify("console.log", "C-f pressed")  -- Debug print
  --   vim.fn.VSCodeNotify "workbench.action.nextEditorInGroup"
  -- end, { silent = false })

  -- vim.keymap.set("n", "<C-b>", function()
  --   vim.fn.VSCodeNotify("console.log", "C-b pressed")  -- Debug print
  --   vim.fn.VSCodeNotify "workbench.action.previousEditorInGroup"
  -- end, { silent = false })

  -- move text up and down
  -- vim.keymap.set("n", "<A-j>", function() vim.fn.VSCodeNotify("editor.action.moveLinesDownAction") end, { silent = true })
  -- vim.keymap.set("n", "<A-k>", function() vim.fn.VSCodeNotify("editor.action.moveLinesUpAction") end, { silent = true })
  -- vim.keymap.set("v", "<A-j>", function() vim.fn.VSCodeNotify("editor.action.moveLinesDownAction") end, { silent = true })
  -- vim.keymap.set("v", "<A-k>", function() vim.fn.VSCodeNotify("editor.action.moveLinesUpAction") end, { silent = true })
end
