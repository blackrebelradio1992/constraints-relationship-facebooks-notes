CREATE TABLE user_accounts(
    id SERIAL PRIMARY KEY,
    username VARCHAR,
    password VARCHAR,
    last_login_date TIMESTAMPTZ
);

CREATE TABLE user_profiles(
    id SERIAL PRIMARY KEY,
    profile_id INT REFERENCES user_profiles(id),
    profile_photo VARCHAR,
    about_me TEXT,
    personel_quote VARCHAR
);

CREATE TABLE comments(
    id SERIAL PRIMARY KEY,
    content TEXT,
    profile_id INT REFERENCES user_profiles(id),
    post_id INTEGER REFERENCES posts(id)
);
CREATE TABLE reaction_types(
    id SERIAL PRIMARY KEY,
    type VARCHAR
);
CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    content VARCHAR,
    profile_id INT REFERENCES user_profiles(id)
);
CREATE TABLE post_reactions(
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts(id),
    reaction_id INTEGER REFERENCES reaction_types(id),
    profile_id INT REFERENCES user_profiles(id),
    UNIQUE (profile_id, post_id)
);


-- Generating random data for user_accounts table
INSERT INTO user_accounts (username, password, last_login_date)
VALUES
  ('john_doe', 'pass123', '2023-11-15 10:45:00+00:00'::TIMESTAMPTZ),
  ('jane_smith', 'securePwd', '2023-11-15 11:30:00+00:00'::TIMESTAMPTZ),
  ('bob_jones', 'secretPass', '2023-11-15 12:15:00+00:00'::TIMESTAMPTZ),
  ('alice_green', 'password123', '2023-11-15 13:00:00+00:00'::TIMESTAMPTZ);

-- Generating random data for user_profiles table
INSERT INTO user_profiles (profile_id, profile_photo, about_me, personel_quote)
VALUES
  (1, 'profile1.jpg', 'I love coding!', 'Live life to the fullest.'),
  (2, 'profile2.jpg', 'Foodie and traveler.', 'Stay positive.'),
  (3, 'profile3.jpg', 'Tech enthusiast.', 'Dream big.');


-- Generating random data for comments table
INSERT INTO comments (content, profile_id, post_id)
VALUES
  ('Great post!', 1, 1),
  ('Nice picture!', 2, 2),
  ('Interesting thoughts!', 3, 1);


-- Generating random data for reaction_types table
INSERT INTO reaction_types (type)
VALUES
  ('LIKE'),
  ('LOVE'),
  ('WOW'),
  ('HAHA');

-- Generating random data for posts table
INSERT INTO posts (content, profile_id)
VALUES
  ('This is my first post!', 1),
  ('Feeling excited about the weekend!', 2),
  ('New tech discovery!', 3);

-- Generating random data for post_reactions table
INSERT INTO post_reactions (post_id, reaction_id, profile_id)
VALUES
  (1, 1, 2), -- User 2 likes Post 1
  (2, 2, 1), -- User 1 loves Post 2
  (3, 3, 3); -- User 3 reacts with 'WOW' to Post 3
