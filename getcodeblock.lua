-- This is a sample of a non-standard writer for Pandok.
-- It selects <source /> blocks from the files of the mediawiki
-- form and compiles a script from it which can then be executed.
--
-- Invoke with: pandoc -t getcodeblock.lua -f mediawiki
--
-- Note:  you need not have lua installed on your system to use this
-- custom writer.  However, if you do have lua installed, you can
-- use it to test changes to the script.  'lua sample.lua' will
-- produce informative error messages if your code contains
-- syntax errors.

local pipe = pandoc.pipe
local stringify = (require "pandoc.utils").stringify

local meta = PANDOC_DOCUMENT.meta

-- Character escaping
local function escape(s, in_attribute)
  return s:gsub("[<>&\"']",
    function(x)
      if x == '<' then
        return '&lt;'
      elseif x == '>' then
        return '&gt;'
      elseif x == '&' then
        return '&amp;'
      elseif x == '"' then
        return '&quot;'
      elseif x == "'" then
        return '&#39;'
      else
        return x
      end
    end)
end

-- Blocksep is used to separate block elements.
function Blocksep()
   return ""
end

-- This function is called once for the whole document. Parameters:
-- body is a string, metadata is a table, variables is a table.
-- This gives you a fragment.  You could use the metadata table to
-- fill variables in a custom lua template.  Or, pass `--template=...`
-- to pandoc, and pandoc will add do the template processing as
-- usual.
function Doc(body, metadata, variables)
  local buffer = {}
  local function add(s)
     table.insert(buffer, s)
  end
  add(body)

  return table.concat(buffer,'')-- .. '\n'
end

-- The functions that follow render corresponding pandoc elements.
-- s is always a string, attr is always a table of attributes, and
-- items is always an array of strings (the items in a list).
-- Comments indicate the types of other variables.

function Str(s)
  return escape(s)
end

function Space()
  return " "
end

function SoftBreak()
  return ""
end

function LineBreak()
  return ""
end

function Emph(s)
  return ""
end

function Strong(s)
  return ""
end

function Subscript(s)
  return ""
end

function Superscript(s)
  return ""
end

function SmallCaps(s)
  return ""
end

function Strikeout(s)
  return ""
end

function Link(s, src, tit, attr)
   return ""
end

function Image(s, src, tit, attr)
   return ""
end

function Code(s, attr)
  return ""
end

function InlineMath(s)
  return ""
end

function DisplayMath(s)
  return ""
end

function SingleQuoted(s)
  return ""
end

function DoubleQuoted(s)
  return ""
end

function Note(s)
  return ""
end

function Span(s, attr)
  return ''
end

function RawInline(format, str)
  return ""
end

function Cite(s, cs)
  return ''
end

function Plain(s)
  return ''
end

function Para(s)
  return ''
end

-- lev is an integer, the header level.
function Header(lev, s, attr)
  return ''
end

function BlockQuote(s)
  return ''
end

function HorizontalRule()
  return ''
end

function LineBlock(ls)
     return ''
end

function CodeBlock(s, attr)
   return s .."\n"
end

function BulletList(items)
  return ''
end

function OrderedList(items)
  return ''
end

function DefinitionList(items)
  return ''
end

-- Convert pandoc alignment to something HTML can use.
-- align is AlignLeft, AlignRight, AlignCenter, or AlignDefault.
function html_align(align)
  if align == 'AlignLeft' then
    return 'left'
  elseif align == 'AlignRight' then
    return 'right'
  elseif align == 'AlignCenter' then
    return 'center'
  else
    return 'left'
  end
end

function CaptionedImage(src, tit, caption, attr)
   return ''
end

function Table(caption, aligns, widths, headers, rows)
  return ''
end

function RawBlock(format, str)
  return ''
end

function Div(s, attr)
  return ''
end

-- The following code will produce runtime warnings when you haven't defined
-- all of the functions you need for the custom writer, so it's useful
-- to include when you're working on a writer.
local meta = {}
meta.__index =
  function(_, key)
    io.stderr:write(string.format("WARNING: Undefined function '%s'\n",key))
    return function() return "" end
  end
setmetatable(_G, meta)
