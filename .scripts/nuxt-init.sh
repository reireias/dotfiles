#!/bin/bash

echo "overwrite layout/default.vue pages/index.vue"
cp ~/.scripts/files/nuxt/default.vue ./layouts/default.vue
cp ~/.scripts/files/nuxt/index.vue ./pages/index.vue

echo "remove unnecessary files"
rm pages/inspire.vue components/Logo.vue components/VuetifyLogo.vue
