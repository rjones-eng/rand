import XCTest
import SwiftTreeSitter
import TreeSitterNote

final class TreeSitterNoteTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_note())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Note grammar")
    }
}
