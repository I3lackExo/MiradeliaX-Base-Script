document.getElementsByClassName("leaflet-control-container")[0].style.display = 'none';

function setZoom(amount)
{
	var count = 0;
	var timer = setInterval(()=>
	{
		console.log(count,amount);
		if (count >= amount)
		{
			clearInterval(timer);
		}
		count ++;
		document.getElementsByClassName("leaflet-control-zoom-out")[0].click();
	}, 100);
}

var firststart = true;

document.addEventListener("mousemove",()=>{
	if (firststart)
	{
		firststart = false;
		setZoom(25);
	}
});

