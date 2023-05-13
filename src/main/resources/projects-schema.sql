DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
                         project_id INT NOT NULL AUTO_INCREMENT,
                         project_name VARCHAR(128) NOT NULL,
                         estimated_hours DECIMAL(7,2),
                         actual_hours DECIMAL(7,2),
                         difficulty INT,
                         notes TEXT,
                         PRIMARY KEY (project_id)
);

CREATE TABLE material (
                          material_id INT NOT NULL AUTO_INCREMENT,
                          material_name VARCHAR(128) NOT NULL,
                          cost DECIMAL(7,2),
                          num_required INT,
                          project_id INT,
                          FOREIGN KEY (project_id) REFERENCES project(project_id),
                          PRIMARY KEY (material_id)
);

CREATE TABLE step (
                      step_id INT NOT NULL AUTO_INCREMENT,
                      step_order INT,
                      step_text TEXT,
                      project_id INT,
                      FOREIGN KEY (project_id) REFERENCES project(project_id),
                      PRIMARY KEY (step_id)
);

CREATE TABLE category (
                          category_id INT NOT NULL AUTO_INCREMENT,
                          category_name VARCHAR(128) NOT NULL,
                          PRIMARY KEY (category_id)
);

CREATE TABLE project_category (
                                  project_id INT,
                                  category_id INT,
                                  FOREIGN KEY (project_id) REFERENCES project(project_id),
                                  FOREIGN KEY (category_id) REFERENCES category(category_id),
                                  UNIQUE KEY unique_project_category (project_id, category_id)
);
