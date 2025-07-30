<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Weather App</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
<!-- ====== CSS for Weather App ====== -->

</head>
<body>
<div class="mainContainer">

    <!-- ========= SEARCH FORM ========= -->
    <div class="searchInput">
        <form action="MyServlet" method="post" style="display:flex; width:100%;">
            <input name="city" type="text" placeholder="Enter city..." value="<%= request.getAttribute("city")!=null ? request.getAttribute("city") : "" %>" />
            <button type="submit">&#128269;</button>
        </form>
    </div>
    
    <!-- ========= ERROR MESSAGE ========= -->
    <% if(request.getAttribute("error") != null) { %>
        <div class="errorMsg" style="color:red; text-align:center; margin-bottom:1rem;">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>

    <!-- ========= WEATHER DISPLAY ========= -->
    <% if(request.getAttribute("city") != null && request.getAttribute("weatherCondition") != null) { %>
        <!-- Hidden input to let JS read weather condition -->
        <input type="hidden" id="wc" value="<%= request.getAttribute("weatherCondition") %>" />

        <div class="weatherIcon">
            <img id="weather-icon" src="" alt="Weather Icon" />
        </div>

        <div class="cityDetails">
            <%= request.getAttribute("city") %>
            <div class="date"><%= request.getAttribute("date") %></div>
        </div>
        <div class="weatherDetails" style="text-align:center;">
            <div class="temp">
                <%= request.getAttribute("temperature") %>°C
            </div>
            <div>
                <b><%= request.getAttribute("weatherCondition") %></b>
            </div>
        </div>
        <div class="windDetails">
            <div class="humidityBox">
                <img src="https://cdn-icons-png.flaticon.com/128/728/728093.png" alt="Humidity" />
                <div>
                  <div>Humidity</div>
                  <div class="humidityValue"><%= request.getAttribute("humidity") %>%</div>
                </div>
            </div>
            <div class="windSpeed">
                <img src="https://cdn-icons-png.flaticon.com/128/869/869869.png" alt="Wind" />
                <div>
                    <div>Wind Speed</div>
                    <div><%= request.getAttribute("windSpeed") %> m/s</div>
                </div>
            </div>
        </div>
    <% } %>
</div>

<script src="myScript.js"></script>

</body>
</html>
