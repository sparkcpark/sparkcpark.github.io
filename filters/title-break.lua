-- Break a post's title onto two lines after its colon ("Main: Subtitle"),
-- only in the page heading. The plain title is kept for the browser tab,
-- social cards, the blog list, and the RSS feed.

function Meta(meta)
  if not meta.title then return nil end
  local plain = pandoc.utils.stringify(meta.title)
  if not plain:find(": ") then return nil end

  if not meta.pagetitle then meta.pagetitle = plain end

  local inlines = pandoc.Inlines(meta.title)
  local out = pandoc.Inlines({})
  local broken = false
  for i, el in ipairs(inlines) do
    if not broken and el.t == "Space" and i > 1
      and inlines[i - 1].t == "Str" and inlines[i - 1].text:match(":$") then
      out:insert(pandoc.LineBreak())
      broken = true
    else
      out:insert(el)
    end
  end
  meta.title = out
  return meta
end
