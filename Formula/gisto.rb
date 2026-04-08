class Gisto < Formula
  desc "Cross-platform snippets management desktop application"
  homepage "https://github.com/Gisto/Gisto"
  version "2.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Gisto/Gisto/releases/download/v2.7.0/Gisto_aarch64.app.tar.gz"
      sha256 "5503a126654ef3c4559ac90c90326368b653d1b3f05bc7f56dfcca6fb0a1ed73"
    else
      url "https://github.com/Gisto/Gisto/releases/download/v2.7.0/Gisto_x64.app.tar.gz"
      sha256 "6cba1cb21deb1f3a0812e06ac3c106f648d8e2b48ef0dfdce958f11f15ebc187"
    end
  end

  def install
    puts "DEBUG: install method starting"
    puts "DEBUG: buildpath = #{buildpath}"
    puts "DEBUG: prefix = #{prefix}"
    system "ls", "-laR", buildpath.to_s
    
    if (buildpath/"Gisto.app").exist?
      puts "DEBUG: Found Gisto.app in buildpath"
      FileUtils.mv (buildpath/"Gisto.app"), prefix/"Gisto.app"
    elsif (buildpath/"Contents").exist?
      puts "DEBUG: Found Contents in buildpath"
      (prefix/"Gisto.app").mkpath
      FileUtils.mv (buildpath/"Contents"), prefix/"Gisto.app/Contents"
    else
      puts "DEBUG: Neither Gisto.app nor Contents found!"
      raise "Could not find Gisto.app or Contents"
    end
    puts "DEBUG: install completed"
  end

  def post_install
    puts "DEBUG: post_install starting"
    appdir = HOMEBREW_PREFIX/"Applications"
    puts "DEBUG: appdir = #{appdir}"
    puts "DEBUG: prefix = #{prefix}"
    puts "DEBUG: Checking for #{prefix}/Gisto.app"
    if (prefix/"Gisto.app").exist?
      puts "DEBUG: Gisto.app exists at prefix, copying to Applications"
      appdir.mkpath unless appdir.exist?
      cp_r "#{prefix}/Gisto.app", appdir
    else
      puts "DEBUG: ERROR - Gisto.app NOT found at prefix!"
    end
  end

  def caveats
    <<~EOS
      Gisto is not code-signed. On macOS, you may need to run:
        xattr -dr com.apple.quarantine /Applications/Gisto.app
    EOS
  end
end
