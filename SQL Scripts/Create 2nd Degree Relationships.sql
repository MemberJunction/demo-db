SELECT * FROM __mj.vwEntityRelationships WHERE Entity='Person Links'
SELECT * FROM __mj.vwEntities WHERE name='Person Links'
SELECT * FROM __mj.vwEntityFields WHERE entity='Person Links'
 
/*****

RUN THIS ONE TIME ONLY
AFter you do CodeGen the first time and entities have been created.

THEN - run CodeGen again which will create tabs in the Angular app for these relationships


-- create a relationship between Person Links and Membership Renewals
INSERT INTO __mj.EntityRelationship 
(
   EntityID,
   RelatedEntityID,
   BundleInAPI,
   IncludeInParentAllQuery,
   Type,
   EntityKeyField,
   RelatedEntityJoinField,
   DisplayInForm,
   DisplayName
)
VALUES
(
   (SELECT ID FROM __mj.Entity WHERE Name='Person Links'),
   (SELECT ID FROM __mj.Entity WHERE Name='Membership Renewals'),
   1,
   0,
   'One To Many',
   'MembershipMemberID',
   'MemberID',
   1,
   'Membership Renewals'
)


-- create a relationship between Person Links and Education Registrations
INSERT INTO __mj.EntityRelationship 
(
   EntityID,
   RelatedEntityID,
   BundleInAPI,
   IncludeInParentAllQuery,
   Type,
   EntityKeyField,
   RelatedEntityJoinField,
   DisplayInForm,
   DisplayName
)
VALUES
(
   (SELECT ID FROM __mj.Entity WHERE Name='Person Links'),
   (SELECT ID FROM __mj.Entity WHERE BaseTable='Registration' AND SchemaName='education'),
   1,
   0,
   'One To Many',
   'EducationStudentID',
   'StudentID',
   1,
   'Education - Registrations'
)
 
-- create a relationship between Person Links and EVENT Registrations
INSERT INTO __mj.EntityRelationship 
(
   EntityID,
   RelatedEntityID,
   BundleInAPI,
   IncludeInParentAllQuery,
   Type,
   EntityKeyField,
   RelatedEntityJoinField,
   DisplayInForm,
   DisplayName
)
VALUES
(
   (SELECT ID FROM __mj.Entity WHERE Name='Person Links'),
   (SELECT ID FROM __mj.Entity WHERE BaseTable='Registration' AND SchemaName='events'),
   1,
   0,
   'One To Many',
   'EventsAttendeeID',
   'AttendeeID',
   1,
   'Event Registrations'
)


-- create a relationship between Person Links and Posts
INSERT INTO __mj.EntityRelationship 
(
   EntityID,
   RelatedEntityID,
   BundleInAPI,
   IncludeInParentAllQuery,
   Type,
   EntityKeyField,
   RelatedEntityJoinField,
   DisplayInForm,
   DisplayName
)
VALUES
(
   (SELECT ID FROM __mj.Entity WHERE Name='Person Links'),
   (SELECT ID FROM __mj.Entity WHERE BaseTable='Post' AND SchemaName='community'),
   1,
   0,
   'One To Many',
   'CommunityAuthorID',
   'AuthorID',
   1,
   'Community - Posts'
)
INSERT INTO __mj.EntityRelationship 
(
   EntityID,
   RelatedEntityID,
   BundleInAPI,
   IncludeInParentAllQuery,
   Type,
   EntityKeyField,
   RelatedEntityJoinField,
   DisplayInForm,
   DisplayName
)
VALUES
(
   (SELECT ID FROM __mj.Entity WHERE Name='Person Links'),
   (SELECT ID FROM __mj.Entity WHERE BaseTable='Reply' AND SchemaName='community'),
   1,
   0,
   'One To Many',
   'CommunityAuthorID',
   'AuthorID',
   1,
   'Community - Replies'
)


*/