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




