CREATE TABLE chart_definitions (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  chart_type VARCHAR(50) NOT NULL,
  library VARCHAR(50) NOT NULL DEFAULT 'plotly',
  data_source_key VARCHAR(100) NOT NULL,
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE chart_parameters (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  chart_id BIGINT NOT NULL,
  param_key VARCHAR(100) NOT NULL,
  param_value TEXT,
  param_type VARCHAR(50) NOT NULL DEFAULT 'string',
  description VARCHAR(255),
  FOREIGN KEY (chart_id) REFERENCES chart_definitions(id) ON DELETE CASCADE,
  UNIQUE KEY unique_chart_param (chart_id, param_key)
);

CREATE TABLE chart_page_assignments (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  chart_id BIGINT NOT NULL,
  page_name VARCHAR(100) NOT NULL,
  display_order INT NOT NULL DEFAULT 0,
  is_visible BOOLEAN NOT NULL DEFAULT TRUE,
  FOREIGN KEY (chart_id) REFERENCES chart_definitions(id) ON DELETE CASCADE,
  UNIQUE KEY unique_chart_page (chart_id, page_name)
);

CREATE INDEX idx_chart_definitions_active ON chart_definitions(is_active);
CREATE INDEX idx_chart_page_assignments_page ON chart_page_assignments(page_name);
