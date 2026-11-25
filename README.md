# ParrotOS Core Terminal on Railway

Railway packaging for [ParrotOS](https://parrotsec.org/). It builds on the official, unmodified image, pinned to a release, and adds only what Railway needs.

A ParrotOS Core shell in your browser.

- Set `USERNAME` and `PASSWORD`; the terminal refuses to start without them.
- Listens on `$PORT` (default `7681`). Attach a volume at `/work` to keep files.

## License

The files in this repository are MIT licensed (see `LICENSE`). ParrotOS itself is licensed separately by its authors; this repository does not include or modify its source code.
