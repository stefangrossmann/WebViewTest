import SwiftUI

@main
struct WebViewTestApp: App {
    var body: some Scene {
        WindowGroup {
            WebView(request: URLRequest(url: URL(string: "https://www.go-steinberg-weiskirchen.de")!))
        }
    }
}
