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
      model.put("allGms", Gm.all());
      model.put("template", "templates/index.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/about", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      model.put("gm", request.session().attribute("currentGm"));
      model.put("template", "templates/about.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/search", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      Gm gm = request.session().attribute("currentGm");
      model.put("gm", gm);
      model.put("allGms", Gm.all());
      model.put("allTeams", Team.all());
      model.put("allLeagues", League.all());
      model.put("template", "templates/search.vtl");
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

    get("/create-team", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      Gm gm = request.session().attribute("currentGm");
      model.put("gm", gm);
      model.put("availableLeagues", League.availableLeagues());
      model.put("template", "templates/create-team.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/new-team", (request, response) -> {
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
      model.put("team", newTeam);
      model.put("gm", gm);
      model.put("leagueId", leagueId);
      model.put("template", "templates/team.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/team/:id", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      Gm gm = request.session().attribute("currentGm");
      Team team = Team.find(Integer.parseInt(request.params("id")));

      model.put("league", team.getLeague());
      model.put("team", team);
      model.put("gm", gm);
      model.put("leagueId", team.getLeague().getId());
      model.put("template", "templates/team.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/starters/:id", (request, response) -> {
      Team team = Team.find(Integer.parseInt(request.params("id")));
      Gm gm = request.session().attribute("currentGm");
      String[] newStarters = request.queryParamsValues("checkStarter");
      team.selectStarters(newStarters);
      response.redirect("/league/" + team.getLeague().getId());
      return null;
    });

    get("league/:id", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      League league = League.find(Integer.parseInt(request.params("id")));
      Gm gm = request.session().attribute("currentGm");
      model.put("league", league);
      model.put("GM", Gm.class);
      model.put("gm", gm);
      model.put("template", "templates/league.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/advanceweek/:id", (request, response) -> {
      League league = League.find(Integer.parseInt(request.params("id")));
      Gm gm = request.session().attribute("currentGm");
      league.advanceWeek();

      response.redirect("/league/" + league.getId());
      return null;
    });


    post("/new-team-page", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      String leagueName = request.queryParams("leagueName");
      int newTeamId = Integer.parseInt(request.queryParams("newTeamId"));
      Team newTeam = Team.find(newTeamId);
      League newLeague = new League(leagueName);
      newLeague.save();
      newLeague.addTeam(newTeam);
      int gmId = newTeam.getGmId();
      Gm gm = Gm.find(gmId);
      model.put("gm", gm);
      model.put("team", newTeam);
      model.put("league", newLeague);
      model.put("leagueId", newLeague.getId());
      model.put("template", "templates/team.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/home", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      Gm gm = request.session().attribute("currentGm");
      model.put("gmsTeams", gm.allTeams());
      model.put("gm", gm);
      model.put("index", "templates/index.vtl");
      model.put("template", "templates/gm.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/edit/:id", (request, response) -> {
      Gm gm = request.session().attribute("currentGm");
      String type = request.queryParams("type");
      String newName = request.queryParams("newName");
      if(type.equals("Team")){
        Team editedItem = Team.find(Integer.parseInt(request.params("id")));
        editedItem.updateName(newName);
      } else if (type.equals("Gm")) {
        Gm editedItem = Gm.find(Integer.parseInt(request.params("id")));
        editedItem.updateName(newName);
      } else if (type.equals("League")) {
        League editedItem = League.find(Integer.parseInt(request.params("id")));
        editedItem.updateName(newName);
      }
      response.redirect("/home");
      return null;
    });

    get("/delete/:type/:id", (request, response) -> {
      int id = Integer.parseInt(request.params("id"));
      String type = request.params("type");
      Gm gm = request.session().attribute("currentGm");
      if(type.equals("Team")){
        Team editedItem = Team.find(id);
        editedItem.delete();
      } else if (type.equals("Gm")) {
        Gm editedItem = Gm.find(id);
        if(editedItem.equals(gm)){
          editedItem.delete();
          response.redirect("/");
          return null;
        }
      } else if (type.equals("League")) {
        League editedItem = League.find(id);
        editedItem.delete();
      }
      response.redirect("/home");
      return null;
    });

    get("/edit/:type/:id", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      int id = Integer.parseInt(request.params("id"));
      String type = request.params("type");
      Gm gm = request.session().attribute("currentGm");
      if(type.equals("Team")){
        Team object = Team.find(id);
        model.put("object", object);
      } else if (type.equals("Gm")) {
        Gm object = Gm.find(id);
        model.put("object", object);
      } else if (type.equals("League")) {
        League object = League.find(id);
        model.put("object", object);
      }

      model.put("gm", gm);
      model.put("template", "templates/update.vtl");
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
      Gm gm = request.session().attribute("currentGm");
      League league = League.find(leagueId);
      List<Team> draftOrder = league.draftOrder();
      int leagueSize = draftOrder.size();
      int draftPosition = 0;
      Team currentTeam = draftOrder.get(draftPosition % leagueSize);
      int round = (int) Math.ceil(((double) draftPosition + 1) / (double) leagueSize);

      request.session().attribute("draftOrder", draftOrder);
      request.session().attribute("draftPosition", draftPosition);
      model.put("remainingSalary", "125000");
      model.put("draftPosition", draftPosition);
      model.put("leagueSize", leagueSize);
      model.put("players", Player.all());
      model.put("round", round);
      model.put("currentTeam", currentTeam);
      model.put("league", league);
      model.put("gm", gm);
      model.put("template", "templates/draft.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/draft/:id", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      Gm gm = request.session().attribute("currentGm");
      int leagueId = Integer.parseInt(request.params("id"));
      League league = League.find(leagueId);
      List<Team> draftOrder = request.session().attribute("draftOrder");
      int leagueSize = draftOrder.size();
      int draftPosition = request.session().attribute("draftPosition");
      Team currentTeam = draftOrder.get(draftPosition % leagueSize);
      int round = (int) Math.ceil(((double) draftPosition + 2) / (double) leagueSize);
      int playerId = Integer.parseInt(request.queryParams("playerId"));
      Player draftedPlayer = Player.find(playerId);
      String evaluation = currentTeam.evaluatePlayer(draftedPlayer);


      if (evaluation.contains("successfully")){
        Team displayTeam = draftOrder.get((draftPosition + 1) % leagueSize);
        model.put("displayTeam", displayTeam);
        Integer salaryCap = 125000;
        if (displayTeam.currentSalarySpent() != null) {
          Integer moneySpent = displayTeam.currentSalarySpent();
          Integer remainingSalary = salaryCap - moneySpent;
          model.put("remainingSalary", remainingSalary);
        } else {
          Integer moneySpent = 0;
          Integer remainingSalary = salaryCap - moneySpent;
          model.put("remainingSalary", remainingSalary);
        }
      } else {
        Team displayTeam = draftOrder.get((draftPosition) % leagueSize);
        model.put("displayTeam", displayTeam);
        Integer moneySpent = displayTeam.currentSalarySpent();
        Integer salaryCap = 125000;
        Integer remainingSalary = salaryCap - moneySpent;
        model.put("remainingSalary", remainingSalary);
      }

      if (draftPosition < leagueSize * 8) {
        //add player logic - use evaluateplayer() not addplayer()
        if (evaluation.contains("successfully")) {
          draftPosition++; // pass this around via hidden form fields or cookies
          request.session().attribute("draftPosition", draftPosition);
        }
      }

      model.put("GM", Gm.class);
      model.put("gm", gm);
      model.put("draftPosition", draftPosition);
      model.put("leagueSize", leagueSize);
      model.put("evaluation", evaluation);
      model.put("players", Player.all());
      model.put("round", round);
      model.put("currentTeam", currentTeam);
      model.put("league", league);
      model.put("template", "templates/draft.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/pass/:id", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      Gm gm = request.session().attribute("currentGm");
      int leagueId = Integer.parseInt(request.params("id"));
      League league = League.find(leagueId);
      List<Team> draftOrder = request.session().attribute("draftOrder");
      int leagueSize = draftOrder.size();
      int draftPosition = request.session().attribute("draftPosition");
      Team currentTeam = draftOrder.get(draftPosition % leagueSize);
      Team displayTeam = draftOrder.get((draftPosition + 1) % leagueSize);
      int round = (int) Math.ceil(((double) draftPosition + 2) / (double) leagueSize);
      String evaluation = currentTeam.getName() + " passes their turn.";
      Integer moneySpent = displayTeam.currentSalarySpent();
      Integer salaryCap = 125000;
      Integer remainingSalary = salaryCap - moneySpent;

      if (draftPosition < leagueSize * 8) {
        draftPosition++; // pass this around via hidden form fields or cookies
        request.session().attribute("draftPosition", draftPosition);
      }

      model.put("GM", Gm.class);
      model.put("gm", gm);
      model.put("remainingSalary", remainingSalary);
      model.put("draftPosition", draftPosition);
      model.put("leagueSize", leagueSize);
      model.put("evaluation", evaluation);
      model.put("players", Player.all());
      model.put("round", round);
      model.put("currentTeam", currentTeam);
      model.put("displayTeam", displayTeam);
      model.put("league", league);
      model.put("template", "templates/draft.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

  }
}
