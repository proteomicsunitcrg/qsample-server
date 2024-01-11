package eu.crg.qsample.user;

import eu.crg.qsample.security.model.User;
import eu.crg.qsample.security.services.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/api/user")
public class UserController {

    @Autowired UserService userService;

    @GetMapping("")
    @PreAuthorize("hasRole('ADMIN')")
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }

    // Retrieve information from the currently logged in user.
    @GetMapping("/current")
    @PreAuthorize("hasRole('USER')")
    public User getCurrentUser() {
        return userService.getCurrentUser();
    }

    @PostMapping("/modifyRole/{to}")
    @PreAuthorize("hasRole('ADMIN')")
    public User modifyRole(@RequestBody User user, @PathVariable String to) {
        return userService.modifyRole(user, to);
    }

    @ExceptionHandler(DataIntegrityViolationException.class)
    void handleNotFoundException(HttpServletResponse response, Exception e) throws IOException {
        response.sendError(HttpStatus.NOT_FOUND.value(), e.getMessage());
    }
}
