{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.mods.cli.nvf.base;
in {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];
  options.mods.cli.nvf.base.enable = mkEnableOption "enable base nvf module";
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
              wrap = true;
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

            dashboard = {
              alpha.enable = true;
              dashboard-nvim.enable = false;
            };

            debugMode = {
              enable = false;
              level = 16;
              logFile = "/tmp/nvim.log";
            };

            diagnostics = {
              enable = true;
              config = {
                underline = true;
                virtual_lines.enable = true;
              };
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
              enableExtraDiagnostics = true;
              assembly.enable = false;
              css.enable = false; # uh oh
              go.enable = true;
              haskell.enable = false;
              html.enable = true;
              java.enable = false;
              lua.enable = true;
              markdown.enable = true;
              nix.enable = true;
              python.enable = true;
              rust = {
                enable = true;
                crates.enable = true;
              };
              r.enable = true;
              sql.enable = true;
              ts.enable = false;
              zig.enable = false;
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
            };

            git = {
              enable = true;
              gitsigns.enable = true;
              gitsigns.codeActions.enable = false;
            };

            notify = {
              nvim-notify.enable = true;
            };

            spellcheck = {
              enable = true;
              languages = ["en"];
              programmingWordlist.enable = true;
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
              todo-comments.enable = true;
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
            };

            ui = {
              borders.enable = true;
              colorizer.enable = true;
              fastaction.enable = true;
              illuminate.enable = true;
              noice.enable = true;
              smartcolumn = {
                enable = true;
              };
            };
            visuals = {
              nvim-scrollbar.enable = false;
              nvim-web-devicons.enable = true;
              nvim-cursorline.enable = true;
              cinnamon-nvim.enable = true;
              fidget-nvim.enable = true;
              highlight-undo.enable = true;
              indent-blankline.enable = true;
              rainbow-delimiters.enable = true;
            };
          };
        };
      };
    };
  };
}
