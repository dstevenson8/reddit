# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	$('.rating img').click ->
		img = $(this)
		parent = $(this).closest('.rating')
		root = $(this).closest('.root')
		id = root.data('id')
		entity_type = root.data('entity-type')

		
		if img.hasClass('active')
			vote_type = 0
		else if img.hasClass('upvote')
			vote_type = 1
		else
			vote_type = -1 

			
		$.getJSON '/vote/' + entity_type + '/' + id + '/' + vote_type, (response) ->
			if response.status == 'success'
				root.find('.points').html(response.new_points)
				root.find('.points_text').html(response.new_points_text)
				parent.find('img').removeClass('active')
				
				if vote_type != 0 
					img.addClass('active')

