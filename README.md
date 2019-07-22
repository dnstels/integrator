# integrator

This is a sample of a non-standard writer for Pandok.
 It selects <source /> blocks from the files of the mediawiki form and compiles a script from it which can then be executed.

Invoke with: pandoc -t getcodeblock.lua -f mediawiki -M lang:lang_name
--
 Note:  you need not have lua installed on your system to use this
 custom writer.  However, if you do have lua installed, you can
 use it to test changes to the script.  'lua sample.lua' will
 produce informative error messages if your code contains
 syntax errors.
