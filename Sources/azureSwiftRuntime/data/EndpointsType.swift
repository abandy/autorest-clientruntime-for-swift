import Foundation
public struct EndpointsType : EndpointsTypeProtocol {
    public var blob: String?
    public var queue: String?
    public var table: String?
    public var file: String?

    enum CodingKeys: String, CodingKey {
        case blob = "blob"
        case queue = "queue"
        case table = "table"
        case file = "file"
    }

  public init() {
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    blob = try container.decode(String?.self, forKey: .blob)
    queue = try container.decode(String?.self, forKey: .queue)
    table = try container.decode(String?.self, forKey: .table)
    file = try container.decode(String?.self, forKey: .file)
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(blob, forKey: .blob)
    try container.encode(queue, forKey: .queue)
    try container.encode(table, forKey: .table)
    try container.encode(file, forKey: .file)
  }
}