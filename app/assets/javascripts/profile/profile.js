


function setCoords(c) {
	$("#cx").val(c.x);
	$("#cy").val(c.y);
	$("#cx2").val(c.x2);
	$("#cy2").val(c.y2);
	$("#w").val(c.w);
	$("#h").val(c.h);
};


jQuery(function($) {
	$('#profilepicture').Jcrop( {
			onChange: setCoords,
			onSelect:    setCoords,
			bgColor:     'black',
			bgOpacity:   .4,
			aspectRatio: 250 / 331	
	});
});
