Prezto Contrib Conventions
=============================

These are my conventions for managing third-party "contrib" code for Prezto.

This isn't an official Prezto convention. It's just something I came up with while figuring out how I was going to use it. But I think it will work well, especially if you use code from multiple authors.


##  Repo organization

Prefer big repos and small modules. Each contrib repo takes effort to install and manage, so it's better to have few of them. And each module has a cost in terms of startup time and shell namespace consumption, as well as code reading & understanding, so it's better to split them into small modules so you can enable only what you actually need.

Create a GitHub repo named `zprezto-<topic>`, where `<topic>` is what your modules deal with. I just throw all my Prezto stuff into a single `zprezto-personal` repo.

Put each module into a directory under the top level of your contrib repo. (Don't make the repo a single module.) Add a `README.md` and a `LICENSE.md` file. Prefer the MIT License so it uses the same license as Prezto itself.

Directories in the repo that start with underscores are special directories and are not modules. This includes stuff like `_doc`.

##  Installation

Create the `~/.zprezto/contrib` directory if it doesn't already exist. Create a `$USER` directory under it, where `$USER` is your GitHub username. Don't call it "mine" or "local" or "personal" or anything like that; use a globally unique name that's associated with your repos.

Clone your contrib repo under that directory, using a local directory name that removes the leading `zprezto-` prefix.

I also like to keep my main `.zprezto` directory itself in Dropbox, and just symlink `~/.zprezto` to it, so it can be shared between different computers and I only have to manage one copy.

###  Example

```sh
USER=apjanke
TOPIC=personal
cd ~/.zprezto
mkdir -p contrib/${USER}
cd contrib/${USER}
git clone https://github.com/${USER}/zprezto-${TOPIC} ${TOPIC}
```

Then add the `$USER/$TOPIC/<modulename>` modules to your pmodules list in your `~/.zpreztorc`.

##  Notes

If this organization seems familiar to you, that's no coincidence. It's based on Mac Homebrew's [Tap mechanism](https://docs.brew.sh/Taps), which I like.

Make sure to check in and push your local changes to GitHub often, especially if you're keeping your repo in Dropbox. Dropbox seems to screw up Git repos sometimes.
