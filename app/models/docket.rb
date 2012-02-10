class Docket < ActiveRecord::Base
  set_table_name :dockets
  attr_accessible :name
  has_and_belongs_to_many :document_sets

  #validates_presence_of :name
  #validates_length_of :name ,:maximum=>255

  #Schema Information

  #name:string

  #scopes
  #default_scope order('created_at DESC')
end