package eu.crg.qsample.security.controller;

import eu.crg.qsample.exceptions.NotFoundException;
import eu.crg.qsample.security.UserDetailsImpl;
import eu.crg.qsample.security.agendo.AgendoAuthService;
import eu.crg.qsample.security.jwt.JwtUtils;
import eu.crg.qsample.security.model.PasswordResetToken;
import eu.crg.qsample.security.model.User;
import eu.crg.qsample.security.payload.requests.LoginRequest;
import eu.crg.qsample.security.payload.responses.JwtResponse;
import eu.crg.qsample.security.payload.responses.MessageResponse;
import eu.crg.qsample.security.repository.RoleRepository;
import eu.crg.qsample.security.repository.UserRepository;
import eu.crg.qsample.security.services.UserService;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/auth")
public class AuthController {
  @Autowired AuthenticationManager authenticationManager;

  @Autowired UserRepository userRepository;

  @Autowired RoleRepository roleRepository;

  @Autowired PasswordEncoder encoder;

  @Autowired JwtUtils jwtUtils;

  @Autowired AgendoAuthService agendoAuthService;

  @Autowired UserService userService;

  @PostMapping("/signin")
  public ResponseEntity<?> authenticateUser(@Valid @RequestBody LoginRequest loginRequest) {
    // System.out.println("login try");
    Optional<User> userOpt = userRepository.findByUsername(loginRequest.getUsername());

    if (!userOpt.isPresent()) { // The user doesnt exist, trying signup
      return registerUser(loginRequest);
    }

    Authentication authentication =
        authenticationManager.authenticate(
            new UsernamePasswordAuthenticationToken(
                loginRequest.getUsername(), loginRequest.getPassword()));

    SecurityContextHolder.getContext().setAuthentication(authentication);
    String jwt = jwtUtils.generateJwtToken(authentication);

    UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
    // System.out.println(userDetails.toString());
    List<String> roles =
        userDetails.getAuthorities().stream()
            .map(item -> item.getAuthority())
            .collect(Collectors.toList());

    return ResponseEntity.ok(
        new JwtResponse(jwt, userDetails.getId(), userDetails.getUsername(), roles));
  }

  @PostMapping("/signup")
  public ResponseEntity<?> registerUser(@Valid @RequestBody LoginRequest signUpRequest) {
    // System.out.println("signup try");
    if (userRepository.existsByUsername(signUpRequest.getUsername())) {
      return ResponseEntity.badRequest()
          .body(new MessageResponse("Error: Username is already taken!"));
    }

    if (!agendoAuthService.agendoAuth(signUpRequest.getUsername(), signUpRequest.getPassword())) {
      return new ResponseEntity<String>("User not found", HttpStatus.UNAUTHORIZED);
    }

    return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
  }

  /**
   * Secret endpoint just to setup users for testing withouth asking agendo
   *
   * @param signUpRequest
   * @return
   */
  @PostMapping("/signupDummyLMAO")
  public ResponseEntity<?> registerUserDummy(@Valid @RequestBody LoginRequest signUpRequest) {
    // System.out.println("signup try");
    if (userRepository.existsByUsername(signUpRequest.getUsername())) {
      return ResponseEntity.badRequest()
          .body(new MessageResponse("Error: Username is already taken!"));
    }

    userService.addUserDummy();

    return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
  }

  /**
   * Secret endpoint just to setup users for testing withouth asking agendo
   *
   * @param signUpRequest
   * @return
   */
  @PostMapping("/firstsignup")
  public ResponseEntity<?> setFirstUserToDB() {
    // System.out.println("Start /firstsignup entry point...");
    userService.addLocalUser();
    // System.out.println("End /firstsignup entry point.");
    return ResponseEntity.ok(new MessageResponse("First signup successfull!"));
  }

  @PostMapping("/recovery")
  public ResponseEntity<?> recoverPassword(@RequestBody LoginRequest email) {
    if (!userRepository.existsByUsername(email.getUsername())) {
      return ResponseEntity.badRequest().body(new MessageResponse("Email doesnt exist"));
    }
    userService.recoverPassword(email.getUsername());
    return null;
  }

  @PostMapping("/getToken")
  public PasswordResetToken getToken(@RequestBody String token) {
    return userService.getToken(token, true);
  }

  @PostMapping("/changePassword")
  public User changePassword(@RequestBody LoginRequest email) {
    return userService.changePassword(email.getUsername(), email.getPassword());
  }

  @PreAuthorize("hasRole('MANAGER')") // This can be commented for testing
  @PostMapping("/changeUserPassword")
  public User changeUserPassword(@RequestBody User user) {
    return userService.changePassword(user.getUsername(), user.getPassword());
  }

  @PreAuthorize("hasRole('MANAGER')") // This can be commented for testing
  @PostMapping("/addUser")
  public User addUser(@RequestBody User newUser) {
    // We use a provided password and we encode it
    String encodedPassword = encoder.encode(newUser.getPassword());
    UUID apiKey = UUID.randomUUID();
    newUser.setPassword(encodedPassword);
    newUser.setApiKey(apiKey);
    return userService.addUser(newUser);
  }

  @PreAuthorize("hasRole('MANAGER')") // This can be commented for testing
  @PostMapping("/deleteUser")
  public ResponseEntity<?> deleteUser(@RequestBody User user) {
    if (userService.deleteUser(user)) {
      return ResponseEntity.ok(new MessageResponse("User successfully deleted!"));
    } else {
      return ResponseEntity.badRequest().body(new MessageResponse("User cannot be deleted!"));
    }
  }

  /**
   * Return bad request instead of not found per security purposes
   *
   * @param response
   * @param e
   * @throws IOException
   */
  @ExceptionHandler(NotFoundException.class)
  void handleNotFoundException(HttpServletResponse response, Exception e) throws IOException {
    response.sendError(HttpStatus.BAD_REQUEST.value(), e.getMessage());
  }
}
