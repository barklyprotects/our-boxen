require 'facter'
require "boxen/config"

config      = Boxen::Config.load

facts = {}


facts["home"] = "/Users/#{config.user}"
facts["cylent_repo_dir"] = "/Users/#{config.user}/cylent"
facts["cylent_golang_path"] = "/Users/#{config.user}/cylent/golang"
facts["cylent_dotfiles"] = "/Users/#{config.user}/cylent/dotfiles"
facts["cylent_env"] = "/Users/#{config.user}/.env"

facts.each { |k, v| Facter.add(k) { setcode { v } } }
