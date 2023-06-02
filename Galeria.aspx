﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Galeria.aspx.cs" Inherits="DaneDynamiczne1.Formularz_sieci_Web14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">Galeria.</p>
                  <asp:Image ID="Image1" runat="server" Height="232px" Width="754px" ImageUrl="~/Grafika/Tytulowa.png" />

   <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: Arial;
  margin: 0;
}

* {
  box-sizing: border-box;
}

img {
  vertical-align: middle;
}

/* Position the image container (needed to position the left and right arrows) */
.container {
  position: relative;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* Container for image text */
.caption-container {
  text-align: center;
  background-color: #222;
  padding: 2px 16px;
  color: white;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Six columns side by side */
.column {
  float: left;
  width: 16.66%;
}

/* Add a transparency effect for thumnbail images */
.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}
</style>

<h2 style="text-align:center">Galeria olejków</h2>

<div class="container">
  <div class="mySlides">
    <div class="numbertext">1 / 6</div>
    <img src="Grafika/1.jpg" style="width:100%">
  </div>

  <div class="mySlides">
    <div class="numbertext">2 / 6</div>
    <img src="Grafika/2.jpg" style="width:100%">
  </div>

  <div class="mySlides">
    <div class="numbertext">3 / 6</div>
    <img src="Grafika/img_mountains_wide.jpg" style="width:100%">
  </div>
    
  <div class="mySlides">
    <div class="numbertext">4 / 6</div>
    <img src="Grafika/img_lights_wide.jpg" style="width:100%">
  </div>

  <div class="mySlides">
    <div class="numbertext">5 / 6</div>
    <img src="Grafika/img_5terre_wide.jpg" style="width:100%">
  </div>
    
  <div class="mySlides">
    <div class="numbertext">6 / 6</div>
    <img src="Grafika/img_mountains_wide.jpg" style="width:100%">
  </div>
    
  <a class="prev" onclick="plusSlides(-1)">❮</a>
  <a class="next" onclick="plusSlides(1)">❯</a>

  <div class="caption-container">
    <p id="caption"></p>
  </div>

  <div class="row">
    <div class="column">
      <img class="demo cursor" src="Grafika/1m.jpg" style="width:100%" onclick="currentSlide(1)" alt="Pozycja 1">
    </div>
    <div class="column">
      <img class="demo cursor" src="Grafika/2m.jpg" style="width:100%" onclick="currentSlide(2)" alt="Pozycja 2">
    </div>
    <div class="column">
      <img class="demo cursor" src="Grafika/img_mountains.jpg" style="width:100%" onclick="currentSlide(3)" alt="Pozycja 3">
    </div>
    <div class="column">
      <img class="demo cursor" src="Grafika/img_lights.jpg" style="width:100%" onclick="currentSlide(4)" alt="Pozycja 4 ">
    </div>
    <div class="column">
      <img class="demo cursor" src="Grafika/img_5terre.jpg" style="width:100%" onclick="currentSlide(5)" alt="Pozycja 5">
    </div>    
    <div class="column">
      <img class="demo cursor" src="Grafika/img_mountains.jpg" style="width:100%" onclick="currentSlide(6)" alt="Pozycja 6">
    </div>
  </div>
</div>
    

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}
</script>
    </div>
       <p> <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Startowa.aspx" class="btn btn-primary btn-lg">Na stronę startową &raquo;</asp:LinkButton> </p>
</asp:Content>
