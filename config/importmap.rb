# Pin npm packages by running ./bin/importmap

pin "jquery", to: "https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.js", preload: true


pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@rails-ujs", to: "rails-ujs@6.1.4/lib/assets/compiled/rails-ujs.js"
# ... other entries ...
pin "flash_popup", to: "flash_popup.js", preload: true


