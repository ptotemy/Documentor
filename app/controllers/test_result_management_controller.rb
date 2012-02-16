class TestResultManagementController < ApplicationController

  def index
    @teams=current_user.teams

  end

  def view_results
    @team=Team.find(params[:team_id])
    @test=Test.find(params[:test_id])
    @total_score=0
    @test_docs=@test.test_docs

    @test_docs.each do |test_doc|
      test_doc.test_doc_infos.each do |test_doc_info|
        if TestResult.find_by_user_id_and_team_id_and_test_doc_info_id(current_user.id, @team.id, test_doc_info.id).answer_key=test_doc_info.correct
          @total_score=@total_score+1

        end
      end

    end
    @test_score=TestScore.new
    @test_score.user_id=current_user.id
    @test_score.test_id=@test.id
    @test_score.team_id=@team.id
    @test_score.score=@total_score
    @test_score.save!


  end

  def view_corrected_document
    @team=Team.find(params[:team_id])
    @test=Test.find(params[:test_id])
    @document=Document.find(params[:document_id])
    @test_doc=TestDoc.find_by_document_id(@document.id)
    @test_doc_infos=@test_doc.test_doc_infos

  end
end
