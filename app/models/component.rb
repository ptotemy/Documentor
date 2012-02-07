class Component < ActiveRecord::Base
  set_table_name :components
  attr_accessible :name, :component_icon
  has_attached_file :component_icon
  has_many :blank_sections,:dependent => :destroy
  has_many :examples,:dependent => :destroy

  #validates_presence_of :name
  #validates_length_of :name ,:maximum=>255

  #validates_presence_of :component_icon_file_name
  #validates_length_of :component_icon_file_name ,:maximum=>255

  #Schema Information

  #name:string

  #component_icon_file_name:string

  #scopes
  #default_scope order('created_at DESC')
end