package eu.crg.qsample.charts.dto;

import java.util.List;

public class ChartDataSourceDTO {

    private Long id;
    private String name;
    private String apiKey;
    private Long paramId;
    private String paramName;
    private List<ContextSourceDTO> contextSources;

    public ChartDataSourceDTO(
            Long id,
            String name,
            String apiKey,
            Long paramId,
            String paramName,
            List<ContextSourceDTO> contextSources) {
        this.id = id;
        this.name = name;
        this.apiKey = apiKey;
        this.paramId = paramId;
        this.paramName = paramName;
        this.contextSources = contextSources;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getApiKey() {
        return apiKey;
    }

    public Long getParamId() {
        return paramId;
    }

    public String getParamName() {
        return paramName;
    }

    public List<ContextSourceDTO> getContextSources() {
        return contextSources;
    }

    public static class ContextSourceDTO {
        private Long id;
        private String name;
        private String abbreviated;

        public ContextSourceDTO(Long id, String name, String abbreviated) {
            this.id = id;
            this.name = name;
            this.abbreviated = abbreviated;
        }

        public Long getId() {
            return id;
        }

        public String getName() {
            return name;
        }

        public String getAbbreviated() {
            return abbreviated;
        }
    }
}
