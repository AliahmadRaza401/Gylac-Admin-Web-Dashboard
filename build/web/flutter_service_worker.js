'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/asset/badge.png": "217854072f3c4f87536db26b3d693c07",
"assets/asset/bike.png": "1a7c4e4738bf1ab63abe8f3ce9f8f14b",
"assets/asset/car.png": "47d71fa07335b4bf908d877c69b97823",
"assets/asset/DashboardIcons/Admin%2520Panel%25202.png": "6c8aabada4d908ef13d481fff3dd5c46",
"assets/asset/DashboardIcons/Admin%2520Panel%25202@3x.png": "ace405363ebcd513e4ae394307e8cabf",
"assets/asset/DashboardIcons/airplane%25201.png": "cc69628dd121eedaf7dfd9bea080feed",
"assets/asset/DashboardIcons/background.png": "90f9fa28bad069236cd218476a5f69ad",
"assets/asset/DashboardIcons/chat.png": "35f2f1689f9c67e746df05112d624818",
"assets/asset/DashboardIcons/check-circle%25201.png": "9dc3909184e4fbdb3bca114f6d8177c1",
"assets/asset/DashboardIcons/customers.png": "21da74c222aa6387248db09d65311f6a",
"assets/asset/DashboardIcons/deliverd.png": "15fcb9fc932a905db077e943f2ed35a1",
"assets/asset/DashboardIcons/delivery-truck.png": "2b7e4757c5c4c2887f69f12dbe2050b1",
"assets/asset/DashboardIcons/doc.png": "ab4bbce85637459128c79ad7f4300e94",
"assets/asset/DashboardIcons/document.png": "9c2460dd7b33715139e038f8ccf20634",
"assets/asset/DashboardIcons/filter.png": "4d6ce9625fdf9ec2dca7a91c5545d8a9",
"assets/asset/DashboardIcons/Group.png": "ddd7008342bbdfabe6f781a0c7b289d9",
"assets/asset/DashboardIcons/ic_dashboard.png": "a62fa367fa30f2a44ebf2fc2722029f2",
"assets/asset/DashboardIcons/ic_sort.png": "f16c966d88cd9afeda4fe2bed5dc1e59",
"assets/asset/DashboardIcons/notification.png": "1c0c0e1bb02d0cddae6b4936004393a0",
"assets/asset/DashboardIcons/notifications.png": "cafe6565f71678ffa4b9640451d40612",
"assets/asset/DashboardIcons/pendin.png": "b083b54223b4d5cfe60fe1bfc48af611",
"assets/asset/DashboardIcons/pinloction.png": "2ba8e73e82dcfa236178b8f136422bc8",
"assets/asset/DashboardIcons/pngtree-send-express-delivery-logistics-poster-picture-image_1014463.jpg": "f9509e57658afbedb51cad94822d38f8",
"assets/asset/DashboardIcons/profile.png": "6ebdcbf2026adceca1b16b36ba9a6064",
"assets/asset/DashboardIcons/profileGroup.png": "4aded53970832d3b79928540313bb328",
"assets/asset/DashboardIcons/promos.png": "dfe32da65c9789d720f54965ed4f924b",
"assets/asset/DashboardIcons/red_circle.png": "d3f99a92e9439793d31512981df2e239",
"assets/asset/DashboardIcons/refreshs.png": "2ac880eb14082231cda5cf5ddf94c9b9",
"assets/asset/DashboardIcons/revenue.png": "af930c7c73370425f06c5ad583812d8b",
"assets/asset/DashboardIcons/setting.png": "b75f15540b62484b6854e6cf50afcbb1",
"assets/asset/DashboardIcons/Template-banner-of-car-pick-up-and-drop-service-06-large.jpg": "8602788b72c90edb601750e918721a66",
"assets/asset/DashboardIcons/united-states%25201.png": "a7f3afbad968b9db35625564c34f44cf",
"assets/asset/DashboardIcons/Vector.png": "dfba0aa956bd06e76f25ca009c270ed0",
"assets/asset/DashboardIcons/x-circle%25201.png": "9c7f06cbcb3b0d31525ef75e64706f28",
"assets/asset/delivery-truck.png": "453f7b58da9fdb3ef552725aae8cd487",
"assets/asset/download.png": "05740106ba457f0224b1023cfa37b0b9",
"assets/asset/drivers.png": "fc6d1df4a7cb4ad3d693aaa83bbb4334",
"assets/asset/Group%25208503.png": "f596cfe26edabee06a3df0ef0e5ce31e",
"assets/asset/lock.png": "8c93105c622819db356f9a2f2f57a96c",
"assets/asset/logo.jpeg": "4f9dd552806ca0a4c9cae6ee9048135b",
"assets/asset/message.png": "613872f1bd4dcb05754b1f30831b83ef",
"assets/asset/miniTruck.png": "5941b42eba57240011b93c9f56348917",
"assets/asset/notificationsIcon.png": "e1ad4a1f61dbfa9a963fcee3070215c8",
"assets/asset/orderlist.png": "7b64e7157e53d5f26c97c16a15229987",
"assets/asset/payments.png": "aa008dc9a252c44e3456815e462081b4",
"assets/asset/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/asset/profileImage.png": "38a2742b3ae66abb3396869d5870fb1f",
"assets/asset/promotion.png": "384970e25a5ebcf980dc03f944e0b725",
"assets/asset/reviewIcon.png": "b7fb9d972f7f40b5d6f8dcbcfa92e66c",
"assets/asset/support.png": "7f888d2ca2474c447d0bb8b667c3a66a",
"assets/asset/Truck.png": "dc3a798fb27f501aed2cbd31fd5d6c29",
"assets/asset/Van.png": "3ac5bdb3cd0a79e39c943d5a00cdcf98",
"assets/AssetManifest.json": "7486d051e3c0cc8b9007c3b19a445eb8",
"assets/FontManifest.json": "f7523b088ca5441633acaae344530050",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "1b4bdc561bb16a222a3f47e014928936",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/im_stepper/assets/me.jpg": "487511e754834bdf2e6771376d59707e",
"assets/shaders/ink_sparkle.frag": "7986514fa2d9902b2cf071effd12f753",
"canvaskit/canvaskit.js": "cf51f0145ed508c7203981a6297dfb6c",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/profiling/canvaskit.js": "e069e181424052299c5bffb1b300bb13",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"cors.json": "ad3f1915302f25f5866ee83f97c41f21",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "db931120412af26cc1511fa058afaf0a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/loadingGif.gif": "e25fa157a9d31cefb78d47c5621b759e",
"index.html": "b9fe4eaa60eb1c3c23f859a106127481",
"/": "b9fe4eaa60eb1c3c23f859a106127481",
"main.dart.js": "291ecf576cedaddd356a033b632b7e09",
"manifest.json": "9b26f321c9c7950fd58ed593a584225f",
"styles.css": "2d03e96d00881c04485cac6f4fefd767",
"version.json": "1ce9e248ca6f2d52a14f726e729716d5"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
