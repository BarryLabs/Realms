{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.mods.cli.nixvim.base;
in
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  options.mods.cli.nixvim.base.enable = mkEnableOption "enable base nixvim module";
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      clang
      mercurial
      nodejs-slim
      ripgrep
      texliveSmall
      tree-sitter
    ];
    programs.nixvim = {
      enable = true;
      colorschemes = {
        catppuccin = {
          enable = true;
          settings = {
            flavour = "mocha";
            integrations = {
              cmp = true;
              gitsigns = true;
              treesitter = true;
              notify = false;
            };
          };
        };
        cyberdream.enable = false;
        dracula.enable = false;
        tokyonight.enable = false;
      };
      autoCmd = [
        {
          event = "InsertEnter";
          command = "norm zz";
        }
        {
          event = "FileType";
          pattern = [
            "markdown"
          ];
          command = "setlocal spell spelllang=en";
        }
      ];
      extraPlugins = with pkgs.vimPlugins; [
        {
          plugin = comment-nvim;
          config = ''lua require("Comment").setup()'';
        }
      ];
      globals = {
        mapleader = ",";
        loaded_ruby_provider = 0;
        loaded_perl_provider = 0;
        loaded_python_provider = 0;
      };
      highlight = {
        Comment = {
          fg = "#f9e2af";
          bg = "#45475a";
          bold = true;
          underline = true;
        };
      };
      keymaps = [
        {
          key = ";";
          action = ":";
        }
        {
          key = "x";
          action = "*d<CR>";
        }
        {
          key = "<C-c>";
          action = "*y";
        }
        {
          key = "<C-v>";
          action = "*p";
        }
        {
          key = "<leader>cc";
          action = "<cmd>CodeCompanionChat<CR>";
        }
        {
          key = "<leader>do";
          action = "<cmd>DiffviewOpen<CR>";
        }
        {
          key = "<leader>dc";
          action = "<cmd>DiffviewClose<CR>";
        }
        {
          key = "<leader>oo";
          action = "<cmd>Oil<CR>";
        }
        {
          key = "<leader>sg";
          action = "<cmd>Telescope live_grep<CR>";
        }
        {
          key = "<leader>sc";
          action = "<cmd>Telescope command_history<CR>";
        }
        {
          key = "<leader>sf";
          action = "<cmd>Telescope find_files<CR>";
        }
        {
          key = "<leader>su";
          action = "<cmd>Telescope undo<CR>";
        }
        {
          key = "<leader>tt";
          action = "<cmd>Neotree<CR>";
        }
      ];
      opts = {
        autoindent = true;
        autoread = true;
        backup = false;
        encoding = "utf-8";
        fileencoding = "utf-8";
        undofile = true;
        swapfile = true;
        cursorline = true;
        ruler = true;
        scrolloff = 4;
        tabstop = 2;
        shiftwidth = 2;
        mouse = "a";
        number = true;
        relativenumber = true;
        completeopt = [
          "menuone"
          "noselect"
          "noinsert"
        ];
        ignorecase = true;
        smartcase = true;
        termguicolors = true;
        #updatetime = 100;
        wrap = true;
        clipboard = {
          register = "unnamedplus";
          providers.wl-copy.enable = true;
        };
      };
      plugins = {
        alpha = {
          enable = true;
          theme = "dashboard";
        };
        codecompanion = {
          enable = true;
          settings = {
            adapters = {
              ollama = {
                __raw = ''
                  function()
                    return require('codecompanion.adapters').extend('ollama', {
                      env = {
                          url = "http://127.0.0.1:11434",
                      },
                      schema = {
                        model = {
                          default = 'qwen2.5-coder:latest',
                          -- default = "llama3.1:8b-instruct-q8_0",
                        },
                        num_ctx = {
                          default = 32768,
                        },
                      },
                    })
                  end
                '';
              };
            };
            opts = {
              log_level = "TRACE";
              send_code = true;
              use_default_actions = true;
              use_default_prompts = true;
            };
            strategies = {
              agent = {
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
        ccc.enable = true;
        diffview = {
          enable = true;
        };
        hop.enable = true;
        leap.enable = true;

        neorg = {
          enable = true;
          telescopeIntegration.enable = true;
          settings = {
            load = {
              "core.concealer" = {
                config = {
                  icon_preset = "varied";
                };
              };
              "core.defaults" = {
                __empty = null;
              };
              "core.dirman" = {
                config = {
                  workspaces = {
                    notes = "~/Documents/Notes";
                  };
                };
              };
            };
          };
        };
        image = {
          enable = true;
          settings = {
            backend = "kitty";
            max_height = 12;
            max_height_window_percentage = {
              __raw = "math.huge";
            };
            max_width = 100;
            max_width_window_percentage = {
              __raw = "math.huge";
            };
            window_overlap_clear_enabled = true;
            window_overlap_clear_ft_ignore = [
              "cmp_menu"
              "cmp_docs"
            ];
          };
        };
        indent-o-matic.enable = true;
        precognition.enable = true;
        nvim-surround.enable = true;
        nvim-autopairs = {
          enable = true;
        };
        lsp = {
          enable = true;
          servers = {
            cssls.enable = true;
            gopls.enable = true;
            html.enable = true;
            lua_ls.enable = true;
            marksman.enable = true;
            nil_ls.enable = true;
            pyright.enable = true;
            rust_analyzer = {
              enable = true;
              installCargo = true;
              installRustc = true;
            };
            rls.enable = true;
            sqls.enable = true;
            zls.enable = true;
          };
          keymaps = {
            silent = true;
            diagnostic = {
              "<leader>k" = "goto_prev";
              "<leader>j" = "goto_next";
            };
            lspBuf = {
              gd = "definition";
              gD = "references";
              gt = "type_definition";
              gi = "implementation";
              K = "hover";
              re = "rename";
            };
          };
        };
        lsp-format = {
          enable = true;
        };
        lspkind = {
          enable = true;
          cmp = {
            enable = true;
            menu = {
              nvim_lsp = "[LSP]";
              nvim_lua = "[api]";
              path = "[path]";
              luasnip = "[snip]";
              buffer = "[buffer]";
              neorg = "[neorg]";
            };
          };
        };
        lualine = {
          enable = true;
        };
        luasnip = {
          enable = true;
        };
        cmp-omni.enable = true;
        cmp-dap.enable = true;
        cmp-nvim-lsp.enable = true;
        cmp-nvim-lsp-document-symbol.enable = true;
        cmp-nvim-lsp-signature-help.enable = true;
        cmp-dictionary.enable = true;
        cmp = {
          enable = true;
          autoEnableSources = true;
          settings = {
            snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
            mapping = {
              "<C-d>" = "cmp.mapping.scroll_docs(-4)";
              "<C-f>" = "cmp.mapping.scroll_docs(4)";
              "<C-Space>" = "cmp.mapping.complete()";
              "<C-e>" = "cmp.mapping.close()";
              "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
              "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
              "<CR>" = "cmp.mapping.confirm({ select = true })";
            };
            sources = [
              { name = "path"; }
              { name = "nvim_lsp"; }
              { name = "luasnip"; }
              { name = "buffer"; }
              { name = "neorg"; }
            ];
          };
        };
        oil = {
          enable = true;
        };
        telescope = {
          enable = true;
          extensions = {
            file-browser.enable = true;
            fzf-native.enable = true;
            media-files.enable = true;
          };
        };
        treesitter = {
          enable = true;
          folding = false;
          nixvimInjections = true;
          settings = {
            auto_install = true;
            indent.enable = true;
            highlight.enable = true;
            ignore_install = [
              "gdscript"
              "julia"
              "tcl"
            ];
            ensure_installed = [
              "bash"
              "c"
              "cpp"
              "css"
              "html"
              "javascript"
              "json"
              "lua"
              "markdown_inline"
              "python"
              "regex"
              "rust"
              "toml"
              "yaml"
              "nix"
            ];
          };
        };
        treesitter-refactor = {
          enable = true;
          highlightDefinitions = {
            enable = true;
          };
        };
        colorizer.enable = true;
        lspsaga.enable = true;
        indent-blankline.enable = true;
        rainbow-delimiters.enable = true;
        render-markdown.enable = true;
        neo-tree.enable = true;
        nix.enable = true;
        noice.enable = true;
        markdown-preview = {
          enable = true;
          settings = {
            theme = "dark";
          };
        };
        web-devicons.enable = true;
        which-key = {
          enable = true;
        };
      };
    };
  };
}
