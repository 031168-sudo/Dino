import UIKit
import WebKit

/// Вся игра — страница assets/index.html с 3D-движком three.js, показанная во весь экран.
/// Те же файлы, что и в Android-версии (app/src/main/assets).
final class GameViewController: UIViewController, WKUIDelegate {
    private var web: WKWebView!

    override func loadView() {
        let cfg = WKWebViewConfiguration()
        cfg.allowsInlineMediaPlayback = true
        cfg.mediaTypesRequiringUserActionForPlayback = []
        cfg.websiteDataStore = .default()            // сохранения: деньги, улучшения, открытые карты
        web = WKWebView(frame: .zero, configuration: cfg)
        web.isOpaque = false
        web.backgroundColor = UIColor(red: 0.125, green: 0.149, blue: 0.227, alpha: 1)
        web.scrollView.isScrollEnabled = false
        web.scrollView.bounces = false
        web.scrollView.contentInsetAdjustmentBehavior = .never
        web.uiDelegate = self
        view = web
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "assets") {
            web.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
    }

    override var prefersStatusBarHidden: Bool { true }
    override var prefersHomeIndicatorAutoHidden: Bool { true }
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge { .all }
}
