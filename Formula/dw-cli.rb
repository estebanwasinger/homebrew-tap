class DwCli < Formula
  desc "Rust-native DataWeave CLI"
  homepage "https://github.com/estebanwasinger/dataweave-py"
  url "https://github.com/estebanwasinger/dataweave-py/releases/download/1.0.2/dw-cli-1.0.2-source.tar.gz"
  sha256 "e26351e7c94a194fc64ffa9908dee76bbb9ed754418a8026bc073dad51b62eed"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/dwpy-cli")
  end

  test do
    output = shell_output("#{bin}/dw run \"1 to 1\"")
    assert_match "[", output
    assert_match "1", output
    assert_match "]", output
  end
end
