// "Culturel&Equality" adında yeni bir sınıf düğümü oluştur
MERGE (CE:Classes {name: 'Culturel&Equality'})
  ON CREATE SET CE.description = 'Represents the combined concept of Culture and Equality in various contexts.'
  ON MATCH SET CE.description = 'Represents the combined concept of Culture and Equality in various contexts.'
WITH CE

// Diğer sınıflarla ilişkileri oluştur
MATCH (c:Classes)
WHERE c.name IN ['Equality', 'Culture', 'Technology', 'Community']
MERGE (CE)-[:HAS_ASPECT]->(c);

// Düğümleri ve açıklamalarını burada ekledim
MERGE (E:Classes {name: 'Equality'})
  ON CREATE SET E.description = 'Represents the concept of equality and fairness in various contexts.'
  ON MATCH SET E.description = 'Represents the concept of equality and fairness in various contexts.'

MERGE (T:Classes {name: 'Technology'})
  ON CREATE SET T.description = 'Encompasses various technological advancements and innovations.'
  ON MATCH SET T.description = 'Encompasses various technological advancements and innovations.'

MERGE (Co:Classes {name: 'Community'})
  ON CREATE SET Co.description = 'Represents the idea of a community, a group of individuals living together.'
  ON MATCH SET Co.description = 'Represents the idea of a community, a group of individuals living together.'

MERGE (Cu:Classes {name: 'Culture'})
  ON CREATE SET Cu.description = 'Encompasses the cultural aspects and traditions of a society.'
  ON MATCH SET Cu.description = 'Encompasses the cultural aspects and traditions of a society.'

MERGE (So:Subclasses {name: 'Social Justice', description:'A structure that focuses on principles of social justice such as social equality, fair opportunities, and equitable distribution of resources.'})
MERGE (Inc:Subclasses {name: 'Inclusion', description:'Focusing on principles that involve inclusive thinking for society and encouraging equal participation of diverse groups.'})
MERGE (Acc:Subclasses {name: 'Accessibility', description:'A structure emphasizing equal and accessible access to diverse resources.'})
MERGE (Sen:Subclasses {name: 'Sensors', description:'Creating a structure that emphasizes the identification and investigation process of specific crimes.'})
MERGE (IoT:Subclasses {name: 'Iot Devices', description:'Special situations and related concepts under examination in the context of crime investigation and security.'})
MERGE (CoI:Subclasses {name: 'Communications Infrastructure', description:'The subclass "Data Analytic Systems" may encompass technological systems that perform data analysis and interpretation processes.'})
MERGE (Rez:Subclasses {name: 'Rezident', description:'An ontology structure encompassing focused examinations on a specific settlement area or unit.'})
MERGE (Org:Subclasses {name: 'Organizations', description:'Engaged in activities within a specific community and may encompass organized institutions in various fields.'})
MERGE (Ins:Subclasses {name: 'Institutions', description:'May encompass organizations providing community services with an official and defined structure.'})
MERGE (Div:Subclasses {name: 'Diversity', description:'It represents a structure focused on different cultures, traditions, and values.'})
MERGE (Tra:Subclasses {name: 'Traditions', description:'It signifies a structure that involves the transmission of specific cultural practices from the past to the present. It includes traditional rituals, ceremonies, and other cultural practices.'})
MERGE (Art:Subclasses {name: 'Arts', description:'It represents a structure encompassing artistic expressions and creative activities within a culture. It may include disciplines such as painting, music, literature, and other artistic forms.'})
MERGE (Her:Subclasses {name: 'Heritage', description:'Heritage refers to a structure that encapsulates and values the cultural elements carried from the past to the present within a specific culture. It may encompass traditions, rituals, handicrafts, and other cultural heritage elements.'})
MERGE (IoS:Subclasses_1 {name: 'Iot Sensors', description:'Can create a structure that intricately examines specific crimes currently under investigation.'})
MERGE (Data:Subclasses_1 {name: 'Data Analytics Systems', description:'Includes the examination of specific situations and related concepts in the context of crime investigation and security through the utilization of data analytics systems.'})
MERGE (Sp:Subclasses_1 {name: 'Social Programs', description:'Special programs implemented interactively within the community, focusing on areas such as social services, assistance, or development.'})
MERGE (ComC:Subclasses_1 {name: 'Community Centers', description:'May encompass structures that serve a specific community and focus on various social activities.'})
MERGE (CuE:Subclasses_1{name: 'Culture Events', description:'It signifies a structure aimed at introducing a specific culture and focusing on cultural activities.'})
MERGE (His:Subclasses_1 {name: 'Historical Artifacts', description:'It denotes a structure that reflects the history of a culture and encompasses significant cultural heritage. It may include ancient artifacts, museums, historical buildings, and other cultural legacies.'});

// class ve subclass ilişkilerini burada oluşturdum
MATCH (c:Classes), (s:Subclasses)
WHERE c.name = 'Equality' AND s.name IN ['Social Justice', 'Inclusion', 'Accessibility']
MERGE (c)-[:HAS_SUBCLASS]->(s);

MATCH (c:Classes), (s:Subclasses)
WHERE c.name = 'Technology' AND s.name IN ['Sensors', 'Iot Devices', 'Communications Infrastructure']
MERGE (c)-[:HAS_SUBCLASS]->(s);

MATCH (c:Classes), (s:Subclasses)
WHERE c.name = 'Community' AND s.name IN ['Rezident', 'Organizations', 'Institutions']
MERGE (c)-[:HAS_SUBCLASS]->(s);

MATCH (c:Classes), (s:Subclasses)
WHERE c.name = 'Culture' AND s.name IN ['Diversity', 'Traditions', 'Arts', 'Heritage']
MERGE (c)-[:HAS_SUBCLASS]->(s);

// subclass ve subclass_1 ilişkilerini burada oluşturdum
MATCH (Sen:Subclasses {name: 'Sensors'}), (IoS:Subclasses_1 {name: 'Iot Sensors'})
MERGE (Sen)-[:Smart_City_Tech]->(IoS);

MATCH (IoT:Subclasses {name: 'Iot Devices'}), (IoS:Subclasses_1 {name: 'Iot Sensors'})
MERGE (IoT)-[:Smart_City_Tech]->(IoS);

MATCH (IoT:Subclasses {name: 'Iot Devices'}), (Data:Subclasses_1 {name: 'Data Analytics Systems'})
MERGE (IoT)-[:Smart_City_Tech]->(Data);

MATCH (CoI:Subclasses {name: 'Communications Infrastructure'}), (Data:Subclasses_1 {name: 'Data Analytics Systems'})
MERGE (CoI)-[:Smart_City_Tech]->(Data);

MATCH (Rez:Subclasses {name: 'Rezident'}), (Sp:Subclasses_1 {name: 'Social Programs'})
MERGE (Rez)-[:Inclusive_Community]->(Sp);

MATCH (Org:Subclasses {name: 'Organizations'}), (Sp:Subclasses_1 {name: 'Social Programs'})
MERGE (Org)-[:Inclusive_Community]->(Sp);

MATCH (Org:Subclasses {name: 'Organizations'}), (ComC:Subclasses_1 {name: 'Community Centers'})
MERGE (Org)-[:Inclusive_Community]->(ComC);

MATCH (Ins:Subclasses {name: 'Institutions'}), (ComC:Subclasses_1 {name: 'Community Centers'})
MERGE (Ins)-[:Inclusive_Community]->(ComC);

MATCH (Div:Subclasses {name: 'Diversity'}), (CuE:Subclasses_1 {name: 'Culture Events'})
MERGE (Div)-[:Diverse_Heritage]->(CuE);

MATCH (Tra:Subclasses {name: 'Traditions'}), (CuE:Subclasses_1 {name: 'Culture Events'})
MERGE (Tra)-[:Diverse_Heritage]->(CuE);

MATCH (Art:Subclasses {name: 'Arts'}), (His:Subclasses_1 {name: 'Historical Artifacts'})
MERGE (Art)-[:Diverse_Heritage]->(His);

MATCH (Her:Subclasses {name: 'Heritage'}), (His:Subclasses_1 {name: 'Historical Artifacts'})
MERGE (Her)-[:Diverse_Heritage]->(His);

// Property eklemek için
MATCH (sen:Subclasses {name: 'Sensors'})-[r:Smart_City_Tech]->(ios:Subclasses_1 {name: 'Iot Sensors'})
MERGE (p:Property {name: 'hasChainedProperty'})
MERGE (sen)-[:HAS_CHAINED_PROPERTY]->(p)
ON CREATE SET p.value = 'https://en.wikipedia.org/wiki/Sensor'
ON MATCH SET p.value = 'https://en.wikipedia.org/wiki/Sensor';
