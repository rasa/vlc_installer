# vlc_installer [![Flattr this][flatter_png]][flatter]

Downloads and install the VLC media player available
at http://www.videolan.org/.

vlc_installer looks in the directory where vlc_installer.exe is for
any files it needs before attempting to download them. If it does download a
file, it will attempt to save a copy of the file in this same directory.

vlc_installer adds the installation directory to your PATH environment variable.
On 32-bit systems, this directory is usually `C:\Program Files\VideoLAN\VLC`.
On 64-bit systems, this directory is usually `C:\Program Files(x86)\VideoLAN\VLC`.

## Usage

````
vlc_installer [options]

Options:
/S         Install the application silently with the default options selected
/D=path    Install into the directory 'path' (default is
           %ProgramFiles(x86)%\VideoLAN)
/INSTYPE n Where n is a number between 1 and 2:
            1: All - VLC 32-bit - All Windows versions
            2: All - VLC 64-bit (Experimental) - All Windows 64-bit versions
````

## Contributing

To contribute to this project, please see [CONTRIBUTING.md](CONTRIBUTING.md).

## Bugs

To view existing bugs, or report a new bug, please see [issues](../../issues).

## Changelog

To view the version history for this project, please see [CHANGELOG.md](CHANGELOG.md).

## License

This project is [MIT licensed](LICENSE).

## Contact

This project was created and is maintained by [Ross Smith II][] [![endorse][endorse_png]][endorse]

Feedback, suggestions, and enhancements are welcome.

[Ross Smith II]: mailto:ross@smithii.com "ross@smithii.com"
[flatter]: https://flattr.com/submit/auto?user_id=rasa&url=https%3A%2F%2Fgithub.com%2Frasa%2Fvlc_installer
[flatter_png]: http://button.flattr.com/flattr-badge-large.png "Flattr this"
[endorse]: https://coderwall.com/rasa
[endorse_png]: https://api.coderwall.com/rasa/endorsecount.png "endorse"

