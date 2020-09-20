DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
    id          INTEGER             NOT NULL PRIMARY KEY,
    name        VARCHAR(64)         NOT NULL,
    description VARCHAR(4096)       NOT NULL,
    thumbnail   VARCHAR(128)        NOT NULL,
    address     VARCHAR(128)        NOT NULL,
    latitude    DOUBLE PRECISION    NOT NULL,
    longitude   DOUBLE PRECISION    NOT NULL,
    rent        INTEGER             NOT NULL,
    door_height INTEGER             NOT NULL,
    door_width  INTEGER             NOT NULL,
    features    VARCHAR(64)         NOT NULL,
    popularity  INTEGER             NOT NULL,
    dpopularity INTEGER AS (-popularity) NOT NULL,
    point       POINT AS (POINT(latitude, longitude)) STORED NOT NULL
);
ALTER TABLE isuumo.estate ADD INDEX idx_estate_01(`dpopularity`);
ALTER TABLE isuumo.estate ADD INDEX idx_estate_02(`rent`);
ALTER TABLE isuumo.estate ADD INDEX idx_estate_03(`door_width`, `rent`);
ALTER TABLE isuumo.estate ADD INDEX idx_estate_04(`door_height`, `rent`);
ALTER TABLE isuumo.estate ADD INDEX idx_estate_05(`door_width`);
ALTER TABLE isuumo.estate ADD INDEX idx_estate_06(`door_height`);
ALTER TABLE isuumo.estate ADD INDEX idx_estate_07(`rent`, `door_height`, `door_width`);
ALTER TABLE isuumo.estate ADD INDEX idx_estate_08(`door_height`, `door_width`);
ALTER TABLE isuumo.estate ADD SPATIAL INDEX sidx_estate_01(`point`);

CREATE TABLE isuumo.chair
(
    id          INTEGER         NOT NULL PRIMARY KEY,
    name        VARCHAR(64)     NOT NULL,
    description VARCHAR(4096)   NOT NULL,
    thumbnail   VARCHAR(128)    NOT NULL,
    price       INTEGER         NOT NULL,
    height      INTEGER         NOT NULL,
    width       INTEGER         NOT NULL,
    depth       INTEGER         NOT NULL,
    color       VARCHAR(64)     NOT NULL,
    features    VARCHAR(64)     NOT NULL,
    kind        VARCHAR(64)     NOT NULL,
    popularity  INTEGER         NOT NULL,
    stock       INTEGER         NOT NULL,
    dpopularity INTEGER AS (-popularity) NOT NULL
);
ALTER TABLE isuumo.chair ADD INDEX idx_chair_01(`dpopularity`);
ALTER TABLE isuumo.chair ADD INDEX idx_chair_02(`stock`);
