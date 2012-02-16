class ExampleSetsController < ApplicationController

  def index
    @example_sets = ExampleSet.all
    @example_set = ExampleSet.new

  end

  def show

    @example_set = ExampleSet.find(params[:id])

  end

  def new
    @example_set = ExampleSet.new
    @components=Component.all
    Component.all.count.times { @example_set.examples.build }

  end

  def create
    #render :text=>params
    #return
    @example_set = ExampleSet.new(params[:example_set])
    if @example_set.save
      if !params[:integrated_view].nil?
        redirect_to example_sets_integrated_view_path, :notice => "Successfully created example set."
      else
        redirect_to example_sets_url, :notice => "Successfully created example set."
      end
    else
      render :new
    end
  end

  def edit
    @example_set = ExampleSet.find(params[:id])
    @components=Component.all

    if !params[:get].nil?
      render :layout=>false
    end
  end

  def update
    @example_set = ExampleSet.find(params[:id])
    if @example_set.update_attributes(params[:example_set])
      if !params[:integrated_view].nil?
        redirect_to example_sets_integrated_view_path, :notice => "Successfully created example set."
      else
        redirect_to example_sets_url, :notice => "Successfully created example set."
      end


    else
      render :edit
    end
  end

  def destroy
    @example_set = ExampleSet.find(params[:id])
    @example_set.destroy
    if !params[:integrated_view].nil?

      redirect_to example_sets_integrated_view_path, :notice => "Successfully destroyed example set."
    else
      redirect_to example_sets_url, :notice => "Successfully destroyed example set."
    end
  end

  def parse_save_from_excel
    test_file = params[:excel_file]
    file = FileUploader.new
    if file.store!(test_file)
      book = Spreadsheet.open "#{file.store_path}"
      sheet1 = book.worksheet 0

      @example_set = []
      @errors = Hash.new
      @counter = 0

      sheet1.each 1 do |row|
        @counter+=1
        p = ExampleSet.new

        p.name = row[0]
        unless ExampleSet.find_by_name(p.name)
          if p.valid?
            p.save
          else
            @errors["#{@counter+1}"] = p.errors
          end
        end
      end
      file.remove!
      if @errors.empty?
        redirect_to example_set, notice: 'All Dummy data were successfully uploaded.'
      else
        redirect_to example_set, notice: 'There were some errors in your upload'
      end

    else
      redirect_to example_set, notice: 'Dummy datum could not be successfully uploaded.'
    end
  end

  def integrated_view
    @example_sets = ExampleSet.all
    @example_set = ExampleSet.new
    Component.all.count.times { @example_set.examples.build }
    render :layout=>'scaffold'

  end
end
