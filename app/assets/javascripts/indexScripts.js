$('.card').hover(
	function (e) {
		$(this).addClass('hovered');
		$(this).animate(
			{
				margin: -10,
				width: '+=20',
				height: '+=20',
			},
			200
		);
		$(this).find('img').animate(
			{
				margin: 0,
				width: '+=20',
				height: '+=20',
			},
			200
		);
	},
	function (e) {
		$(this).removeClass('hovered');
		$(this).animate(
			{
				margin: 0,
				width: '-=20',
				height: '-=20',
			},
			200
		);
		$(this).find('img').animate(
			{
				margin: 0,
				width: '-=20',
				height: '-=20',
			},
			200
		);
	}
);

$(document).ready(function () {
	setTimeout(function () {
		$('.alert').fadeOut();
	}, 3000);
});
