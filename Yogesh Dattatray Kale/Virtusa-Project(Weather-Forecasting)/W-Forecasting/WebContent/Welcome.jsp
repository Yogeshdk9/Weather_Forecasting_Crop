<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Welcome User Weather Forecasting</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="main.css"/>

<style>

.container {
      padding: 12px;
}
.center {
  margin: 0;
  position: absolute;
  top: 40%;
  left: 40%;
  -ms-transform: translate(40%, -40%);
  transform: translate(-40%, -40%);
}  
.nav{
    position: relative;
  overflow: hidden;

  text-align: center;

}
.navbar{
    background-color: #000080;
}
.dropdown-menu{
    text-align: center;
}
/*Alert box css*/
.alert {
 position : relative;
 text-align: center;
  padding: 20px;
  color: black;
  font-size: 30px;
  font-weight: bold;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
/* feels like css*/
.current .feels{
    color: #FFF;
    font-size: 24px;
    font-weight: bold;
    margin: 20px 0px;
}
/* weather_image css*/
.weather_image{

position:relative;
left:630px;
  border: 1px solid #ddd;
  border-radius: 4px;
  padding: 5px;
  width: 220px;
  background-color: rgba(0, 0, 0, 0.596);
  
}
</style>

</head>

<body>

	<%
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			
			if(session.getAttribute("username")==null)
			{
				response.sendRedirect("index.jsp");
			}
			
			
		
		%>
		
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="Welcome.jsp"><b>Weather Forecasting</b></a>
    </div>
    <ul class="nav navbar-nav">

      <li><a href="forecast.jsp">Weather Forecast</a></li>
      <li><a href="pollution.jsp">Air Pollution Data</a></li>
      <li><a href="4DaysHistory.jsp">Data of 4 past days</a></li>
      <li><a href="map.jsp">Images(Map)</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
	  <li><a href="#" onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Logout</a></li>
    
    
    </ul>
  </div>
</nav>

 <!--Alert box-->

       <div class="alert">
        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
        <div class="message">Alert Message</div>
      </div>

      <!--Alert box finish-->



<div id="id01" class="modal">
<form class="modal-content animate" action="Logout" style="background-color:black;">
<div class="container">
      <label for="uname" style="color:white;"><b>DO YOU WANT TO LOGOUT...</b></label>
</div ><br><br>
<div class="center">
    <input type="submit" value="Logout">
     <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
  </div>
  </form>
</div>

<div class="app-wrap">
        <header>
            <input type="text"  class="search-box" placeholder="City Name"/>
        </header>
        <main>
            
            <div class="current">
  
                <div class="temp">##<span>°C</span></div>
                <section class="location">
                <div class="city">####, #######</div>
                <div class="date">### ## ## ####</div>
            </section>
                <div class="feels">##<span>°C</span></div>
                <div class="weather">####</div>
            </div>
  
        </main>
</div>
    
    
    
 
<script type="text/javascript">

const api={
	    key:"a9e36dc51bdeb4a5e4a07ef28cd9d5d6",
	    base:"https://api.openweathermap.org/data/2.5/"
	}
	if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(getPosSuccess, getPosErr);
	} else {
	    alert('geolocation not available?! What year is this?');
	    // IP address or prompt for city?
	}

	function getPosSuccess(pos) {
	  // Get the coordinates and accuracy properties from the returned object
	  var geoLat = pos.coords.latitude.toFixed(5);
	  var geoLng = pos.coords.longitude.toFixed(5);
	  var geoAcc = pos.coords.accuracy.toFixed(1);

	//Storing it in local storage to acces it in another file..
	  localStorage.setItem("lat", geoLat);  
	 // console.log(geoLat);
	  localStorage.setItem("lng", geoLng);
	 // console.log(geoLng)

	 // alert(geoLat+" "+geoLng);
	  getResults1(geoLat,geoLng);
	}

	// getCurrentPosition: Error returned
	function getPosErr(err) {
	  switch (err.code) {
	    case err.PERMISSION_DENIED:
	      alert("User denied the request for Geolocation.");
	      break;
	    case err.POSITION_UNAVAILABLE:
	      alert("Location information is unavailable.");
	      break;
	    case err.TIMEOUT:
	      alert("The request to get user location timed out.");
	      break;
	    default:
	      alert("An unknown error occurred.");
	  }
	}



	//localStorage.setItem("lat", geoLat);  
	//console.log(geoLat);
	//--------------
	//for current location of user.

	function getResults1(geoLat,geoLng){
	    fetch(`${api.base}weather?lat=${geoLat}&lon=${geoLng}&units=metric&appid=${api.key}`)
	    .then(weather=>{
	        return weather.json();
	    }).then(displayResults);
	}

	//-----------------------------------------------	--
	// when user search for differnt location in search box..

	const searchbox = document.querySelector('.search-box');
	searchbox.addEventListener('keypress', setQuery);

	function setQuery(evt) {
	    if(evt.keyCode==13){
	        getResults(searchbox.value);
	        
	    }
	}


	//-----------------
	// search with city name..

	function getResults(query){
	    fetch(`${api.base}weather?q=${query}&units=metric&APPID=${api.key}`)
	    .then(weather=>{
	        return weather.json();
	    }).then(displayResults);
	}


	//----------------------------------
	//display the result from json to html page

	function displayResults(weather){
	    //console.log(weather);  

	    let alerts=document.querySelector('.alert .message');
        alerts.innerText=`Today: ${weather.weather[0].description}`;

	    let city = document.querySelector('.location .city');
	    city.innerText=`${weather.name}, ${weather.sys.country}`;

	    let now =new Date();
	    let date = document.querySelector('.location .date');
	    date.innerText = dateBuilder(now);

	    let locationIcon = document.querySelector('.weather-icon');
	    const {icon} = weather.weather[0];
	   // locationIcon.innerHTML = `<img src="http://openweathermap.org/img/w/${icon}.png"/>`;
	   
	    

	    let temp = document.querySelector('.current .temp');
	    temp.innerHTML=`${Math.round(weather.main.temp)}<span>°c</span>`;

	    let feels=document.querySelector('.current .feels');
	    feels.innerHTML=`${weather.main.feels_like}<span>°c</span>`;

	    let weather_el = document.querySelector('.current .weather');
	    weather_el.innerText=weather.weather[0].main;

	    let hilow = document.querySelector('.hi-low');
	    hilow.innerText =`${Math.floor(weather.main.temp_min)}°c / ${Math.round(weather.main.temp_max)}°c`;

	    let weatherimg = document.querySelector('.weather_image');
	    weatherimg.innerHTML = `<img src="icons/${icon}.jpg" style="width:200px"/>`;


	}

	function dateBuilder(d){
	    let months =["January","February","March","April","May","June","July","August","September","October","November","December"];
	    let days=["Sunday","Monday","Tuesday","Wednesday","Thrusday","Friday","Saturday"];

	    let day=days[d.getDay()];
	    let date=d.getDate();
	    let month=months[d.getMonth()];
	    let year=d.getFullYear();


	    return `${day} ${date} ${month} ${year}`;
	}



</script>




</body>
</html>