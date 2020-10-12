$('#editBtn').on('click', () => {
	$('.backdrop').toggleClass('d-none');
});

$('#closeBtn').on('click', () => {
	$('.backdrop').toggleClass('d-none');
});

$('.fa-cog').click(e => {
	if ($('.button-wrapper').hasClass('d-none')) {
		$('.button-wrapper').removeClass('d-none');
	} else {
		$('.button-wrapper').addClass('d-none');
	}
});

$(document).ready(function () {
	$('select').addClass('form-control');

	setTimeout(function () {
		$('.alert').fadeOut();
	}, 3000);
});
