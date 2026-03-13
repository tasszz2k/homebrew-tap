class Agentlens < Formula
  desc "CLI tool to scan agent config and track usage costs across AI coding tools"
  homepage "https://github.com/tasszz2k/agent-lens"
  url "https://registry.npmjs.org/@tasszz2k/agentlens/-/agentlens-0.5.10.tgz"
  sha256 "a3601638a5d33d69594dc7b0048d8bb963f28e2d1829ae8f3a722709aeaeba1d"
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
