require 'machinist/active_record'
require 'machinist/object'
require 'sham'
require 'faker'

# require all files in blueprints dir.
blueprints_dir = Rails.root + 'test/blueprints'
Dir.entries(blueprints_dir).reject { |entry| entry =~ /^\./ }.each do |entry|
  require "#{blueprints_dir}/#{entry}"
end

Sham.title { Faker::Company.bs }
Sham.imdb_id { "tt#{rand(10000)}" }
Sham.year { [19, 20].rand.to_s + rand(99).to_s.rjust(2, '0') }
