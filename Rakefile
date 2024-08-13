# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task default: :spec

namespace :range do
  desc "Generate range definition files"
  task :generate do
    ruby "scripts/generate_range_files.rb --dir data"
  end
end
