{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    #colorschemes.gruvbox = {
    #        enable = true;
    #        settings = {
    #                transparent_mode = true;
    #        };
    #};
    defaultEditor = true;
    vimdiffAlias = true;
    enableMan = true;
    vimAlias = true;
    clipboard.register = "unnamedplus";
    globals.mapleader = " ";
    opts = {
      relativenumber = true;
      tabstop = 4;
      conceallevel = 2;
      softtabstop = 4;
      expandtab = true;
      smartindent = true;
      swapfile = false;
      backup = false;
      shiftwidth = 4;
      undofile = true;
      hlsearch = false;
      incsearch = true;
      termguicolors = true;
      scrolloff = 8;
      signcolumn = "yes";
      colorcolumn = "80";
      foldmethod = "syntax";
      foldlevelstart = 99;
      spell = true;
      nu = true;
      completeopt = "menuone,noselect";
      updatetime = 250;
      timeoutlen = 300;
      smartcase = true;
      ignorecase = true;
      breakindent = true;
    };
    plugins = {
      dap.enable = true;
      lazygit.enable = true;
      vim-css-color.enable = true;
      presence-nvim = {
        enable = true;
        enableLineNumber = true;
        buttons = [
          {
            label = "github";
            url = "https://github.com/quantinium03";
          }
        ];
      };
      obsidian = {
        enable = true;
        settings = {
          completion = {
            min_chars = 2;
            nvim_cmp = true;
          };
          workspaces = [
            {
              name = "work";
              path = "~/personal/obsidian/work";
            }
            {
              name = "personal";
              path = "~/personal/obsidian/quantinium";
            }
          ];
        };
      };
      nvim-jdtls = {
        enable = true;
        data = "/home/quantinium/.cache/jdtls/config";
        configuration = "/home/quantinium/.cache/jdtls/workspace";
      };
      indent-blankline.enable = true;
      harpoon = {
        enable = true;
        enableTelescope = true;
      };
      wakatime.enable = true;
      lualine.enable = true;
      web-devicons.enable = true;
      which-key.enable = true;
      undotree.enable = true;
      trouble.enable = true;
      todo-comments.enable = true;
      fidget.enable = true;
      gitsigns.enable = true;
      blink-cmp.settings = {
        sources.providers = {
          lazydev = {
            name = "LazyDev";
            module = "lazydev.integrations.blink";
            score_offset = 100;
          };
        };
      };
      lsp = {
        enable = true;
        servers = {
          astro.enable = true;
          marksman.enable = true;
          pyright.enable = true;
          tailwindcss.enable = true;
          ts_ls.enable = true;
          eslint.enable = true;
          lua_ls.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          nixd = {
            enable = true;
            settings.formatting.command = [ "nixpkgs-fmt" ];
          };
          gopls.enable = true;
          html.enable = true;
          cssls.enable = true;
          clangd.enable = true;
        };
      };
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp_luasnip.enable = true;
      friendly-snippets.enable = true;
      lspkind.enable = true;
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "luasnip"; }
        ];
      };
      comment.enable = true;
      ts-context-commentstring.enable = true;
      telescope = {
        extensions.fzf-native.enable = true;
        extensions.file-browser.enable = true;
        enable = true;
        keymaps = {
          "<leader>fr" = {
            action = "oldfiles";
            options = {
              desc = "[F]uzzy find [R]ecent files";
            };
          };
          "<leader>gf" = {
            action = "git_files";
            options = {
              desc = "[S]earch [G]it [F]iles";
            };
          };
          "<leader>sf" = {
            action = "find_files";
            options = {
              desc = "[S]earch [F]iles";
            };
          };
          "<leader>sh" = {
            action = "help_tags";
            options = {
              desc = "[S]earch [H]elp";
            };
          };
          "<leader>sw" = {
            action = "grep_string";
            options = {
              desc = "[S]earch current [W]ord";
            };
          };
          "<leader>sg" = {
            action = "live_grep";
            options = {
              desc = "[S]earch by [G]rep";
            };
          };
          "<leader>sd" = {
            action = "diagnostics";
            options = {
              desc = "[S]earch [D]iagnostics";
            };
          };
          "<leader>sr" = {
            action = "diagnostics";
            options = {
              desc = "[S]earch [R]esume";
            };
          };
        };
      };
      treesitter = {
        enable = true;
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          bash
          json
          lua
          make
          markdown
          nix
          regex
          toml
          vim
          vimdoc
          xml
          yaml
          c
          query
          elixir
          heex
          javascript
          fish
        ];
      };

      luasnip.enable = true;

    };
    extraPlugins = with pkgs.vimPlugins; [
      lazydev-nvim
      nvim-jdtls
      vim-mustache-handlebars
      (pkgs.vimUtils.buildVimPlugin {
        name = "catppuccin.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "nvim";
          rev = "main";
          sha256 = "sha256-4h/fzFY8JR9r+QnoiWEqgQKPMuu8i9HTC4v0Jp7iuUo=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "typr";
        src = pkgs.fetchFromGitHub {
          owner = "nvzone";
          repo = "typr";
          rev = "main";
          sha256 = "sha256-CHZ83Ctkv7mVOzVL4iSS3SgVOxTdMwecjCaomwPpsK4=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "volt";
        src = pkgs.fetchFromGitHub {
          owner = "nvzone";
          repo = "volt";
          rev = "main";
          sha256 = "sha256-uhNPJfqq28iAGSBEDobQgNuLNThwkMqpXgRO27eTtVI=";
        };
      })
    ];
    keymaps = [
      {
        action = "<cmd>Ex<CR>";
        key = "<leader>pv";
        options = {
          silent = true;
        };
      }
      {
        action = "<cmd>UndotreeToggle<CR>";
        key = "<leader>u";
        options = {
          silent = true;
        };
      }
      {
        action = "<cmd>LazyGit<CR>";
        key = "<leader>lg";
        options = {
          silent = true;
        };
      }
    ];
    extraConfigLua = ''
      local get_errors = function(bufnr) return vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR }) end
      local errors = get_errors(0)

      vim.api.nvim_create_autocmd('DiagnosticChanged', {
        callback = function()
          errors = get_errors(0)
        end
      })

      text = {
        editing = function(opts)
          return string.format('Editing %s - %s errors', opts.filename, #errors)
        end
      }

      local config = {
          cmd = {'/home/quantinium/.nix-profile/bin/jdtls'},
          root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
      }
      require('jdtls').start_or_attach(config)

      require('catppuccin').setup({
          transparent_background = true,
      })
      vim.cmd('colorscheme catppuccin')

      local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
      vim.api.nvim_create_autocmd('TextYankPost', {
        callback = function()
          vim.highlight.on_yank()
        end,
        group = highlight_group,
        pattern = '*',
      })

      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          path_display = { "truncate " },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next,     -- move to next result
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
    
      vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)

      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        snippet = { -- configure how nvim-cmp interacts with snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
          ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
          ["<C-e>"] = cmp.mapping.abort(), -- close completion window
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
        -- sources for autocompletion
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- snippets
          { name = "buffer" }, -- text within current buffer
          { name = "path" }, -- file system paths
        }),
        -- configure lspkind for vs-code like pictograms in completion menu
        formatting = {
          format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
      })
 

      vim.keymap.set("x", "<leader>p", [["_dP]])
      vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
      vim.keymap.set("n", "<leader>Y", [["+Y]])
      vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
      vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
      vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
      vim.api.nvim_set_keymap('x', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
      vim.api.nvim_set_keymap('x', 'K', ":m '>-2<CR>gv=gv", { noremap = true, silent = true })
      vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
      vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
    '';
  };
}
