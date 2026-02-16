-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Spawn a fish shell in login mode
config.default_prog = { '/usr/bin/elvish', '-l'}

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 11
config.color_scheme = 'Aura (Gogh)'

config.skip_close_confirmation_for_processes_named = {
  'elvish',
  'bash',
  'sh',
  'zsh',
  'fish',
  'tmux',
  'nu',
  'cmd.exe',
  'pwsh.exe',
  'powershell.exe',
}

config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = 'h',
    mods = 'ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'v',
    mods = 'ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'Enter',
    mods = 'ALT',
    action = wezterm.action.SpawnCommandInNewTab { args = { "elvish", "-l", }, },
  },
  {
    key = 'p',
    mods = 'CTRL',
    action = wezterm.action.ShowTabNavigator
  },
  {
    key = 'LeftArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'q',
    mods = 'ALT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'c',
    mods = 'ALT',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
  {
    key = 'UpArrow',
    mods = 'CTRL',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 },
  },
  {
    key = 'LeftArrow',
    mods = 'CTRL',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'DownArrow',
    mods = 'CTRL',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  },
  {
    key = 'RightArrow',
    mods = 'CTRL',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  },
  {
      key = 'x',
      mods = 'ALT',
      action = wezterm.action.SpawnCommandInNewTab {
        set_environment_variables = { QUAKE_TERM = "1", RUST_BACKTRACE = "1" },
        -- args = { 'alacritty', '--title', 'quake' },
            args = {
      'sh', '-lc',
      [[
        alacritty --title quake >/dev/null 2>&1 &
        pid=$!

        while :; do
          clear
          echo
          echo "  Quake terminal monitor"
          echo "  PID: $pid"
          echo
          if kill -0 "$pid" 2>/dev/null; then
            echo "  Status: running"
          else
            echo "  Status: exited"
            echo
            echo "  (closing tab)"
            -- sleep 1
            exit 0
          fi
          echo
          echo "  Press Ctrl-C to close this tab."
          sleep 0.5
        done
      ]]
    },
      },
    },
  -- {
    --   key = 'x',
    --   mods = 'ALT',
    --   action = wezterm.action_callback(function(window, pane)
    --     wezterm.background_child_process {
    --       'usr/bin/env', 'QUAKE_TERM=1',
    --       'alacritty', '--title', 'quake'
    --     }
    --   end),
    -- },
}

-- Finally, return the configuration to wezterm:
return config
