package eu.crg.qsample.context_source;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
@RequestMapping("/api/context-sources")
public class ContextSourceController {

    private final ContextSourceRepository contextSourceRepository;

    public ContextSourceController(ContextSourceRepository contextSourceRepository) {
        this.contextSourceRepository = contextSourceRepository;
    }

    @GetMapping
    public List<ContextSourceDTO> getContextSources() {
        List<ContextSource> contextSources = new ArrayList<>();
        contextSourceRepository.findAll().forEach(contextSources::add);

        return contextSources
                .stream()
                .sorted(Comparator.comparing(ContextSource::getName))
                .map(this::toDTO)
                .collect(Collectors.toList());
    }

    @PostMapping
    @Transactional
    public ResponseEntity<ContextSourceDTO> createContextSource(
            @RequestBody ContextSourceSaveDTO contextSourceDTO) {

        validateContextSource(contextSourceDTO);

        String name = contextSourceDTO.getName().trim();
        String abbreviated = contextSourceDTO.getAbbreviated() == null
                || contextSourceDTO.getAbbreviated().trim().isEmpty()
                ? name
                : contextSourceDTO.getAbbreviated().trim();

        ContextSource contextSource = new ContextSource();
        contextSource.setName(name);
        contextSource.setAbbreviated(abbreviated);
        contextSource.setApiKey(UUID.randomUUID());

        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(toDTO(contextSourceRepository.save(contextSource)));
    }

    private void validateContextSource(ContextSourceSaveDTO contextSourceDTO) {
        if (contextSourceDTO == null
                || contextSourceDTO.getName() == null
                || contextSourceDTO.getName().trim().isEmpty()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Context source name is required");
        }

        if (contextSourceDTO.getName().trim().length() > 50) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Context source name must be 50 characters or less");
        }

        if (contextSourceDTO.getAbbreviated() != null
                && contextSourceDTO.getAbbreviated().trim().length() > 50) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Context source abbreviated name must be 50 characters or less");
        }
    }

    private ContextSourceDTO toDTO(ContextSource contextSource) {
        return new ContextSourceDTO(
                contextSource.getId(),
                contextSource.getName(),
                contextSource.getAbbreviated(),
                contextSource.getApiKey() == null ? null : contextSource.getApiKey().toString()
        );
    }
}
