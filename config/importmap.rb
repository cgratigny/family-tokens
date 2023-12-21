# Pin npm packages by running ./bin/importmap

pin "@hotwired/turbo-rails", to: "https://ga.jspm.io/npm:@hotwired/turbo-rails@8.0.0-beta.1/app/javascript/turbo/index.js", preload: true

pin "@hotwired/turbo", to: "https://ga.jspm.io/npm:@hotwired/turbo@8.0.0-beta.1/dist/turbo.es2017-esm.js"
pin "@rails/actioncable/src", to: "https://ga.jspm.io/npm:@rails/actioncable@7.1.2/src/index.js"

pin "@rails/actiontext", to: "actiontext.js"

pin "application", preload: true

pin "jquery", to: "https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.js"
pin "jquery-ui", to: "https://code.jquery.com/ui/1.12.1/jquery-ui.js"
pin "jquery-ujs", to: "https://cdnjs.cloudflare.com/ajax/libs/jquery-ujs/1.2.2/rails.js", preload: true

pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js", preload: true
pin "vendor/timepicker"
pin "vendor/datepicker"

pin "ahoy", to: "https://ga.jspm.io/npm:ahoy@1.0.1/lib/index.js"
pin "os", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/os.js"
pin "moment", to: "https://ga.jspm.io/npm:moment@2.29.4/moment.js"

pin "@rails/activestorage", to: "https://ga.jspm.io/npm:@rails/activestorage@7.1.1/app/assets/javascripts/activestorage.esm.js"

pin_all_from "app/javascript/controllers", under: "controllers"

pin "stimulus", to: "https://ga.jspm.io/npm:stimulus@3.2.2/dist/stimulus.js"
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.2.2/dist/stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
