package eu.crg.qsample.security.services;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;

import eu.crg.qsample.exceptions.NotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import eu.crg.qsample.mail.MailService;
import eu.crg.qsample.security.agendo.AgendoAuthUser;
import eu.crg.qsample.security.model.ERole;
import eu.crg.qsample.security.model.PasswordResetToken;
import eu.crg.qsample.security.model.Role;
import eu.crg.qsample.security.model.User;
import eu.crg.qsample.security.repository.PasswordResetRespository;
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

    @Autowired
    PasswordResetRespository resetRespository;

    @Autowired
    PasswordResetService resetService;

    @Autowired
    MailService mailService;

    public User addUserAgendo(String username, String password, AgendoAuthUser user) {
        User newUser = new User(null, UUID.randomUUID(), user.getName(), user.getName(), username,
                encoder.encode(password), user.getId());
        Set<Role> roles = new HashSet<>();
        Role internalRole = roleRepo.findByName(ERole.ROLE_INTERNAL).get();
        Role userRole = roleRepo.findByName(ERole.ROLE_USER).get();
        Role ADMNIRole = roleRepo.findByName(ERole.ROLE_ADMIN).get();
        Role managerRole = roleRepo.findByName(ERole.ROLE_MANAGER).get();
        roles.add(internalRole);
        roles.add(userRole);
        roles.add(ADMNIRole);
        roles.add(managerRole);
        newUser.setRoles(roles);
        return userRepo.save(newUser);
    }

    public User addUserDummy() {
        Set<Role> roles = new HashSet<>();
        Role roleAdmin = roleRepo.findByName(ERole.ROLE_ADMIN).get();
        Role roleInternal = roleRepo.findByName(ERole.ROLE_INTERNAL).get();
        Role roleManager = roleRepo.findByName(ERole.ROLE_MANAGER).get();
        Role roleUser = roleRepo.findByName(ERole.ROLE_USER).get();
        User newUser = new User(null, UUID.randomUUID(), "ADMINDUMMY", "UNIT", "admin@unittest.cat",
                encoder.encode("unittest"), 942l);
        roles.add(roleAdmin);
        roles.add(roleInternal);
        roles.add(roleManager);
        roles.add(roleUser);
        newUser.setRoles(roles);
        return userRepo.save(newUser);
    }

    public User addLocalUser() {

        User newUser = new User(null, UUID.randomUUID(), "admin", "admin", "admin@admin.com",
                encoder.encode("admin"), 942l);
        Set<Role> roles = new HashSet<>();
        Role roleAdmin = roleRepo.findByName(ERole.ROLE_ADMIN).get();
        Role roleInternal = roleRepo.findByName(ERole.ROLE_INTERNAL).get();
        Role roleManager = roleRepo.findByName(ERole.ROLE_MANAGER).get();
        Role roleUser = roleRepo.findByName(ERole.ROLE_USER).get();
        roles.add(roleAdmin);
        roles.add(roleInternal);
        roles.add(roleManager);
        roles.add(roleUser);
        newUser.setRoles(roles);
        return userRepo.save(newUser);
    }

    public List<User> getAllUsers() {
        return userRepo.findAll();
    }

    public Optional<User> getUserByApiKey(UUID apiKey) {
        return userRepo.findByApiKey(apiKey);
    }

    private User getUserFromSecurityContext() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = userRepo.findByUsername(authentication.getName()).get();
        return u;
    }

    public User modifyRole(User user, String to) {
        Set<Role> roles = new HashSet<>();
        Role roleExternal = roleRepo.findByName(ERole.ROLE_EXTERNAL).get();
        Role roleAdmin = roleRepo.findByName(ERole.ROLE_ADMIN).get();
        Role roleInternal = roleRepo.findByName(ERole.ROLE_INTERNAL).get();
        Role roleManager = roleRepo.findByName(ERole.ROLE_MANAGER).get();
        Role roleUser = roleRepo.findByName(ERole.ROLE_USER).get();
        Optional<User> userOpt = getUserByApiKey(user.getApiKey());
        User loggedUser = getUserFromSecurityContext();
        if (userOpt.isPresent()) {
            if (loggedUser.getId().equals(userOpt.get().getId())) {
                throw new DataIntegrityViolationException("You cannot modify yourself");
            }
            userOpt.get().setRoles(null);
            switch (to) {
                case "external":
                    roles.add(roleUser);
                    roles.add(roleExternal);
                    break;
                case "internal":
                    roles.add(roleUser);
                    roles.add(roleInternal);
                    break;
                case "manager":
                    roles.add(roleUser);
                    roles.add(roleInternal);
                    roles.add(roleManager);
                    break;
                case "admin":
                    roles.add(roleUser);
                    roles.add(roleInternal);
                    roles.add(roleManager);
                    roles.add(roleAdmin);
                    break;
                default:
                    throw new DataIntegrityViolationException("Incorrect assingment");
            }
            userOpt.get().setRoles(roles);
            userRepo.save(userOpt.get());
        } else {
            throw new DataIntegrityViolationException("User not found");
        }
        return userOpt.get();
    }

    public void recoverPassword(String email) {
        Optional<User> userOpt = userRepo.findByUsername(email);
        if (userOpt.isPresent()) {
            String token = UUID.randomUUID().toString();
            PasswordResetToken tokenObj = createPasswordResetTokenForUser(userOpt.get(), token);
            resetService.sendPasswordResetHtmlEmail(tokenObj);

        }
    }

    public PasswordResetToken createPasswordResetTokenForUser(User user, String token) {
        ZoneId defaultZoneId = ZoneId.systemDefault();
        LocalDate today = LocalDate.now();
        LocalDate plusOne = today.plusDays(2);
        Date date = Date.from(plusOne.atStartOfDay(defaultZoneId).toInstant());

        PasswordResetToken myToken = new PasswordResetToken(token, user, date);
        Optional<PasswordResetToken> pwdRTokenOpt = resetRespository.findOneByUser(user);
        if (pwdRTokenOpt.isPresent()) {
            resetRespository.delete(pwdRTokenOpt.get());
        }
        return resetRespository.save(myToken);
    }

    public PasswordResetToken getToken(String token, boolean delete) {
        Optional<PasswordResetToken> pwdTokenOpt = resetRespository.findOneByToken(token);
        if (pwdTokenOpt.isPresent()) {
            if (delete) {
                resetRespository.delete(pwdTokenOpt.get());
            }
            return pwdTokenOpt.get();
        } else {
            throw new NotFoundException("Token doesnt found");
        }
    }

    public User changePassword(String username, String password) {
        Optional <User> useropt = userRepo.findByUsername(username);
        String encodedPassword = encoder.encode(password);
        if (useropt.isPresent()) {
            useropt.get().setPassword(encodedPassword);
            return userRepo.save(useropt.get());
        } else {
            throw new NotFoundException("User doesnt found");
        }
    }
}
