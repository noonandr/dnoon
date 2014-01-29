# dnoon.com

Repository for personal site hosted on Digital Ocean, using a node.js server and Grunt for development.

## Setup from Github 

Install [node.js](http://nodejs.org/).

Install Grunt command line tools:

```shell
$ npm install -g grunt-cli
```

To start server and generate files:

```
$ npm install -g grunt-cli
$ npm install
$ grunt
```

To view site open [localhost:3000](http://localhost:3000).

That should be it to get to development.

## Deploy to Server

Copy this repo to root if not an empty directory:

```
$ git clone git://github.com/noonandr/dnoon
```

If repo exists do a pull:

```
$ cd dnoon

$ git pull git://github.com/noonandr/dnoon
```

Install node on Ubuntu:

```
$ git clone https://github.com/joyent/node.git
$ cd node
$ git tag
$ git checkout v0.10.25
$ sudo make install
$ node -v
$ ./configure
$ make
$ node -v
$ nvm use 0.10.25
```

Setup connect for server:

```
$ sudo npm install connect
$ npm install forever -g
```

Create hello.js file in root directory:

```
$ vim hello.js
```

Add below code to hello.js (to save and exit press 'ctrl' + 'c' and then type ':x' and press enter):

```
var connect = require('connect');
connect.createServer(
    connect.static(__dirname + '/dnoon/build')
).listen(80);
```

Check server is running at root:

```
$ node hello.js
```

Start forever to set site to live:

```
$ forever start hello.js
```

Check forever is running:

```
$ forever list
```