//
//  Untitled.swift
//  SwiftSkill
//
//  Created by Shibo Tong on 20/2/2026.
//

import Markdown
import Yams
import Foundation

public protocol SkillParser {
    func parse(_ markdown: String) throws -> Skill
    func parse(url: URL) async throws -> Skill
}

public class MarkdownParser: SkillParser {
    
    private let decoder = YAMLDecoder()
    
    public func parse(url: URL) async throws -> Skill {
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let string = String(data: data, encoding: .utf8) else {
            throw SwiftSkillError.invalidInput
        }
        return try parse(string)
    }
    
    public func parse(_ markdown: String) throws -> Skill {
        let split = markdown.split(separator: "---", maxSplits: 1, omittingEmptySubsequences: true)
        print(split)
        let yamlText = String(markdown.split(separator: "---", maxSplits: 1, omittingEmptySubsequences: true).first ?? "")
        print(yamlText)
        let skill = try decoder.decode(Skill.self, from: yamlText)
        return skill
    }
}
