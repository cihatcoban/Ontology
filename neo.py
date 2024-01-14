from rdflib import Graph, URIRef, Literal, BNode, Namespace
from rdflib.namespace import RDF, RDFS

# RDF verisi için bir Graph oluşturalım
g = Graph()

# Varsayılan isim alanı
ex = Namespace("your-namespace-here")

# "Culturel&Equality" sınıf düğümü
culturel_equality = ex.CulturelEquality
g.add((culturel_equality, RDF.type, ex.Classes))
g.add((culturel_equality, RDFS.label, Literal("Culturel&Equality")))
g.add((culturel_equality, RDFS.comment, Literal("Represents the combined concept of Culture and Equality in various contexts.")))

# Diğer sınıflar ve ilişkileri
classes = ["Equality", "Technology", "Community", "Culture"]
for class_name in classes:
    class_node = getattr(ex, class_name)
    g.add((culturel_equality, ex.hasAspect, class_node))

    class_node_uri = getattr(ex, class_name)
    g.add((class_node_uri, RDF.type, ex.Classes))
    g.add((class_node_uri, RDFS.label, Literal(class_name)))

# Alt sınıflar
subclasses = {
    "SocialJustice": "A structure that focuses on principles of social justice such as social equality, fair opportunities, and equitable distribution of resources.",
    "Inclusion": "Focusing on principles that involve inclusive thinking for society and encouraging equal participation of diverse groups.",
    "Accessibility": "A structure emphasizing equal and accessible access to diverse resources.",
    "Sensors": "Creating a structure that emphasizes the identification and investigation process of specific crimes.",
    "IotDevices": "Special situations and related concepts under examination in the context of crime investigation and security.",
    "CommunicationsInfrastructure": "The subclass 'Data Analytic Systems' may encompass technological systems that perform data analysis and interpretation processes.",
    "Rezident": "An ontology structure encompassing focused examinations on a specific settlement area or unit.",
    "Organizations": "Engaged in activities within a specific community and may encompass organized institutions in various fields.",
    "Institutions": "May encompass organizations providing community services with an official and defined structure.",
    "Diversity": "It represents a structure focused on different cultures, traditions, and values.",
    "Traditions": "It signifies a structure that involves the transmission of specific cultural practices from the past to the present. It includes traditional rituals, ceremonies, and other cultural practices.",
    "Arts": "It represents a structure encompassing artistic expressions and creative activities within a culture. It may include disciplines such as painting, music, literature, and other artistic forms.",
    "Heritage": "Heritage refers to a structure that encapsulates and values the cultural elements carried from the past to the present within a specific culture. It may encompass traditions, rituals, handicrafts, and other cultural heritage elements.",
    "IotSensors": "Can create a structure that intricately examines specific crimes currently under investigation.",
    "DataAnalyticsSystems": "Includes the examination of specific situations and related concepts in the context of crime investigation and security through the utilization of data analytics systems.",
    "SocialPrograms": "Special programs implemented interactively within the community, focusing on areas such as social services, assistance, or development.",
    "CommunityCenters": "May encompass structures that serve a specific community and focus on various social activities.",
    "CultureEvents": "It signifies a structure aimed at introducing a specific culture and focusing on cultural activities.",
    "HistoricalArtifacts": "It denotes a structure that reflects the history of a culture and encompasses significant cultural heritage. It may include ancient artifacts, museums, historical buildings, and other cultural legacies."
}

for subclass_name, subclass_comment in subclasses.items():
    subclass_node = getattr(ex, subclass_name)
    g.add((subclass_node, RDF.type, ex.Subclasses))
    g.add((subclass_node, RDFS.label, Literal(subclass_name)))
    g.add((subclass_node, RDFS.comment, Literal(subclass_comment)))

    g.add((culturel_equality, ex.hasSubclass, subclass_node))


# Oluşturulan RDF grafiğini Turtle formatında yazma işlemi
rdf_turtle = g.serialize(format="turtle")
print(rdf_turtle)

# RDF
with open("output.ttl", "w", encoding="utf-8") as f:
    f.write(rdf_turtle)

