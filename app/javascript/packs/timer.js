function getTimeRemaining(endtime) {
	var total = Date.parse(endtime) - Date.parse(new Date());
	var seconds = Math.floor((total / 1000) % 60);
	var minutes = Math.floor((total / 1000 / 60) % 60);
	return {
		total: total,
		minutes: minutes,
		seconds: seconds,
	};
}

window.initializeClock= function(id, endtime) {
	var clock = document.getElementById(id);
	var minutesSpan = clock.querySelector(".minutes");
	var secondsSpan = clock.querySelector(".seconds");

	function updateClock() {
		var t = getTimeRemaining(endtime);

		if (
			(t.minutes == 0 && t.seconds == 0) ||
			(t.minutes == -1 && t.seconds == -1)
		) {
			$(".clock-countdown").html(`<span>Draw stopped</span>`);
			return $(".draw-start-notice").html(`<h3> Lottery countdown stops</h1>`);
		}

		minutesSpan.innerHTML = ("0" + t.minutes).slice(-2);
		secondsSpan.innerHTML = ("0" + t.seconds).slice(-2);

		if (t.total <= 0) {
			clearInterval(timeinterval);
		}
	}

	updateClock();
	var timeinterval = setInterval(updateClock, 1000);
}
