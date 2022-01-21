vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_compiler_latexmk_engines = {
    _ = '-xelatex'
}
vim.g.tex_comment_nospell = 1
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
vim.g.vimtex_view_general_options_latexmk = '--unique'
-- Run setup and specify two custom build engines
require('texmagic').setup{
    engines = {
        pdflatex = {    -- This has the same name as a default engine but would
                        -- be preferred over the same-name default if defined
            executable = "xelatex",
            args = {
                "-pdflatex",
                "-interaction=nonstopmode",
                "-synctex=1",
                "-outdir=.build",
                "-pv",
                "%f"
            },
            isContinuous = false
        },
        lualatex = {    -- This is *not* one of the defaults, but it can be
                        -- called via magic comment if defined here
            executable = "xelatex",
            args = {
                "-pdflua",
                "-interaction=nonstopmode",
                "-synctex=1",
                "-pv",
                "%f"
            },
            isContinuous = false
        }
    }
}

-- use { 
--     'lervag/vimtex',
--     opt = true,
--     config = function ()
--         vim.g.vimtex_view_general_viewer = 'okular'
--         vim.g.vimtex_compiler_latexmk_engines = {
--             _ = '-xelatex'
--         }
--         vim.g.tex_comment_nospell = 1
--         vim.g.vimtex_compiler_progname = 'nvr'
--         vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
--         vim.g.vimtex_view_general_options_latexmk = '--unique'
--     end,
--     ft = 'tex'
-- }
--
