class Set < ActiveRecord::Base
  set_table_name :sets
  attr_accessible :name

  has_many :examples,:dependent => :destroy

  #validates_presence_of :name
  #validates_length_of :name ,:maximum=>255

  #Schema Information

  #name:string

  #scopes
  #default_scope order('created_at DESC')
end