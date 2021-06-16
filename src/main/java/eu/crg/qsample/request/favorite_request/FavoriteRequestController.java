package eu.crg.qsample.request.favorite_request;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import eu.crg.qsample.request.MiniRequest;

@RestController
@RequestMapping(value = "api/favRequest")
public class FavoriteRequestController {

    @Autowired
    FavoriteRequestService favoriteRequestService;

    @PreAuthorize("hasRole('USER')")
    @PostMapping(value = "/setNew")
    public FavoriteRequest setNew(@RequestBody FavoriteRequest favRequest) {
        return favoriteRequestService.save(favRequest);
    }

    @PreAuthorize("hasRole('USER')")
    @PostMapping(value = "/removeFav")
    public boolean removeFav(@RequestBody FavoriteRequest favRequest) {
        return favoriteRequestService.removeFav(favRequest);
    }

    @PreAuthorize("hasRole('USER')")
    @GetMapping(value = "/check/{agendoId}")
    public boolean checkIfFav(@PathVariable Long agendoId) {
        return favoriteRequestService.checkIfFav(agendoId);
    }

    @PreAuthorize("hasRole('USER')")
    @GetMapping(value = "/favAgendo")
    public List<MiniRequest> getFavAgendo() {
        return favoriteRequestService.getFavAgendo();
    }


}