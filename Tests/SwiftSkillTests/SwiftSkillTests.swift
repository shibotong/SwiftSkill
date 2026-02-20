import Testing
import Foundation
@testable import SwiftSkill

let skillText = """
    ---
    name: pdf-processing
    description: Extract text and tables from PDF files, fill forms, merge documents.
    license: Apache-2.0
    metadata:
      author: example-org
      version: "1.0"
    ---
    """

@Test
func parseSkill() throws {
    let parser = MarkdownParser()
    let skill = try parser.parse(skillText)
    
    #expect(skill.name == "pdf-processing")
    #expect(skill.description == "Extract text and tables from PDF files, fill forms, merge documents.")
    #expect(skill.license == "Apache-2.0")
    #expect(skill.metadata?.count == 2)
    let metadataAuthor = try #require(skill.metadata?["author"])
    let metadataVersion = try #require(skill.metadata?["version"])
    #expect(metadataAuthor == "example-org")
    #expect(metadataVersion == "1.0")
}

@Test
func parseRemoteSkill() async throws {
    let parser = MarkdownParser()
    let url = URL(string: "https://raw.githubusercontent.com/anthropics/skills/refs/heads/main/skills/algorithmic-art/SKILL.md")
    
    let skill = try await parser.parse(url: url!)
    
    #expect(skill.name == "algorithmic-art")
    #expect(skill.description == "Creating algorithmic art using p5.js with seeded randomness and interactive parameter exploration. Use this when users request creating art using code, generative art, algorithmic art, flow fields, or particle systems. Create original algorithmic art rather than copying existing artists' work to avoid copyright violations.")
    #expect(skill.license == "Complete terms in LICENSE.txt")
    #expect(skill.metadata == nil)
}
