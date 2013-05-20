#= require jquery-ui
#= require jquery_ujs

@wineLib || (@wineLib = {})
@wineLib.classes || (@wineLib.classes = {})

	

#================================= jQuery Extensions

$.fn.disableEmptyFileInputsOnSubmit = (additionalSubmissionMethod) ->
	$(this).each ->
		form = $(this).submit ->
			$("input[type='file']:not(.optional)", form).each ->
				$(this).parents(".field").remove()  if $(this)[0].files.length is 0
			additionalSubmissionMethod() unless typeof additionalSubmissionMethod != "function"



#================================= input cloning machine

class @wineLib.classes.input_cloner

	constructor: (@stockField, @button) ->
		console.log "cloner initializing...", @button.length
		@blankfield = @stockField.clone()
		@lastAddedField = @stockField
		@startingIndex = @currentIndex = @stockField.data "index"
		@button.css("background", "orange").click @replicate

	replicate: =>		
		newField = @blankfield.clone()
		fileInput = $ "input,select,textarea", newField
		newName = undefined
		fileInput.each (i,e) =>
			newName = $(e).attr("name").replace @startingIndex, @currentIndex+1
			$(e).attr("name", newName).prop('disabled',false).attr "id", newName		
		$('label',newField).attr "for", newName
		@currentIndex++
		@lastAddedField = newField.show().insertAfter @allCurrentFields()
		$(newField).trigger "replicate"

	allCurrentFields : ->
		@lastAddedField.add(@lastAddedField.siblings()).last()



#================================= drag/drop sorting support

class @wineLib.classes.ordered_collection

	constructor: (@house)->
		@house.sortable stop: @updatePriorityFields

	updatePriorityFields: =>
		fields = $ '.field', @house
		fields.each ->
			$('[name*=priority]', this).val fields.index $(this)
