#
# Injector transformer.
# @module gulp/helpers/transform
#

#
# Transforms a file stream to <script> tag string.
# @param  {String} filePath Original file path.
# @param  {Stream} file     File stream.
# @return {String}          HTML <script> tag string ready to be inlined.
#
exports.scripts = (filePath, file) ->
  "<script>#{file.contents.toString 'utf8'}</script>"

#
# Transforms a file stream to <style> tag string.
# @param  {String} filePath Original file path.
# @param  {Stream} file     File stream.
# @return {String}          HTML <style> tag string ready to be inlined.
#
exports.styles = (filePath, file) ->
  "<style>#{file.contents.toString 'utf8'}</style>"
