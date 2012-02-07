class DocketsController < ApplicationController

  def index
    @dockets = Docket.all
    @docket = Docket.new

  end

  def show

    @docket = Docket.find(params[:id])

  end

  def new
    @docket = Docket.new

  end

  def create
    @docket = Docket.new(params[:docket])
    if @docket.save
      redirect_to docket_integrated_view_path, :notice => "Successfully created docket."
    else
      render :new
    end
  end

  def edit
    @docket = Docket.find(params[:id])
    if !params[:get].nil?
      render :layout=>false
    end
  end

  def update
    @docket = Docket.find(params[:id])
    if @docket.update_attributes(params[:docket])
      redirect_to docket_untegrated_view_path, :notice => "Successfully updated docket."
    else
      render :edit
    end
  end

  def destroy
    @docket = Docket.find(params[:id])
    @docket.destroy
    redirect_to docket_untegrated_view_path, :notice => "Successfully destroyed docket."
  end

  def parse_save_from_excel
    test_file = params[:excel_file]
    file = FileUploader.new
    if file.store!(test_file)
      book = Spreadsheet.open "#{file.store_path}"
      sheet1 = book.worksheet 0

      @docket = []
      @errors = Hash.new
      @counter = 0

      sheet1.each 1 do |row|
        @counter+=1
        p = Docket.new

        p.name = row[0]
        unless Docket.find_by_name(p.name)
          if p.valid?
            p.save
          else
            @errors["#{@counter+1}"] = p.errors
          end
        end
      end
      file.remove!
      if @errors.empty?
        redirect_to docket, notice: 'All Dummy data were successfully uploaded.'
      else
        redirect_to docket, notice: 'There were some errors in your upload'
      end

    else
      redirect_to docket, notice: 'Dummy datum could not be successfully uploaded.'
    end
  end

  def integrated_view
    @dockets = Docket.all
    @docket = Docket.new
    render :layout=>'scaffold'

  end

  def add_documents
    @docket=Docket.find(params[:docket_id])
    @documents=Document.all
    @docket_documents=Array.new(@documents.count) { DocketDocuments.new }

  end

  def confirm_documents

    @docket_documents = params[:docket_documents].values.collect { |doc| DocketDocuments.new(doc) }
    @docket_documents.each do |dok_doc|
      dok_doc.save!
    end
    redirect_to "add_documents/#{@docket_documents[0].docket_id}"

  end
end
