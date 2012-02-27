function loadPage(page) {
    $.get('http://127.0.0.1/newslistar/newslist'+page,
    function (htmlResult) {
		$("#w-newslist").replaceWith(htmlResult); 
		$('.noJs').hide();	
    }    
    );
	 window.location.hash = page;
    return false;
}

function addFavouriteGame(game) {
	$.post('http://127.0.0.1/profile/profile', { username: game }, function(data) {
		$('#w-profile').replaceWith(data);
		$('#favourite-game').addClass("is-updated");
	});
}

$(document).ready(function() {
	$('.noJs').hide();
	var hash = window.location.hash;
	hash = hash.replace('#','');
	console.log(hash);
	loadPage(hash);
});
