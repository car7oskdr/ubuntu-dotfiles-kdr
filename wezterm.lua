local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- ==========================================
-- 1. APARIENCIA Y VENTANA
-- ==========================================
config.initial_cols = 120
config.initial_rows = 28

config.color_scheme = "Ayu Mirage"

-- Transparencia y Blur
config.window_background_opacity = 0.90

-- Padding
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

-- Tab Bar moderna
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- ==========================================
-- 2. TIPOGRAFÍA Y FUENTES
-- ==========================================
-- Usamos JetBrains Mono como fuente principal, con Nerd Fonts como fallback
config.font = wezterm.font_with_fallback {
  'JetBrains Mono',
  'Symbols Nerd Font',
}
config.font_size = 11.0

-- ==========================================
-- 3. MULTIPLEXACIÓN Y COMPORTAMIENTO
-- ==========================================
-- Default behavior for paths 
config.default_cwd = wezterm.home_dir
config.default_prog = { '/bin/zsh', '-l' }

-- ==========================================
-- 4. ATAJOS DE TECLADO (KEYBINDINGS)
-- ==========================================
-- Configurar Leader Key a CTRL+a (estilo tmux)
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  -- Dividir pantalla vertical y horizontalmente
  {
    key = '|',
    mods = 'LEADER|SHIFT',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'LEADER',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Movimiento entre paneles (estilo vim)
  { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
  -- Crear y mover entre tabs
  { key = 'c', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'p', mods = 'LEADER', action = act.ActivateTabRelative(-1) },
  { key = 'n', mods = 'LEADER', action = act.ActivateTabRelative(1) },
}

-- ==========================================
-- 5. BARRA DE ESTADO
-- ==========================================
wezterm.on('update-right-status', function(window, pane)
  -- Workspace actual
  local stat = window:active_workspace()
  
  -- Fecha y hora
  local time = wezterm.strftime '%H:%M'
  local date = wezterm.strftime '%Y-%m-%d'

  window:set_right_status(wezterm.format({
    { Foreground = { Color = '#73d0ff' } },
    { Text = '   ' .. stat .. ' ' },
    { Foreground = { Color = '#d4bfff' } },
    { Text = '   ' .. time .. ' ' },
    { Foreground = { Color = '#bae67e' } },
    { Text = '   ' .. date .. ' ' },
  }))
end)

return config
