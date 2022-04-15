if (os_type == os_windows)
{
    if (file_exists(game_save_id + "тест/notepad.exe"))
    {  
        file_rename(game_save_id + "тест/notepad.exe", game_save_id + "тест/moved/notepad.exe");
    }
    else
    {
        show_message("file not found! make sure you have copied 'notepad.exe' to your sandbox first.")
    }
}

if (os_type == os_macosx)
{
    if (directory_exists(game_save_id + "тест/TextEdit.app"))
    {
        directory_rename(game_save_id + "тест/TextEdit.app", game_save_id + "тест/moved/TextEdit.app");
    }
    else
    {
        show_message("file not found! make sure you have copied 'TextEdit.app' to your sandbox first.")
    }
}

if (os_type == os_linux)
{
    if (file_exists(game_save_id + "тест/gedit"))
    {       
        file_rename(game_save_id + "тест/gedit", game_save_id + "тест/moved/gedit");
    }
    else
    {
        show_message("file not found! make sure you have copied 'gedit' to your sandbox first.")
    }
}

print_directory_contents(game_save_id, "*.*", true, true);