cask "grammar-police" do
  version "0.0.7"
  sha256 "e3198d5aa9288b0bde6e1eb4ffe4226ec0436d39e59188b89458adb4dad031f5"

  url "https://github.com/tasszz2k/GrammarPolice/releases/download/v#{version}/GrammarPolice.zip"
  name "GrammarPolice"
  desc "AI-powered menubar app for grammar correction and translation on macOS"
  homepage "https://github.com/tasszz2k/GrammarPolice"

  depends_on macos: ">= :sonoma"

  app "GrammarPolice.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/GrammarPolice.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/GrammarPolice",
    "~/Library/Caches/com.tasszz2k.GrammarPolice",
    "~/Library/Preferences/com.tasszz2k.GrammarPolice.plist",
    "~/Library/Logs/GrammarPolice",
  ]

  caveats <<~EOS
    GrammarPolice requires the following permissions:
    - Accessibility: System Settings > Privacy & Security > Accessibility
    - Input Monitoring: System Settings > Privacy & Security > Input Monitoring

    Configure your OpenAI API key or local LLM in Preferences after installation.

    Note: This app is not code-signed. If you see "app is damaged" error, run:
      xattr -cr /Applications/GrammarPolice.app
  EOS
end
