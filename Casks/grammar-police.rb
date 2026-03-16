cask "grammar-police" do
  version "0.0.5"
  sha256 "64559adbf76b0e96013e1d370dbad4ce2fc16d0cbe444f30ddd9cc94ae50e910"

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
