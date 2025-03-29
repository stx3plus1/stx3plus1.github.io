rm -f Packages* Release*
apt-ftparchive packages ./pool > Packages
zstd -q -c19 Packages > Packages.zst
xz -c9 Packages > Packages.xz
bzip2 -c9 Packages > Packages.bz2

apt-ftparchive \
    -o APT::FTPArchive::Release::Origin="cdstx4" \
	-o APT::FTPArchive::Release::Label="cdstx4 repo" \
	-o APT::FTPArchive::Release::Suite="stable" \
	-o APT::FTPArchive::Release::Version="1.0" \
	-o APT::FTPArchive::Release::Codename="ios" \
	-o APT::FTPArchive::Release::Architectures="iphoneos-arm" \
	-o APT::FTPArchive::Release::Components="main" \
	-o APT::FTPArchive::Release::Description="silly stx repo!!" \
	release . > Release

gpg -abs -u 9573C0B0127C974BE033D88E8A84E63D7AEE0CD6 -o Release.gpg Release