import java.util.HashMap;
import java.util.List;
import java.lang.Math;

import spark.ModelAndView;
import spark.template.velocity.VelocityTemplateEngine;

import static spark.Spark.*;

public class App {
  public static void main(String[] args) {
    staticFileLocation("/public");
    String layout = "templates/layout.vtl";


    get("/", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      List<Gm> allGms = Gm.all();
      model.put("allGms", allGms);
      model.put("template", "templates/index.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/create-team", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      String userName = request.queryParams("userName");
      Gm newGm = new Gm(userName);
      newGm.save();
      request.session().attribute("currentGm", newGm);
      model.put("gm", newGm);
      model.put("availableLeagues", League.availableLeagues());
      model.put("template", "templates/create-team.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/team/:id", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      int leagueId = Integer.parseInt(request.queryParams("leagueId"));
      String teamName = request.queryParams("teamName");
      Gm gm = request.session().attribute("currentGm");
      Team newTeam = new Team(teamName, gm.getId());
      newTeam.save();
      if (leagueId != 0) {
        League league = League.find(leagueId);
        league.addTeam(newTeam);
        model.put("league", league);
      }
      model.put("newTeam", newTeam);
      model.put("gm", gm);
      model.put("leagueId", leagueId);
      model.put("template", "templates/team.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/new-league/:id", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      String leagueName = request.queryParams("leagueName");
      int newTeamId = Integer.parseInt(request.queryParams("newTeamId"));
      Team newTeam = Team.find(newTeamId);
      League newLeague = new League(leagueName);
      newLeague.save();
      newLeague.addTeam(newTeam);
      int gmId = Integer.parseInt(request.params("id"));
      Gm gm = Gm.find(gmId);
      model.put("gm", gm);
      model.put("newTeam", newTeam);
      model.put("league", newLeague);
      model.put("leagueId", newLeague.getId());
      model.put("template", "templates/team.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/gm/:id", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      Gm gm = request.session().attribute("currentGm");
      model.put("gmsTeams", gm.allTeams());
      model.put("gm", gm);
      model.put("template", "templates/gm.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/hello", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      int gmId = Integer.parseInt(request.queryParams("gmId"));
      Gm gm = Gm.find(gmId);
      request.session().attribute("currentGm", gm);
      model.put("gmsTeams", gm.allTeams());
      model.put("gm", gm);
      model.put("template", "templates/gm.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/draft/:id", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      int leagueId = Integer.parseInt(request.params("id"));
      League league = League.find(leagueId);
      List<Team> draftOrder = league.draftOrder();
      int leagueSize = draftOrder.size();
      int draftPosition = 0;
      Team currentTeam = draftOrder.get(draftPosition % leagueSize);
      int round = (int) Math.ceil(((double) draftPosition + 1) / (double) leagueSize);

      if (draftPosition < leagueSize * 8) {
        //add player logic - use evaluateplayer() not addplayer()
        draftPosition++; // pass this around via hidden form fields or cookies
      }

      request.session().attribute("draftOrder", draftOrder);
      request.session().attribute("leagueSize", leagueSize);
      request.session().attribute("draftPosition", draftPosition);
      model.put("players", Player.all());
      model.put("round", round);
      model.put("currentTeam", currentTeam);
      model.put("league", league);
      model.put("template", "templates/draft.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());



  }
}
