package eu.crg.qsample.security.services;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import eu.crg.qsample.security.agendo.AgendoAuthUser;
import eu.crg.qsample.security.model.ERole;
import eu.crg.qsample.security.model.Role;
import eu.crg.qsample.security.model.User;
import eu.crg.qsample.security.repository.RoleRepository;
import eu.crg.qsample.security.repository.UserRepository;

@Service
public class UserService {

    @Autowired
    UserRepository userRepo;

    @Autowired
    RoleRepository roleRepo;

    @Autowired
    PasswordEncoder encoder;

    public User addUserAgendo(String username, String password, AgendoAuthUser user) {
        User newUser = new User(null, UUID.randomUUID(), user.getName(), user.getName(), username,
                encoder.encode(password), user.getId());
        Set<Role> roles = new HashSet<>();
        Role internalRole = roleRepo.findByName(ERole.ROLE_INTERNAL).get();
        Role userRole = roleRepo.findByName(ERole.ROLE_USER).get();
        roles.add(internalRole);
        roles.add(userRole);
        newUser.setRoles(roles);
        return userRepo.save(newUser);
    }
}