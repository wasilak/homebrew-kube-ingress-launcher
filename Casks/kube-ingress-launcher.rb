cask "kube-ingress-launcher" do
  version "0.2.0"
  
  url "https://github.com/wasilak/kube-ingress-launcher/releases/download/v#{version}/kube-ingress-launcher-#{version}-universal-apple-darwin.dmg"
  sha256 "d08cb6d7fae4d0d1a40f1c65fc6ca76999ca6497136f1b39c74dd204871ab6bb"
  
  name "Kube Ingress Launcher"
  desc "Desktop launcher for quickly searching and opening Kubernetes ingress resources"
  homepage "https://github.com/wasilak/kube-ingress-launcher"
  
  livecheck do
    url :url
    strategy :github_latest
  end
  
  app "Kube Ingress Launcher.app"
  
  zap trash: [
    "~/Library/Application Support/foo.otteryak.kube-ingress-launcher",
    "~/Library/Preferences/foo.otteryak.kube-ingress-launcher.plist",
    "~/Library/Saved Application State/foo.otteryak.kube-ingress-launcher.savedState",
    "~/Library/Caches/foo.otteryak.kube-ingress-launcher",
  ]
  
  caveats <<~EOS
    Kube Ingress Launcher is an unsigned application. You'll need to bypass macOS Gatekeeper:
    
    1. Try to open the application from /Applications
    2. Go to System Settings > Privacy & Security
    3. Click "Open Anyway" in the Security section
    4. Confirm by clicking "Open"
    
    For detailed instructions, see:
    https://github.com/wasilak/kube-ingress-launcher/blob/main/docs/GATEKEEPER_BYPASS.md
    
    The application requires Accessibility permission for the global keyboard shortcut (Cmd+Shift+K).
  EOS
end
