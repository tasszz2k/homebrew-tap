class Agentlens < Formula
  desc "CLI tool to scan agent config and track usage costs across AI coding tools"
  homepage "https://github.com/tasszz2k/agent-lens"
  url "https://registry.npmjs.org/@tasszz2k/agentlens/-/agentlens-0.5.2.tgz"
  sha256 "6e59b1e20c4a766e99c277dc5d29d8105ca6afa23e0db39629da3a0f2724de3c"
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
