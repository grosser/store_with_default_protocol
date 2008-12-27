require 'rubygems'
require 'active_record'

#create model table
ActiveRecord::Schema.define(:version => 1) do
  create_table "users" do |t|
    t.string    "name"
    t.string    "website"
    t.string    "image_url"
    t.string    "git_url"
    t.string    "overwritten_url"
  end
end

#create model
class User < ActiveRecord::Base
  store_with_default_protocol 'git', :git_url
  store_with_default_protocol 'http', :website, :image_url

  def overwritten_url=(value)
    write_attribute(:overwritten_url,value.to_s+'-1')
  end
  store_with_default_protocol 'http', :overwritten_url
end