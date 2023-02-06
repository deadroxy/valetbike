Hello Stack Log

1. Changed terminal shell type from zsh to bash
2. Opened .bash_profile to configure in VSCode
3. Added "export BASH_SILENCE_DEPRECATION_WARNING=1" to .bash_profile to silence zsh suggestions
4. Found easier prompt to print all paths (thanks Lucia): echo $PATH | sed 's/:/\n/g' | sort | uniq -c
5. Installed Xcode
6. Installed Homebrew using exact instructions from the mac install guide (mac.install.guide/rubyonrails/3.html)
    a) /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    b) echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/Mercer/.bash_profile
    c) echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/Mercer/.bash_profile
    d) eval "$(/opt/homebrew/bin/brew shellenv)"
    e) brew doctor
    NOTE  -- Several warnings re: unexpected files and libs came up after the brew doctor command. Homebrew says that these shouldn't cause problems but can help with diagnosing future issues when using the application.
    f) brew list (to check that no packages are installed)
    g) brew deps --tree --installed (to check that no dependencies are installed)
    h) xcode-select -p (to check for the Command Line Tools folder)
    i) ls -l /Library/Developer/CommandLineTools (to check for folders and files in the Command Line Tools folder)
7. Installed and configured Git (mac.install.guide/rubyonrails/4.html)
    a) git version (to check that is installed)
    b) git config -l --global (to check current settings)
    c) git config --global user.name "mercerkriese" (to set username)
    d) git config --global user.email mkriese@smith.edu (to set email)
    e) git config --global color.ui true
    f) git config -l --global (to check new configuration)
    g) ssh-keygen (to create encrypted key)
    NOTE -- Below is the information returned upon creation of encrypted key:

Your identification has been saved in /Users/Mercer/.ssh/id_rsa
Your public key has been saved in /Users/Mercer/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:mNmeAUa1Nl2zkVJZfHVR2RA94MdDD4qLBE4uE/9vp4s Mercer@MacBook-Pro-103.local
The key's randomart image is:
+---[RSA 3072]----+
|    . +..  .=***X|
|     B . o.o+=++*|
|    o * = o.o. =o|
|     + X o .  . .|
|      + S .      |
|       . +       |
|        o o .    |
|         o o     |
|        E o.     |
+----[SHA256]-----+

    h) attempted to make a public ssh key to connect with GitHub and troubleshooted issue with the install guide using GitHub's guide (https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
    i) added ssh key to GitHub profile. can access all ssh keys from terminal using 'ls -al ~/.ssh' and then copied the key using 'pbcopy < ~/.ssh/id_rsa.pub'

8. Installed asdf via git
    a) git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
    b) checked $PATH to ensure that asdf was added appropriately
9. Installed ARM DMG version of mySQL from developer's website (https://dev.mysql.com/downloads/file/?id=516827)
    a) legacy password: csc223mysql
    b) the mySQL path was NOT added to my PATH right away so added to .bash_profile in VSCode using 'export PATH=${PATH}:/usr/local/mysql/bin/' (https://devdotcode.com/how-to-add-mysql-to-the-path-in-mac-os/)
10. Installed ruby system dependencies via Homebrew
    a) brew install openssl readline
    b) brew install ruby-build
    c) brew install shared-mime-info
    d) asdf plugin add ruby
    e) export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
    f) export RUBY_CFLAGS="-Wno-error=implicit-function-declaration"
    g) asdf install ruby 3.1.2
        i. Ran into issue with install, cited as a problem with the OpenSSL extension (filepath: /var/folders/9m/lqvpk7vd3nj5pr3pqyq16mrm0000gn/T/ruby-build.20230202161713.99706.log). 
        ii. Found thread where other folks had a similar problem and troubleshot it with 'git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build' (https://github.com/rbenv/ruby-build/issues/377). When i re-attempted the ruby install, it didn't work.
        ii. I then tried another troubleshooting option on the same thread 'brew reinstall openssl@3' to reinstall openSSL. 
        ii. I utilized a configuring setup from another troubleshooting thread (https://stackoverflow.com/questions/66281574/export-ruby-configure-opts-with-openssl-dir-brew-prefix-openssl1-1eval): './configure –with-openssl-dir=`brew -–prefix openssl`'
    h) asdf global ruby 3.1.2
    i) ruby -v (to check that correct version installed)
11. Installing Ruby Gems:
    a) echo "gem: --no-document" >> ~/.gemrc
    b) gem install rails --version 7.0.3.1
    c) gem install mysql2 -- --with-opt-dir="$(brew --prefix openssl@1.1)"
    d) gem update bundler
12. Forked and cloned valetbike repo: git clone https://github.com/mercerkriese/valetbike.git
13. Prepped application:
    a) cd valetbike
    b) Created .tool-versions text file with contents "asdf local ruby 3.1.2"
    c) bundle install (installs gems)
    d) Created .env text file with contents:
        "MYSQL_USERNAME=root
        MYSQL_PASSWORD=YOURPASSWORD
        MYSQL_SOCKET=/tmp/mysql.sock"
14. Prepped mySQL database:
    a) rake db:create (creates both the development and test databases with rails)
    b) rake db:migrate (runs the database migrations)
15. Confirmed app runs: 
    a) rackup (launches server)
    b) Opened http://localhost:9292 on computer
16. Read through lead developer's notes
17. Opened rails command line and added new stations and bikes
18. Found that can edit homepage in valetbike/app/views/layouts/application.html.erb
    a) useful information regarding 'yield' in rails: https://richstone.io/debunk/#:~:text=It%20takes%20the%20view%20name,code%20example%20to%20illustrate%20it.&text=It%20runs%20a%20render_with_layout%20method,for%20the%20requested%20%3Aindex%20view.
    b) yield calls to valetbike/app/views/stations/index.html.erb
19. Edited welcome message, added code to show number of docked bikes at each station
20. Researched creating a rake file to import CSV data
    a) How to create a rake file: https://dwradcliffe.com/2011/12/29/import-csv.html
    b) How to import CSV data: https://ruby-doc.org/stdlib-1.9.2/libdoc/csv/rdoc/CSV.html, https://guides.firstdraft.com/loading-data-from-a-csv-file-into-your-database
    c) Created importStationsCSV.rake and importBikesCSV.rake in lib/tasks
    d) Used console to import csv by calling rake tasks from each file
    