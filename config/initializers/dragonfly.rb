require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick,
    convert_command:  `which convert`.strip.presence || '/usr/local/bin/convert',
    identify_command: `which identify`.strip.presence || '/usr/local/bin/identify'

  verify_urls true

  secret 'f879c16a083ff38f727ebfe2807adcd495df64587afa91bc1bd44720954b0788'

  url_format '/images/dynamic/:job/:basename.:ext'

  fetch_file_whitelist /public/

  fetch_url_whitelist /.+/
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware