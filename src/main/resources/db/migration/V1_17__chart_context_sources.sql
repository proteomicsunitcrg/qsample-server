CREATE TABLE chart_context_sources (
    chart_id BIGINT NOT NULL,
    context_source_id BIGINT NOT NULL,

    PRIMARY KEY (chart_id, context_source_id),

    CONSTRAINT fk_chart_context_chart
        FOREIGN KEY (chart_id)
        REFERENCES chart_definitions(id),

    CONSTRAINT fk_chart_context_source
        FOREIGN KEY (context_source_id)
        REFERENCES context_source(id)
);
