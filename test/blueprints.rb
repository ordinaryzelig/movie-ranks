require 'machinist/active_record'
require 'machinist/object'
require 'sham'
require 'faker'

# require all files in blueprints dir.
blueprints_dir = Rails.root + 'test/blueprints'
Dir.entries(blueprints_dir).reject { |entry| entry =~ /^\./ }.each do |entry|
  require "#{blueprints_dir}/#{entry}"
end
