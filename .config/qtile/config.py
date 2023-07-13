# QtileOS for Debian 12 

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import os
import subprocess

from libqtile import hook

# color schema
from colors import colors

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])

mod = "mod4"
#terminal = guess_terminal()
myTerm = "alacritty" 
myBrowser = "librewolf"

keys = [

# Add dedicated sxhkdrc to autostart.sh script

         #=-/ Main sys control /-=#
         Key([mod], "Tab", lazy.next_layout(), desc='Toggle through layouts'),
         Key([mod], "q", lazy.window.kill(), desc="kill focused window"),
         Key([mod, "shift"], "q", lazy.shutdown(), desc="shutdown qtile"),
         Key([mod, "control"], "r", lazy.restart(), desc='Restart Qtile'),
         Key([mod, "shift"], "r", lazy.reload_config(), desc="reload the config"),

         #=-/ Terminals /-=#
         Key([mod, "shift"], "Return", lazy.spawn(myTerm), desc='Run Launcher'),
         Key([mod, "shift"], "a", lazy.spawn("alacritty")),
         Key([mod, "shift"], "s", lazy.spawn("kitty -e bettercd.sh"), desc='my file manager'),

         #=-/ Browsers /-=#
         Key([mod, "shift"], "b", lazy.spawn(myBrowser), desc='librewolf'),
         Key([mod, "shift"], "f", lazy.spawn("firefox"), desc='another browser'),

         
         #=-/ Multimedia keys /-=#
         Key([], "XF86AudioLowerVolume", lazy.spawn("changevolume down")),
         Key([], "XF86AudioRaiseVolume", lazy.spawn("changevolume up")),
         Key([], "XF86AudioMute", lazy.spawn("changevolume mute")),

         # Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume 0 -10%")),
         # Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume 0 +10%")),
         # Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
# # CLOSE WINDOW, RELOAD AND QUIT QTILE
#     Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
#     Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
#     Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
#     #Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
#
# CHANGE FOCUS USING VIM OR DIRECTIONAL KEYS
    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),

# MOVE WINDOWS UP OR DOWN,LEFT OR RIGHT USING VIM KEYS
    # Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    # Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "h", lazy.layout.swap_column_left()),
    Key([mod, "shift"], "l", lazy.layout.swap_column_right()),

# MOVE WINDOWS UP OR DOWN,LEFT OR RIGHT USING DIRECTIONAL KEYS
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Left", lazy.layout.swap_column_left()),
    Key([mod, "shift"], "Right", lazy.layout.swap_column_right()),

# RESIZE UP, DOWN, LEFT, RIGHT USING VIM KEYS
    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),

# RESIZE UP, DOWN, LEFT, RIGHT USING DIRECTIONAL KEYS
    Key([mod, "control"], "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
     Key([mod, "control"], "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
     Key([mod, "control"], "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
     Key([mod, "control"], "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),

# QTILE LAYOUT KEYS
    # Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),

# TOGGLE FLOATING LAYOUT
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),
	Key([mod, "shift"], "z", lazy.layout.normalize(), desc="Reset all window sizes"),

    ]
# end of keys

# groups = [Group(i) for i in ["", "", "", "", "阮", "", "", "", ""]]
groups = [Group(i) for i in ["1", "2", "3", "4", "5", "6", "7", "8", "9"]]
group_hotkeys = "123456789"

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Columns(margin=3, num_columns=3, insert_position=1, border_focus=colors['cyan'], border_normal=colors['dark-blue'], border_width=4),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    layout.Matrix(),
    layout.MonadTall(border_width=4,ratio=0.7, min_ratio=0.20, max_ratio=0.80),
    layout.MonadWide(),
    layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    layout.Zoomy(),
]

#=-/ Default settings for widgets /-=#
widget_defaults = dict(
	font='JetBrainsMono Nerd Font',
    background=colors['bg'],
    foreground=colors['fg'],
    fontsize=14,
    padding=2,
)
extension_defaults = widget_defaults.copy()
separator = widget.Sep(size_percent=50, foreground=colors['fg3'], linewidth =1, padding =10)
spacer = widget.Sep(size_percent=50, foreground=colors['fg3'], linewidth =0, padding =10)


#=-/ widgets /-=#
def init_widgets_list():
    widgets_list = [
              widget.Sep(
                       linewidth = 0, padding = 10,
                       foreground = colors['fg'], background = colors['bg']
                       ),
              widget.Image(
                       filename = "~/.config/qtile/qtile.png", scale = "False",
                       background = colors['bg'],
                       mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm)}
                       ),

              widget.Sep(
                       linewidth = 0, padding = 0,
                       foreground = colors['bg'],
                       background = colors['bg0']
                       ),
             widget.TextBox(
                       text = '', font = "JetBrainsMono Nerd Font", fontsize = 37,
                       background = colors['bg'], foreground = colors['dark-green'],
                       padding = 0
                       ),
             widget.TextBox(
                       text = '', font = "JetBrainsMono Nerd Font", fontsize = 37,
                       background = colors['dark-green'], foreground = colors['bg0'],
                       padding = 0
                       ),
              widget.GroupBox(
                       font = "FontAwesome Bold", fontsize = 14,
                       margin_y = 3, margin_x = 0, padding_y = 5, padding_x = 3,
                       borderwidth = 3, rounded = False,
                       active = colors['fg'], inactive = colors['dark-green'],
                       highlight_color = colors['bg0'], highlight_method = "line",
                       this_current_screen_border = colors['cyan'], this_screen_border = colors['dark-red'],
                       other_current_screen_border = colors['cyan'], other_screen_border = colors['dark-cyan'],
                       background = colors['bg0'], foreground = colors['fg'],
                       ),
             widget.TextBox(
                       text = '', font = "JetBrainsMono Nerd Font", fontsize = 37,
                       background = colors['bg0'], foreground = colors['bg'],
                       padding = 0
                       ),
             # widget.TextBox(
             #           text = '', font = "JetBrainsMono Nerd Font", fontsize = 37,
             #           foreground = colors['bg0'], background = colors['bg0'],
             #           padding = 0
             #           ),
              widget.WindowName(
                       foreground = colors['fg'], 
                       # background = colors['bg0'],
                       padding = 0
                       ),
              widget.TextBox(
                       text ='', font = "JetBrainsMono Nerd Font", fontsize = 37,
                       foreground = colors['bg0'],
                       # background = colors['bg0'],
                       padding = 0
                       ),
              widget.CurrentLayout(
                       foreground = colors['dark-green'], background = colors['bg0'],
                       padding = 5
                       ),
              widget.CurrentLayoutIcon(
                       custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                       background = colors['bg0'], foreground = colors['fg'],
                       padding = 2, scale = 0.7
                       ),
               widget.Memory(
                format='󰻠{MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}',
                measure_mem='G',
                foreground=colors['dark-green'],
                background=colors['bg0']
               ),
              widget.TextBox(
                       text='', font = "JetBrainsMono Nerd Font", fontsize = 37,
                       foreground = colors['bg'], background = colors['bg0'],
                       padding = 0
                       ),
               widget.CPU(
					format=" {load_percent:04}%",
					foreground=colors['dark-green'],
			   ),
              widget.TextBox(
                       text = '', font = "JetBrainsMono Nerd Font", fontsize = 37,
                       foreground = colors['dark-green'], background = colors['bg'],
                       padding = 0
                       ),
               widget.Volume(
					fmt="󰕾 {}",
					mute_command="amixer -D pulse set Master toggle",
					foreground=colors['fg'],
                    background=colors['dark-green']
            ),
              widget.TextBox(
                       text = '', font = "JetBrainsMono Nerd Font", fontsize = 37,
                       foreground = colors['bg'], background = colors['dark-green'],
                       padding = 0
                       ),
              widget.Clock(
                       foreground = colors['dark-green'], background = colors['bg'],
                       format = "%A, %B %d - %l:%M %p",
                       padding = 5
                       ),
              widget.Systray(
                       background = colors['bg'],
                       padding = 5
                       ),
              widget.TextBox(
                       text = '', font = "JetBrainsMono Nerd Font", fontsize = 37,
                       foreground = colors['bg'], background = colors['bg'],
                       padding = 0
                       ),
              widget.Image(
                       filename = "~/.config/qtile/debian_bg.png", scale = "False",
                       background = colors['bg'],
                       mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm)}
                       ),

              widget.Sep(
                       linewidth = 0, padding = 10,
                       foreground = colors['fg'], background = colors['bg'],
                       ),
              ]
    return widgets_list

#=-/ set bar to screen /-=#
def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1


#=-/ Set bar height and opacity, also set wallpaper /-=#
def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=25),
            wallpaper='~/.config/qtile/leafs.jpg',
            wallpaper_mode='fill')]

#=-/ Initiate functions for screens and widgets /-=#
if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()


# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="qimgv"),  # q image viewer
        Match(wm_class="Galculator"),  # calculator
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
