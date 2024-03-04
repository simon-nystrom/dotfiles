{ config, pkgs, lib, ... }:

{
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      git_branch = {
        format = "[$symbol$branch(:$remote_branch)]($style) ";
      };
      kubernetes = {
        disabled = false;
        format = ''[$symbol$context( \($namespace\))]($style) '';
        symbol = "";
        style = "bold yellow";
      };
      package.disabled = true;
      python.disabled = true;
      gradle.disabled = true;
      java.disabled = true;
      kotlin.disabled = true;
      elixir.disabled = true;
      character = {
        success_symbol = "[➜](bold green)";
      };
    };
  };

  programs.autojump.enable = true;

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 0;
    keyMode = "vi";
    mouse = true;
    prefix = "`";
    extraConfig = ''
      bind ` send-key `

      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      set-option -ga terminal-overrides "alacritty:Tc"

      setw -g automatic-rename on

      set -g renumber-windows on
      set -g status-position top
    '';
    terminal = "screen-256color";
    newSession = true;
    plugins = with pkgs; [
      tmuxPlugins.sensible
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_window_left_separator ""
          set -g @catppuccin_window_right_separator " "
          set -g @catppuccin_window_middle_separator " █"
          set -g @catppuccin_window_number_position "right"
          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"
          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"
          set -g @catppuccin_status_modules_right "application directory session date_time"
          set -g @catppuccin_status_modules_left ""
          set -g @catppuccin_status_left_separator  " "
          set -g @catppuccin_status_right_separator " "
          set -g @catppuccin_status_right_separator_inverse "no"
          set -g @catppuccin_status_fill "icon"
          set -g @catppuccin_status_connect_separator "no"
          set -g @catppuccin_directory_text "#{b:pane_current_path}"
        '';
      }
    ];
    # Possibly replace with tmux-resurrect?
    tmuxinator.enable = true;
  };

  programs.ripgrep.enable = true;

  programs.git = {
    enable = true;
    aliases = {
      co = "checkout";
    };

    ignores = [ ".DS_Store" ];

    delta = { enable = true; };
  };

  programs.fzf = {
    enable = true;
    defaultCommand = "rg --files";
    # Seems to cause tmux to freeze
    # tmux = {
    #   enableShellIntegration = true;
    # };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    defaultKeymap = "viins";

    shellAliases = {
      ls = "ls --color";
      ll = "ls -lah";
      # So used to using the Z-util that I forget I use autojump instead.
      z = "j";
      envim = "nvim ~/.config/nvim";
      # Start editing in home.nix file whever we are, but set Neovim cwd to ~/.config/nix-darwin/
      enix = "nvim ~/.config/nix-darwin/home.nix -c ':cd %:p:h'";
      mux = "tmuxinator";
      # Very strange ssh behaviour in alacritty without this
      ssh = "TERM=xterm-256color ssh";
    };

    envExtra = lib.concatStrings [ 
      "export LIVEBOOK_PORT=50000"
      "export BAT_THEME=ansi"
    ];

    syntaxHighlighting = {
      enable = true;
    };

    initExtra = ''
    repo() {
      url=$(git remote get-url origin | sed -E "s_.*@(.*)\.git_\1_" | sed -E "s/:/\//g" | sed -E "s_^_https://_")
      open "$url"
    }
    '';

    history = {
      extended = true;
      ignoreAllDups = true;
      ignorePatterns = [ 
        "git reset *" 
        "rm *" "rm -rf *"
        "ls" "ls *" "ll" "ll *"
      ];
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      import = [
        "~/.config/alacritty/catppuccin-mocha.toml"
      ];
      colors = {
        draw_bold_text_with_bright_colors = true;
      };
      font = {
        size = 14;
        normal = {
          family = "FiraCode Nerd Font Mono";
        };
      };
      window = {
        decorations = "buttonless";
        padding = {
          x = 10;
          y = 10;
        };
      };
    };

  };

  # TODO:
  # bat
  # eww
  # jq
  # yq
  # k9s


  nix = {
    gc = {
      automatic = true;
      frequency = "monthly";
    };
  };

}
