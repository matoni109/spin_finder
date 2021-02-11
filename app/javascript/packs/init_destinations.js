import mapboxgl from 'mapbox-gl';
// Not our Mapbox token. Taken from another user on Codepen as temp
mapboxgl.accessToken = 'pk.eyJ1IjoiYWx1a2FjaCIsImEiOiJ3US1JLXJnIn0.xrpBHCwvzsX76YlO-08kjg';

let map = new mapboxgl.Map({
    container: 'destination-map',
    style: 'mapbox://styles/mapbox/streets-v8',
    center: [145.035831, -37.994890],
    zoom: 12.5,
    bearing: 27,
    pitch: 45
});

let chapters = {
    'beach-road': {
        bearing: 27,
        center: [145.035831, -37.994890],
        zoom: 15.5,
        pitch: 20
    },
    'yarra-blvd': {
        duration: 9000,
        center: [145.0120, -37.80094],
        bearing: 150,
        zoom: 15,
        pitch: 0
    },
    'dandenongs': {
        bearing: 90,
        center: [145.351117, -37.863193],
        zoom: 13,
        speed: 0.6,
        pitch: 40
    },
    'lysterfield': {
        bearing: 90,
        center: [145.301865, -37.964879],
        zoom: 12.3
    }
};

// On every scroll event, check which element is on screen
window.onscroll = function() {
    let chapterNames = Object.keys(chapters);
    for (var i = 0; i < chapterNames.length; i++) {
        let chapterName = chapterNames[i];
        if (isElementOnScreen(chapterName)) {
            setActiveChapter(chapterName);
            break;
        }
    }
};

let activeChapterName = 'beach-road';
const setActiveChapter = (chapterName) => {
    if (chapterName === activeChapterName) return;

    map.flyTo(chapters[chapterName]);

    document.getElementById(chapterName).setAttribute('class', 'active');
    document.getElementById(activeChapterName).setAttribute('class', '');

    activeChapterName = chapterName;
}

const isElementOnScreen = (id) => {
    let element = document.getElementById(id);
    let bounds = element.getBoundingClientRect();
    return bounds.top < window.innerHeight && bounds.bottom > (window.innerHeight / 2);
}


const initDestinations = () => {
  const mapElementDestination = document.getElementById('destination-map');
    if (element) {
      const destinationMap = buildMap(element);
    }
}


export { initDestinations }
