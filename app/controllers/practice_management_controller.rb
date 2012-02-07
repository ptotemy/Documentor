class PracticeManagementController < ApplicationController
  def index
    @documents=Document.all


  end

  def practice_document
    @document=Document.find(params[:document_id])
    @practice_examples=Array.new
    @blank_sections=@document.blank_sections
    @blank_sections.each_with_index do |blank_section, index|
      component=Component.find(blank_section.component)
      example=component.examples.shuffle.first
      @practice_examples[index]=Array.new
      @practice_examples[index][0]=example.id
      @practice_examples[index][1]=blank_section.id

    end

    @temp=Temp.new
    @temp.data=@practice_examples
    @temp.save!


  end

  def evaluate_results
    @document=Document.find(params[:document_id])

    @practice_examples=Temp.first.data
    Temp.first.destroy


  end
end
