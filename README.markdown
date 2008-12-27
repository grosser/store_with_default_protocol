Problem
=======
 - Website or url columns have to be stored with a protocol to be used.
 - Most 'evil' users do not bother to add http:// to their urls.

Solution
========
Store the column with a defult protocol unless a protocol is supplied

Usage
=====

    class User < ActiveRecord::Base
      store_with_default_protocol 'http', :website, :image_url, ...
    end

Author
======
Michael Grosser  
grosser.michael@gmail.com  
Hereby placed under public domain, do what you want, just do not hold me accountable...