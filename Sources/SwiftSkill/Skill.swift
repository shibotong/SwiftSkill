//
//  Skill.swift
//  SwiftSkill
//
//  Created by Shibo Tong on 20/2/2026.
//

public struct Skill: Codable {
    public let name: String
    public let description: String
    public let license: String?
    public let metadata: [String: String]?
    public let allowedTools: String?
    
    public init(name: String, description: String, license: String? = nil, metadata: [String : String]? = nil, allowedTools: String? = nil) {
        self.name = name
        self.description = description
        self.license = license
        self.metadata = metadata
        self.allowedTools = allowedTools
    }
}
