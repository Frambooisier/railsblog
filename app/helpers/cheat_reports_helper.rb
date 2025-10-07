module CheatReportsHelper
  def cheat_reports_subpages
    [
      { name: "Confirmed Players", path: confirmed_players_cheat_reports_path },
      { name: "Pending Players", path: pending_players_cheat_reports_path },
      { name: "Suspected Players", path: suspected_players_cheat_reports_path }
    ]
  end
end
