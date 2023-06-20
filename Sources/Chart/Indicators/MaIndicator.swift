import UIKit

public class MaIndicator: ChartIndicator, Equatable {
    let id: String
    let period: Int
    let type: MaType
    let color: Color
    let width: CGFloat

    private enum CodingKeys : String, CodingKey {
        case id
        case period
        case type
        case color
        case width
    }

    public init(id: String, period: Int, type: MaType, onChart: Bool = true, color: UIColor = .blue, width: CGFloat = 1) {
        self.id = id
        self.period = period
        self.type = type
        self.color = Color(color)
        self.width = width

        super.init(onChart: onChart)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        period = try container.decode(Int.self, forKey: .period)
        type = try container.decode(MaType.self, forKey: .type)
        color = try container.decode(Color.self, forKey: .color)
        width = try container.decode(CGFloat.self, forKey: .width)
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(period, forKey: .period)
        try container.encode(type, forKey: .type)
        try container.encode(color, forKey: .color)
        try container.encode(width, forKey: .width)
        try super.encode(to: encoder)
    }

    public static func ==(lhs: MaIndicator, rhs: MaIndicator) -> Bool {
        lhs.id == rhs.id &&
                lhs.period == rhs.period &&
                lhs.type == rhs.type &&
                lhs.color.hex == rhs.color.hex &&
                lhs.width == rhs.width
    }

}

extension MaIndicator {

    public enum MaType: String, Codable {
        case ema
        case sma
        case wma
    }

}
