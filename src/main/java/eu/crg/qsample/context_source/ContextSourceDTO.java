package eu.crg.qsample.context_source;

public class ContextSourceDTO {
    private Long id;
    private String name;
    private String abbreviated;
    private String apiKey;

    public ContextSourceDTO(Long id, String name, String abbreviated, String apiKey) {
        this.id = id;
        this.name = name;
        this.abbreviated = abbreviated;
        this.apiKey = apiKey;
    }

    public Long getId() { return id; }
    public String getName() { return name; }
    public String getAbbreviated() { return abbreviated; }
    public String getApiKey() { return apiKey; }
}
