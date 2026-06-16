package eu.crg.qsample.charts.dto;

import java.util.List;

public class ChartDataSourceOptionsDTO {

    private List<OptionDTO> params;
    private List<ChartDataSourceDTO.ContextSourceDTO> contextSources;

    public ChartDataSourceOptionsDTO(
            List<OptionDTO> params,
            List<ChartDataSourceDTO.ContextSourceDTO> contextSources) {
        this.params = params;
        this.contextSources = contextSources;
    }

    public List<OptionDTO> getParams() {
        return params;
    }

    public List<ChartDataSourceDTO.ContextSourceDTO> getContextSources() {
        return contextSources;
    }

    public static class OptionDTO {
        private Long id;
        private String name;

        public OptionDTO(Long id, String name) {
            this.id = id;
            this.name = name;
        }

        public Long getId() {
            return id;
        }

        public String getName() {
            return name;
        }
    }
}
