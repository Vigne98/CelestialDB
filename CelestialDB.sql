--Database creation & connection --
postgres-> CREATE DATABASE celestialDB;
postgres-> \c celestialDB
--Create of each of the tables that will be used in the DB--
CREATE TABLE galaxy();
CREATE TABLE star();
CREATE TABLE planet();
CREATE TABLE moon();
CREATE TABLE blackholes();

--Checking the current state of the DB
\d 
            List of relations
+--------+------------+-------+--------------+
| Schema |  Name      | Type  |    Owner     |
+--------+------------+-------+--------------+
| public | blackholes | table | freecodecamp |
| public | galaxy     | table | freecodecamp |
| public | moon       | table | freecodecamp |
| public | planet     | table | freecodecamp |
| public | star       | table | freecodecamp |
+--------+------------+-------+--------------+
(4 rows)

--We add the ID column that will work as primary key to each of the tables--
ALTER TABLE galaxy ADD COLUMN galaxy_id SERIAL;
ALTER TABLE star ADD COLUMN star_id SERIAL;
ALTER TABLE planet ADD COLUMN planet_id SERIAL;
ALTER TABLE moon ADD COLUMN moon_id SERIAL;
ALTER TABLE blackholes ADD COLUMN blackholes_id SERIAL;


--We convert each column into primary key--
ALTER TABLE galaxy ADD PRIMARY KEY(galaxy_id);
ALTER TABLE star ADD PRIMARY KEY(star_id);
ALTER TABLE planet  ADD PRIMARY KEY(planet_id);
ALTER TABLE moon ADD PRIMARY KEY(moon_id);
ALTER TABLE blackholes ADD PRIMARY KEY(blackholes_id);

--We create the name column for each of the tables--
ALTER TABLE galaxy ADD COLUMN name VARCHAR(30) NOT NULL UNIQUE;
ALTER TABLE star ADD COLUMN name VARCHAR(30) NOT NULL UNIQUE;
ALTER TABLE planet  ADD COLUMN name VARCHAR(30) NOT NULL UNIQUE;
ALTER TABLE moon  ADD COLUMN name VARCHAR(30) NOT NULL UNIQUE;
ALTER TABLE blackholes ADD COLUMN name VARCHAR(30) NOT NULL UNIQUE;

--Adding Columns--
ALTER TABLE star ADD COLUMN distance_from_earth_millions_km INT;
ALTER TABLE moon ADD COLUMN distance_from_earth_millions_km INT;
ALTER TABLE planet ADD COLUMN distance_from_earth_millions_km INT;
ALTER TABLE blackholes ADD COLUMN distance_from_earth_lightyears INT;

ALTER TABLE star ADD COLUMN has_life BOOLEAN;
ALTER TABLE moon ADD COLUMN has_life BOOLEAN;
ALTER TABLE planet ADD COLUMN has_life BOOLEAN;

ALTER TABLE star ADD COLUMN age_in_billions INT NOT NULL;
ALTER TABLE moon ADD COLUMN age_in_millions INT NOT NULL;
ALTER TABLE planet ADD COLUMN age_in_millions INT NOT NULL;

ALTER TABLE galaxy ADD COLUMN type_of_galaxy VARCHAR(30);
ALTER TABLE star ADD COLUMN type_of_star VARCHAR(30);
ALTER TABLE planet ADD COLUMN type_of_planet VARCHAR(30);
ALTER TABLE blackholes ADD COLUMN type_of_blackhole VARCHAR(30);

ALTER TABLE galaxy ADD COLUMN galaxy_description TEXT;
ALTER TABLE star ADD COLUMN star_description TEXT;
ALTER TABLE moon ADD COLUMN moon_description TEXT;
ALTER TABLE planet ADD COLUMN planet_description TEXT;
ALTER TABLE blackholes ADD COLUMN blackhole_description TEXT;

ALTER TABLE planet ADD COLUMN mass_relative_to_earth NUMERIC(3,1);

ALTER TABLE galaxy ADD COLUMN explored BOOLEAN;
--Applying foreign keys
ALTER TABLE star ADD COLUMN galaxy_id INT REFERENCES galaxy(galaxy_id);

ALTER TABLE planet ADD COLUMN star_id INT REFERENCES star(star_id);

ALTER TABLE moon ADD COLUMN planet_id INT REFERENCES planet(planet_id);
------------------------------------------------------------------
--Adding the values into the Galaxy table: Name, Type of Galaxy, Description and Explored--

INSERT INTO galaxy(name, type_of_galaxy, galaxy_description, explored) 
    VALUES ('Andromeda', 'Spiral', 'Andromeda, also known as M31, is a spiral galaxy located about 2.537 million light-years away from Earth. It is the nearest spiral galaxy to the Milky Way and is approximately 220,000 light-years in diameter. Andromeda is home to over a trillion stars and numerous star clusters and nebulae. It has a prominent bulge at its center and spiral arms extending outward. Andromeda is gravitationally bound to the Milky Way and is expected to collide with it in about 4 billion years.', FALSE),
    ('Centaurus A', 'Elliptical', 'Centaurus A is a peculiar galaxy located approximately 11 million light-years away from Earth. It is notable for its distinctive appearance, featuring a prominent dust lane across its center. Centaurus A is an active galaxy, with a supermassive black hole at its core emitting strong radio waves and X-rays. It is believed to be the result of a merger between a spiral and elliptical galaxy. The galaxy exhibits strong radio emissions and is an object of interest for astronomers studying active galactic nuclei.', TRUE ),
    ('Triangulum Galaxy', 'Spiral' ,'The Triangulum Galaxy, also known as Messier 33, is a spiral galaxy located approximately 3 million light-years away from Earth. It is the third-largest member of the Local Group of galaxies, after the Milky Way and Andromeda. Triangulum is characterized by its loose spiral arms and relatively small size compared to its larger neighbors. The galaxy is home to numerous young blue stars and star-forming regions. Despite its proximity, Triangulum appears faint to the naked eye due to its low surface brightness.', FALSE),
    ('Whirlpool Galaxy', 'Spiral','The Whirlpool Galaxy, also known as Messier 51, is a classic spiral galaxy located approximately 23 million light-years away from Earth. It is famous for its striking spiral arms and prominent companion galaxy, NGC 5195. The interaction between the two galaxies has triggered intense star formation in the Whirlpool Galaxy, visible in its bright knots and dust lanes. The Whirlpool Galaxy is a popular target for amateur astronomers and professional observatories alike, providing valuable insights into galaxy interactions and star formation processes.', TRUE),
    ('Sombrero Galaxy', 'Lenticular', 'The Sombrero Galaxy, also known as Messier 104, is a spiral galaxy located approximately 28 million light-years away from Earth. It derives its name from its distinctive appearance resembling a sombrero hat, with a bright central bulge and a prominent dust lane encircling its disk. The Sombrero Galaxy is classified as a lenticular galaxy due to its combination of features from both spiral and elliptical galaxies. It is home to a large central bulge of older stars and exhibits active star formation in its disk regions.',TRUE),
    ('Pinwheel Galaxy', 'Spiral', 'The Pinwheel Galaxy, also known as Messier 101, is a spiral galaxy located about 21 million light-years away from Earth. It is characterized by its spiral arms filled with young blue stars and extensive regions of star formation.' ,FALSE),
    ('Milky Way', 'Barred Spiral','The Milky Way is a barred spiral galaxy spanning about 100,000 light-years in diameter. It contains billions of stars, along with dust, gas, and a supermassive black hole at its center. Our solar system is located within one of its spiral arms, known as the Orion Arm. The Milky Way is home to numerous star clusters, nebulae, and other celestial phenomena.' ,TRUE);


--Adding the values into the Star table: Name, Distance from earth millions km, has life, age in billions, Type of Star, Description and Galaxy where it corresponds    --

INSERT INTO star(name, distance_from_earth_millions_km, has_life, age_in_billions, type_of_star, star_description, galaxy_id)
    VALUES ('Andromeda Alpha', 26, FALSE, 8, 'Main Sequence', 'Andromeda Alpha is a main sequence star located within the Andromeda Galaxy. It emits a bright, white light and is part of a binary system. Despite its age of 8 billion years, it continues to sustain nuclear fusion in its core, providing heat and light to its planetary system.', 1),
    ('Centaurus B', 40, TRUE, 10, 'Red Giant', 'Centaurus B is a red giant star located in the Centaurus A galaxy. With an age of 10 billion years, it has expanded and cooled from its original main sequence phase. Despite its advanced stage, Centaurus B supports life on its orbiting planets, including a diverse array of ecosystems.', 2),
    ('Triangulum Delta', 31, FALSE, 5, 'Binary System', 'Triangulum Delta is a binary star system within the Triangulum Galaxy. It consists of a massive blue supergiant and a compact white dwarf in close orbit. The blue supergiant emits intense ultraviolet radiation, sculpting the surrounding nebulae and influencing the evolution of nearby stars.', 3),
    ('Whirlpool Gamma', 55, FALSE, 6, 'Variable Star: Cepheid', 'Whirlpool Gamma is a variable star located in the Whirlpool Galaxy. As a Cepheid variable, it exhibits regular pulsations in brightness, which astronomers use to determine cosmic distances. Despite its relatively young age of 6.5 billion years, Whirlpool Gamma plays a crucial role in calibrating the cosmic distance ladder.', 4),
    ('Sombrero Epsilon', 68, FALSE, 9, 'White Dwarf', 'Sombrero Epsilon is a white dwarf star located in the Sombrero Galaxy. Formed from the remnants of a Sun-like star, it has ceased nuclear fusion and undergone gravitational collapse. Despite its small size, Sombrero Epsilon emits a faint glow, contributing to the stellar population of its host galaxy.',5),
    ('Andromeda Beta', 49, FALSE, 7, 'Red Supergiant','Andromeda Beta is a red supergiant star located in the Andromeda Galaxy. With an age of 7.2 billion years, it has expanded to a large size and emits a reddish glow. Despite its advanced stage of evolution, Andromeda Beta continues to play a vital role in the dynamics of its galactic environment.' ,1);

--Adding the values into the Planet table: Name, Distance from earth millions km, has life, age in millions, type of planet, mass relative to earth, description --

INSERT INTO planet(name, distance_from_earth_millions_km, has_life, age_in_millions, type_of_planet, mass_relative_to_earth, planet_description, star_id)
VALUES 
('Earth', 0, TRUE, 45400, 'Terrestrial', 1, 'Earth is the third planet from the Sun and the only known planet to support life. It has a diverse biosphere, including oceans, continents, and a protective atmosphere, making it uniquely habitable.',1),
('Mars', 54.6, FALSE, 4600, 'Terrestrial', 10.7, 'Mars, the fourth planet from the Sun, is known as the Red Planet due to its rusty-red surface. It features polar ice caps, deserts, and ancient river valleys, with ongoing exploration for signs of past life.',1),
('Jupiter', 588, FALSE, 4600, 'Gas Giant', 37.2, 'Jupiter, the largest planet in the Solar System, is predominantly composed of hydrogen and helium. It hosts a dynamic atmosphere featuring colorful bands, the Great Red Spot, and numerous moons.',2),
('Saturn', 1200, FALSE, 4600, 'Gas Giant', 95, 'Saturn, known for its spectacular ring system, is the second-largest planet in the Solar System. Its rings are composed of ice and dust particles, orbiting around the planets equator.',2),
('Neptune', 4300, FALSE, 4600, 'Ice Giant', 17.3, 'Neptune, the eighth and farthest known planet from the Sun, is characterized by its blue coloration due to methane in its atmosphere. It experiences high-speed winds and has a system of faint rings.',3),
('Kepler-186f', 492, FALSE, 1100, 'Terrestrial', 33.3, 'Kepler-186f is an exoplanet orbiting within the habitable zone of the Kepler-186 star system. It is considered one of the most Earth-like exoplanets discovered to date.',4),
('Gliese 581g', 20, FALSE, 8000, 'Terrestrial', 42.2, 'Gliese 581g is an exoplanet orbiting within the habitable zone of the red dwarf star Gliese 581. Its existence is still under debate, but if confirmed, it could support liquid water.',5),
('HD 209458 b', 150, FALSE, 6000, 'Gas Giant', 69, 'HD 209458 b is an exoplanet known for being one of the first to have its atmosphere detected. It orbits very close to its parent star, resulting in extreme temperatures.',6),
('Trappist-1e', 39, FALSE, 7600, 'Terrestrial', 78, 'Trappist-1e is an exoplanet orbiting within the habitable zone of the ultracool dwarf star Trappist-1. It is considered one of the best candidates for hosting extraterrestrial life.',4),
('PSR B1257+12 c', 980, FALSE, 2500, 'Terrestrial', 14.5, 'PSR B1257+12 c is an exoplanet orbiting a pulsar in the constellation Virgo. It is part of a planetary system that formed from the remnants of a supernova explosion.',5),
('WASP-12b', 870, FALSE, 1500, 'Gas Giant', 14.5, 'WASP-12b is an exoplanet with one of the shortest orbital periods discovered to date, completing an orbit around its parent star in just over one Earth day.',4),
('CoRoT-7b', 490, FALSE, 1500, 'Terrestrial', 95, 'CoRoT-7b is an exoplanet discovered by the CoRoT space telescope. It orbits very close to its parent star, resulting in extreme temperatures.',2),
('Kepler-438b', 470, FALSE, 4000, 'Terrestrial', 63.1, 'Kepler-438b is an exoplanet orbiting within the habitable zone of the red dwarf star Kepler-438. It is considered one of the most Earth-like exoplanets discovered to date.',2);

--Adding the values into the Moon table: name, distance from earth in millions km, has life, age in million of years, description and its closest planet[id]--
    
INSERT INTO moon(name, distance_from_earth_millions_km, has_life, age_in_millions, moon_description, planet_id)
VALUES 
('Moon', 384.4, FALSE, 4500, 'The Moon is Earth''s only natural satellite and the fifth largest moon in the Solar System. It is thought to have formed about 4.5 billion years ago.', 14), 
('Phobos', 9377, FALSE, 4500, 'Phobos is the larger and closer of the two moons of Mars. It is heavily cratered and may be a captured asteroid.', 16), 
('Deimos', 23460, FALSE, 4500, 'Deimos is the smaller and outermost of the two moons of Mars. It is irregularly shaped and heavily cratered.', 17), 
('Ganymede', 628.3, FALSE, 4500, 'Ganymede is the largest moon of Jupiter and in the Solar System. It has a subsurface ocean and is larger than the planet Mercury.', 23), 
('Europa', 671.1, FALSE, 4500, 'Europa is the smallest of Jupiter''s Galilean moons, but it has a subsurface ocean that could harbor life. Its surface is covered in ice.', 23),
('Io', 421.6, FALSE, 4500, 'Io is the most volcanically active body in the Solar System. It has over 400 active volcanoes and is continuously reshaped by lava flows.', 23),
('Callisto', 748.9, FALSE, 4500, 'Callisto is the second largest moon of Jupiter and is heavily cratered. It has the oldest surface of any moon in the Solar System.', 23), 
('Titan', 1257, FALSE, 4500, 'Titan is the largest moon of Saturn and is the only moon in the Solar System with a thick atmosphere. It has methane lakes and rivers on its surface.', 24), 
('Enceladus', 238, FALSE, 4500, 'Enceladus is one of Saturn''s innermost moons and is covered in ice. It has geysers of water vapor erupting from its south pole.', 24), 
('Mimas', 185.5, FALSE, 4500, 'Mimas is a small moon of Saturn and is notable for its large crater, Herschel, which gives it a resemblance to the Death Star.', 24), 
('Iapetus', 3567, FALSE, 4500, 'Iapetus is a moon of Saturn with a two-tone coloration. One hemisphere is dark and heavily cratered, while the other is bright and icy.', 24), 
('Triton', 354, FALSE, 4500, 'Triton is the largest moon of Neptune and is geologically active. It has cryovolcanoes erupting nitrogen gas and a thin atmosphere.', 25), 
('Proteus', 117647, FALSE, 4500, 'Proteus is the second-largest moon of Neptune and is irregularly shaped. It orbits close to Neptune and is heavily cratered.', 25), 
('Charon', 19591, FALSE, 4500, 'Charon is the largest moon of Pluto and is so large that Pluto and Charon are sometimes considered a binary system. It has a reddish color.', 16), 
('Luna', 384.4, FALSE, 4500, 'Luna is Earth''s only natural satellite and the fifth largest moon in the Solar System. It is thought to have formed about 4.5 billion years ago.', 21), 
('Ariel', 191, FALSE, 4500, 'Ariel is one of Uranus''s larger moons and is the brightest of its moons. It has a young surface with few impact craters and many valleys.', 17),
('Umbriel', 266, FALSE, 4500, 'Umbriel is a moon of Uranus and has a heavily cratered surface. It has a dark coloration due to its icy surface and lack of geological activity.', 17),
('Miranda', 130, FALSE, 4500, 'Miranda is one of Uranus''s smaller moons and is the most geologically diverse moon in the Solar System. It has cliffs, canyons, and cratered plains.', 17), 
('Titania', 436, FALSE, 4500, 'Titania is the largest moon of Uranus and is covered in impact craters and rift valleys. It has a thin nitrogen atmosphere.', 17), 
('Triton II', 354, FALSE, 4500, 'Triton II is the largest moon of Neptune and is geologically active. It has cryovolcanoes erupting nitrogen gas and a thin atmosphere.', 23); 

--Adding the values into the Blacholes table: Name, Distance from earth in lightyears, type of blacholes and a brief description--

INSERT INTO blackholes(name, distance_from_earth_lightyears, type_of_blackhole, blackhole_description)
VALUES 
('Sagittarius A*', 26000, 'Supermassive', 'Sagittarius A* is a supermassive black hole located at the center of the Milky Way Galaxy. It has a mass equivalent to approximately 4.1 million solar masses.'),
('M87*', 55000, 'Supermassive', 'M87* is a supermassive black hole located in the center of the giant elliptical galaxy Messier 87. It was the first black hole ever imaged directly by the Event Horizon Telescope.'),
('Cygnus X-1', 6070, 'Stellar', 'Cygnus X-1 is a stellar-mass black hole in a binary system with a blue supergiant star. It was the first black hole ever discovered and is one of the brightest X-ray sources in the sky.'),
('V404 Cygni', 7800, 'Stellar', 'V404 Cygni is a stellar-mass black hole in a binary system with a low-mass star. It is known for its frequent outbursts, emitting X-rays and gamma rays.'),
('GW150914', 1300, 'Intermediate', 'GW150914 is an intermediate-mass black hole formed from the merger of two black holes in a distant galaxy. Its detection in gravitational waves confirmed the existence of such black holes.'),
('LB-1', 7800, 'Stellar', 'LB-1 is a stellar-mass black hole in the Milky Way Galaxy, orbiting a blue giant star. Its discovery challenged existing theories about the formation of black holes in binary systems.');
