class Agentlens < Formula
  desc "CLI tool to scan agent config and track usage costs across AI coding tools"
  homepage "https://github.com/tasszz2k/agent-lens"
  url "https://registry.npmjs.org/@tasszz2k/agentlens/-/agentlens-0.5.0.tgz"
  sha256 "ebdc7ee8b33d6ce29f4b2b250938a0c0c2359cb5152de8152e5175e5f1b5306e"
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
