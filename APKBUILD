# Contributor: @ilgigante77
# Maintainer: @ilgigante77
pkgname=qotd-client
pkgver=1.0
pkgrel=0
pkgdesc="Client per QOTD (Quote of the Day)"
url="https://github.com/tanadelgigante/qotd-client"
arch="x86_64"
license="GPL-3.0"
depends=""
makedepends="alpine-sdk"
source="qotd-client"

# Aggiungi qui i checksum generati da abuild checksum
md5sums="SKIP"
sha1sums="SKIP"
sha256sums="SKIP"
sha512sums="SKIP"

build() {
    cd "$srcdir"
}

package() {
    install -Dm755 "$srcdir/qotd-client" "$pkgdir/usr/bin/qotd-client"
}

