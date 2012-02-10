class Document < ActiveRecord::Base
  set_table_name :documents
  attr_accessible :name, :blank_form ,:document_set_id
  has_attached_file :blank_form
  has_many :blank_sections,:dependent => :destroy
  belongs_to :document_set

  has_and_belongs_to_many :dockets


  #validates_presence_of :name
  #validates_length_of :name ,:maximum=>255

  #validates_presence_of :blank_form_file_name
  #validates_length_of :blank_form_file_name ,:maximum=>255

  #Schema Information

  #name:string

  #blank_form_file_name:string

  #scopes
  #default_scope order('created_at DESC')
end