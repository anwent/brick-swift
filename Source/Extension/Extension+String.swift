//
// Created by zh on 2021/6/28.
//

public extension String {

    /// 返回只包含十进制数字的字符串 eg: "a1b2c3" -> "123"
    var brickFilterDecimalDigits: String {
        let digitSet = CharacterSet.decimalDigits
        return String(self.unicodeScalars.filter { digitSet.contains($0) })
    }

}