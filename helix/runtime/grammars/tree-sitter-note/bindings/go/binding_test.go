package tree_sitter_note_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_note "github.com/tree-sitter/tree-sitter-note/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_note.Language())
	if language == nil {
		t.Errorf("Error loading Note grammar")
	}
}
