# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#= require ./administration-lib


#================================= cloners
$ ->
	new wineLib.classes.input_cloner $('.new_selection'), $('#add_selection')

	new wineLib.classes.ordered_collection $ '#selections > span:first'


	removeUnspecifiedConnectionsAndVideos = ->
		$('#selections select').each ->
			$(this).parents(".field").remove() unless $(':selected',this).attr 'value'

	$("form").disableEmptyFileInputsOnSubmit removeUnspecifiedConnectionsAndVideos