get_string_async("The value of 'working_directory' can be seen in the textbox below: ", working_directory);
get_string_async("The value of 'program_directory' can be seen in the textbox below: ", program_directory);
get_string_async("The value of 'program_filename' can be seen in the textbox below: ", program_filename);
get_string_async("The value of 'program_pathname' can be seen in the textbox below: ", program_pathname);
get_string_async("The value of 'temp_directory' can be seen in the textbox below: ", temp_directory);

if (!directory_exists(game_save_id))
    directory_create(game_save_id);

if (os_type == os_windows)
    get_string_async("enter the following text into command prompt to see your sandbox directory:", "start \"\" \"" + game_save_id + "\"");

if (os_type == os_macosx)
    get_string_async("enter the following text into the terminal to see your sandbox directory:", "open \"" + game_save_id + "\"");

if (os_type == os_linux)
    get_string_async("enter the following text into the terminal to see your sandbox directory:", "xdg-open \"" + game_save_id + "\"");

