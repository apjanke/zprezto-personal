apjanke's Prezto Contrib Conventions
====================================

These are my conventions for managing third-party "contrib" code for Prezto.

This isn't an official Prezto convention. It's just something I came up with while figuring out how I was going to use it. But I think it will work well, especially if you use code from multiple authors.

Contrib support in Prezto is new as of late 2017. You can read about it in [this Prezto PR](https://github.com/sorin-ionescu/prezto/pull/1458).

##  Repo organization

Prefer big repos and small modules. Each contrib repo takes effort to install and manage, so it's better to have few of them. And each module has a cost in terms of startup time and shell namespace consumption, as well as code reading & understanding, so it's better to split them into small modules so you can enable only what you actually need.

Create a GitHub repo named `zprezto-<topic>`, where `<topic>` is what your modules deal with. I just throw all my Prezto stuff into a single `zprezto-personal` repo.

Put each module into a directory under the top level of your contrib repo. (Don't make the repo a single module.) Add a `README.md` and a `LICENSE.md` file. Prefer the MIT License so it uses the same license as Prezto itself.

Directories in the repo that start with underscores are special directories and are not modules. This includes stuff like `_doc`.

###  Prompt themes

Collect all your prompt themes in a single module. Add a `README.md` for the module that lists all the themes, and includes a screenshot or two of each.

_HMMM_: Actually, maybe don't include screenshots. My `~/.zprezto` directory is 53 MB now, and it's mainly theme screenshots. Maybe there should be a separate doco repo for theme repos.

Choose distinctive names for your themes. The prompt theme namespace is global; it's not qualified by the module that provides them. Don't name your theme `clean` or `minimal`. If you're John Q. Citizen, name it `clean-jqc`. Or name it `OwlBearDen` or `ferrari-double-spoiler`.

##  Local ~/.zprezto organization

Create the `~/.zprezto/contrib` directory if it doesn't already exist. Create a `$USER` directory under it, where `$USER` is your GitHub username. Don't call it "mine" or "local" or "personal" or anything like that; use a globally unique name that's associated with your repos. GitHub usernames meet that criteria.

Using GitHub usernames as the first level of directories provides a namespace mechanism that prevents module names from colliding. And it offloads the work of managing the global namespace to an outside authority that's already doing that work.

Clone your contrib repo under that directory, using a local directory name that removes the leading `zprezto-` prefix.

I also like to keep my main `.zprezto` directory itself in Dropbox, and just symlink `~/.zprezto` to it, so it can be shared between different computers and I only have to manage one copy.

###  Example

```sh
USER=apjanke
TOPIC=personal
cd ~/.zprezto
mkdir -p contrib/${USER}
cd contrib/${USER}
git clone --recursive https://github.com/${USER}/zprezto-${TOPIC} ${TOPIC}
# Install the official contrib repo
cd ../..
mkdir -p contrib/belak
cd contrib/belak
git clone --recursive https://github.com/belak/prezto-contrib contrib
```

Then add the `$USER/$TOPIC/<modulename>` and `belak/contrib/<modulename>` modules to your pmodules list in your `~/.zpreztorc`.

##  Notes

If this organization seems familiar to you, that's no coincidence. It's based on Mac Homebrew's [Tap mechanism](https://docs.brew.sh/Taps), which I like.

Make sure to check in and push your local changes to GitHub often, especially if you're keeping your repo in Dropbox. Dropbox seems to screw up Git repos sometimes.

See my [Notable Contrib Repos](Notable-Contrib-Repos.md) list for other Prezto contrib repos of interest.
