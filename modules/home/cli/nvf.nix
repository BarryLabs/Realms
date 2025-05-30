{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.mods.cli.nvf;
in {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];
  options.mods.cli.nvf.enable = mkEnableOption "enable nvf";
  config = mkIf cfg.enable {
    programs = {
      nvf = {
        enable = true;
        settings = {
          vim = {
            viAlias = true;
            vimAlias = true;
            options = {
              autoindent = false;
              shiftwidth = 2;
              tabstop = 2;
            };

            debugMode = {
              enable = false;
              level = 16;
              logFile = "/tmp/nvim.log";
            };

            assistant = {
              codecompanion-nvim = {
                enable = true;
                setupOpts = {
                  strategies = {
                    cmd = {
                      adapter = "ollama";
                    };
                    chat = {
                      adapter = "ollama";
                    };
                    inline = {
                      adapter = "ollama";
                    };
                  };
                };
              };
            };

            autopairs = {
              nvim-autopairs.enable = true;
            };

            autocomplete = {
              nvim-cmp.enable = true;
            };

            comments = {
              comment-nvim.enable = true;
            };

            lsp = {
              enable = true;
              formatOnSave = true;
              lspkind.enable = false;
              lightbulb.enable = false;
              lspsaga.enable = true;
              trouble.enable = false;
              lspSignature.enable = false;
              otter-nvim.enable = false;
              nvim-docs-view.enable = false;
            };

            languages = {
              enableFormat = true;
              enableTreesitter = true;
              enableExtraDiagnostics = false;
              assembly.enable = false;
              css.enable = true;
              go.enable = true;
              haskell.enable = false;
              html.enable = true;
              java.enable = true;
              lua.enable = true;
              markdown.enable = true;
              nix.enable = true;
              python.enable = true;
              rust = {
                enable = true;
                crates.enable = true;
              };
              r.enable = false;
              sql.enable = false;
              ts.enable = false;
              zig.enable = false;
            };

            visuals = {
              nvim-scrollbar.enable = true;
              nvim-web-devicons.enable = true;
              nvim-cursorline.enable = true;
              cinnamon-nvim.enable = true;
              fidget-nvim.enable = true;
              highlight-undo.enable = true;
              indent-blankline.enable = true;
            };

            statusline = {
              lualine = {
                enable = true;
                theme = "catppuccin";
              };
            };

            theme = {
              enable = true;
              name = "catppuccin";
              style = "mocha";
              transparent = true;
            };

            snippets.luasnip.enable = true;

            filetree = {
              neo-tree = {
                enable = true;
              };
            };

            tabline = {
              nvimBufferline.enable = true;
            };

            treesitter.context.enable = true;

            telescope = {
              enable = true;
              setupOpts = {
                defaults = {
                  vimgrep_arguments = [
                    "\${pkgs.ripgrep}/bin/rg"
                    "--color=never"
                    "--no-heading"
                    "--with-filename"
                    "--line-number"
                    "--column"
                    "--smart-case"
                    "--hidden"
                    "--no-ignore"
                  ];
                };
              };
            };

            git = {
              enable = true;
              gitsigns.enable = true;
              gitsigns.codeActions.enable = false;
            };

            dashboard = {
              alpha.enable = true;
            };

            notify = {
              nvim-notify.enable = true;
            };

            utility = {
              ccc.enable = true;
              vim-wakatime.enable = false;
              icon-picker.enable = true;
              surround.enable = true;
              diffview-nvim.enable = true;
              motion = {
                hop.enable = true;
                leap.enable = true;
                precognition.enable = true;
              };

              images = {
                image-nvim = {
                  enable = true;
                  setupOpts = {
                    backend = "kitty";
                  };
                };
              };
            };

            notes = {
              neorg = {
                enable = true;
                treesitter = {
                  enable = true;
                  norgPackage = pkgs.tree-sitter-grammars.tree-sitter-norg;
                };
                setupOpts = {
                  load = {
                    "core.defaults" = {
                      enable = true;
                    };
                    "core.dirman" = {
                      config = {
                        workspaces = {
                          notes = "~/Documents/Notes/";
                        };
                        default_workspace = "notes";
                      };
                    };
                    "core.concealer" = {
                      config = {
                        icon_preset = "varied";
                      };
                    };
                  };
                };
              };
              todo-comments.enable = true;
            };

            ui = {
              borders.enable = true;
              noice.enable = true;
              colorizer.enable = true;
              modes-nvim.enable = true;
              illuminate.enable = true;
              smartcolumn = {
                enable = true;
                setupOpts.custom_colorcolumn = {
                  nix = "110";
                  ruby = "120";
                  java = "130";
                  go = ["90" "130"];
                };
              };
              fastaction.enable = true;
            };
          };
        };
      };
    };
  };
}
