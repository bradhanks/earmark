defmodule Acceptance.Html.IndentedCodeBlocksTest do
  use Support.AcceptanceTestCase

  describe "Indented code blocks" do
    test "simple (but easy?)" do
      markdown = "    a simple\n      indented code block\n"
      html = "<pre><code>a simple\n  indented code block</code></pre>\n"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

    test "code is soo verbatim" do
      markdown = "    <a/>\n    *hi*\n\n    - one\n"
      html = "<pre><code>&lt;a/&gt;\n*hi*\n\n- one</code></pre>\n"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

    test "chunky bacon (RIP: Why)" do
      markdown = "    chunk1\n\n    chunk2\n  \n \n \n    chunk3\n"
      html = "<pre><code>chunk1\n\nchunk2\n\n\n\nchunk3</code></pre>\n"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

    test "not the alpha, not the omega (gamma maybe?)" do
      markdown = "\n    \n    foo\n    \n\n"
      html = "<pre><code>foo</code></pre>\n"
      messages = []
      assert as_html(markdown) == {:ok, html, messages}
    end
  end

  describe "Indented Code Blocks with IAL" do
    test "just an example" do
      markdown = "\n    wunderbar\n{: lang=\"de:at\"}\n"
      html = "<pre lang=\"de:at\"><code>wunderbar</code></pre>\n"
      messages = []
      assert as_html(markdown) == {:ok, html, messages}
    end
  end
end

# SPDX-License-Identifier: Apache-2.0
