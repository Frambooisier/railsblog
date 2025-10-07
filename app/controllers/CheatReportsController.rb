class CheatReportsController < ApplicationController
  def index
    @cheat_reports = CheatReport.all #needs to be first declared so next part has something to work with
    @pagy, @cheat_reports = pagy(@cheat_reports)

  end

  def show
    @cheat_report = CheatReport.find(params[:id])
  end
  def new
@cheat_report = CheatReport.new
end
  def confirmed_players
    @cheat_reports = CheatReport.confirmed
  end

  def edit
@cheat_report = CheatReport.find(params[:id])
  end
  def update
    @cheat_report = CheatReport.find(params[:id])
    if @cheat_report.update(cheat_report_params)
      redirect_to @cheat_report, notice: 'CheatReport was successfully updated.'
    else
      render :edit
    end
  end
  def pending_players
    @cheat_reports = CheatReport.pending
  end

  def suspected_players
    @cheat_reports = CheatReport.suspected
  end
  private
  def cheat_report_params
    params.require(:cheat_report).permit(:name, :player_name, :status, :content, :cover_image)
  end
end
