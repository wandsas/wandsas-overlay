= Our current state of tmux config =

== Dependencies ==

* [Tmux] <https://github.com/tmux/tmux>
* [GNU Stow] <https://www.gnu.org/software/stow/>
* [Myrepos] <https://myrepos.branchable.com/>
* [Myrepos stow plugin] <https://github.com/aspiers/mr-config>

== Add a .mrconfig ==

{{{
~ # cat > ~/.mrconfig <<'EOF'
[DEFAULT]
include = cat /usr/share/mr/stow

[$HOME/.GIT/wandsas/tmuxrc]
stowable = true
checkout = git clone git://github.com/wandsas/tmuxrc.git
remotes = git_add_remote wandsas git@rpi:/git/tmuxrc.git
EOF
}}}

== Bootstrap on a new install machine ==

{{{
~ # mr -t -i bootstrap https://github.com/wandsas/shell-env/home-mr-config 
}}}

== MIT License ==

Copyright (c) 2018 wandsas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
