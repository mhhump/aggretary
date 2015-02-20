# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->	
  $('#doors').imagesLoaded ->
    $('#doors').masonry
      itemSelector: '.box'
      isFitWidth: true

ready = ->
	$(document).on 'click', 'button[data-toggle]', ->
		$target = $($(this).attr('data-toggle'))
		$target.toggle()

$(document).ready(ready)
$(document).on('page:load', ready)

