local bufferline = require('bufferline')

bufferline.setup {
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true
            },
        }
    }
}
