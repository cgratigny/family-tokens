/*******************************************************************
 * WARNING: BE CAREFUL WHEN MODIFYING THIS FILE!
 * The order of imports in this file matters.
 * Changing the order of imports can break dependencies between JavaScript libraries,
 * causing errors in the application.
 * Only change the import order if you fully understand the dependency chain.
 *******************************************************************/

// Import Rails specific packages
import { Turbo } from "@hotwired/turbo-rails"
// "optin" - No turbo forms unless you insist. Use data-turbo="true" to enable turbo on individual forms.
Turbo.setFormMode("optin")
import "@rails/actiontext"
import "@rails/activestorage"

import "application"

// Import third-party libraries
import "ahoy"

import "controllers"
