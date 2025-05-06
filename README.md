This .vimrc file is designed to enhance your C++ development experience by providing convenient settings for both editing and creating C++ class files.
Features:

    Line Numbering:

        Displays line numbers by default (set number).

        In insert mode, shows absolute line numbers (set norelativenumber number).

    Status Line:

        Customizes the status line to show the file name, modified status, and additional information like ASCII values, hex values, line, column, and percentage.

    Cursor Line/Column Highlighting:

        Highlights the line and column of the cursor for better visibility.

    Tab and Indentation Settings:

        Uses real tab characters instead of spaces (set noexpandtab).

        Sets the tab stop, shift width, and soft tab stop to 4 spaces.

        Enables smart indentation for consistent formatting across lines.

    C++ Class Generator:

        Provides a function to quickly generate C++ header and source files for a class, including the constructor, copy constructor, assignment operator, and destructor.

How to Use:

    Place this .vimrc file in your home directory (~/.vimrc).

    Open a C++ file in Vim, and the configuration will be applied automatically.

    Use the Class(ClassName) function in Vim to generate a header and source file template for a new C++ class.
