# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#= require ./administration-lib


#================================= cloners
$ ->
	bind_sticker_cloner = (event)->
		if event.target is @
			new wineLib.classes.input_cloner $('.new_sticker',@), $('.add_sticker',@)
		

	$('#selections').delegate ".new_selection", "replicate", bind_sticker_cloner 

	$('.stickers').each ->
		new wineLib.classes.input_cloner $('.new_sticker',@), $('.add_sticker',@)


	new wineLib.classes.input_cloner $('.new_selection'), $('#add_selection')

	new wineLib.classes.ordered_collection $ '#selections > span:first'



	removeUnspecifiedSelectionsAndStickers = ->
		$('#selections select').each ->
			$(this).parents(".field").remove() unless $(':selected',this).attr 'value'
		$('.stickers input').each ->
			$(this).parents(".field").remove() unless $(this).attr 'value' isnt ""

	$("form").disableEmptyFileInputsOnSubmit removeUnspecifiedConnectionsAndVideos