//
// Created by zh on 2021/6/28.
//

public enum BrickNumberFormat {
    case fourDigits
    case CN
    case US
    case custom(fmt: String)
}

extension BrickNumberFormat {
    var fmt: String {
        switch self {
        case .CN: return "XX XXX XXXX XXXX"
        case .US: return "X XXX XXX XXXX"
        case .fourDigits: return "X X X X"
        case .custom(let fmt): return fmt
        }
    }
}

public extension String {

    /// 格式化数字类型字符串 eg: "8613888888888" -> "86 138 8888 8888"
    func brickFormatNumberString(_ numberFmt: BrickNumberFormat) -> String {
        let numbers = self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        for ch in numberFmt.fmt where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }

}