# Team_Project

Tables
users,roles,user_roles

roles -> admin, users

sunbox paypal

mvnRepository (maven)

persistent -> JPA -> safe and fast

cntr+shift+i -> fix all imports

lombok -> Getter,Setter

Jquery ui -> autocomplete

logging.level.org.hibernate.SQL= DEBUG -> application properties to see the query if failed

(Springbooot) dates -> @DateTimeFormat      LocalDate (java 8)

(Springbooot) @Transient -> only entity no database

(Springbooot)  upload file -> input type="file" not spring form, me @RequestParam mixed form 
Class -> MultipartFile instead of Part

spring.jpa.hibernate.ddl-auto = create / update / auto

plugin για πολυπλοκοτητα password

hushpw  , checkpw

<<<<<<< HEAD
session.ivalidate() an kanei log out αλλιώς κλείνει μόνο του μετά από 30 λεπτά (ρυθμίζεται στο web.xml)

αν δε θελω να γεμισω το session για να περασω μια παραμετρο μετα απο redirect -> addFlashAAttribute("...","...") -> ζούνε μόνο για ένα 'πήγαινε-έλα'
στον controller (RedirectAttribute)
=======
session.ivalidate() an kanei log out


Entities

User -> id ,( firstname, lastname, email, password , profile_photo )
Admin ->id ,firstname, lastname, email, password 
Comment -> id , timestamp , text , firstname , lastname , user_id
Post -> id , timestamp , text , firstname , lastname , trip ,user_id
Trip -> id , Photos, Calendar, Notes (iclude links), Budget, user_id
Location -> id , link
Transportation -> id , link
Accomodation -> id , link
Rentals -> id , link
Horeca -> id , link
Sightseeing -> id , link
History -> id , link
Tradition ->id , link
>>>>>>> ee151721359a9c9ceb13e6114a2f945892e8776a

Admins
vaspap,1234

User
kostas 5678
mitsos 0123
billy 9876


