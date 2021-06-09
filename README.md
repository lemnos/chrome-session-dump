# What

A tool for dumping the contents of chrome session files.

# Why?

Most tools for reading SNSS files (chrome session files) are either broken or
outdated. This tool aims to facilitate scripting by providing a clean way of
extracting useful information (like the active tab) from a running or saved
chrome session. You could, for instance, use the tool to extract the current
page within an external script and download its contents to disk or 
store it inside a bookmark file.

# Installation

## From Source

```
make && sudo make install
```

Binaries are also available for linux and macOS. 

## Linux

```
sudo curl -o /usr/bin/chrome-session-dump -L 'https://github.com/lemnos/chrome-session-dump/releases/download/v0.0.1/chrome-session-dump-linux' && sudo chmod 755 /usr/bin/chrome-session-dump
```

## macOS

```
sudo curl -o /usr/bin/chrome-session-dump -L 'https://github.com/lemnos/chrome-session-dump/releases/download/v0.0.1/chrome-session-dump-osx' && sudo chmod 755 /usr/bin/chrome-session-dump
```

# Usage

```
# chrome-session-dump # Print the url of all tabs found in the session in order.

https://ddg.gg
https://protonmail.com

chrome-session-dump -active # Print the url of the most recently active tab

https://protonmail.com

chrome-session-dump -printf '%t\n'

Secure email: ProtonMail is free encrypted email.
DuckDuckGo — Privacy, simplified.

chrome-session-dump -deleted -history|grep 'chrome-session-dump' # Search history of all (potentially deleted) tabs for a url containing the given expression.

https://github.com/lemnos/chrome-session-dump
```

A session file (or chrome directory) can optionally be provided as the final argument, by default the tool will
look for the most recent session file in ~/.config/chrome.

# Caveats

Won't work on incognito tabs (since they are not persisted to disk).
The output lags behind changes by a few milliseconds since chrome does not immediately flush changes to disk.

# To whom it may concern

Please don't use this for evil.
