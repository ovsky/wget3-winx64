![gnu-wget3-icon](https://github.com/ovsky/wget3-winx64/blob/main/icon-256.png?raw=true)

# 🚀 GNU WGET3 for Windows (Modern Build)

## What is this?

A **high-performance Windows build** of GNU Wget3 — the legendary non-interactive file downloader reimagined for modern Windows systems. This fork combines the power of libwget with native Windows API integration for blazing-fast, resumable downloads over HTTP, HTTPS, and FTP protocols.

---

## ⚡ Key Features

- **🪟 Windows Native**: Modern build tools with full Windows API integration for latest OS compatibility
- **📊 HTTP/2 & TLS 1.3**: Lightning-fast downloads with cutting-edge protocol support
- **⏸️ Smart Resumption**: Automatically resume interrupted downloads without losing progress
- **🌐 Recursive Mirroring**: Download entire websites while preserving directory structure
- **🧵 Multi-threaded**: Parallel download streams for maximum performance
- **🔒 Enterprise Security**: HPKP, OCSP stapling, HSTS preload support
- **💾 Multiple Encodings**: Brotli, Zstandard, lzip, gzip, bzip2, XZ compression support
- **📱 Repository Integration**: WinGet, Microsoft Store, Flatpak, F-Droid support
- **🎯 RSS/Atom/Sitemap**: Automated feed-based downloads with robot.txt compliance

---

## 📦 Stack

- **Language**: C (54.1%) with Makefile build system
- **Architecture**: libwget library core + wget2 CLI utility
- **Build System**: Autotools + CMake
- **Security**: GnuTLS, libgnutls for SSL/TLS operations
- **Key Dependencies**: nghttp2 (HTTP/2), libpsl (cookie handling), libidn2 (IDN support)

---

## 🏗️ Project Structure

```
.
├── src/                    Main wget2 CLI implementation
├── libwget/                Core libwget C library (URI parsing, HTTP, parsing engines)
├── lib/                    GNU portability library (directory traversal, etc.)
├── examples/               Real-world usage examples (HTTP requests, CSS parsing, streaming)
├── fuzz/                   Fuzzer test suite (libFuzzer + AFL integration for OSS-Fuzz)
├── docs/                   Documentation and build requirements
├── tests/                  Test suite with valgrind regression testing
└── configure, Makefile     Autotools build system with Windows support
```

**How it works**: The libwget library provides the core downloading engine with parsers for HTML, CSS, XML, and RSS/Atom feeds. The wget2 CLI wraps this with Windows-friendly command-line interface and configuration file support. Build system uses autotools/CMake to compile for native Windows x64 binaries.

---

## 🚀 Getting Started

### Download Pre-Built Binary
```bash
# Download latest release from https://github.com/ovsky/wget3-winx64/releases
# Extract and add to PATH, then:
wget --version
```

### Build from Source (Windows)

**Requirements:**
- CMake or Visual Studio
- GCC for Windows (MinGW-w64) or MSVC
- OpenSSL development libraries

```bash
git clone https://github.com/ovsky/wget3-winx64.git
cd wget3-winx64
mkdir build && cd build
cmake ..
cmake --build . --config Release
```

### Common Usage

```bash
# Simple file download
wget https://example.com/file.zip

# Resume interrupted download
wget -c https://example.com/largefile.zip

# Recursive website mirror
wget --recursive https://example.com/

# Download with custom headers
wget --header "Authorization: Bearer token" https://example.com/api/data
```

---

## 🔧 Advanced Capabilities

### Multi-threaded Chunk Downloads
```bash
wget --chunk-size=1M https://example.com/largefile.zip
```

### Feed-Based Downloads
```bash
wget --force-rss -i feed.xml          # Download URLs from RSS feed
wget --force-atom -i feed.xml         # Download URLs from Atom feed
wget --force-sitemap -i sitemap.xml   # Download URLs from sitemap
```

### Security Features
```bash
wget --secure-protocol=PFS https://example.com    # Perfect Forward Secrecy only
wget --check-certificate=off https://example.com  # Disable cert checking (dev only)
```

---

## 📚 Try asking

- How does libwget's HTTP/2 multiplexing work with parallel connections?
- Can I use wget3 to mirror a website with authentication cookies?
- What compression algorithms does wget3 support for downloads?

---

## 🤝 Contributing

We welcome contributions! Here's how:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-thing`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to your fork (`git push origin feature/amazing-thing`)
5. **Open** a Pull Request

### Issues & Bug Reports
Found a bug? [Open an issue](https://github.com/ovsky/wget3-winx64/issues) with:
- Steps to reproduce
- Expected vs actual behavior
- Windows version and build output

### Fuzzing & Security
Help us fuzz with libFuzzer:
```bash
export CC=clang
export CFLAGS="-O1 -fno-omit-frame-pointer -fsanitize=address"
./configure --enable-fuzzing
make -j$(nproc)
```

---

## 📄 Licensing

- **wget2 & CLI**: GNU General Public License v3.0 or later (GPLv3+)
- **libwget library**: GNU Lesser General Public License v3.0 or later (LGPLv3+)

---

## 🙏 Acknowledgments

- [GNU Wget Project](https://www.gnu.org/software/wget/) - Original vision and implementation
- [GNU Wget2](https://gitlab.com/gnuwget/wget2) - Modern successor architecture
- libwget contributors and the broader GNU ecosystem

---

<div align="center">

**[Download](https://github.com/ovsky/wget3-winx64/releases)** | **[Report Issue](https://github.com/ovsky/wget3-winx64/issues)** | **[Documentation](https://gnuwget.gitlab.io/wget2/reference/)**

Made with ❤️ for Windows power users and developers

</div>