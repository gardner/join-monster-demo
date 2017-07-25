
--
-- Name: accounts; Type: TABLE; Schema: public; Owner: -
--
CREATE DATABASE IF NOT EXISTS join_monster;

USE join_monster;

DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email_address VARCHAR(150),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    num_legs INT DEFAULT 2,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--
DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    body TEXT NOT NULL,
    post_id INT NOT NULL,
    author_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    archived BOOLEAN DEFAULT FALSE
);

--
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
    account_id INT NOT NULL,
    comment_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    body TEXT NOT NULL,
    author_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    archived BOOLEAN DEFAULT FALSE
);


--
-- Name: relationships; Type: TABLE; Schema: public; Owner: -
--
DROP TABLE IF EXISTS relationships;
CREATE TABLE relationships (
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    closeness VARCHAR(255)
);


--
-- Name: sponsors; Type: TABLE; Schema: public; Owner: -
--
DROP TABLE IF EXISTS sponsors;
CREATE TABLE sponsors (
    generation INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    num_legs INT DEFAULT 2,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: -
--

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/accounts.tsv'
INTO TABLE accounts
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/comments.tsv'
INTO TABLE comments
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/likes.tsv'
INTO TABLE likes
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/posts.tsv'
INTO TABLE posts
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';


--
-- Data for Name: relationships; Type: TABLE DATA; Schema: public; Owner: -
--

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/relationships.tsv'
INTO TABLE relationships
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';


--
-- Data for Name: sponsors; Type: TABLE DATA; Schema: public; Owner: -
--

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/sponsors.tsv'
INTO TABLE sponsors
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';




