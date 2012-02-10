class TestManagementController < ApplicationController

  def index
    @teams=current_user.teams


  end

  def view_checklist
    @team=Team.find(params[:team_id])
    @test=Test.find(params[:test_id])
    @docket=Docket.find(@test.source_id)
    @document_sets=@docket.document_sets

  end

  def set_checklist


    @score=0
    @total_pages=0
    @team=Team.find(params[:team_id])
    @test=Test.find(params[:test_id])
    @docket=Docket.find(@test.source_id)
    @document_sets=@docket.document_sets
    @document_sets.each do |document_set|
      @total_pages=@total_pages+document_set.documents.count
      document_set.documents.each do |document|
        if !params[document.id.to_s].nil?
          @score=@score+1
        end
      end


    end

    @test_checklist_data=TestChecklistData.new
    @test_checklist_data.test_id=@test.id
    @test_checklist_data.team_id=@team.id
    @test_checklist_data.user_id=current_user.id
    @test_checklist_data.score=@score*100/@total_pages
    @test_checklist_data.save!
    redirect_to take_test_path(:test_id=>@test.id, :team_id=>@team.id)

  end

  def take_test
    @team=Team.find(params[:team_id])
    @test=Test.find(params[:test_id])
    @test_docs=@test.test_docs
    if params[:current_doc_number].nil?
      @current_doc_number=0
    else
      @current_doc_number=params[:current_doc_number]
    end
    @test_doc=@test_docs[@current_doc_number.to_i]
    @document=Document.find(@test_doc.document_id)
    @test_doc_infos=@test_doc.test_doc_infos
    @next_page_number=@current_doc_number.to_i+1
    @total_pages=@test_docs.count


  end

  def save_results
    @test_doc=TestDoc.find(params[:test_doc_id])
    @test_doc_infos=@test_doc.test_doc_infos
    @test_doc_infos.each do |test_doc_info|
      @test_result=TestResult.new
      @test_result.test_doc_info_id=test_doc_info.id
      @test_result.answer_key=params[test_doc_info.id.to_s]
      @test_result.user_id=current_user.id
      @test_result.team_id=params[:team_id]
      @test_result.save!

    end
    if params[:next_page_number]==params[:total_pages]
      redirect_to user_path, :notice => "Test Completed"
    else
      redirect_to take_test_path(:test_id=>@test_doc.test_id, :team_id=>params[:team_id], :current_doc_number=>params[:next_page_number])
    end

  end
end
