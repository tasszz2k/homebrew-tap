class Agentlens < Formula
  desc "CLI tool to scan agent config and track usage costs across AI coding tools"
  homepage "https://github.com/tasszz2k/agent-lens"
  url "https://registry.npmjs.org/@tasszz2k/agentlens/-/agentlens-0.5.3.tgz"
  sha256 "b664b86d95686e5a80b67ceaaf66b9c8136b00cd6b7a63e20b99b744830aa73e"
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
