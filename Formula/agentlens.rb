class Agentlens < Formula
  desc "CLI tool to scan agent config and track usage costs across AI coding tools"
  homepage "https://github.com/tasszz2k/agent-lens"
  url "https://registry.npmjs.org/@tasszz2k/agentlens/-/agentlens-0.5.9.tgz"
  sha256 "5b521eb93a9cbda61c3c27c233b5ff9a08406e7ee62255f36ccfed4b387c504b"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentlens --version")
  end
end
