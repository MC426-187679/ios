import SwiftUI

extension Font {
    static var appTitle: Font {
        .title.bold()
    }

    static var appHeadline: Font {
        .title2.bold()
    }

    static var appBody: Font {
        .body
    }

    static var bodyPointSize: CGFloat {
        UIFont.preferredFont(forTextStyle: .body).pointSize
    }
}
