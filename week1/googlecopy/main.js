//1st Exercise : Display google searchbar
/*document.getElementById("display-button").onclick = function() {
    document.getElementById("display-button").style.display = "none";
    document.getElementById("page-center").style.display = "block";
};*/

//2nd Exercise : Activate google search
document.getElementById("search-button").onclick = function() {
	var search = document.getElementById('search-bar').value;
	window.location.href = "https://www.google.fr/#q=" + search;
}

//3rd Exercise : Annoying popup
setTimeout(function() {
	alert("Hey le site xxxvidsxxx est trop bien. Viens dessus stp please");
}, 10000);
