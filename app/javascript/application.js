// Entry point for the build script in your package.json
//= require google_maps_api

import "./controllers"
import "@hotwired/turbo-rails"
import jquery from "jquery"
window.$ = window.jQuery = jquery
import * as bootstrap from "bootstrap"
window.bootstrap = bootstrap