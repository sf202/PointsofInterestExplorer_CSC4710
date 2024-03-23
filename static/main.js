//google API key
const apiKey = 'AIzaSyAkW0iGM8DniteJO7xa_yEuJseeFGQJLBM'



//URL variable
const url = 'http://localhost:5000/'

//Functions to change pages
document.addEventListener("DOMContentLoaded", function() {
    const acceptButton = document.getElementById("seller");
    acceptButton.addEventListener("click", function() {
    window.location.href = "/src/pages/rform.html";
});
});

// Added a JavaScript function to navigate to the sellers login page
function navigateToSellersLogin() {
    window.location.href = "sellers-login.html"; 
}

//Main Page Map
//Variables for Map Functions
let map;
let currentMarker;
let currentMarkerTitle;
let currentMarkerLocation;
let address = [];
let supplierName = [];
let supplierCategory = [];
let coordinates = [];
let hardCodedMarker = [];
let supplierMarker = [];
let markers = [];
let selectedCategory
//Hard Coded Variables
const arrayWithHardcodedNames = [
    'Centennial Olympic Park',
    'Piedmont Park',
    'Forsyth Park',
    'Savannah Historic District Park',
    'Chattahoochee River National Recreation Area Park',
    'Stone Mountain Park',
    'Callaway Gardens Park',
    'Jekyll Island State Park',
    'Amicalola Falls State Park',
    'Red Top Mountain State Park',
    'Martin Luther King Jr. National Historic Site',
    'Andersonville National Historic Site',
    'Stone Mountain Park',
    'Fort Pulaski National Monument',
    'Kennesaw Mountain National Battlefield Park',
    'Jimmy Carter National Historic Site',
    'Fort Frederica National Monument',
    'Wormsloe Historic Site',
    'Georgia State Capitol',
    'Ocmulgee Mounds National Historical Park',
    'Georgia Aquarium',
    'World of Coca-Cola',
    'Atlanta Botanical Garden',
    'Zoo Atlanta',
    'Georgia Museum of Art',
    'Six Flags Over Georgia',
    'The Fox Theatre',
    'High Museum of Art',
    'Atlanta History Center',
    'Atlanta BeltLine'
    // Add more names as needed
  ];
  
const hardCodedAddresss = [
    '265 Park Ave W NW, Atlanta, GA 30313, United States',
    '400 Park Dr NE, Atlanta, GA 30306, United States',
    '2 W Gaston St, Savannah, GA 31401, United States',
    'Savannah, GA 31401, United States',
    '1978 Island Ford Pkwy, Sandy Springs, GA 30350, United States',
    '1000 Robert E Lee Blvd, Stone Mountain, GA 30083, United States',
    '17800 US-27, Pine Mountain, GA 31822, United States',
    'Jekyll Island, GA 31527, United States',
    '418 Amicalola Falls Lodge Dr, Dawsonville, GA 30534, United States',
    '50 Lodge Rd SE, Cartersville, GA 30121, United States',
    '450 Auburn Ave NE, Atlanta, GA 30312, United States',
    '760 Pow Rd, Andersonville, GA 31711, United States',
    '1000 Robert E Lee Blvd, Stone Mountain, GA 30083, United States',
    'US-80, Savannah, GA 31410, United States',
    '900 Kennesaw Mountain Dr, Kennesaw, GA 30152, United States',
    '300 N Bond St, Plains, GA 31780, United States',
    '6515 Frederica Rd, St Simons, GA 31522, United States',
    '7601 Skidaway Rd, Savannah, GA 31406, United States',
    '206 Washington St SW, Atlanta, GA 30334, United States',
    '1207 Emery Hwy, Macon, GA 31217, United States',
    '225 Baker St NW, Atlanta, GA 30313, United States',
    '121 Baker St NW, Atlanta, GA 30313, United States',
    '1345 Piedmont Ave NE, Atlanta, GA 30309, United States',
    '800 Cherokee Ave SE, Atlanta, GA 30315, United States',
    '90 Carlton St, Athens, GA 30602, United States',
    '275 Riverside Pkwy SW, Austell, GA 30168, United States',
    '660 Peachtree St NE, Atlanta, GA 30308, United States',
    '1280 Peachtree St NE, Atlanta, GA 30309, United States',
    '130 West Paces Ferry Rd NW, Atlanta, GA 30305, United States',
    'Atlanta, GA, United States',
];
let supplierAddresses = [
    /*put addresses here; can be geocode or street address */
   /* { lat: 33.42282051456218, lng: -84.2339243975608 }, 
    { lat: 33.52282051456218, lng: -84.2339243975608 }, 
    { lat: 33.22282051456218, lng: -84.2339243975608 }, 
    { lat: 33.32282051456218, lng: -84.2339243975608 },
    { lat: 28.46, lng: -80.53 },   // 28.396837 -80.605659   28.46,-80.53  33.62838334036501, -84.47175545088831
    // Local FREE FOOD RESOURCES */
    { lat: 33.760347, lng: -84.393619 },
    { lat: 33.785808, lng: -84.373663 },
    { lat: 32.073950, lng: -81.092250 },
    { lat: 32.078944, lng: -81.091786 },
    { lat: 33.979573, lng: -84.304245 },
    { lat: 33.810153, lng: -84.145156 },
    { lat: 32.837435, lng: -84.839299 },
    { lat: 31.070561, lng: -81.412781 },
    { lat: 34.556224, lng: -84.249338 },
    { lat: 34.147433, lng: -84.713946 },
    { lat: 33.755833, lng: -84.371944 },
    { lat: 32.199167, lng: -84.127222 },
    { lat: 33.810153, lng: -84.145156 },
    { lat: 32.023056, lng: -80.899167 },
    { lat: 33.982778, lng: -84.580833 },
    { lat: 32.031389, lng: -84.392222 },
    { lat: 31.223611, lng: -81.384722 },
    { lat: 31.991667, lng: -81.063056 },
    { lat: 33.749167, lng: -84.388056 },
    { lat: 32.831944, lng: -83.615833 },
    { lat: 33.763388, lng: -84.395093 },
    { lat: 33.762834, lng: -84.392049 },
    { lat: 33.790249, lng: -84.372065 },
    { lat: 33.732677, lng: -84.372462 },
    { lat: 33.954187, lng: -83.372173 },
    { lat: 33.770640, lng: -84.551351 },
    { lat: 33.772685, lng: -84.385297 },
    { lat: 33.790945, lng: -84.385480 },
    { lat: 33.839934, lng: -84.381604 },
    { lat: 33.767714, lng: -84.365331 }
];


function initMap() {
    const mapOptions = {
        center: { lat: 33.75243, lng: -84.39354 },
        zoom: 12,
    };

    map = new google.maps.Map(document.getElementById('map'), mapOptions);

    const layer = new google.maps.FusionTablesLayer({
        query: {
            select: 'Geocodable address',
            from: '1FjVvT2lxm_meECyU7Mn1TaZOvvwu3rJnpZztPqvr',
        },
    });

    layer.addListener('click', function (event) {
        document.getElementById('end').value = event.row.Address.value;
        calculateAndDisplayRoute();
    });

    layer.setMap(map);

    directionsService = new google.maps.DirectionsService();
    directionsDisplay = new google.maps.DirectionsRenderer();
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById('right-panel'));

    const control = document.getElementById('floating-panel');
    control.style.display = 'block';
    map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);

    document.getElementById('but').addEventListener('click', function () {
        calculateAndDisplayRoute();
    });

    pinAllSellers();
}


//Route Distance via Driving Functions
async function calculateAndDisplayRoute() {
    var start = document.getElementById('start').value;
    var end = document.getElementById('end').value;

    directionsService.route(
        {
            origin: start,
            destination: end,
            travelMode: 'DRIVING',
        },
        function (response, status) {
            if (status === 'OK') {
                directionsDisplay.setDirections(response);

                // Extract distance and duration from the response
                const route = response.routes[0].legs[0];
                const distance = route.distance;
                const duration = route.duration;

                // Update the distance and time information on the page
                updateDistanceTimeInfo(distance, duration);
            } else {
                window.alert('Directions request failed due to ' + status);
            }
        }
    );
}

// Rest of the code remains the same.
function updateDistanceTimeInfo(distance, duration) {
    const infoElement = document.getElementById('distance-time-info');
    infoElement.innerHTML = `Distance: ${distance.text}<br>Duration: ${duration.text}`;
}

//Location and Zip Functions
async function useMyLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
            async (position) => {
                currentMarkerLocation = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude,
                };
                currentMarkerTitle = 'User Location';
                updateLocation(currentMarkerTitle, currentMarkerLocation);
            },

            (error) => {
            console.error('Error getting user location:', error);
            }, 
            {
                //This fixes the delay (not sure if it affects accuracy by too much)
                enableHighAccuracy: false,
                timeout: 5000,
                maximumAge: Infinity
            }
        );
    } else {
        alert('Geolocation is not supported by your browser.');
    }
}

async function searchZipCode() {
    const zipCode = document.getElementById('zip-code').value;
    if (zipCode) {
        try {
            currentMarkerLocation = await geocodeZipCode(zipCode);
            
            currentMarkerTitle = 'Zip Code Location'
            updateLocation(currentMarkerTitle, currentMarkerLocation);

        } catch (error) {
            console.error('Error geocoding zip code:', error);
            alert('Invalid zip code or unable to find location.');
        }
    } else {
        alert('Please enter a zip code.');
    }
}

function geocodeZipCode(zipCode) {
    return new Promise((resolve, reject) => {
        const geocoder = new google.maps.Geocoder();
        geocoder.geocode({ address: zipCode }, (results, status) => {
            if (status === 'OK' && results.length > 0) {
                resolve(results[0].geometry.location);
            } else {
                reject(new Error('Invalid zip code or unable to find location.'));
            }
        });
    });
}

function geocodeAddress() {
    var geocoder = new google.maps.Geocoder();
    var address = document.getElementById('addressInput').value;

    geocoder.geocode({ 'address': address }, function (results, status) {
        if (status === 'OK') {
            var location = results[0].geometry.location;
            console.log('Latitude: ' + location.lat());
            console.log('Longitude: ' + location.lng());
        } else {
            console.error('Geocode was not successful for the following reason: ' + status);
        }
    });
}

//General Map Functions
async function pinAllSellers(){
    await getSupplierAddresses()
    .then(getCoordinates)
    .then(pinSellers)
}

async function updateLocation(markerTitle, location)
{
    map.setCenter(location);

    if (currentMarker) {
        currentMarker.setMap(null);
    }
    //RePins Supplier Markers to recalculate distance from new location
    if(supplierMarker) {
        setMapOnAll(null);
        markers = [];
        pinSellers(selectedCategory);
    }

    currentMarker = await addMarker(map, markerTitle, location);
}

function setMapOnAll(map) {
    for (let i = 0; i < markers.length; i++) {
      markers[i].setMap(map);
    }
}


// 40.7484° N, 73.9857° W

//-----------------------------------------------------------------------------------------------------------------------------


async function addMarker(toMap, title, location, address) {
    var marker = new google.maps.Marker({
        position: location,
        map: toMap,
        title: title
    });

    markers.push(marker);

    var distance = google.maps.geometry.spherical.computeDistanceBetween(map.center, location) * 0.000621371;
    distance = distance.toFixed(2);

    var infoContent = `<div style="color: black;">
        <h3 style="color: black;">${title}</h3>
        <p style="color: black;">${address}</p>
        <p style="color: black;">${distance}mi</p>
        <p style="color: black;">Link: <a href="#" id="linkPlaceholder">[Link]</a></p>
        </div>`;

    // Create an InfoWindow with the content
    var infowindow = new google.maps.InfoWindow({
        content: infoContent
    });

    //When ready can make infowindow html template in a separate html file, but for now just using html string
        /*fetch('infowindow-content.html')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Failed to load infowindow-content.html');
                }
                return response.text();
            })
            .then(htmlContent => {
                // Set the content of the InfoWindow to the loaded HTML
                infowindow.setContent(htmlContent);

                // Add a click event listener to the marker
                marker.addListener('click', function () {
                    // Open the InfoWindow when the marker is clicked
                    infowindow.open(map, marker);
                });
            })
            .catch(error => {
                console.error(error);
            });*/
   
    //Opens and closes the Marker's InfoWindow
    google.maps.event.addListener(marker, 'mouseover', function () {
        infowindow.open(map, marker);
    });
    google.maps.event.addListener(marker, 'mouseout', function () {
        infowindow.close(map, marker);
    });

    return marker;
}


async function pinSellers(category) {

    //First probably need to move the JS code from rform.html to an external .js file
    
    //Then above import from that file into this js file (something like this at the top of this file: 
    //import {getAllSuppliers} from './path/to/file.js')

    //Then loop through getAllSuppliers...

    //var suppliers = getAllSuppliers();

    //for (var i = 0; i < suppliers.length; i++) { //do this instead later



    setMapOnAll(null);
    markers = [];

    //Keeps track of the Zip Code or GPS location marker 
    if (currentMarker){
        currentMarker = await addMarker(map, currentMarkerTitle, currentMarkerLocation);
    }
    

    if (category === 'all' || category === undefined) {
   //Adds the hard coded Seller Markers to the map
        for (let i = 0; i < supplierAddresses.length; i++) {
            hardCodedMarker = await addMarker(map, arrayWithHardcodedNames[i], supplierAddresses[i], hardCodedAddresss[i]);
        }
        if(coordinates.length > 0){
            for(let i = 0; i < coordinates.length; i++){
                    supplierMarker = await addMarker(map, supplierName[i], coordinates[i], address[i]);  
            }
        }
    }

    else {
        db_supplierCategory(category);
        for (let i = 0; i < supplierAddresses.length; i++) {
            const isFoodBank = ['Centennial Olympic Park','Piedmont Park','Forsyth Park','Savannah Historic District Park','Chattahoochee River National Recreation Area Park','Stone Mountain Park','Callaway Gardens Park','Jekyll Island State Park','Amicalola Falls State Park','Red Top Mountain State Park'].includes(arrayWithHardcodedNames[i]);
            const isSupermarket =['Martin Luther King Jr. National Historic Site','Andersonville National Historic Site','Stone Mountain Park','Fort Pulaski National Monument','Kennesaw Mountain National Battlefield Park','Jimmy Carter National Historic Site','Fort Frederica National Monument','Wormsloe Historic Site','Georgia State Capitol','Ocmulgee Mounds National Historical Park'].includes(arrayWithHardcodedNames[i]);
            const isFastFood = ['Georgia Aquarium','World of Coca-Cola','Atlanta Botanical Garden','Zoo Atlanta','Georgia Museum of Art','Six Flags Over Georgia','The Fox Theatre','High Museum of Art','Atlanta History Center','Atlanta BeltLine'].includes(arrayWithHardcodedNames[i]);

            if (
                (category === 'Parks' && isFoodBank) ||
                (category === 'HistoricalSites' && isSupermarket) ||
                (category === 'Landmarks' && isFastFood)
            ) {
                hardCodedMarker = await addMarker(map, arrayWithHardcodedNames[i], supplierAddresses[i], hardCodedAddresss[i]);
            }
        }
    }
}

async function db_supplierCategory(category){
    if(coordinates.length>0){
        for(let i = 0; i < coordinates.length; i++){
            if(supplierCategory[i] === 'Parks' && category === 'Parks'){
                supplierMarker = await addMarker(map, supplierName[i], coordinates[i], address[i]); 
            }
            else if(supplierCategory[i] === 'HistoricalSites' && category === 'HistoricalSites'){
                supplierMarker = await addMarker(map, supplierName[i], coordinates[i], address[i]); 
            }
            else if(supplierCategory[i] === 'Landmarks' && category === 'Landmarks'){
                supplierMarker = await addMarker(map, supplierName[i], coordinates[i], address[i]); 
            }
            else if(supplierCategory[i] === 'farmers_market' && category === 'farmers_market'){
                supplierMarker = await addMarker(map, supplierName[i], coordinates[i], address[i]); 
            }
            else if(supplierCategory[i] === 'groceryStore' && category === 'groceryStore'){
                supplierMarker = await addMarker(map, supplierName[i], coordinates[i], address[i]); 
            }
        }
    }
}

//Gets Supplier Addresses from database
async function getSupplierAddresses() {
    try{
        const response = await fetch(url + 'supplierAddress', 
        {
            //Lets fetchAPI know we want to post data
            method: 'GET',
        })
        if(response.status === 200) {
            console.log(response)
            const data = await response.json()

            for (let i = 0; i < data.length; i++) {
                address[i] = data[i].SupplierAddress + ", " +
                data[i].SupplierCityState + " " + data[i].SupplierZip;
                supplierCategory[i] = data[i].FoodCategories 

                supplierName[i] = data[i].SupplierName;

                console.log(supplierName[i] + ": " + address[i])
                console.log("Food Category: " + supplierCategory[i])
            }
        }
        else if (response.status === 204) {
            console.log("Database is empty");
            pinSellers('all');
        }
    
        //Prints if  
        else if (!response.ok) {
            console.log('Something went wrong')
        }
    }
    catch(error){
        console.log("Error with getSupplierAddress")
    }
}

//Gets Coordinates from Supplier Addresses
async function getCoordinates() {
    for(let i = 0; i < address.length; i++) {
    
        const response = await fetch(`https://maps.googleapis.com/maps/api/geocode/json?address=${encodeURIComponent(address[i])}&key=${apiKey}`)
        if(!response.ok){
            console.log("Couldn't get coordinates")
        }
        const data = await response.json()


        if(!data || data.status === 'ZERO_RESULTS') {
            console.log('No results found')
        }
        else{

        coordinates[i] = data.results[0].geometry.location 
        console.log(coordinates[i])
    }
    }
}
// Handdling requests for different food categories.
function getFoodByCategory(category) {
    fetch(`/foods?category=${category}`) // Adjust the endpoint to your server route handling food categories
    .then(handleErrors)
    .then((data) => {
        console.log(data); // Log or handle retrieved data
    })
    .catch((error) => {
        console.error('Error:', error);
    });
}
function testmain() {
    alert("hello");
   
    
}

// Add an event listener to the dropdown menu to call pinSellers with the selected category
document.getElementById('categoryFilter').addEventListener('change', function () {
    selectedCategory = this.value;
    pinSellers(selectedCategory);
});




// Add an event listener to the dropdown menu to adjust map zoom level
document.getElementById('radiusDropdown').addEventListener('change', function () {
    const selectedRadius = parseInt(this.value); // Parse the selected radius as an integer

    // Check if the selectedRadius is a valid number
    if (!isNaN(selectedRadius)) {
        // Adjust the map's zoom level based on the selected radius
        const newZoomLevel = calculateZoomLevel(selectedRadius);

        // Set the new zoom level for the map
        map.setZoom(newZoomLevel);
    }
});

// Function to calculate the zoom level based on the selected radius
function calculateZoomLevel(radius) {
    // You can customize this formula based on your specific requirements
    // For example, you may want to set a minimum and maximum zoom level
    // This is a simple example, you may need to adjust it based on your specific use case
    const minZoom = 3;
    const maxZoom = 25;
    const zoomIncrement = 5;

    // Calculate the zoom level based on the radius
    const zoomLevel = Math.min(maxZoom, Math.max(minZoom, Math.ceil(radius / zoomIncrement) * zoomIncrement));

    return zoomLevel;
}
