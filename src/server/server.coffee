# HTTP server entry point.
#
# This server is used both for delivering the API resources
# and serving static application files.

'use strict'

# Community modules:
path = require 'path'
express = require 'express'
compression = require 'compression'
serveStatic = require 'serve-static'

# Our modules:
router = require './router'

# Server configuration:
staticDir = path.resolve __dirname, process.env.STATIC_DIR || 'static'
cacheAge = process.env.CACHE_AGE || 24 * 60 * 60 * 1000 # 24 hours
port = process.env.PORT || 8000

# Compatibility headers middleware for Internet Explorer:
compatibilityHeaders = (request, response, next) ->
  # Instruct IE to use the latest available compatibility mode:
  response.setHeader 'X-UA-Compatible', 'IE=edge'
  do next

# Server:
(do express)
  .use compatibilityHeaders
  .use do compression
  .use '/api', router
  .use serveStatic staticDir, maxAge: cacheAge
  .listen port