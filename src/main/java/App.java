import java.util.HashMap;
import java.util.List;

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

    post("/gm/:id", (request, response) -> {
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
      model.put("gm", gm);
      model.put("leagueId", leagueId);
      model.put("template", "templates/gm.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/new-league/:id", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      String leagueName = request.queryParams("leagueName");
      League newLeague = new League(leagueName);
      newLeague.save();
      int gmId = Integer.parseInt(request.params("id"));
      Gm gm = Gm.find(gmId);
      model.put("gm", gm);
      model.put("league", newLeague);
      model.put("leagueId", newLeague.getId());
      model.put("template", "templates/gm.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/hello", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      int gmId = Integer.parseInt(request.queryParams("gmId"));
      Gm gm = Gm.find(gmId);
      model.put("gm", gm);

      model.put("template", "templates/gm.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());



  }
}
