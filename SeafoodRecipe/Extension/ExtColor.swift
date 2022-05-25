import UIKit

extension UIColor {
    convenience init?(hexaRGB: String, alpha: CGFloat = 1) {
        var chars = Array(hexaRGB.hasPrefix("#") ? hexaRGB.dropFirst() : hexaRGB[...])
        switch chars.count {
        case 3: chars = chars.flatMap { [$0, $0] }
        case 6: break
        default: return nil
        }
        self.init(red: .init(strtoul(String(chars[0...1]), nil, 16)) / 255,
                green: .init(strtoul(String(chars[2...3]), nil, 16)) / 255,
                 blue: .init(strtoul(String(chars[4...5]), nil, 16)) / 255,
                alpha: alpha)
    }

    convenience init?(hexaRGBA: String) {
        var chars = Array(hexaRGBA.hasPrefix("#") ? hexaRGBA.dropFirst() : hexaRGBA[...])
        switch chars.count {
        case 3: chars = chars.flatMap { [$0, $0] }; fallthrough
        case 6: chars.append(contentsOf: ["F","F"])
        case 8: break
        default: return nil
        }
        self.init(red: .init(strtoul(String(chars[0...1]), nil, 16)) / 255,
                green: .init(strtoul(String(chars[2...3]), nil, 16)) / 255,
                 blue: .init(strtoul(String(chars[4...5]), nil, 16)) / 255,
                alpha: .init(strtoul(String(chars[6...7]), nil, 16)) / 255)
    }

    convenience init?(hexaARGB: String) {
        var chars = Array(hexaARGB.hasPrefix("#") ? hexaARGB.dropFirst() : hexaARGB[...])
        switch chars.count {
        case 3: chars = chars.flatMap { [$0, $0] }; fallthrough
        case 6: chars.append(contentsOf: ["F","F"])
        case 8: break
        default: return nil
        }
        self.init(red: .init(strtoul(String(chars[2...3]), nil, 16)) / 255,
                green: .init(strtoul(String(chars[4...5]), nil, 16)) / 255,
                 blue: .init(strtoul(String(chars[6...7]), nil, 16)) / 255,
                alpha: .init(strtoul(String(chars[0...1]), nil, 16)) / 255)
    }
    
    class func rgba(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ alpha:CGFloat? = nil) -> UIColor{
        if let alp = alpha{
            return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alp)
        }else{
            return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
        }
    }
    
    class func color(r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat? = nil) -> UIColor{
        if let alp = alpha{
            return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alp)
        }else{
            return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
        }
    }
    
    // MARK: - Chart Colors
    
    static func btnChartColors() -> [UIColor] {
        return [
            UIColor.init(hexaRGB: "6219CF") ?? .blue,
            UIColor.init(hexaRGB: "FDC908") ?? .blue,
            UIColor.init(hexaRGB: "597EFC") ?? .blue,
            UIColor.init(hexaRGB: "FE9836") ?? .blue,
            UIColor.init(hexaRGB: "FF5E5E") ?? .blue
       ]
    }
}
