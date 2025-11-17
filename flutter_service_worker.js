'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "0867c3e13649ac4d06fe34b7b3ddce08",
"index.html": "ef5ad37da5bf70f5636f26cf0942beea",
"/": "ef5ad37da5bf70f5636f26cf0942beea",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "086d45e4dec09b37e6f6c6da3a17cddf",
"assets/lib/src/view/screens/home/tabs/additional/adaptive.dart": "26792f069039dc4b6d92e1e1576394b4",
"assets/lib/src/view/screens/home/tabs/additional/brightness_typography.dart": "8c0e7c01bf6e52c51135d6fe5cbc6c6a",
"assets/lib/src/view/screens/home/tabs/additional/colors.dart": "3ab252d129cd2dc26c94eb44ff556401",
"assets/lib/src/view/screens/home/tabs/additional/additional.dart": "cc4c4117b550a358c781ab9670d273b6",
"assets/lib/src/view/screens/home/tabs/icons/icons.dart": "61bd830e582ea40030dfc7154cb9651d",
"assets/lib/src/view/screens/home/tabs/icons/icon_theme.dart": "f66d4aa4f49911d08291d0aa72183df8",
"assets/lib/src/view/screens/home/tabs/icons/icon_all.dart": "8983ae9d2521f824064228a3f686cf73",
"assets/lib/src/view/screens/home/tabs/icons/icon.dart": "569fb5419768cffaac9316beca003ba6",
"assets/lib/src/view/screens/home/tabs/icons/icon_button.dart": "5b41e93035d3e1d8d2921d1b00fdda3f",
"assets/lib/src/view/screens/home/tabs/icons/icon_from.dart": "a1448329b39071fc7a31de5e827abd77",
"assets/lib/src/view/screens/home/tabs/buttons/buttons.dart": "f4ce8359862e41b7d43368bc98307503",
"assets/lib/src/view/screens/home/tabs/buttons/basic_buttons.dart": "0755108c9e73d5398af62553a5bceedc",
"assets/lib/src/view/screens/home/tabs/buttons/menus.dart": "25098c19a1d8a90bc339604792f550ba",
"assets/lib/src/view/screens/home/tabs/buttons/selection_buttons.dart": "0da0bd6a031987fffefd70df191e33c7",
"assets/lib/src/view/screens/home/tabs/buttons/navigation_buttons.dart": "1b6ac3df7d7e869ef5307d621a302d51",
"assets/lib/src/view/screens/home/tabs/surfaces/bottom_sheet.dart": "8adbb5064e36ef9544f77318c76e1435",
"assets/lib/src/view/screens/home/tabs/surfaces/surfaces.dart": "25b13ad25d2e83b2c2bf873ad9cf0422",
"assets/lib/src/view/screens/home/tabs/surfaces/dialog.dart": "1448f5e8b9ca3b840caab1f842138d17",
"assets/lib/src/view/screens/home/tabs/surfaces/list_tile.dart": "8558e3f93a33f111b59c112c8f69efb9",
"assets/lib/src/view/screens/home/tabs/fields/text_form_field.dart": "97d293542f18644fac83270ca79b6fb4",
"assets/lib/src/view/screens/home/tabs/fields/fields.dart": "54ef109d54cd52a9e18e08e6bfa69188",
"assets/lib/src/view/screens/home/tabs/fields/text_field.dart": "261755827fbefa654fd3309b04d34a27",
"assets/lib/src/view/screens/home/tabs/fields/autocomplete_field.dart": "ae97421206309c47b8018a699fd12085",
"assets/lib/src/view/screens/home/tabs/navigation/tab_bar_preferred.dart": "b662884136bd9c33eb469710f9b31b12",
"assets/lib/src/view/screens/home/tabs/navigation/navigation_view.dart": "fa4161ed01ce648705c6189330349b58",
"assets/lib/src/view/screens/home/tabs/navigation/navigation.dart": "99ece3c39c6bb728033a8f6891654f9c",
"assets/lib/src/view/screens/home/tabs/navigation/tab_view.dart": "fd8331658e1f58db96b277263c6ffba2",
"assets/lib/src/view/screens/home/tabs/layouts/layouts.dart": "3e9ca1864159d3bcb1800203bb9e2f92",
"assets/lib/src/view/screens/home/tabs/layouts/scaffold_page.dart": "e74011eef077413ecdab4b975f332012",
"assets/lib/src/view/screens/home/tabs/layouts/scaffold.dart": "aabefa7c695dd8379cbdb103d63149a8",
"assets/lib/src/view/screens/home/tabs/pickers/date_picker.dart": "5dc68df3a61dd501ff2ea212aea7ead1",
"assets/lib/src/view/screens/home/tabs/pickers/time_picker.dart": "f4e65424b3ccbcafcdfb25f044aee14c",
"assets/lib/src/view/screens/home/tabs/pickers/pickers.dart": "1a921b622265b8a53d960d371d80f431",
"assets/lib/src/view/screens/home/tabs/indicators/indicators.dart": "1069ab589acd868b2d3e85afc29992c7",
"assets/lib/src/view/screens/home/tabs/indicators/slider_discrete.dart": "64cc2261de6bd56b0d8409bcfdc9cc53",
"assets/lib/src/view/screens/home/tabs/indicators/slider_continuous.dart": "e4a14f89dedbe965b9fa1b02f80d0bc0",
"assets/lib/src/view/screens/home/tabs/indicators/circular_progress_indicator.dart": "fa59a6b6fb36e22e4c194082c1d47c63",
"assets/fonts/MaterialIcons-Regular.otf": "84460ae93522aae8091a76cf985c983d",
"assets/NOTICES": "92eed7b7a90b93a51cef123219c0cb06",
"assets/packages/adp_mobile_preview/assets/ios-bar-white.png": "8f1b8848c5e4c95ea35f92f65883baa9",
"assets/packages/adp_mobile_preview/assets/appleicon.ttf": "c4dba022f47759c31be8e7c70db60b88",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b84b8e8b8a6cdf3c61a843ca2172d334",
"assets/packages/window_manager/images/ic_chrome_maximize.png": "af7499d7657c8b69d23b85156b60298c",
"assets/packages/window_manager/images/ic_chrome_unmaximize.png": "4a90c1909cb74e8f0d35794e2f61d8bf",
"assets/packages/window_manager/images/ic_chrome_close.png": "75f4b8ab3608a05461a31fc18d6b47c2",
"assets/packages/window_manager/images/ic_chrome_minimize.png": "4282cd84cb36edf2efb950ad9269ca62",
"assets/FontManifest.json": "ce9856f1c9aae1c760af02ed9eb4e6d9",
"assets/AssetManifest.bin": "deb9702b8a99cda6ec21b980fc10831c",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter_bootstrap.js": "9302b1008d4d9ab980080c9988fed55b",
"version.json": "ff966ab969ba381b900e61629bfb9789",
"main.dart.js": "557dab68a939c6d28403684181a6e2c6"};
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
