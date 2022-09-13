package cz.belligerator.cokjidlu.controllers;

import cz.belligerator.cokjidlu.entities.Meal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@Controller
@RequestMapping(path = "/api")
public class MealController {
    
    private ArrayList<Meal> list = new ArrayList<>();
    
    public MealController() {
        Meal m1 = new Meal(0, "Svickova");
        Meal m2 = new Meal(1, "Drstkova");
        Meal m3 = new Meal(2, "Knedlo, zelo, vepro");
        list.add(m1);
        list.add(m2);
        list.add(m3);
    }
    
    @GetMapping(path = "/all")
    public @ResponseBody
    Iterable<Meal> getAllUsers() {
        return list;
    }
    
    @PostMapping(path = "/add")
    public @ResponseBody
    Iterable<Meal> addNewUser(@RequestBody Meal meal) {
        meal.setId(list.get(list.size() - 1).getId() + 1);
        list.add(meal);
        return list;
    }
}
