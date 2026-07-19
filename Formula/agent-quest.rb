class AgentQuest < Formula
  desc "Gamify your AI coding agent usage into an RPG"
  homepage "https://github.com/Hin-Nattapat/agent-quest"
  url "https://github.com/Hin-Nattapat/agent-quest/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "9de84d69cceba97ee58202896578c72556b6474136178c3f95b2266b5dfa9316"
  license "MIT"

  depends_on "bun"
  depends_on "jq"

  def install
    libexec.install "adapters", "core", "tools", "hud", "scripts", "config"
    (bin/"aq").write <<~SH
      #!/bin/bash
      exec bun "#{libexec}/tools/aq.ts" "$@"
    SH
  end

  def caveats
    <<~EOS
      Run `aq setup` to deploy the engine to ~/.agentrpg and wire your coding agent(s).
      Re-run `aq setup` after `brew upgrade` to refresh the deployed engine.
    EOS
  end

  test do
    assert_match "Usage:  aq", shell_output("#{bin}/aq --help")
  end
end
