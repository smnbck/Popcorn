//
//  MediaStreamsArray.swift
//  Popcorn
//
//  Created by Simon Back on 23.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import Foundation

class MediaStreamsArray {
    let array: [MediaStream] = [
        
        // MARK: - Filme
        MovieStream(id: 1, title: "Inception",
                    description: "Cobb ist der Anführer einer technologisch bestens ausgerüsteten Bande von Dieben, die einen Weg gefunden hat, Träume in den Köpfen von Menschen zu platzieren und zu steuern, indem man sich selbst in ihnen manifestiert. Auf diesem Weg soll der aufstrebende Manager Fischer dazu bewegt werden, seine künftige Firma aufzusplitten.",
                    duration: 141, genre: "Thriller", usk: "12", rating: "8,8"),
        
        MovieStream(id: 2, title: "Der Pate",
                    description: "Ein abschreckendes Portrait über Aufstieg und Fall eines sizilianischen Clans in Amerika. Grandios balanciert die Handlung zwischen dem Familienleben der Corleones und den schmutzigen Mafia-Geschäften, in die sie verwickelt sind.",
                    duration: 177, genre: "Drama", usk: "16", rating: "9,2"),
        
        MovieStream(id: 3, title: "Kung Fu Panda",
                    description: "Als Nudelsuppen-Lehrling hat Po, der Panda, seinen Beruf längst gefunden. Heimlich träumt der pummelige Bär davon, ein berühmter Kung Fu-Kämpfer zu sein, doch im Grunde ist jedem klar, dass er besser beim Essen fassen und Sprüche klopfen ist als beim Anwenden von raffinierter Kampftechnik. Das Schicksal allerdings hat Großes mit dem wohl größten Faulenzer im alten China vor.",
                    duration: 88, genre: "Zeichentrick", usk: "6", rating: "7,6"),
        
        MovieStream(id: 4, title: "Fast & Furious 7",
                    description: "Alle Hauptdarsteller sind wieder am Start - Dominic Torettos (Vin Diesel) Team konnte Widersacher Owen Shaw zwar ausschalten ... doch Owens Bruder Ian (Jason Statham) schwört Rache. Dom und seine Freunde sind inzwischen zu einer Familie zusammengewachsen, die nicht einmal Ian Shaw auseinanderbringen kann ... oder doch?",
                    duration: 137, genre: "Action", usk: "12", rating: "7,2"),
        
        MovieStream(id: 5, title: "Ex_Machina",
                    description: "Ein junger Programmierer (Domhnall Gleeson) soll für den Chef seines Konzerns (Oscar Isaac) an einem Experiment teilnehmen und mit der ersten, wahren künstlichen Intelligenz interagieren: einer bildschönen Roboterfrau (Alicia Vikander). In dem packenden Film stellen sich für Caleb viele Fragen: Worin unterscheiden sich Wahrheit und Lüge? Was ist das Wesen von Bewusstsein, Emotion und Sexualität?",
                    duration: 108, genre: "Sci-Fi", usk: "12", rating: "7,7"),
        
        MovieStream(id: 6, title: "Titanic",
                    description: "Das Jahr 2012 markiert den 100. Jahrestag des Untergangs der Titanic, des damals modernsten Passagierschiffs der Welt, das auf seiner Jungfernfahrt im April 1912 mit einem Eisberg kollidierte und sank.",
                    duration: 195, genre: "Drama", usk: "12", rating: "7,7"),
        
        MovieStream(id: 7, title: "Stirb langsam 4.0",
                    description: "Amerika wird bedroht - von innen! Eine Terror-Organisation um den genialen Greg plant, die Infrastruktur des Landes lahmzulegen, indem sämtliche Computerverbindungen abgeschaltet werden. Während das Land im Chaos versinkt, ist es wieder einmal an John McClane, in die Bresche zu springen. Unterstützt von dem jungen Hacker Matt, nimmt McClane den Kampf gegen die Terroristen auf.",
                    duration: 123, genre: "Action", usk: "16", rating: "7,2"),
        
        MovieStream(id: 8, title: "Der Hobbit: Schlacht der fünf Heere",
                    description: "Oscar-Preisträger Peter Jackson kehrt in dem letzten der drei auf dem historischen Meisterwerk von J.R.R. Tolkien basierenden Filme nach Mittelerde zurück, 60 Jahre vor dem Beginn der Herr der Ringe -Trilogie.",
                    duration: 144, genre: "Abenteuer", usk: "12", rating: "7,4"),
        
        MovieStream(id: 9, title: "Django Unchained",
                    description: "Um den berüchtigten Brittle-Brüdern auf die Spur zu kommen, befreit der als Zahnarzt getarnte Kopfgeldjäger Dr. King Schultz einen Sklaven, der ihm den Weg weisen kann.",
                    duration: 158, genre: "Western", usk: "16", rating: "8,4"),
        
        MovieStream(id: 10, title: "Fight Club",
                    description: "Designerwohnung, hochbezahlter Job, teure Autos und eine goldene Kreditkarte. Es sind Männer, die kurz vor der Vollkommenheit stehen und denen dennoch etwas fehlt. Es sind Männer ohne Zweck, ohne Ziel. Die Komplexität ihres Alltags macht ihnen zu schaffen, sie lechzen nach einfachen Sinneserfahrungen.",
                    duration: 133, genre: "Thriller", usk: "18", rating: "8,8"),
        
        MovieStream(id: 11, title: "Pulp Fiction",
                    description: "Vincent Vega und Jules Winnfield holen für ihren Boss Marsellus Wallace eine schwarze Aktentasche aus einer Wohnung ab. Drei Jungs, die ihnen dabei im Wege stehen, lassen ihr Leben. Die Killer machen sich mit einem vierten Jungen als Geisel auf den Weg ins Hauptquartier. Doch als das Auto über eine Straßenerhöhung schaukelt, erschießt Vincent aus Versehen die Geisel.",
                    duration: 154, genre: "Thriller", usk: "16", rating: "8,9"),
            
            
        // MARK: - Serien
        
        SeriesStream(id: 12, title: "House of Cards",
                     description: "Weil der frisch gewählte US-Präsident Walker ihm das fest versprochene Amt des Außenministers verwehrt hat, plant der machtbesessene Kongressabgeordnete Francis Underwood eine Intrige gegen die Regierung.",
                     seasons: [
                        Season(episodes: [
                            Episode(episodeId: 1, title: "1. Das Spiel beginnt", duration: 56,
                                    description: "Willkommen im Löwenkäfig Washington D.C.: Für seine politische Karriere ist der machtgierige Kongressabgeordnete Francis Underwood zu fast allem bereit."),
                            Episode(episodeId: 2, title: "2. Der Gesetzesentwurf", duration: 50,
                                    description: "Mit einem raffinierten Plan will der Kongressabgeordnete Francis Underwood den designierten Außenminister ins Abseits befördern. Außerdem engagiert er ein paar Elitestudenten, die ihm einen Entwurf für eine Bildungsreform erstellen sollen."),
                            Episode(episodeId: 3, title: "3. Der Wasserturm", duration: 51,
                                    description: "Ein Wasserturm in Form eines Pfirsichs droht in Frank Underwoods Heimatstaat South Carolina eine PR-Krise auszulösen, die ihn den Kopf kosten könnte. Der Kongressabgeordnete muss die schwierigen Besprechungen mit den Gewerkschaften über die Bühne bringen."),
                            Episode(episodeId: 4, title: "4. Die Intrige", duration: 49,
                                    description: "Frank Underwood (Kevin Spacey) spielt seine Kongresskollegen gegeneinander aus, um eine Mehrheit für seinen Gesetzesentwurf zur Bildungsreform zu erlangen."),
                            Episode(episodeId: 5, title: "5. Die Spendengala", duration: 52,
                                    description: "Mit seinem Kampf für das Gesetz zur Bildungsreform gefährdet der Kongressabgeordnete Francis Underwood die ehrgeizigen Pläne seiner Frau Claire. Reporterin Zoe verbindet unterdessen Arbeit und Privatleben."),
                            Episode(episodeId: 6, title: "6. Der Streik", duration: 50,
                                    description: "Der Kongressabgeordnete Francis Underwood schlägt gegen die streikenden Lehrerverbände zurück. Seine Frau Claire wird von einem unerwarteten Geständnis überrascht."),
                            Episode(episodeId: 7, title: "7. Neustart", duration: 54,
                                    description: "Der Kongressabgeordnete Francis Underwood geht aus einem wichtigen Kampf als Sieger hervor. Aber er hat keine Zeit, sich auf seinen Lorbeeren auszuruhen. Peter Russo muss sich seiner Vergangenheit stellen."),
                            Episode(episodeId: 8, title: "8. Die gute alte Zeit", duration: 47,
                                    description: "Der Kongressabgeordnete Francis Underwood wird an seiner Alma Mater ausgezeichnet. Peter Russo kehrt derweil nach Philadelphia zurück. Beide Männer müssen noch ein paar unerledigte Aufgaben zu Ende führen."),
                            Episode(episodeId: 9, title: "9. Gewissensentscheidung", duration: 52,
                                    description: "Der Abgeordnete Peter Russo geht mit Vizepräsident Matthews auf Wahl-Tournee. Francis Underwood und Doug Stamper versuchen, als Einpeitscher die Unterstützung des Kongresses für ihren Gesetzesentwurf zu gewinnen."),
                            Episode(episodeId: 10, title: "10. Im freien Fall", duration: 53,
                                    description: "Der Kongressabgeordnete Francis Underwood muss dem Präsidenten erklären, warum der Gesetzesentwurf abgelehnt wurde. Bald stellt er fest, dass seine Frau Claire an seiner Niederlage nicht ganz unschuldig war."),
                            Episode(episodeId: 11, title: "11. Erlösung", duration: 54,
                                    description: "Der Abgeordnete Peter Russo hat nach einem verpatzten Interview alle Chancen auf das Gouverneursamt von Pennsylvania verspielt. Als er im Suff androht, über Francis Underwoods Machenschaften auszupacken, muss Francis zu drastischen Mitteln greifen."),
                            Episode(episodeId: 12, title: "12. Der Wunschkandidat", duration: 53,
                                    description: "Francis Underwood soll im Auftrag des Präsidenten den Multimilliardär Raymond Tusk überreden, Vizepräsident zu werden. Zoe wird klar, dass sie von Underwood ausgenutzt wurde und stellt Recherchen zu Russos vermeintlichem Selbstmord an."),
                            Episode(episodeId: 13, title: "13. Der neue Vizepräsident", duration: 50,
                                    description: "Der Kongressabgeordnete Francis Underwood versucht zu verhindern, dass Multimilliardär Raymond Tusk neuer Vizepräsident wird. Zoe spürt bei ihren Recherchen eine Prostituierte auf, die einst bei Peter Russo im Auto saß, als dieser festgenommen wurde.")
                            ]),
                        Season(episodes: [
                            Episode(episodeId: 1, title: "1. Jäger oder Gejagter?", duration: 56,
                                    description: "Politikveteran Frank Underwood hat inzwischen das Amt des US-Vizepräsidenten erobert. Doch Journalistin Zoe Barnes und ihre Kollegen drohen aufzudecken, dass Underwood am Tod des Abgeordneten Peter Russo nicht ganz unschuldig war. Underwoods Gattin Claire versucht derweil, die Klage einer ehemaligen Mitarbeiterin abzuwenden."),
                            Episode(episodeId: 2, title: "2. Ein Freund der Familie", duration: 50,
                                    description: "Vizepräsident Frank Underwood ist dabei, eine ihm gewogene und skrupellose Abgeordnete zu seiner Nachfolgerin als Fraktionsführer aufzubauen. Zoes Kollege Lucas Goodwin versucht mit allen Mitteln, die Wahrheit ans Licht zu bringen. Claire muss sich ihrer traumatischen Vergangenheit stellen."),
                            Episode(episodeId: 3, title: "3. Senatoren in Handschellen", duration: 51,
                                    description: "Frank Underwood muss seine neue Machtposition ausspielen, um bei einer wichtigen Abstimmung im Senat eine Niederlage abzuwenden. Zoes Kollege Lucas Goodwin setzt seine Recherchen fort und macht dabei das FBI auf sich aufmerksam. Frank und Claire sind auf der Suche nach einem PR-Manager."),
                            Episode(episodeId: 4, title: "4. Das Fernsehinterview", duration: 49,
                                    description: "Nach einem Terror-Alarm im Capitol sitzt Frank Underwood dort gemeinsam mit dem Bildungspolitiker Donald Blythe fest. Der hat noch eine Rechnung mit ihm offen. Claire Underwood gibt bei einem Aufsehen erregenden Fernsehinterview einige schmerzhafte Erinnerungen preis und bewegt die Nation."),
                            Episode(episodeId: 5, title: "5. Die Brücke", duration: 52,
                                    description: "Frank Underwood kommuniziert auf inoffiziellem Wege mit einem chinesischen Milliardär. Lucas Goodwin wählt extreme Mittel, um den Vizepräsidenten bloßzustellen. Das Team Underwood bekommt Verstärkung durch eine zwielichtige Persönlichkeit."),
                            Episode(episodeId: 6, title: "6. Hitzewelle", duration: 50,
                                    description: "Mitten in einer Energiekrise beenden Frank Underwood und Raymond Tusk ihre fragile Allianz. Lucas Goodwin muss eine schwierige Entscheidung fällen. Doug Stamper und Rachel kommen sich näher."),
                            Episode(episodeId: 7, title: "7. Spendengelder", duration: 54,
                                    description: "Trotz einiger Reibungspunkte vertiefen die Walkers ihre Freundschaft mit den Underwoods. Zwischen Frank und Raymond Tusk herrscht dagegen Krieg."),
                            Episode(episodeId: 8, title: "8. Auf souveränem Boden", duration: 47,
                                    description: "Frank Underwoods Konflikt mit Raymond Tusk eskaliert. Claire beeinflusst Tricia Walker in Politik- und Haushaltsfragen. Zwischen Frank und Linda Vasquez kommt es zu einer Konfrontation."),
                            Episode(episodeId: 9, title: "9. Bauernopfer", duration: 52,
                                    description: "Der Krieg zwischen Raymond Tusk und den Underwoods artet ins Persönliche aus. Freddy und sein Barbecue-Joint geraten zwischen die Fronten."),
                            Episode(episodeId: 10, title: "10. Personenschutz", duration: 53,
                                    description: "Frank Underwood will Raymond Tusk endgültig erledigen. Zwischen Claire und Jackie Sharp kommt es zum Konflikt."),
                            Episode(episodeId: 11, title: "11. Unter Zugzwang", duration: 54,
                                    description: "Frank Underwood (Kevin Spacey) muss einer Sonderermittlerin Rede und Antwort stehen. Remy Danton versucht sich alle Optionen offen zu halten. Doug Stamper (Michael Kelly) kämpft mit seinen Dämonen."),
                            Episode(episodeId: 12, title: "12. Isoliert", duration: 53,
                                    description: "Frank Underwood (Kevin Spacey) steht plötzlich ganz alleine da. Claire (Robin Wright) muss ein großes Opfer bringen. Doug Stamper (Michael Kelly) versucht, die Kontrolle zurückzugewinnen."),
                            Episode(episodeId: 13, title: "13. Todesstoß", duration: 50,
                                    description: "Während die Nation in Aufruhr ist, steht Frank Underwood (Kevin Spacey) vor dem Untergang. Doug Stamper (Michael Kelly) muss lose Enden wieder zusammenführen. Claire (Robin Wright) muss für ihre Rücksichtslosigkeit einen hohen Preis zahlen.")
                            ]),
                        Season(episodes: [
                            Episode(episodeId: 1, title: "1. Die Kehrseite der Macht", duration: 56,
                                    description: "Frank Underwood und seine Frau Claire haben ihr Ziel erreicht: Underwood ist seit mehreren Monaten Präsident der Vereinigten Staaten. Doch politische und private Schwierigkeiten setzen das Paar schon bald unter Druck."),
                            Episode(episodeId: 2, title: "2. Zwischenlösung", duration: 50,
                                    description: "Die nächsten Präsidentschaftswahlen werfen ihre Schatten voraus und bringen Frank Underwood in Bedrängnis. Seine Frau Claire bekommt die Macht der Medien zu spüren. Jackie Sharp schmiedet große Pläne."),
                            Episode(episodeId: 3, title: "3. Staatsbankett", duration: 51,
                                    description: "Der Besuch eines ausländischen Staatsoberhaupts verläuft nicht nach Frank Underwoods Vorstellungen. Seine Frau Claire findet in der Außenministerin eine Unterstützerin. Einer von Franks Vertrauten bekommt ein überraschendes Angebot."),
                            Episode(episodeId: 4, title: "4. Die Kandidatin", duration: 49,
                                    description: "Claire Underwood kämpft im UN-Sicherheitsrat für eine Friedensmission und droht an einer Veto-Macht zu scheitern. Frank bekommt ernsthafte Konkurrenz für die kommenden Präsidentschaftsvorwahlen. Ein Soldatenbegräbnis und ein Treffen mit dem Opfer eines Drohnenangriffs lassen ihn an sich selbst zweifeln."),
                            Episode(episodeId: 5, title: "5. Ausnahmezustand", duration: 52,
                                    description: "Mithilfe eines Notstandsparagraphen will Frank Underwood sein Programm zur Bekämpfung der Arbeitslosigkeit durchboxen. Claire benötigt zur Durchsetzung der Friedensresolution präsidiale Schützenhilfe von ihrem Mann. Einer von Franks alten Vertrauten wechselt die Fronten."),
                            Episode(episodeId: 6, title: "6. Wahrer Mut", duration: 50,
                                    description: "Präsident Underwood und seine Frau Claire reisen nach Moskau. Dort wollen sie über die Freilassung eines inhaftierten US-Bürgers verhandeln. Claire sorgt mit einer öffentlichen Erklärung für einen Eklat"),
                            Episode(episodeId: 7, title: "7. Ein neues Gelübde", duration: 54,
                                    description: "Zwischen Präsident Frank Underwood und seiner Frau Claire herrscht dicke Luft. Mit einem neuen Gelübde wollen sie die Wogen glätten. Frank steht innen- und außenpolitisch unter großem Druck."),
                            Episode(episodeId: 8, title: "8. Hurrikan", duration: 47,
                                    description: "Ein Hurrikan bedroht nicht nur die gesamte Ostküste, sondern auch US-Präsident Frank Underwoods (Kevin Spacey) Budget. Er muss eine schwierige Entscheidung treffen."),
                            Episode(episodeId: 9, title: "9. Rache auf Russisch", duration: 52,
                                    description: "Ein verheerendes Ereignis im Jordantal sorgt für politischen Zündstoff. Claire (Robin Wright) erhält geheime Informationen und berät ihren Mann (Kevin Spacey). Doch die Reaktion des US-Präsidenten hat nicht die erwünschte Wirkung - ganz im Gegenteil!"),
                            Episode(episodeId: 10, title: "10. Spitzentreffen", duration: 53,
                                    description: "US-Präsident Frank Underwood (Kevin Spacey) trifft den russischen Präsidenten zu Verhandlungen. Claire (Robin Wright) versucht derweil, ihre Friedensmission zu retten. Doch beide kommen nicht darum herum, schwere Opfer zu bringen."),
                            Episode(episodeId: 11, title: "11. Die Fernsehdebatte", duration: 54,
                                    description: "Frank Underwood hat einen wichtigen TV-Termin und macht sich dabei neue Feinde. Claire wächst die Belastung als First Lady über den Kopf."),
                            Episode(episodeId: 12, title: "12. Kopf an Kopf", duration: 53,
                                    description: "Kurz vor den Präsidentschafts-Vorwahlen wächst der Druck auf US-Präsident Frank Underwood (Kevin Spacey) und seine Konkurrentin. Beide fahren schwere taktische Geschütze auf. Claire (Robin Wright) verfällt in Selbstzweifel."),
                            Episode(episodeId: 13, title: "13. Ebenbürtig", duration: 50,
                                    description: " Bei einem wichtigen öffentlichen Auftritt muss Präsident Frank Underwood (Kevin Spacey) auf die Unterstützung seiner Frau Claire (Robin Wright) verzichten. Doug Stamper (Michael Kelly) will endlich seinen Auftrag zu Ende führen.")
                            ]),
                        Season(episodes: [
                            Episode(episodeId: 1, title: "1. Wahlkampf", duration: 56,
                                    description: "Frank Underwood (Kevin Spacey) ist zu den Vorwahlen nach New Hampshire gereist. Seine Frau Claire (Robin Wright) dagegen hat sich auf die Ranch ihrer Familie in Texas zurückgezogen. Die Öffentlichkeit soll von ihrer Trennung freilich nichts erfahren. Doch Caire spinnt weitere Pläne, die Frank nicht gefallen."),
                            Episode(episodeId: 2, title: "2. Die Lage der Nation", duration: 50,
                                    description: "Kurz vor seiner Rede zur Lage der Nation erkennt US-Präsident Frank Underwood (Kevin Spacey), dass seine Frau Claire (Robin Wright) ihn hintergeht. Er schreibt die Rede um, um ihre eigenen politischen Pläne zu durchkreuzen. Doch so schnell will Claire nicht aufgeben."),
                            Episode(episodeId: 3, title: "3. Die Sünden des Vaters", duration: 51,
                                    description: "Frank Underwood (Kevin Spacey) umwirbt in seinem Heimatstaat South Carolina die schwarzen Wähler. Claire (Robin Wright) versucht ihren Mann zu erpressen, damit er sie zu seiner Kandidatin für die Vizepräsidentschaft macht. Die russische Ölpolitik sorgt auf den amerikanischen Straßen für Chaos."),
                            Episode(episodeId: 4, title: "4. Akt der Verzweiflung", duration: 49,
                                    description: "Claire Underwoods (Robin Wright) Erpressungsversuche gegenüber ihrem Mann Frank (Kevin Spacey) setzen ihn unter Druck. Frank gerät bei einer Wahlkampfveranstaltung unter Beschuss, was Claire für ihre Zwecke nutzt."),
                            Episode(episodeId: 5, title: "5. Diskreditiert", duration: 52,
                                    description: "Frank Underwood (Kevin Spacey) liegt im Koma und braucht dringend eine Lebertransplantation. Claire (Robin Wright) schmiedet derweil eigene Pläne und mischt sich in die Außenpolitik ein."),
                            Episode(episodeId: 6, title: "6. Im Angesicht des Todes", duration: 50,
                                    description: "Nachdem Doug im Gesundheitsministerium Druck macht, bekommt Frank Underwood (Kevin Spacey) eine neue Leber. Claire (Robin Wright) erweist sich gleich auf mehreren politischen Ebenen als gewiefte Strategin."),
                            Episode(episodeId: 7, title: "7. Inlandsüberwachung", duration: 54,
                                    description: "Frank Underwood (Kevin Spacey) und seine Gattin Claire (Robin Wright) basteln an einem neuen Plan, um Claire für ein wichtiges Amt in Position zu bringen. Mit allen Mitteln versucht Frank, seinen ärgsten Rivalen im Kampf um die Präsidentschaft zu kompromittieren."),
                            Episode(episodeId: 8, title: "8. Bauernopfer", duration: 47,
                                    description: "Frank und Claire Underwoods (Kevin Spacey, Robin Wright) Schachzüge bei der Suche nach einem möglichen Vizepräsidenten gehen voll auf. Franks Affäre mit Zoe bringt ihn in langsam aber sicher in Bedrängnis."),
                            Episode(episodeId: 9, title: "9. Parteitag", duration: 52,
                                    description: "Frank Underwood (Kevin Spacey) bringt seine Wunschkandidatin für die Vizepräsidentschaft in Position: seine Frau Claire (Robin Wright). Doch Franks Gegner sind nicht untätig."),
                            Episode(episodeId: 10, title: "10. Nominierung", duration: 53,
                                    description: "Frank Underwoods (Kevin Spacey) Nominierung als Präsidentschaftskandidat der Demokraten gerät in Gefahr. Mit einem Ablenkungsmanöver versucht er seiner Widersacherin den Wind aus den Segeln zu nehmen. Claire (Robin Wright) hat eine Affäre und Erfolg mit einer beeindruckenden Rede."),
                            Episode(episodeId: 11, title: "11. Mehr als ein Ehepaar", duration: 54,
                                    description: "Der Wahlkampfstress macht Frank gesundheitlich zu schaffen: Sein Körper droht die frisch transplantierte Leber abzustoßen, wenn Frank sich nicht schont. Claire absolviert unterdessen die Wahlkampftour allein - und realisiert, dass aus der Affäre mit Tom tiefere Gefühle entstanden sind."),
                            Episode(episodeId: 12, title: "12. Verschleppt", duration: 53,
                                    description: "Zwei junge Islamisten haben eine amerikanische Familie entführt und drohen damit, sie hinzurichten, wenn ihre Forderungen nicht erfüllt werden. Frank Underwood und sein Widersacher beim Kampf ums Weiße Haus, Will Conway, versuchen mit den Entführern zu verhandeln."),
                            Episode(episodeId: 13, title: "13. Die Quelle des Terrors", duration: 50,
                                    description: "Frank Underwood übernimmt die Kontrolle über die Verhandlungen mit den islamistischen Geiselnehmern. Doch die nehmen einen anderen Verlauf als erwartet. Ein Artikel über die Vergangenheit der Underwoods bringt Frank und Claire in Bedrängnis. Prompt starten sie ein gewagtes Ablenkmanöver.")
                            ]),
            ], genre: "Drama", usk: "12", rating: "9,0"),
        
        SeriesStream(id: 13, title: "New Girl",
                     description: "Jessica Day (Zooey Deschanel) zieht nach einer sehr schwierigen Trennung mit drei Jungs zusammen, die alle Single sind.",
                     seasons: [
                        Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: [])
            ], genre: "Komödie", usk: "6", rating: "7,8"),
        
        SeriesStream(id: 14, title: "Modern Family",
                     description: "Die Serie handelt von drei Familen, die unterschiedlicher nicht sein können...",
                     seasons: [
                        Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: [])
            ], genre: "Komödie", usk: "12", rating: "8,5"),
        
        SeriesStream(id: 15, title: "How To Get Away With Murder",
                     description: "Wes lernt seine Nachbarin kennen, die Hauptverdächtige in einem Mordfall ist. Annalises Methoden stellen die Wertvorstellungen und Überzeugungen ihrer Studenten auf eine harte Probe.",
                     seasons: [
                        Season(episodes: [])
            ], genre: "Krimi", usk: "12", rating: "8,3"),
        
        SeriesStream(id: 16, title: "The Walking Dead",
                     description: "Polizist Rick Grimes erwacht aus dem Koma und erkennt die Welt nicht wieder: Das Krankenhaus, in dem er sich befindet, liegt in Trümmern, das Umland ist verwüstet - und überall lauern blutrünstige Zombies darauf, die Lebenden zu zerfleischen!",
                     seasons: [
                        Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: [])
            ], genre: "Horror", usk: "18", rating: "8,6"),
        
        SeriesStream(id: 17, title: "Grey's Anatomy",
                     description: "Hier lernen wir Meredith Grey kennen, eine brillante Assistenzärztin der Chirurgie in ihrem ersten Jahr am Seattle Grace Hospital. Zusammen mit ihren Ausbildungskollegen versucht Meredith, ihren Weg durch die täglichen Traumata und sozialen Landminen des Lebens innerhalb des Krankenhauses und draußen in der realen Welt zu finden.",
                     seasons: [
                        Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: [])
            ], genre: "Drama", usk: "16", rating: "7,7"),
            
        SeriesStream(id: 18, title: "Breaking Bad",
                     description: "Bei Walter White, der früher ein erfolgreicher Chemiewissenschaftler und jetzt Lehrer an einer Highschool ist, wird Krebs festgestellt. Ihm bleiben noch zwei Jahre. Er entschließt sich, seiner Frau und seinem behinderten Sohn nichts zu sagen und schwört, alles zu tun, um seine Familie abzusichern. Walter kommt die Idee, mit seinem seinen ehemaligen Schüler Jesse ein Drogenlabor zu eröffnen.",
                     seasons: [
                        Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: [])
            ], genre: "Krimi", usk: "16", rating: "9,5"),

        SeriesStream(id: 19, title: "Big Bang Theory",
                     description: "In der Serienpremiere in der Leonard und Sheldon das erste Mal auf Penny treffen, wird Leonards Interesse sofort geweckt. Sheldon ist jedoch der Ansicht, dass sein Kumpel einfach nur auf verlorenem Posten steht.",
                     seasons: [
                        Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: [])
            ], genre: "Komödie", usk: "6", rating: "8,3"),
        
        SeriesStream(id: 20, title: "Vikings",
                     description: "Vikings zeigt die komplexe und gewalttätige Welt des Wikingers Ragnar Lothbrok. Lothbrok, mystisch veranlagt und gläubig, behauptet von sich, direkter Abkömmling von Kriegsgott Odin zu sein, und strebt entschlossen und mit List danach, König der Wikinger zu werden.",
                     seasons: [
                        Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: [])
            ], genre: "Drama", usk: "16", rating: "8,6"),
        
        SeriesStream(id: 21, title: "Bones - Die Knochenjägerin",
                     description: "Es ist nicht viel, was vom Menschen übrig bleibt - Knochen, Spuren, verblassende Hinweise. Und doch erzählt dieser Rest die Geschichte von Leben und Sterben, wenn man Verstand, Intuition und modernste Techniken einzusetzen weiß, wie die Anthropologin Dr. Temperance \"Bones\" Brennan (Emily Deschanel).",
                     seasons: [
                        Season(episodes: []), Season(episodes: []), Season(episodes: []), Season(episodes: [])
            ], genre: "Krimi", usk: "12", rating: "7,9"),
            
        TVStationSeriesStream(id: 22, title: "hart aber fair", description: "\"hart aber fair\" ist eine  politische Talkshow die jeden Montagabend bei Das Erste ausgestrahlt wird.", seasons: [], genre: "Polittalk", usk: nil, rating: nil, stationId: 1, tvStationName: "Das Erste", startingTime: "21:00", endingTime: "22:15", nextShow: "Tagesthemen", isExistingShow: false),
        
        TVStationSeriesStream(id: 23, title: "Navy CIS", description: "Leroy Jethro Gibbs leitet ein spezielles Ermittlerteam, das Verbrechen untersucht, die in Zusammenhang mit der US Navy oder Marine-Corps-Angehörigen stehen. Unterstützung bekommt er durch Anthony DiNozzo, einem ehemaligen Angehörigen des Morddezernats, Caitlin Todd, einer ehemaligen Secret-Service-Agentin und der Forensikerin Abby Sciuto.", seasons: [], genre: "Krimi", usk: "16", rating: "7,9", stationId: 2, tvStationName: "SAT.1", startingTime: "21:15", endingTime: "22:15", nextShow: "Elementary", isExistingShow: false),
        
        TVStationSeriesStream(id: 24, title: "Undercover Boss", description: "Manager wechseln die Seiten und beobachten ihr Unternehmen aus der Perspektive der Mitarbeiter.", seasons: [], genre: nil, usk: nil, rating: nil, stationId: 3, tvStationName: "RTL", startingTime: "21:15", endingTime: "22:15", nextShow: "Ich bin ein Star - Holt mich hier raus!",isExistingShow: false),
        
        TVStationSeriesStream(id: 25, title: "The Big Bang Theory",
                              description: "In der Serienpremiere in der Leonard und Sheldon das erste Mal auf Penny treffen, wird Leonards Interesse sofort geweckt. Sheldon ist jedoch der Ansicht, dass sein Kumpel einfach nur auf verlorenem Posten steht."
            , seasons: [], genre: "Komödie", usk: "6", rating: "8,3", stationId: 4, tvStationName: "ProSieben", startingTime: "21:15", endingTime: "21:45", nextShow: "The Big Bang Theory", isExistingShow: true),
        
        TVStationMovieStream(id: 26, title: "The Italian Job", description: "Zusammen mit Mentor John Bridger, Computerfreak Lyle, Fahrer Handsome Rob, dem Explosionsspezialisten Left Ear sowie Logistiker Steve, erbeutet Junggangster Charlie Croker bei einem waghalsigen Venedig-Coup Goldbarren im Wert von 35 Millionen Dollar. Doch die Freude an der Beute währt nur kurz, denn Steve entpuppt sich als Verräter, bringt die Gang um ihr Geld und tötet dabei John.", duration: 100, genre: "Action", usk: "12", rating: "7,0", stationId: 5, tvStationName: "kabel eins", startingTime: "20:15", endingTime: "22:25", nextShow: "Mr. Nice Guy", isExistingShow: false)
        
    ]
}
