"""Post-render: use folder URLs (".../post/") instead of ".../post/index.html"
in the sitemap and RSS feed, so they match each page's canonical URL."""

import os
import re
from pathlib import Path

out = Path(os.environ.get("QUARTO_PROJECT_OUTPUT_DIR", "_site"))
site = "https://sparkcpark.github.io/"

for name in ("sitemap.xml", "blog.xml"):
    path = out / name
    if not path.exists():
        continue
    text = path.read_text(encoding="utf-8")
    # ".../index.html" -> ".../"; the root index.html becomes the bare site URL
    new = re.sub(r"(https://sparkcpark\.github\.io/(?:[^<\"\s]*/)?)index\.html", r"\1", text)
    if new != text:
        path.write_text(new, encoding="utf-8")
