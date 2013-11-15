homebrew-tap
============

Various Formulae for [Homebrew](http://brew.sh/), a Mac OS X package manager.

To use the Formulae in the `Formula` directory once homebrew is installed,

    brew tap igg/tap
    brew install <package>
Where `<package>` is one of the files in the `Formula` directory ending in `.rb`.
Don't use the `.rb` file extension in the package name.

Some of these formulae may conflict with a package in the main Homebrew collection, or with some other tap you're using.
In that case, specify this tap repository when installing the package:

    brew install igg/tap/ext2fuse
