class QueriesController < ApplicationController
  def index
    @queries = Query.all
  end

  def new
    @query = Query.new
    @display_query = Query.new
  end

  def create
    @query = Query.new(query_params)
    if @query.save
        emotion_result = Indico.emotion(@query.text)
        
        new_emotion = Emotion.create(
            joy: emotion_result['joy'],
            sad: emotion_result['sadness'],
            fear: emotion_result['fear'],
            anger: emotion_result['anger'],
            surprise: emotion_result['surprise'],
            query_id: @query.id
            )

        @display_query = @query
        @query = Query.new

        render :new
    else
        redirect_to root_path
    end

  end

  def show
    @query = Query.find(params[:id])
  end



  private

  def query_params
    params.require(:query).permit(
        :text
        )
  end

end
