<p align="center">
	<img src="https://raw.githubusercontent.com/coldbox-modules/cbwire/development/logo.png">
</p>

# Catching 🔥 Wire

## An Introduction to CBWire 4

#### Description of Session from IntoTheBox 2025:

> We are continually bombarded with the latest and greatest new (or at least new to us) “thing” and constantly told we should integrate this or that right away! Keeping up with new technologies, modules, libraries, etc. can be a full-time job in itself.
> 
> In this session we will explore one of the “things” you may have heard tossed around, CBWire! We will go a little deeper than a typical “Elevator Pitch” and discuss what CBWire is, what it can do, and end with a live coding demonstration of how easy it is to integrate into an existing ColdBox application while building our first wire. We will end with a Q & A and hopefully gain a few more CBWire fans!

This repository contains the CBWire demos used for this presentation and more.

## Setup of Demo

### 1. Environment Variables

Copy `.env.example` to `.env` in the root of the repository

There are **not** any environment variables that need to be changed when copying `.env.example` to `.env`, However there are a few optional values you might want to modify. Setting the `DEMO_USER_*` values will allow ColdBox to reset the primary demo user on every appinit

```
# Demo User (ID=1) Info (will be reset on appinit. Remove or set to blank to disable)
DEMO_USER_EMAIL=you@example.com
DEMO_USER_PASSWORD=password
DEMO_USER_FIRST_NAME=Jonathon 
DEMO_USER_LAST_NAME=Deauxville
DEMO_USER_TITLE=Baron
```

### 2. Start CommandBox and install ColdBox dependencies

Four commands to get going! Start CommandBox in the root of the repository, change into the `wwwroot` folder, install dependencies, and fire up the server!

```bash
box
cd wwwroot
install
server start
```

### Troubleshooting Tips

- If the server is having trouble finding the SQLite Database or JDBC driver when started up, you can put the absolute path for:
  -  SQLite Database: `DB_PATH` environment variable in `.env` replacing the relative path of `./DB/catchingWire.db` (Note: If you change the .env file make sure to restart commandbox to refresh the environment variables)
  -  jars folder: `server.json` setting `app.libDirs` replacing the relative path of `./DB/jars/`

## Features of the demo
- Includes a SQLite database &  SQLite JDBC driver
- between the `.env`, `server.json`, and `.cfconfig.json` files the lucee server should load the JDBC driver and create the SQLite datasource
- Initial Modules Installed:
  - [QB](https://qb.ortusbooks.com/)
  - [Quick](https://quick.ortusbooks.com/)
  - [CBSecurity](https://coldbox-security.ortusbooks.com/)
  - [BCrypt](https://forgebox.io/view/BCrypt)
  - [ColdThumbs](https://forgebox.io/view/ColdThumbs)
  - [cbvalidation](https://coldbox-validation.ortusbooks.com/)
  - [CBWire (Of Course!)](https://cbwire.ortusbooks.com/)
- When `ENVIRONMENT=development` you can automtically login using `COMMAND KEY + l` on mac and `WINDOWS KEY + l` on windows
- Working [CBSecurity](https://coldbox-security.ortusbooks.com/) user authentication
- [Uses the AdminLTE Bootstrap open source admin dashboard & control panel theme](https://adminlte.io/)
- Contains multiple CBWire demos covering many features of CBWire
- Contains a `.demo` folder with demos for use with [Demo Time VSCode Extension](https://demotime.elio.dev/)

*Side Note: this is a basic stack I like to start with on projects to get jump started and add or remove from there.*

## Other Stuff

#### JDBC SQLite Driver

Demo uses the [sqlite-jdbc driver found here](https://github.com/xerial/sqlite-jdbc) and is automatically added to the classpath of the server in the `server.json` configuration

#### SQLite Tools

A very useful, simple, and free tool for Mac users to interact directly with the SQLite DB is [DB Browser for SQLite](https://sqlitebrowser.org/)

## Other Links and Resources

### [CBWire (Of Course!)](https://cbwire.ortusbooks.com/)

Great for all things CBWire

### [CBWIRE Demos @ GitHub](https://github.com/grantcopley/cbwire-examples)

Fabulous examples of a multitude of CBWIRE features

### [livewire.laravel.com](https://livewire.laravel.com/)

CBWire uses Livewire.js and is essentially the CF port of Livewire. Once I was more familiar with CBWire it became easier to look through the livewire documentation and corelate the PHP parts to CBWIRE counterparts.

### [alpinejs.dev](https://alpinejs.dev/)

Livewire includes alpine.js out of the box and adds some great features when your ready to dive into it deeper

### [ColdThumbs](https://forgebox.io/view/ColdThumbs)

I have to give a shout out to <a href="https://github.com/GaryStanton" target="_blank">Gary Stanton</a>, the create of ColdThumbs. I don't know him but I love ColdThumbs. I have used this module many times and it is extremely helpful. I use it to create and cache thumbnail images on the fly. If you want to see it in action copy your profile image to `/wwwroot/includes/images/profiles/1.jpg` and reload the page.

### [highlight.js](https://highlightjs.org/) 

used for all the code syntax highlighting at the bottom of each CBWire demo page.

### [AdminLTE Theme](https://adminlte.io/) 

The open source admin dashboard & control panel theme used in this demo

## Acknowledgments

### [Grant Copley](https://github.com/grantcopley), for all his hard work on CBWire.

### [Caleb Porzio](https://github.com/calebporzio), the creator of Livewire, Alpine.js and more.

### [Ortus Solutions](https://github.com/Ortus-Solutions), the creators of all things BOX!


