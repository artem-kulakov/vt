jQuery ->
	$('#record_client_id').autocomplete
		source: $('#record_client_id').data('autocomplete-source')