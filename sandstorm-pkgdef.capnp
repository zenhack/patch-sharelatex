@0xb1ad881ac0baba9f;

using Spk = import "/sandstorm/package.capnp";
# This imports:
#   $SANDSTORM_HOME/latest/usr/include/sandstorm/package.capnp
# Check out that file to see the full, documented package definition format.

const pkgdef :Spk.PackageDefinition = (
  # The package definition. Note that the spk tool looks specifically for the
  # "pkgdef" constant.

  id = "5vuv7v0w7gu20z72m78n83rx9qqtqpmtk32f39823wh967z226qh",
  # Your app ID is actually its public key. The private key was placed in
  # your keyring. All updates must be signed with the same key.

  manifest = (
    # This manifest is included in your app package to tell Sandstorm
    # about your app.

    appTitle = (defaultText = "ShareLaTeX"),

    appVersion = 10,  # Increment this for every release.
    appMarketingVersion = (defaultText = "2015.11.16 (0.1.4+)"),

    metadata = (
      icons = (
        appGrid = (png = (dpi1x = embed "app-graphics/sharelatex-128.png")),
        grain = (png = (dpi1x = embed "app-graphics/sharelatex-24.png",
                        dpi2x = embed "app-graphics/sharelatex-48.png")),
        market = (png = (dpi1x = embed "app-graphics/sharelatex-150.png"))
      ),
      website = "https://www.sharelatex.com",
      codeUrl = "https://github.com/dwrensha/sharelatex",
      license = (openSource = agpl3),
      categories = [office, science],
      author = (
       upstreamAuthor = "ShareLaTeX Team",
       contactEmail = "david@sandstorm.io",
       pgpSignature = embed "pgp-signature",
      ),
      pgpKeyring = embed "pgp-keyring",
      description = (defaultText = embed "description.md"),
      shortDescription = (defaultText = "LaTeX editor"),
      screenshots = [(width = 448, height = 294, png = embed "sandstorm-screenshot.png")],
      changeLog = (defaultText = embed "changeLog.md"),
    ),

    actions = [
      # Define your "new document" handlers here.
      ( title = (defaultText = "New ShareLaTeX Project"),
        command = .myCommand,
        nounPhrase = (defaultText = "document"),
      )
    ],

    continueCommand = .myCommand
    # This is the command called to start your app back up after it has been
    # shut down for inactivity. Here we're using the same command as for
    # starting a new instance, but you could use different commands for each
    # case.
  ),

  sourceMap = (
    # Here we defined where to look for files to copy into your package. The
    # `spk dev` command actually figures out what files your app needs
    # automatically by running it on a FUSE filesystem. So, the mappings
    # here are only to tell it where to find files that the app wants.
    searchPath = [
      ( sourcePath = "sharelatex-old", packagePath = ""),
    ]
  ),

  alwaysInclude = ["/"],

  bridgeConfig = (
    viewInfo = (
       permissions = [(name = "read", title = (defaultText = "read"),
                       description = (defaultText = "allows viewing")),
                      (name = "write", title = (defaultText = "write"),
                       description = (defaultText = "allows editing"))],
       roles = [(title = (defaultText = "collaborator"),
                 permissions = [true, true],
                 verbPhrase = (defaultText = "can read and write"),
                 default = true),
                (title = (defaultText = "reader"),
                 permissions = [true, false],
                 verbPhrase = (defaultText = "can read"))]
    )
  )

);

const myCommand :Spk.Manifest.Command = (
  # Here we define the command used to start up your server.
  argv = ["/sandstorm-http-bridge", "2999", "--", "/usr/bin/sh", "start.sh"],
  environ = [
    # Note that this defines the *entire* environment seen by your app.
    (key = "PATH", value = "/usr/local/bin:/usr/bin:/bin"),
    (key = "USER", value="sharelatex"),
    (key = "HOME", value="/var")
  ]
);
