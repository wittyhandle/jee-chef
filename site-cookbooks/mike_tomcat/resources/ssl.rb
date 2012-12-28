actions :enable, :disable

attribute :alias, :kind_of => String, :name_attribute => true
attribute :store_name, :kind_of => String
attribute :store_directory, :kind_of => String
attribute :secret, :kind_of => String

attribute :cn, :kind_of => String
attribute :ou, :kind_of => String
attribute :o, :kind_of => String
attribute :c, :kind_of => String

attribute :validity, :kind_of => Integer
attribute :user, :kind_of => String