first_slide = true

function Pandoc(doc)
  local blocks = doc.blocks
  for _, key in pairs({ "date", "author", "subtitle" }) do
    if doc.meta[key] then
      table.insert(blocks, 1, pandoc.utils.stringify(doc.meta[key]))
    end
  end
  if doc.meta["title"] then
    table.insert(blocks, 1, pandoc.Header(1, pandoc.utils.stringify(doc.meta["title"])))
  end
  local meta = {}
  meta["type"] = "slide"
  return pandoc.Pandoc(blocks, meta)
end

function HorizontalRule(el)
  return pandoc.RawInline("markdown", "---")
end

function Header(el)
  if el.level < 3 then
    if not first_slide then
      return { pandoc.HorizontalRule(), el }
    end
    first_slide = false
  end
end

return { { Pandoc = Pandoc }, { Header = Header }, { HorizontalRule = HorizontalRule } }
