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

	@PostMapping("/signin")
	public ResponseEntity<?> authenticateUser(@Valid @RequestBody LoginRequest loginRequest) {


		Optional <User> userOpt = userRepository.findByUsername(loginRequest.getUsername());


		if (!agendoAuthService.agendoAuth(loginRequest.getUsername(), loginRequest.getPassword())) {
			return ResponseEntity.ok(new MessageResponse("UserNotFound"));
		}


		Authentication authentication = authenticationManager.authenticate(
				new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

		SecurityContextHolder.getContext().setAuthentication(authentication);
		String jwt = jwtUtils.generateJwtToken(authentication);

		UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
		if (userDetails.getAuthorities().size() == 0) {
			System.out.println("POLLA");
		}
		System.out.println(userDetails.toString());
		List<String> roles = userDetails.getAuthorities().stream().map(item -> item.getAuthority())
				.collect(Collectors.toList());

		return ResponseEntity.ok(new JwtResponse(jwt, userDetails.getId(), userDetails.getUsername(), roles));
	}

	@PostMapping("/signup")
	public ResponseEntity<?> registerUser(@Valid @RequestBody SignupRequest signUpRequest) {
		if (userRepository.existsByUsername(signUpRequest.getUsername())) {
			return ResponseEntity.badRequest().body(new MessageResponse("Error: Username is already taken!"));
		}

		// Create new user's account
		User user = new User(signUpRequest.getUsername(), encoder.encode(signUpRequest.getPassword()));
		UUID userUuid = UUID.randomUUID();
		user.setFirstname("marc");
		user.setLastname("marcaca");
		user.setApiKey(userUuid);

		Set<Role> roles = new HashSet<>();
		Role external = roleRepository.findByName(ERole.ROLE_EXTERNAL).get();
		Role admin = roleRepository.findByName(ERole.ROLE_ADMIN).get();
		Role internal = roleRepository.findByName(ERole.ROLE_INTERNAL)
				.orElseThrow(() -> new RuntimeException("ROLE not found"));
		roles.add(external);
		Role userRole = roleRepository.findByName(ERole.ROLE_USER)
				.orElseThrow(() -> new RuntimeException("ROLE not found"));
		roles.add(internal);
		roles.add(admin);
		roles.add(userRole);
		user.setRoles(roles);
		userRepository.save(user);
		System.out.println(user.getRoles().size());

		return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
	}
}