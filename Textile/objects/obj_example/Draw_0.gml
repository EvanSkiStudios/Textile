draw_set_color(c_white);

if (os_type == os_windows)
{
    draw_text(0, 0, string_hash_to_newline(@"#* press <enter> to copy notepad.exe to your sandbox directory.
        #* press <backspace> to delete notepad.exe from your sandbox directory.
        #* press <space> to move notepad.exe to a subfolder in your sandbox.
        #* you can manage files inside and outside the sandbox directory."));
}

if (os_type == os_macosx)
{
    draw_text(0, 0, string_hash_to_newline(@"#* press <enter> to copy TextEdit.app to your sandbox directory.
        #* press <backspace> to delete TextEdit.app from your sandbox directory.
        #* press <space> to move TextEdit.app to a subfolder in your sandbox.
        #* you can manage files inside and outside the sandbox directory."));
}

if (os_type == os_linux)
{
    draw_text(0, 0, string_hash_to_newline(@"#* press <enter> to copy gedit to your sandbox directory.
        #* press <backspace> to delete gedit from your sandbox directory.
        #* press <space> to move gedit to a subfolder in your sandbox.
        #* you can manage files inside and outside the sandbox directory."));
}

