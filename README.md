This repository contains a set of scripts to monkey-patch the ShareLaTeX
sandstorm spk, to solve an issue where it was loading icons & fonts from
CDNs, which will break the app when we start enforcing
Content-Security-Policy.

Unfortunately, The ShareLaTeX app [predates vagrant-spk and doesn't have
a proper build system][1]. Getting it building again would probably be even
more work than packaging the current version of the app from scratch, so
the current thinking is that we will:

- Use this set of scripts to build an SPK of the currently packaged
  version that will not break when we start enforcing CSP
- Separately, we'll package the current version of ShareLaTeX, now
  called Overleaf, as a new app. No attempt will be made to migrate
  grains' internal storage; instead, users wishing to upgrade should
  click the button to download their project source as a zip, and upload
  it into a new (Overleaf) grain.

---

On a system with Sandstorm installed:

First, fetch the old spk and the necessary assets:

```sh
./fetch.sh
```

Then, make a patched root directory:

```sh
./patch.sh
```

You should now be able to run the app using `spk dev`, or build a new
spk with `spk pack`. Note that we disable the devmode file detection, so
there is no need to run spk dev before building the spk, as it will not
affect the contents.

[1]: https://github.com/dwrensha/sharelatex/issues/13
