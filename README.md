# wrong.vim

My take on some things that Vim really shouldn't do.

Whilst structured as a plugin this is for illustrative purposes, I don't
expect anyone to actually install this.

## C-isms

By default many of Vim's settings default to values that are appropriate
for C. Set these via ftplugin as any other filetype would do.

## Format Options

Many filetypes set a buffer local value for `formatoptions`. The value
of this setting represents the user's preference for formatting
behaviour, filetypes have no business touching this.

## Spell motions

Don't require `spell` to be set for `]s`, `[s`, and `z=`. The user's
intent to move to or correct a spelling error is pretty clear, so
throwing an error if spell is not set does not make for a good user
experience.

## Explicitly map `<CR>` in the quickfix window

The behaviour of `<CR>` operates by calling `do_cmdline_cmd` in Vim's
actual source code to perform `:.cc` or `:.ll` depending if the list is
a quickfix list or location list respectively. This behaviour of `<CR>`
in the quickfix window is not covered in Vim's documentation at the time
of writing.

Should the user wish to map `<CR>` one may think an expression mapping
to determine if window is a quickfix window is sufficient. But the usage
of an expression mapping has limitations on what the resulting mapping
is allowed to perform (see `:help map-expression`).

As such create a buffer local mapping for the `qf` filetype to ensure
`<CR>` produces `<CR>` in the quickfix window, to "do the right thing"
for quickfix and location lists. Allowing for `<CR>` to be mapped by the
user without having to consider the context of the quickfix window and
potential limitations of an expression mapping.
