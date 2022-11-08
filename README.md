# Hedgedoc-slides Extension For Quarto

This filter converts Pandoc slide shows to HedgeDoc slide shows:

- add meta information `title`, `subtitle`, `author`, `date` to title slide
- add horizontal rules before level 1 and 2 headings
- shorten horizontal rules to `---`

## Installing

```bash
quarto add sokotim/hedgedoc-slides
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

## Using

Add

``` yml
filters:
    - hedgedoc-slides
```

to `_quarto.yml` or your YAML metadata header. Then convert your markdown file, e.g.

```
quarto render example.qmd -o hedgedoc-slides.md -t markdown
```

## Example

Here is the source code for a minimal example: [example.qmd](example.qmd).
