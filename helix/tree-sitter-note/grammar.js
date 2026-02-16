// grammar.js
module.exports = grammar({
  name: "note",

  rules: {
    source_file: ($) => seq(
      repeat($._line_with_nl),
      optional($.text_line) // last line may not end with '\n'
    ),

    _line_with_nl: ($) => choice(
      seq($.text_line, "\n"),
      "\n" // blank line
    ),

    // any non-empty line
    text_line: (_$) => token(/[^\n]+/),
  }
});
