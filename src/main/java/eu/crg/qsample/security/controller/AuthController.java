package eu.crg.qsample.security.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import eu.crg.qsample.security.UserDetailsImpl;
import eu.crg.qsample.security.agendo.AgendoAuthService;
import eu.crg.qsample.security.jwt.JwtUtils;
import eu.crg.qsample.security.model.ERole;
import eu.crg.qsample.security.model.Role;
import eu.crg.qsample.security.model.User;
import eu.crg.qsample.security.payload.requests.LoginRequest;
import eu.crg.qsample.security.payload.requests.SignupRequest;
import eu.crg.qsample.security.payload.responses.JwtResponse;
import eu.crg.qsample.security.payload.responses.MessageResponse;
import eu.crg.qsample.security.repository.RoleRepository;
import eu.crg.qsample.security.repository.UserRepository;
import eu.crg.qsample.security.services.UserService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/auth")
public class AuthController {
    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    UserRepository userRepository;

    @Autowired
    RoleRepository roleRepository;

    @Autowired
    PasswordEncoder encoder;

    @Autowired
    JwtUtils jwtUtils;

    @Autowired
    AgendoAuthService agendoAuthService;

    @Autowired
    UserService userService;

    @PostMapping("/signin")
    public ResponseEntity<?> authenticateUser(@Valid @RequestBody LoginRequest loginRequest) {

        System.out.println("login try");
        Optional<User> userOpt = userRepository.findByUsername(loginRequest.getUsername());

        if (!userOpt.isPresent()) { // The user doesnt exist, trying signup
            return registerUser(loginRequest);
        }

        // if (!agendoAuthService.agendoAuth(loginRequest.getUsername(),
        // loginRequest.getPassword())) {
        // return ResponseEntity.ok(new MessageResponse("UserNotFound"));
        // }

        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtUtils.generateJwtToken(authentication);

        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        System.out.println(userDetails.toString());
        List<String> roles = userDetails.getAuthorities().stream().map(item -> item.getAuthority())
                .collect(Collectors.toList());

        return ResponseEntity.ok(new JwtResponse(jwt, userDetails.getId(), userDetails.getUsername(), roles));
    }

    @PostMapping("/signup")
    public ResponseEntity<?> registerUser(@Valid @RequestBody LoginRequest signUpRequest) {
        System.out.println("signup try");
        if (userRepository.existsByUsername(signUpRequest.getUsername())) {
            return ResponseEntity.badRequest().body(new MessageResponse("Error: Username is already taken!"));
        }

        if(!agendoAuthService.agendoAuth(signUpRequest.getUsername(), signUpRequest.getPassword())) {
            return ResponseEntity.ok(new MessageResponse("UserNotFound"));
        }

        return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
    }

    /**
     * Secret endpoint just to setup users for testing withouth asking agendo
     * @param signUpRequest
     * @return
     */
    @PostMapping("/signupDummyLMAO")
    public ResponseEntity<?> registerUserDummy(@Valid @RequestBody LoginRequest signUpRequest) {
        System.out.println("signup try");
        if (userRepository.existsByUsername(signUpRequest.getUsername())) {
            return ResponseEntity.badRequest().body(new MessageResponse("Error: Username is already taken!"));
        }

        userService.addUserDummy();

        return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
    }
}