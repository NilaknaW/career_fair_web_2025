'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "bbf4921e4c09ae4b5d8167bc3a6c63d8",
"assets/AssetManifest.bin.json": "6569599a1d923998a6879ded89fd484d",
"assets/AssetManifest.json": "946806ca88991247e08cfbb565d7fc0e",
"assets/assets/images/1.png": "77e6e437e48810dc8f1bc5144f4179c0",
"assets/assets/images/29.jpeg": "4086c920f85b68294601e8109ca30417",
"assets/assets/images/30.jpeg": "fdda1a713457494ed15e271d364f3e23",
"assets/assets/images/entc_logo.png": "f0dbcbe08c48aea5be4157b118401560",
"assets/assets/images/gallery/1.jpeg": "f90969f5bcbf5234ffcead26674f0e7f",
"assets/assets/images/gallery/10.jpeg": "c9a7785e4ab871a260591c966180bf85",
"assets/assets/images/gallery/11.jpeg": "4fc5cf6bdd38c5473fd328f5b470ec2c",
"assets/assets/images/gallery/12.jpeg": "561f5e58f135123b9e2e596e84d53954",
"assets/assets/images/gallery/13.jpeg": "39b77865c16ef986a18dde581b223fd5",
"assets/assets/images/gallery/14.jpeg": "fad4a0665081236b0d8b5b8382bd74fe",
"assets/assets/images/gallery/15.jpeg": "27b5203dee897dfaedd7482f9e1cccb7",
"assets/assets/images/gallery/16.jpeg": "f9e1a9f3650f14ebb86d8629f33c3ac0",
"assets/assets/images/gallery/17.jpeg": "7ef6e5e711169eeaa7c7c787dd2af5dd",
"assets/assets/images/gallery/18.jpeg": "ba5e58d5b5e3df211855d33f7d44dccc",
"assets/assets/images/gallery/19.jpeg": "a68800989b422d836ff0b3637bf995a6",
"assets/assets/images/gallery/2.jpeg": "5c60dd63c950680cefef47a093b7cdd4",
"assets/assets/images/gallery/20.jpeg": "c07c4a0b38d5dcff9e12ccbd1d462158",
"assets/assets/images/gallery/21.jpeg": "42072aa42f5c0edc61eec436e1063d81",
"assets/assets/images/gallery/22.jpeg": "129f159238cf0dd955f06e4cbbe580a5",
"assets/assets/images/gallery/23.jpeg": "82189905e60b43e34df79e72b25d923f",
"assets/assets/images/gallery/24.jpeg": "a6d42fcd40494c89f25441fddb81e63e",
"assets/assets/images/gallery/25.jpeg": "16b0b5e3eaaa3853b4212df63b53e783",
"assets/assets/images/gallery/26.jpeg": "bf5e33c3f10661216cb25d778c128f99",
"assets/assets/images/gallery/27.jpeg": "3791022f2ff2469835dffb6b3dd13640",
"assets/assets/images/gallery/28.jpeg": "a1efd839cea8b0fca7898f8350dee91d",
"assets/assets/images/gallery/3.jpeg": "bd9014a9e8bc9a5fd4d2b7699fd5613a",
"assets/assets/images/gallery/4.jpeg": "fe23f3678eea3206502a08e004ea01d1",
"assets/assets/images/gallery/5.jpeg": "75a9972e9e9856613d16241f5ee72654",
"assets/assets/images/gallery/6.jpeg": "3fe5660b03466e95314f4f42b7682802",
"assets/assets/images/gallery/7.jpeg": "63cd1fe5139b85281bd8c2987fe6983f",
"assets/assets/images/gallery/8.jpeg": "217061e2dc4cdf71beaea97c7a349a85",
"assets/assets/images/gallery/9.jpeg": "444a06c9162198d05e1613056f84c598",
"assets/assets/images/left_arrow.png": "584585fb723bf19b5862227f57a52a02",
"assets/assets/images/left_pic_bg.png": "93ff8b7dc38ea82d5a656b174f086c13",
"assets/assets/images/logo_cf.png": "896a02fd8e5cc64a2ef92fb67f96755f",
"assets/assets/images/proposal.png": "3e6a4abdcf7efd4e0b639f2bb7efb8d5",
"assets/assets/images/recruit.png": "f5d68468ce9d02404e7c2d3343887909",
"assets/assets/images/right_arrow.png": "5c0bbf7eadf1e8105005f8253ef1ade7",
"assets/assets/images/right_pic_bg.png": "4e250cef4f5657d58501266e08c54f5f",
"assets/assets/videos/intro.mp4": "5b6a683109059085e6ed5949734977cf",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "dec756719dc4fd25fe2093ed41548140",
"assets/NOTICES": "ab348efa08530190c913da41cc918fdc",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "391ff5f9f24097f4f6e4406690a06243",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "ed8d7a4405c40349366750676292a214",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "db802452b92becd297f30aedaab841f9",
"/": "db802452b92becd297f30aedaab841f9",
"main.dart.js": "ad040e77d4570ae404d26b988c964703",
"manifest.json": "8708724f5d648b6b947e3f232532dc6b",
"version.json": "0e17aed5b826a75c1cc8df3656cb215a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
