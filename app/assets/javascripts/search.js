function search_tag() {
    var element = "#search-form"
    $.ajax({
	url: "/search",
	type: "POST",
	data: 'search=' + $(element).val()
    })
}
