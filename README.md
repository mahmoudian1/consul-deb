Consul-deb
================

Building the [**Consul**](https://consul.io) debian package.

It only installs the agent. No UI.


Requirements
-------------------

* fpm

To see how to install and use fmp have a look at: <https://github.com/jordansissel/fpm>

How it works?
-------------------

To create a consul rpm version 0.5.0 and consul-template 0.8.0:

```
 ./build-consul-deb.sh 0.6.3 x86_64
```

The new package is located in the target folder. The target folder will be overridden
when the next build starts.





