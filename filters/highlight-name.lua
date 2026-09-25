-- Bold and underline "Park, C." in the rendered bibliography.
-- Quarto runs citeproc after all Lua filters, so this filter runs citeproc
-- itself, highlights the name, then drops the bibliography metadata so the
-- references are not processed a second time.

local function highlight(inlines)
  local out = pandoc.List()
  local i = 1
  while i <= #inlines do
    local a, sp, b = inlines[i], inlines[i + 1], inlines[i + 2]
    if a.t == "Str" and a.text == "Park,"
      and sp and sp.t == "Space"
      and b and b.t == "Str" and b.text:match("^C%.") then
      local rest = b.text:sub(3)
      out:insert(pandoc.Strong({ pandoc.Underline({ pandoc.Str("Park, C.") }) }))
      if rest ~= "" then out:insert(pandoc.Str(rest)) end
      i = i + 3
    else
      out:insert(a)
      i = i + 1
    end
  end
  return out
end

function Pandoc(doc)
  if not doc.meta.bibliography then return nil end
  doc = pandoc.utils.citeproc(doc)
  doc = doc:walk({
    Div = function(div)
      if div.classes:includes("csl-entry") then
        return div:walk({ Inlines = highlight })
      end
    end
  })
  doc.meta.bibliography = nil
  doc.meta.nocite = nil
  doc.meta.references = nil
  return doc
end
