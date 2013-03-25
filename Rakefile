#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

SharpBlog::Application.load_tasks
require "rubygems"
require "sequel"

task :load_old_blog => :environment do
    Post.delete_all
    Tag.delete_all
    Tagging.delete_all
    Sequel.connect("sqlite://#{Rails.root.to_s}/db/blog.sqlite3") do |db| 
    	db[:posts].all do |post|
    		Post.create :title => post[:title], :body => post[:body], :body_html => post[:body_html],
    			:published_at => post[:published_at], :views_count => post[:views_count], :slug => post[:slug],
    			:edited_at => Time.now, :approved_comments_count => post[:approved_comments_count]
    	end
    	db[:tags].all do |tag|
    		Tag.create :taggings_count => tag[:taggings_count], :name => tag[:name]
    	end
    	db[:taggings].all do |tagging|
    		Tagging.create :tag_id => tagging[:tag_id], :taggable_id => tagging[:taggable_id], 
    			:tagger_id => tagging[:tagger_id], :tagger_type => tagging[:tagger_type], 
    			:context => tagging[:context], :taggable_type => tagging[:taggable_type]
    	end
    end
end

 

