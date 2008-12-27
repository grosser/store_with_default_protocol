require 'rubygems'
require 'active_record'

#create model table
ActiveRecord::Schema.define(:version => 1) do
  create_table "users" do |t|
    t.string    "name"
    t.string    "website"
    t.string    "image_url"
  end
end

#create model
class User < ActiveRecord::Base
  store_with_default_protocol 'http', :website, :image_url
end