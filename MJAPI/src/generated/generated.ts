/********************************************************************************
* ALL ENTITIES - TypeGraphQL Type Class Definition - AUTO GENERATED FILE
* Generated Entities and Resolvers for Server
* 
* GENERATED: 3/16/2024, 12:11:43 PM
* 
*   >>> DO NOT MODIFY THIS FILE!!!!!!!!!!!!
*   >>> YOUR CHANGES WILL BE OVERWRITTEN
*   >>> THE NEXT TIME THIS FILE IS GENERATED
* 
**********************************************************************************/
import { Arg, Ctx, Int, Query, Resolver, Field, Float, ObjectType, FieldResolver, Root, InputType, Mutation, 
         PubSub, PubSubEngine, ResolverBase, RunViewByIDInput, RunViewByNameInput, RunDynamicViewInput } from '@memberjunction/server';
import { Metadata, EntityPermissionType } from '@memberjunction/core'
import { AppContext } from '@memberjunction/server';

import { MaxLength } from 'class-validator';
import { DataSource } from 'typeorm';

import * as mj_core_schema_server_object_types from '@memberjunction/server'

import { ReplyEntity, PostEntity, Company__communityEntity, AuthorEntity, ForumEntity, ReplySeedEntity, NameSeedEntity, JobTitleSeedEntity, PostSeedEntity, OrganizationEntity, Registration__eventsEntity, AttendeeEntity, EventEntity, StudentEntity, RegistrationEntity, Company__educationEntity, CourseEntity, InstructorEntity, OrganizationLinkEntity, PersonLinkEntity, MembershipRenewalEntity, MemberTypeEntity, Company__membershipEntity, MemberEntity } from 'mj_generatedentities';


//****************************************************************************
// ENTITY CLASS for Replies
//****************************************************************************
@ObjectType()
export class Reply_ {  
    @Field(() => Int) 
    ReplyID: number;
      
    @Field(() => Int) 
    PostID: number;
      
    @Field(() => Int) 
    AuthorID: number;
      
    @Field({nullable: true}) 
    ReplyContent?: string;
      
    @Field() 
    @MaxLength(3)
    ReplyDate: Date;
    
}
        
//****************************************************************************
// INPUT TYPE for Replies   
//****************************************************************************
@InputType()
export class CreateReplyInput {
    @Field(() => Int, )
    ReplyID: number;

    @Field(() => Int, )
    PostID: number;

    @Field(() => Int, )
    AuthorID: number;

    @Field({ nullable: true })
    ReplyContent: string;

    @Field()
    ReplyDate: Date;
}

        
//****************************************************************************
// INPUT TYPE for Replies   
//****************************************************************************
@InputType()
export class UpdateReplyInput {
    @Field(() => Int, )
    ReplyID: number;

    @Field(() => Int, )
    PostID: number;

    @Field(() => Int, )
    AuthorID: number;

    @Field({ nullable: true })
    ReplyContent: string;

    @Field()
    ReplyDate: Date;
}

//****************************************************************************
// RESOLVER for Replies
//****************************************************************************
@ObjectType()
export class RunReplyViewResult {
    @Field(() => [Reply_])
    Results: Reply_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(Reply_)
export class ReplyResolver extends ResolverBase {
    @Query(() => RunReplyViewResult)
    async RunReplyViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunReplyViewResult)
    async RunReplyViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunReplyViewResult)
    async RunReplyDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Replies';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => Reply_, { nullable: true })
    async Reply(@Arg('ReplyID', () => Int) ReplyID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<Reply_ | null> {
        this.CheckUserReadPermissions('Replies', userPayload);
        const sSQL = `SELECT * FROM [community].[vwReplies] WHERE [ReplyID]=${ReplyID} ` + this.getRowLevelSecurityWhereClause('Replies', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Replies', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }

    @Mutation(() => Reply_)
    async CreateReply(
        @Arg('input', () => CreateReplyInput) input: CreateReplyInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <ReplyEntity>await new Metadata().GetEntityObject('Replies', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateReplyInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateReplyInput) {
    }
    
    @Mutation(() => Reply_)
    async UpdateReply(
        @Arg('input', () => UpdateReplyInput) input: UpdateReplyInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <ReplyEntity>await new Metadata().GetEntityObject('Replies', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Replies
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateReplyInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateReplyInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Posts
//****************************************************************************
@ObjectType()
export class Post_ {  
    @Field(() => Int) 
    PostID: number;
      
    @Field(() => Int) 
    ForumID: number;
      
    @Field(() => Int) 
    AuthorID: number;
      
    @Field({nullable: true}) 
    PostContent?: string;
      
    @Field() 
    @MaxLength(3)
    PostDate: Date;
    
    @Field(() => [Reply_])
    RepliesArray: Reply_[]; // Link to Replies

}
        
//****************************************************************************
// INPUT TYPE for Posts   
//****************************************************************************
@InputType()
export class CreatePostInput {
    @Field(() => Int, )
    PostID: number;

    @Field(() => Int, )
    ForumID: number;

    @Field(() => Int, )
    AuthorID: number;

    @Field({ nullable: true })
    PostContent: string;

    @Field()
    PostDate: Date;
}

        
//****************************************************************************
// INPUT TYPE for Posts   
//****************************************************************************
@InputType()
export class UpdatePostInput {
    @Field(() => Int, )
    PostID: number;

    @Field(() => Int, )
    ForumID: number;

    @Field(() => Int, )
    AuthorID: number;

    @Field({ nullable: true })
    PostContent: string;

    @Field()
    PostDate: Date;
}

//****************************************************************************
// RESOLVER for Posts
//****************************************************************************
@ObjectType()
export class RunPostViewResult {
    @Field(() => [Post_])
    Results: Post_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(Post_)
export class PostResolver extends ResolverBase {
    @Query(() => RunPostViewResult)
    async RunPostViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunPostViewResult)
    async RunPostViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunPostViewResult)
    async RunPostDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Posts';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => Post_, { nullable: true })
    async Post(@Arg('PostID', () => Int) PostID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<Post_ | null> {
        this.CheckUserReadPermissions('Posts', userPayload);
        const sSQL = `SELECT * FROM [community].[vwPosts] WHERE [PostID]=${PostID} ` + this.getRowLevelSecurityWhereClause('Posts', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Posts', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }
  
    @FieldResolver(() => [Reply_])
    async RepliesArray(@Root() post_: Post_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Replies', userPayload);
        const sSQL = `SELECT * FROM [community].[vwReplies] WHERE [PostID]=${post_.PostID} ` + this.getRowLevelSecurityWhereClause('Replies', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Replies', await dataSource.query(sSQL));
        return result;
    }
    
    @Mutation(() => Post_)
    async CreatePost(
        @Arg('input', () => CreatePostInput) input: CreatePostInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <PostEntity>await new Metadata().GetEntityObject('Posts', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreatePostInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreatePostInput) {
    }
    
    @Mutation(() => Post_)
    async UpdatePost(
        @Arg('input', () => UpdatePostInput) input: UpdatePostInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <PostEntity>await new Metadata().GetEntityObject('Posts', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Posts
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdatePostInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdatePostInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Companies__community
//****************************************************************************
@ObjectType()
export class Company__community_ {  
    @Field(() => Int) 
    CompanyID: number;
      
    @Field() 
    @MaxLength(510)
    CompanyName: string;
      
    @Field({nullable: true}) 
    @MaxLength(510)
    Website?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    Industry?: string;
      
    @Field({nullable: true}) 
    @MaxLength(100)
    Size?: string;
      
    @Field({nullable: true}) 
    @MaxLength(510)
    Address?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    City?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    State?: string;
      
    @Field({nullable: true}) 
    @MaxLength(40)
    ZipCode?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    Country?: string;
    
    @Field(() => [Author_])
    AuthorsArray: Author_[]; // Link to Authors

    @Field(() => [OrganizationLink_])
    OrganizationLinksArray: OrganizationLink_[]; // Link to OrganizationLinks

}
        
//****************************************************************************
// INPUT TYPE for Companies__community   
//****************************************************************************
@InputType()
export class CreateCompany__communityInput {
    @Field(() => Int, )
    CompanyID: number;

    @Field()
    CompanyName: string;

    @Field({ nullable: true })
    Website: string;

    @Field({ nullable: true })
    Industry: string;

    @Field({ nullable: true })
    Size: string;

    @Field({ nullable: true })
    Address: string;

    @Field({ nullable: true })
    City: string;

    @Field({ nullable: true })
    State: string;

    @Field({ nullable: true })
    ZipCode: string;

    @Field({ nullable: true })
    Country: string;
}

        
//****************************************************************************
// INPUT TYPE for Companies__community   
//****************************************************************************
@InputType()
export class UpdateCompany__communityInput {
    @Field(() => Int, )
    CompanyID: number;

    @Field()
    CompanyName: string;

    @Field({ nullable: true })
    Website: string;

    @Field({ nullable: true })
    Industry: string;

    @Field({ nullable: true })
    Size: string;

    @Field({ nullable: true })
    Address: string;

    @Field({ nullable: true })
    City: string;

    @Field({ nullable: true })
    State: string;

    @Field({ nullable: true })
    ZipCode: string;

    @Field({ nullable: true })
    Country: string;
}

//****************************************************************************
// RESOLVER for Companies__community
//****************************************************************************
@ObjectType()
export class RunCompany__communityViewResult {
    @Field(() => [Company__community_])
    Results: Company__community_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(Company__community_)
export class Company__communityResolver extends ResolverBase {
    @Query(() => RunCompany__communityViewResult)
    async RunCompany__communityViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunCompany__communityViewResult)
    async RunCompany__communityViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunCompany__communityViewResult)
    async RunCompany__communityDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Companies__community';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => Company__community_, { nullable: true })
    async Company__community(@Arg('CompanyID', () => Int) CompanyID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<Company__community_ | null> {
        this.CheckUserReadPermissions('Companies__community', userPayload);
        const sSQL = `SELECT * FROM [community].[vwCompanies__community] WHERE [CompanyID]=${CompanyID} ` + this.getRowLevelSecurityWhereClause('Companies__community', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Companies__community', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }
  
    @FieldResolver(() => [Author_])
    async AuthorsArray(@Root() company__community_: Company__community_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Authors', userPayload);
        const sSQL = `SELECT * FROM [community].[vwAuthors] WHERE [CompanyID]=${company__community_.CompanyID} ` + this.getRowLevelSecurityWhereClause('Authors', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Authors', await dataSource.query(sSQL));
        return result;
    }
      
    @FieldResolver(() => [OrganizationLink_])
    async OrganizationLinksArray(@Root() company__community_: Company__community_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Organization Links', userPayload);
        const sSQL = `SELECT * FROM [common].[vwOrganizationLinks] WHERE [CommunityCompanyID]=${company__community_.CompanyID} ` + this.getRowLevelSecurityWhereClause('Organization Links', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Organization Links', await dataSource.query(sSQL));
        return result;
    }
    
    @Mutation(() => Company__community_)
    async CreateCompany__community(
        @Arg('input', () => CreateCompany__communityInput) input: CreateCompany__communityInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <Company__communityEntity>await new Metadata().GetEntityObject('Companies__community', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateCompany__communityInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateCompany__communityInput) {
    }
    
    @Mutation(() => Company__community_)
    async UpdateCompany__community(
        @Arg('input', () => UpdateCompany__communityInput) input: UpdateCompany__communityInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <Company__communityEntity>await new Metadata().GetEntityObject('Companies__community', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Companies__community
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateCompany__communityInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateCompany__communityInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Authors
//****************************************************************************
@ObjectType()
export class Author_ {  
    @Field(() => Int) 
    AuthorID: number;
      
    @Field(() => Int, {nullable: true}) 
    CompanyID?: number;
      
    @Field() 
    @MaxLength(510)
    Email: string;
      
    @Field({nullable: true}) 
    @MaxLength(100)
    FirstName?: string;
      
    @Field({nullable: true}) 
    @MaxLength(100)
    LastName?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    JobTitle?: string;
      
    @Field({nullable: true}) 
    @MaxLength(510)
    Address?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    City?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    State?: string;
      
    @Field({nullable: true}) 
    @MaxLength(40)
    ZipCode?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    Country?: string;
    
    @Field(() => [Post_])
    PostsArray: Post_[]; // Link to Posts

    @Field(() => [Reply_])
    RepliesArray: Reply_[]; // Link to Replies

    @Field(() => [PersonLink_])
    PersonLinksArray: PersonLink_[]; // Link to PersonLinks

}
        
//****************************************************************************
// INPUT TYPE for Authors   
//****************************************************************************
@InputType()
export class CreateAuthorInput {
    @Field(() => Int, )
    AuthorID: number;

    @Field(() => Int, { nullable: true })
    CompanyID: number;

    @Field()
    Email: string;

    @Field({ nullable: true })
    FirstName: string;

    @Field({ nullable: true })
    LastName: string;

    @Field({ nullable: true })
    JobTitle: string;

    @Field({ nullable: true })
    Address: string;

    @Field({ nullable: true })
    City: string;

    @Field({ nullable: true })
    State: string;

    @Field({ nullable: true })
    ZipCode: string;

    @Field({ nullable: true })
    Country: string;
}

        
//****************************************************************************
// INPUT TYPE for Authors   
//****************************************************************************
@InputType()
export class UpdateAuthorInput {
    @Field(() => Int, )
    AuthorID: number;

    @Field(() => Int, { nullable: true })
    CompanyID: number;

    @Field()
    Email: string;

    @Field({ nullable: true })
    FirstName: string;

    @Field({ nullable: true })
    LastName: string;

    @Field({ nullable: true })
    JobTitle: string;

    @Field({ nullable: true })
    Address: string;

    @Field({ nullable: true })
    City: string;

    @Field({ nullable: true })
    State: string;

    @Field({ nullable: true })
    ZipCode: string;

    @Field({ nullable: true })
    Country: string;
}

//****************************************************************************
// RESOLVER for Authors
//****************************************************************************
@ObjectType()
export class RunAuthorViewResult {
    @Field(() => [Author_])
    Results: Author_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(Author_)
export class AuthorResolver extends ResolverBase {
    @Query(() => RunAuthorViewResult)
    async RunAuthorViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunAuthorViewResult)
    async RunAuthorViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunAuthorViewResult)
    async RunAuthorDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Authors';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => Author_, { nullable: true })
    async Author(@Arg('AuthorID', () => Int) AuthorID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<Author_ | null> {
        this.CheckUserReadPermissions('Authors', userPayload);
        const sSQL = `SELECT * FROM [community].[vwAuthors] WHERE [AuthorID]=${AuthorID} ` + this.getRowLevelSecurityWhereClause('Authors', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Authors', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }
  
    @FieldResolver(() => [Post_])
    async PostsArray(@Root() author_: Author_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Posts', userPayload);
        const sSQL = `SELECT * FROM [community].[vwPosts] WHERE [AuthorID]=${author_.AuthorID} ` + this.getRowLevelSecurityWhereClause('Posts', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Posts', await dataSource.query(sSQL));
        return result;
    }
      
    @FieldResolver(() => [Reply_])
    async RepliesArray(@Root() author_: Author_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Replies', userPayload);
        const sSQL = `SELECT * FROM [community].[vwReplies] WHERE [AuthorID]=${author_.AuthorID} ` + this.getRowLevelSecurityWhereClause('Replies', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Replies', await dataSource.query(sSQL));
        return result;
    }
      
    @FieldResolver(() => [PersonLink_])
    async PersonLinksArray(@Root() author_: Author_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Person Links', userPayload);
        const sSQL = `SELECT * FROM [common].[vwPersonLinks] WHERE [CommunityAuthorID]=${author_.AuthorID} ` + this.getRowLevelSecurityWhereClause('Person Links', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Person Links', await dataSource.query(sSQL));
        return result;
    }
    
    @Mutation(() => Author_)
    async CreateAuthor(
        @Arg('input', () => CreateAuthorInput) input: CreateAuthorInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <AuthorEntity>await new Metadata().GetEntityObject('Authors', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateAuthorInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateAuthorInput) {
    }
    
    @Mutation(() => Author_)
    async UpdateAuthor(
        @Arg('input', () => UpdateAuthorInput) input: UpdateAuthorInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <AuthorEntity>await new Metadata().GetEntityObject('Authors', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Authors
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateAuthorInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateAuthorInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Forums
//****************************************************************************
@ObjectType()
export class Forum_ {  
    @Field(() => Int) 
    ForumID: number;
      
    @Field() 
    @MaxLength(510)
    Title: string;
      
    @Field({nullable: true}) 
    Description?: string;
      
    @Field() 
    @MaxLength(3)
    CreationDate: Date;
    
    @Field(() => [Post_])
    PostsArray: Post_[]; // Link to Posts

}
        
//****************************************************************************
// INPUT TYPE for Forums   
//****************************************************************************
@InputType()
export class CreateForumInput {
    @Field(() => Int, )
    ForumID: number;

    @Field()
    Title: string;

    @Field({ nullable: true })
    Description: string;

    @Field()
    CreationDate: Date;
}

        
//****************************************************************************
// INPUT TYPE for Forums   
//****************************************************************************
@InputType()
export class UpdateForumInput {
    @Field(() => Int, )
    ForumID: number;

    @Field()
    Title: string;

    @Field({ nullable: true })
    Description: string;

    @Field()
    CreationDate: Date;
}

//****************************************************************************
// RESOLVER for Forums
//****************************************************************************
@ObjectType()
export class RunForumViewResult {
    @Field(() => [Forum_])
    Results: Forum_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(Forum_)
export class ForumResolver extends ResolverBase {
    @Query(() => RunForumViewResult)
    async RunForumViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunForumViewResult)
    async RunForumViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunForumViewResult)
    async RunForumDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Forums';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => Forum_, { nullable: true })
    async Forum(@Arg('ForumID', () => Int) ForumID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<Forum_ | null> {
        this.CheckUserReadPermissions('Forums', userPayload);
        const sSQL = `SELECT * FROM [community].[vwForums] WHERE [ForumID]=${ForumID} ` + this.getRowLevelSecurityWhereClause('Forums', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Forums', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }
  
    @FieldResolver(() => [Post_])
    async PostsArray(@Root() forum_: Forum_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Posts', userPayload);
        const sSQL = `SELECT * FROM [community].[vwPosts] WHERE [ForumID]=${forum_.ForumID} ` + this.getRowLevelSecurityWhereClause('Posts', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Posts', await dataSource.query(sSQL));
        return result;
    }
    
    @Mutation(() => Forum_)
    async CreateForum(
        @Arg('input', () => CreateForumInput) input: CreateForumInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <ForumEntity>await new Metadata().GetEntityObject('Forums', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateForumInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateForumInput) {
    }
    
    @Mutation(() => Forum_)
    async UpdateForum(
        @Arg('input', () => UpdateForumInput) input: UpdateForumInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <ForumEntity>await new Metadata().GetEntityObject('Forums', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Forums
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateForumInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateForumInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Reply Seeds
//****************************************************************************
@ObjectType()
export class ReplySeed_ {  
    @Field(() => Int) 
    ReplySeedID: number;
      
    @Field({nullable: true}) 
    Content?: string;
    
}
        
//****************************************************************************
// INPUT TYPE for Reply Seeds   
//****************************************************************************
@InputType()
export class CreateReplySeedInput {
    @Field(() => Int, )
    ReplySeedID: number;

    @Field({ nullable: true })
    Content: string;
}

        
//****************************************************************************
// INPUT TYPE for Reply Seeds   
//****************************************************************************
@InputType()
export class UpdateReplySeedInput {
    @Field(() => Int, )
    ReplySeedID: number;

    @Field({ nullable: true })
    Content: string;
}

//****************************************************************************
// RESOLVER for Reply Seeds
//****************************************************************************
@ObjectType()
export class RunReplySeedViewResult {
    @Field(() => [ReplySeed_])
    Results: ReplySeed_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(ReplySeed_)
export class ReplySeedResolver extends ResolverBase {
    @Query(() => RunReplySeedViewResult)
    async RunReplySeedViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunReplySeedViewResult)
    async RunReplySeedViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunReplySeedViewResult)
    async RunReplySeedDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Reply Seeds';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => ReplySeed_, { nullable: true })
    async ReplySeed(@Arg('ReplySeedID', () => Int) ReplySeedID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<ReplySeed_ | null> {
        this.CheckUserReadPermissions('Reply Seeds', userPayload);
        const sSQL = `SELECT * FROM [reference].[vwReplySeeds] WHERE [ReplySeedID]=${ReplySeedID} ` + this.getRowLevelSecurityWhereClause('Reply Seeds', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Reply Seeds', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }

    @Mutation(() => ReplySeed_)
    async CreateReplySeed(
        @Arg('input', () => CreateReplySeedInput) input: CreateReplySeedInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <ReplySeedEntity>await new Metadata().GetEntityObject('Reply Seeds', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateReplySeedInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateReplySeedInput) {
    }
    
    @Mutation(() => ReplySeed_)
    async UpdateReplySeed(
        @Arg('input', () => UpdateReplySeedInput) input: UpdateReplySeedInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <ReplySeedEntity>await new Metadata().GetEntityObject('Reply Seeds', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Reply Seeds
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateReplySeedInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateReplySeedInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Name Seeds
//****************************************************************************
@ObjectType()
export class NameSeed_ {  
    @Field(() => Int) 
    NameID: number;
      
    @Field({nullable: true}) 
    @MaxLength(100)
    Name?: string;
      
    @Field({nullable: true}) 
    @MaxLength(20)
    NameType?: string;
    
}
        
//****************************************************************************
// INPUT TYPE for Name Seeds   
//****************************************************************************
@InputType()
export class CreateNameSeedInput {
    @Field(() => Int, )
    NameID: number;

    @Field({ nullable: true })
    Name: string;

    @Field({ nullable: true })
    NameType: string;
}

        
//****************************************************************************
// INPUT TYPE for Name Seeds   
//****************************************************************************
@InputType()
export class UpdateNameSeedInput {
    @Field(() => Int, )
    NameID: number;

    @Field({ nullable: true })
    Name: string;

    @Field({ nullable: true })
    NameType: string;
}

//****************************************************************************
// RESOLVER for Name Seeds
//****************************************************************************
@ObjectType()
export class RunNameSeedViewResult {
    @Field(() => [NameSeed_])
    Results: NameSeed_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(NameSeed_)
export class NameSeedResolver extends ResolverBase {
    @Query(() => RunNameSeedViewResult)
    async RunNameSeedViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunNameSeedViewResult)
    async RunNameSeedViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunNameSeedViewResult)
    async RunNameSeedDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Name Seeds';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => NameSeed_, { nullable: true })
    async NameSeed(@Arg('NameID', () => Int) NameID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<NameSeed_ | null> {
        this.CheckUserReadPermissions('Name Seeds', userPayload);
        const sSQL = `SELECT * FROM [reference].[vwNameSeeds] WHERE [NameID]=${NameID} ` + this.getRowLevelSecurityWhereClause('Name Seeds', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Name Seeds', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }

    @Mutation(() => NameSeed_)
    async CreateNameSeed(
        @Arg('input', () => CreateNameSeedInput) input: CreateNameSeedInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <NameSeedEntity>await new Metadata().GetEntityObject('Name Seeds', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateNameSeedInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateNameSeedInput) {
    }
    
    @Mutation(() => NameSeed_)
    async UpdateNameSeed(
        @Arg('input', () => UpdateNameSeedInput) input: UpdateNameSeedInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <NameSeedEntity>await new Metadata().GetEntityObject('Name Seeds', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Name Seeds
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateNameSeedInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateNameSeedInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Job Title Seeds
//****************************************************************************
@ObjectType()
export class JobTitleSeed_ {  
    @Field(() => Int) 
    JobTitleID: number;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    JobTitle?: string;
    
}
        
//****************************************************************************
// INPUT TYPE for Job Title Seeds   
//****************************************************************************
@InputType()
export class CreateJobTitleSeedInput {
    @Field(() => Int, )
    JobTitleID: number;

    @Field({ nullable: true })
    JobTitle: string;
}

        
//****************************************************************************
// INPUT TYPE for Job Title Seeds   
//****************************************************************************
@InputType()
export class UpdateJobTitleSeedInput {
    @Field(() => Int, )
    JobTitleID: number;

    @Field({ nullable: true })
    JobTitle: string;
}

//****************************************************************************
// RESOLVER for Job Title Seeds
//****************************************************************************
@ObjectType()
export class RunJobTitleSeedViewResult {
    @Field(() => [JobTitleSeed_])
    Results: JobTitleSeed_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(JobTitleSeed_)
export class JobTitleSeedResolver extends ResolverBase {
    @Query(() => RunJobTitleSeedViewResult)
    async RunJobTitleSeedViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunJobTitleSeedViewResult)
    async RunJobTitleSeedViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunJobTitleSeedViewResult)
    async RunJobTitleSeedDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Job Title Seeds';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => JobTitleSeed_, { nullable: true })
    async JobTitleSeed(@Arg('JobTitleID', () => Int) JobTitleID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<JobTitleSeed_ | null> {
        this.CheckUserReadPermissions('Job Title Seeds', userPayload);
        const sSQL = `SELECT * FROM [reference].[vwJobTitleSeeds] WHERE [JobTitleID]=${JobTitleID} ` + this.getRowLevelSecurityWhereClause('Job Title Seeds', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Job Title Seeds', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }

    @Mutation(() => JobTitleSeed_)
    async CreateJobTitleSeed(
        @Arg('input', () => CreateJobTitleSeedInput) input: CreateJobTitleSeedInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <JobTitleSeedEntity>await new Metadata().GetEntityObject('Job Title Seeds', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateJobTitleSeedInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateJobTitleSeedInput) {
    }
    
    @Mutation(() => JobTitleSeed_)
    async UpdateJobTitleSeed(
        @Arg('input', () => UpdateJobTitleSeedInput) input: UpdateJobTitleSeedInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <JobTitleSeedEntity>await new Metadata().GetEntityObject('Job Title Seeds', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Job Title Seeds
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateJobTitleSeedInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateJobTitleSeedInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Post Seeds
//****************************************************************************
@ObjectType()
export class PostSeed_ {  
    @Field(() => Int) 
    PostSeedID: number;
      
    @Field({nullable: true}) 
    Content?: string;
      
    @Field({nullable: true}) 
    @MaxLength(100)
    Type?: string;
    
}
        
//****************************************************************************
// INPUT TYPE for Post Seeds   
//****************************************************************************
@InputType()
export class CreatePostSeedInput {
    @Field(() => Int, )
    PostSeedID: number;

    @Field({ nullable: true })
    Content: string;

    @Field({ nullable: true })
    Type: string;
}

        
//****************************************************************************
// INPUT TYPE for Post Seeds   
//****************************************************************************
@InputType()
export class UpdatePostSeedInput {
    @Field(() => Int, )
    PostSeedID: number;

    @Field({ nullable: true })
    Content: string;

    @Field({ nullable: true })
    Type: string;
}

//****************************************************************************
// RESOLVER for Post Seeds
//****************************************************************************
@ObjectType()
export class RunPostSeedViewResult {
    @Field(() => [PostSeed_])
    Results: PostSeed_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(PostSeed_)
export class PostSeedResolver extends ResolverBase {
    @Query(() => RunPostSeedViewResult)
    async RunPostSeedViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunPostSeedViewResult)
    async RunPostSeedViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunPostSeedViewResult)
    async RunPostSeedDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Post Seeds';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => PostSeed_, { nullable: true })
    async PostSeed(@Arg('PostSeedID', () => Int) PostSeedID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<PostSeed_ | null> {
        this.CheckUserReadPermissions('Post Seeds', userPayload);
        const sSQL = `SELECT * FROM [reference].[vwPostSeeds] WHERE [PostSeedID]=${PostSeedID} ` + this.getRowLevelSecurityWhereClause('Post Seeds', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Post Seeds', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }

    @Mutation(() => PostSeed_)
    async CreatePostSeed(
        @Arg('input', () => CreatePostSeedInput) input: CreatePostSeedInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <PostSeedEntity>await new Metadata().GetEntityObject('Post Seeds', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreatePostSeedInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreatePostSeedInput) {
    }
    
    @Mutation(() => PostSeed_)
    async UpdatePostSeed(
        @Arg('input', () => UpdatePostSeedInput) input: UpdatePostSeedInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <PostSeedEntity>await new Metadata().GetEntityObject('Post Seeds', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Post Seeds
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdatePostSeedInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdatePostSeedInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Organizations
//****************************************************************************
@ObjectType()
export class Organization_ {  
    @Field(() => Int) 
    OrganizationID: number;
      
    @Field() 
    @MaxLength(510)
    OrganizationName: string;
      
    @Field({nullable: true}) 
    @MaxLength(510)
    Website?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    Industry?: string;
      
    @Field({nullable: true}) 
    @MaxLength(100)
    Size?: string;
      
    @Field({nullable: true}) 
    @MaxLength(510)
    Address?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    City?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    State?: string;
      
    @Field({nullable: true}) 
    @MaxLength(40)
    ZipCode?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    Country?: string;
    
    @Field(() => [Attendee_])
    AttendeesArray: Attendee_[]; // Link to Attendees

    @Field(() => [OrganizationLink_])
    OrganizationLinksArray: OrganizationLink_[]; // Link to OrganizationLinks

}
        
//****************************************************************************
// INPUT TYPE for Organizations   
//****************************************************************************
@InputType()
export class CreateOrganizationInput {
    @Field(() => Int, )
    OrganizationID: number;

    @Field()
    OrganizationName: string;

    @Field({ nullable: true })
    Website: string;

    @Field({ nullable: true })
    Industry: string;

    @Field({ nullable: true })
    Size: string;

    @Field({ nullable: true })
    Address: string;

    @Field({ nullable: true })
    City: string;

    @Field({ nullable: true })
    State: string;

    @Field({ nullable: true })
    ZipCode: string;

    @Field({ nullable: true })
    Country: string;
}

        
//****************************************************************************
// INPUT TYPE for Organizations   
//****************************************************************************
@InputType()
export class UpdateOrganizationInput {
    @Field(() => Int, )
    OrganizationID: number;

    @Field()
    OrganizationName: string;

    @Field({ nullable: true })
    Website: string;

    @Field({ nullable: true })
    Industry: string;

    @Field({ nullable: true })
    Size: string;

    @Field({ nullable: true })
    Address: string;

    @Field({ nullable: true })
    City: string;

    @Field({ nullable: true })
    State: string;

    @Field({ nullable: true })
    ZipCode: string;

    @Field({ nullable: true })
    Country: string;
}

//****************************************************************************
// RESOLVER for Organizations
//****************************************************************************
@ObjectType()
export class RunOrganizationViewResult {
    @Field(() => [Organization_])
    Results: Organization_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(Organization_)
export class OrganizationResolver extends ResolverBase {
    @Query(() => RunOrganizationViewResult)
    async RunOrganizationViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunOrganizationViewResult)
    async RunOrganizationViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunOrganizationViewResult)
    async RunOrganizationDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Organizations';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => Organization_, { nullable: true })
    async Organization(@Arg('OrganizationID', () => Int) OrganizationID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<Organization_ | null> {
        this.CheckUserReadPermissions('Organizations', userPayload);
        const sSQL = `SELECT * FROM [events].[vwOrganizations] WHERE [OrganizationID]=${OrganizationID} ` + this.getRowLevelSecurityWhereClause('Organizations', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Organizations', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }
  
    @FieldResolver(() => [Attendee_])
    async AttendeesArray(@Root() organization_: Organization_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Attendees', userPayload);
        const sSQL = `SELECT * FROM [events].[vwAttendees] WHERE [OrganizationID]=${organization_.OrganizationID} ` + this.getRowLevelSecurityWhereClause('Attendees', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Attendees', await dataSource.query(sSQL));
        return result;
    }
      
    @FieldResolver(() => [OrganizationLink_])
    async OrganizationLinksArray(@Root() organization_: Organization_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Organization Links', userPayload);
        const sSQL = `SELECT * FROM [common].[vwOrganizationLinks] WHERE [EventsOrganizationID]=${organization_.OrganizationID} ` + this.getRowLevelSecurityWhereClause('Organization Links', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Organization Links', await dataSource.query(sSQL));
        return result;
    }
    
    @Mutation(() => Organization_)
    async CreateOrganization(
        @Arg('input', () => CreateOrganizationInput) input: CreateOrganizationInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <OrganizationEntity>await new Metadata().GetEntityObject('Organizations', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateOrganizationInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateOrganizationInput) {
    }
    
    @Mutation(() => Organization_)
    async UpdateOrganization(
        @Arg('input', () => UpdateOrganizationInput) input: UpdateOrganizationInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <OrganizationEntity>await new Metadata().GetEntityObject('Organizations', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Organizations
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateOrganizationInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateOrganizationInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Registrations__events
//****************************************************************************
@ObjectType()
export class Registration__events_ {  
    @Field(() => Int) 
    RegistrationID: number;
      
    @Field(() => Int) 
    EventID: number;
      
    @Field(() => Int) 
    AttendeeID: number;
      
    @Field() 
    @MaxLength(3)
    RegistrationDate: Date;
      
    @Field(() => Float, {nullable: true}) 
    RegistrationFee?: number;
      
    @Field({nullable: true, description: 'Paid, Unpaid, Refunded'}) 
    @MaxLength(510)
    PaymentStatus?: string;
      
    @Field({nullable: true, description: 'Registered, Pending, Canceled, Attended'}) 
    @MaxLength(510)
    Status?: string;
      
    @Field({nullable: true, description: 'Attendee, Sponsor, Speaker'}) 
    @MaxLength(40)
    RegistrationType?: string;
    
}
        
//****************************************************************************
// INPUT TYPE for Registrations__events   
//****************************************************************************
@InputType()
export class CreateRegistration__eventsInput {
    @Field(() => Int, )
    RegistrationID: number;

    @Field(() => Int, )
    EventID: number;

    @Field(() => Int, )
    AttendeeID: number;

    @Field()
    RegistrationDate: Date;

    @Field(() => Float, { nullable: true })
    RegistrationFee: number;

    @Field({ nullable: true })
    PaymentStatus: string;

    @Field({ nullable: true })
    Status: string;

    @Field({ nullable: true })
    RegistrationType: string;
}

        
//****************************************************************************
// INPUT TYPE for Registrations__events   
//****************************************************************************
@InputType()
export class UpdateRegistration__eventsInput {
    @Field(() => Int, )
    RegistrationID: number;

    @Field(() => Int, )
    EventID: number;

    @Field(() => Int, )
    AttendeeID: number;

    @Field()
    RegistrationDate: Date;

    @Field(() => Float, { nullable: true })
    RegistrationFee: number;

    @Field({ nullable: true })
    PaymentStatus: string;

    @Field({ nullable: true })
    Status: string;

    @Field({ nullable: true })
    RegistrationType: string;
}

//****************************************************************************
// RESOLVER for Registrations__events
//****************************************************************************
@ObjectType()
export class RunRegistration__eventsViewResult {
    @Field(() => [Registration__events_])
    Results: Registration__events_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(Registration__events_)
export class Registration__eventsResolver extends ResolverBase {
    @Query(() => RunRegistration__eventsViewResult)
    async RunRegistration__eventsViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunRegistration__eventsViewResult)
    async RunRegistration__eventsViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunRegistration__eventsViewResult)
    async RunRegistration__eventsDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Registrations__events';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => Registration__events_, { nullable: true })
    async Registration__events(@Arg('RegistrationID', () => Int) RegistrationID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<Registration__events_ | null> {
        this.CheckUserReadPermissions('Registrations__events', userPayload);
        const sSQL = `SELECT * FROM [events].[vwRegistrations__events] WHERE [RegistrationID]=${RegistrationID} ` + this.getRowLevelSecurityWhereClause('Registrations__events', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Registrations__events', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }

    @Mutation(() => Registration__events_)
    async CreateRegistration__events(
        @Arg('input', () => CreateRegistration__eventsInput) input: CreateRegistration__eventsInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <Registration__eventsEntity>await new Metadata().GetEntityObject('Registrations__events', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateRegistration__eventsInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateRegistration__eventsInput) {
    }
    
    @Mutation(() => Registration__events_)
    async UpdateRegistration__events(
        @Arg('input', () => UpdateRegistration__eventsInput) input: UpdateRegistration__eventsInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <Registration__eventsEntity>await new Metadata().GetEntityObject('Registrations__events', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Registrations__events
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateRegistration__eventsInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateRegistration__eventsInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Attendees
//****************************************************************************
@ObjectType()
export class Attendee_ {  
    @Field(() => Int) 
    AttendeeID: number;
      
    @Field(() => Int, {nullable: true}) 
    OrganizationID?: number;
      
    @Field() 
    @MaxLength(510)
    Email: string;
      
    @Field({nullable: true}) 
    @MaxLength(100)
    FirstName?: string;
      
    @Field({nullable: true}) 
    @MaxLength(100)
    LastName?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    JobTitle?: string;
      
    @Field({nullable: true}) 
    @MaxLength(510)
    Address?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    City?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    State?: string;
      
    @Field({nullable: true}) 
    @MaxLength(40)
    ZipCode?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    Country?: string;
    
    @Field(() => [PersonLink_])
    PersonLinksArray: PersonLink_[]; // Link to PersonLinks

    @Field(() => [Registration__events_])
    Registrations__eventsArray: Registration__events_[]; // Link to Registrations__events

}
        
//****************************************************************************
// INPUT TYPE for Attendees   
//****************************************************************************
@InputType()
export class CreateAttendeeInput {
    @Field(() => Int, )
    AttendeeID: number;

    @Field(() => Int, { nullable: true })
    OrganizationID: number;

    @Field()
    Email: string;

    @Field({ nullable: true })
    FirstName: string;

    @Field({ nullable: true })
    LastName: string;

    @Field({ nullable: true })
    JobTitle: string;

    @Field({ nullable: true })
    Address: string;

    @Field({ nullable: true })
    City: string;

    @Field({ nullable: true })
    State: string;

    @Field({ nullable: true })
    ZipCode: string;

    @Field({ nullable: true })
    Country: string;
}

        
//****************************************************************************
// INPUT TYPE for Attendees   
//****************************************************************************
@InputType()
export class UpdateAttendeeInput {
    @Field(() => Int, )
    AttendeeID: number;

    @Field(() => Int, { nullable: true })
    OrganizationID: number;

    @Field()
    Email: string;

    @Field({ nullable: true })
    FirstName: string;

    @Field({ nullable: true })
    LastName: string;

    @Field({ nullable: true })
    JobTitle: string;

    @Field({ nullable: true })
    Address: string;

    @Field({ nullable: true })
    City: string;

    @Field({ nullable: true })
    State: string;

    @Field({ nullable: true })
    ZipCode: string;

    @Field({ nullable: true })
    Country: string;
}

//****************************************************************************
// RESOLVER for Attendees
//****************************************************************************
@ObjectType()
export class RunAttendeeViewResult {
    @Field(() => [Attendee_])
    Results: Attendee_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(Attendee_)
export class AttendeeResolver extends ResolverBase {
    @Query(() => RunAttendeeViewResult)
    async RunAttendeeViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunAttendeeViewResult)
    async RunAttendeeViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunAttendeeViewResult)
    async RunAttendeeDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Attendees';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => Attendee_, { nullable: true })
    async Attendee(@Arg('AttendeeID', () => Int) AttendeeID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<Attendee_ | null> {
        this.CheckUserReadPermissions('Attendees', userPayload);
        const sSQL = `SELECT * FROM [events].[vwAttendees] WHERE [AttendeeID]=${AttendeeID} ` + this.getRowLevelSecurityWhereClause('Attendees', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Attendees', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }
  
    @FieldResolver(() => [PersonLink_])
    async PersonLinksArray(@Root() attendee_: Attendee_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Person Links', userPayload);
        const sSQL = `SELECT * FROM [common].[vwPersonLinks] WHERE [EventsAttendeeID]=${attendee_.AttendeeID} ` + this.getRowLevelSecurityWhereClause('Person Links', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Person Links', await dataSource.query(sSQL));
        return result;
    }
      
    @FieldResolver(() => [Registration__events_])
    async Registrations__eventsArray(@Root() attendee_: Attendee_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Registrations__events', userPayload);
        const sSQL = `SELECT * FROM [events].[vwRegistrations__events] WHERE [AttendeeID]=${attendee_.AttendeeID} ` + this.getRowLevelSecurityWhereClause('Registrations__events', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Registrations__events', await dataSource.query(sSQL));
        return result;
    }
    
    @Mutation(() => Attendee_)
    async CreateAttendee(
        @Arg('input', () => CreateAttendeeInput) input: CreateAttendeeInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <AttendeeEntity>await new Metadata().GetEntityObject('Attendees', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateAttendeeInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateAttendeeInput) {
    }
    
    @Mutation(() => Attendee_)
    async UpdateAttendee(
        @Arg('input', () => UpdateAttendeeInput) input: UpdateAttendeeInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <AttendeeEntity>await new Metadata().GetEntityObject('Attendees', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Attendees
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateAttendeeInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateAttendeeInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Events
//****************************************************************************
@ObjectType()
export class Event_ {  
    @Field(() => Int) 
    EventID: number;
      
    @Field() 
    @MaxLength(510)
    EventName: string;
      
    @Field({nullable: true}) 
    @MaxLength(510)
    Location?: string;
      
    @Field({nullable: true}) 
    Description?: string;
      
    @Field({nullable: true}) 
    @MaxLength(3)
    StartDate?: Date;
      
    @Field({nullable: true}) 
    @MaxLength(3)
    EndDate?: Date;
      
    @Field({nullable: true}) 
    @MaxLength(510)
    Address?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    City?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    State?: string;
      
    @Field({nullable: true}) 
    @MaxLength(40)
    Zip?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    Country?: string;
      
    @Field({nullable: true}) 
    @MaxLength(40)
    EventType?: string;
      
    @Field(() => Float, {nullable: true}) 
    MemberPrice?: number;
      
    @Field(() => Float, {nullable: true}) 
    NonMemberPrice?: number;
      
    @Field(() => Float, {nullable: true}) 
    SpeakerPrice?: number;
    
    @Field(() => [Registration__events_])
    Registrations__eventsArray: Registration__events_[]; // Link to Registrations__events

}
        
//****************************************************************************
// INPUT TYPE for Events   
//****************************************************************************
@InputType()
export class CreateEventInput {
    @Field(() => Int, )
    EventID: number;

    @Field()
    EventName: string;

    @Field({ nullable: true })
    Location: string;

    @Field({ nullable: true })
    Description: string;

    @Field({ nullable: true })
    StartDate: Date;

    @Field({ nullable: true })
    EndDate: Date;

    @Field({ nullable: true })
    Address: string;

    @Field({ nullable: true })
    City: string;

    @Field({ nullable: true })
    State: string;

    @Field({ nullable: true })
    Zip: string;

    @Field({ nullable: true })
    Country: string;

    @Field({ nullable: true })
    EventType: string;

    @Field(() => Float, { nullable: true })
    MemberPrice: number;

    @Field(() => Float, { nullable: true })
    NonMemberPrice: number;

    @Field(() => Float, { nullable: true })
    SpeakerPrice: number;
}

        
//****************************************************************************
// INPUT TYPE for Events   
//****************************************************************************
@InputType()
export class UpdateEventInput {
    @Field(() => Int, )
    EventID: number;

    @Field()
    EventName: string;

    @Field({ nullable: true })
    Location: string;

    @Field({ nullable: true })
    Description: string;

    @Field({ nullable: true })
    StartDate: Date;

    @Field({ nullable: true })
    EndDate: Date;

    @Field({ nullable: true })
    Address: string;

    @Field({ nullable: true })
    City: string;

    @Field({ nullable: true })
    State: string;

    @Field({ nullable: true })
    Zip: string;

    @Field({ nullable: true })
    Country: string;

    @Field({ nullable: true })
    EventType: string;

    @Field(() => Float, { nullable: true })
    MemberPrice: number;

    @Field(() => Float, { nullable: true })
    NonMemberPrice: number;

    @Field(() => Float, { nullable: true })
    SpeakerPrice: number;
}

//****************************************************************************
// RESOLVER for Events
//****************************************************************************
@ObjectType()
export class RunEventViewResult {
    @Field(() => [Event_])
    Results: Event_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(Event_)
export class EventResolver extends ResolverBase {
    @Query(() => RunEventViewResult)
    async RunEventViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunEventViewResult)
    async RunEventViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunEventViewResult)
    async RunEventDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Events';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => Event_, { nullable: true })
    async Event(@Arg('EventID', () => Int) EventID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<Event_ | null> {
        this.CheckUserReadPermissions('Events', userPayload);
        const sSQL = `SELECT * FROM [events].[vwEvents] WHERE [EventID]=${EventID} ` + this.getRowLevelSecurityWhereClause('Events', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Events', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }
  
    @FieldResolver(() => [Registration__events_])
    async Registrations__eventsArray(@Root() event_: Event_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Registrations__events', userPayload);
        const sSQL = `SELECT * FROM [events].[vwRegistrations__events] WHERE [EventID]=${event_.EventID} ` + this.getRowLevelSecurityWhereClause('Registrations__events', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Registrations__events', await dataSource.query(sSQL));
        return result;
    }
    
    @Mutation(() => Event_)
    async CreateEvent(
        @Arg('input', () => CreateEventInput) input: CreateEventInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <EventEntity>await new Metadata().GetEntityObject('Events', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateEventInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateEventInput) {
    }
    
    @Mutation(() => Event_)
    async UpdateEvent(
        @Arg('input', () => UpdateEventInput) input: UpdateEventInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <EventEntity>await new Metadata().GetEntityObject('Events', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Events
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateEventInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateEventInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Students
//****************************************************************************
@ObjectType()
export class Student_ {  
    @Field(() => Int) 
    StudentID: number;
      
    @Field(() => Int, {nullable: true}) 
    CompanyID?: number;
      
    @Field() 
    @MaxLength(510)
    Email: string;
      
    @Field({nullable: true}) 
    @MaxLength(100)
    FirstName?: string;
      
    @Field({nullable: true}) 
    @MaxLength(100)
    LastName?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    JobTitle?: string;
      
    @Field({nullable: true}) 
    @MaxLength(510)
    Address?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    City?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    State?: string;
      
    @Field({nullable: true}) 
    @MaxLength(40)
    ZipCode?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    Country?: string;
    
    @Field(() => [PersonLink_])
    PersonLinksArray: PersonLink_[]; // Link to PersonLinks

    @Field(() => [Registration_])
    RegistrationsArray: Registration_[]; // Link to Registrations

}
        
//****************************************************************************
// INPUT TYPE for Students   
//****************************************************************************
@InputType()
export class CreateStudentInput {
    @Field(() => Int, )
    StudentID: number;

    @Field(() => Int, { nullable: true })
    CompanyID: number;

    @Field()
    Email: string;

    @Field({ nullable: true })
    FirstName: string;

    @Field({ nullable: true })
    LastName: string;

    @Field({ nullable: true })
    JobTitle: string;

    @Field({ nullable: true })
    Address: string;

    @Field({ nullable: true })
    City: string;

    @Field({ nullable: true })
    State: string;

    @Field({ nullable: true })
    ZipCode: string;

    @Field({ nullable: true })
    Country: string;
}

        
//****************************************************************************
// INPUT TYPE for Students   
//****************************************************************************
@InputType()
export class UpdateStudentInput {
    @Field(() => Int, )
    StudentID: number;

    @Field(() => Int, { nullable: true })
    CompanyID: number;

    @Field()
    Email: string;

    @Field({ nullable: true })
    FirstName: string;

    @Field({ nullable: true })
    LastName: string;

    @Field({ nullable: true })
    JobTitle: string;

    @Field({ nullable: true })
    Address: string;

    @Field({ nullable: true })
    City: string;

    @Field({ nullable: true })
    State: string;

    @Field({ nullable: true })
    ZipCode: string;

    @Field({ nullable: true })
    Country: string;
}

//****************************************************************************
// RESOLVER for Students
//****************************************************************************
@ObjectType()
export class RunStudentViewResult {
    @Field(() => [Student_])
    Results: Student_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(Student_)
export class StudentResolver extends ResolverBase {
    @Query(() => RunStudentViewResult)
    async RunStudentViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunStudentViewResult)
    async RunStudentViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunStudentViewResult)
    async RunStudentDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Students';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => Student_, { nullable: true })
    async Student(@Arg('StudentID', () => Int) StudentID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<Student_ | null> {
        this.CheckUserReadPermissions('Students', userPayload);
        const sSQL = `SELECT * FROM [education].[vwStudents] WHERE [StudentID]=${StudentID} ` + this.getRowLevelSecurityWhereClause('Students', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Students', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }
  
    @FieldResolver(() => [PersonLink_])
    async PersonLinksArray(@Root() student_: Student_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Person Links', userPayload);
        const sSQL = `SELECT * FROM [common].[vwPersonLinks] WHERE [EducationStudentID]=${student_.StudentID} ` + this.getRowLevelSecurityWhereClause('Person Links', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Person Links', await dataSource.query(sSQL));
        return result;
    }
      
    @FieldResolver(() => [Registration_])
    async RegistrationsArray(@Root() student_: Student_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Registrations', userPayload);
        const sSQL = `SELECT * FROM [education].[vwRegistrations] WHERE [StudentID]=${student_.StudentID} ` + this.getRowLevelSecurityWhereClause('Registrations', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Registrations', await dataSource.query(sSQL));
        return result;
    }
    
    @Mutation(() => Student_)
    async CreateStudent(
        @Arg('input', () => CreateStudentInput) input: CreateStudentInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <StudentEntity>await new Metadata().GetEntityObject('Students', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateStudentInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateStudentInput) {
    }
    
    @Mutation(() => Student_)
    async UpdateStudent(
        @Arg('input', () => UpdateStudentInput) input: UpdateStudentInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <StudentEntity>await new Metadata().GetEntityObject('Students', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Students
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateStudentInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateStudentInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Registrations
//****************************************************************************
@ObjectType()
export class Registration_ {  
    @Field(() => Int) 
    RegistrationID: number;
      
    @Field(() => Int) 
    CourseID: number;
      
    @Field(() => Int) 
    StudentID: number;
      
    @Field() 
    @MaxLength(3)
    RegistrationDate: Date;
      
    @Field(() => Float, {nullable: true}) 
    RegistrationFee?: number;
      
    @Field({nullable: true, description: 'Paid, Unpaid, Refunded'}) 
    @MaxLength(510)
    PaymentStatus?: string;
      
    @Field({nullable: true, description: 'Pending, In Progress, Failed, Completed'}) 
    @MaxLength(510)
    CompletionStatus?: string;
      
    @Field(() => Boolean, {nullable: true}) 
    CertificationAwarded?: boolean;
    
}
        
//****************************************************************************
// INPUT TYPE for Registrations   
//****************************************************************************
@InputType()
export class CreateRegistrationInput {
    @Field(() => Int, )
    RegistrationID: number;

    @Field(() => Int, )
    CourseID: number;

    @Field(() => Int, )
    StudentID: number;

    @Field()
    RegistrationDate: Date;

    @Field(() => Float, { nullable: true })
    RegistrationFee: number;

    @Field({ nullable: true })
    PaymentStatus: string;

    @Field({ nullable: true })
    CompletionStatus: string;

    @Field(() => Boolean, { nullable: true })
    CertificationAwarded: boolean;
}

        
//****************************************************************************
// INPUT TYPE for Registrations   
//****************************************************************************
@InputType()
export class UpdateRegistrationInput {
    @Field(() => Int, )
    RegistrationID: number;

    @Field(() => Int, )
    CourseID: number;

    @Field(() => Int, )
    StudentID: number;

    @Field()
    RegistrationDate: Date;

    @Field(() => Float, { nullable: true })
    RegistrationFee: number;

    @Field({ nullable: true })
    PaymentStatus: string;

    @Field({ nullable: true })
    CompletionStatus: string;

    @Field(() => Boolean, { nullable: true })
    CertificationAwarded: boolean;
}

//****************************************************************************
// RESOLVER for Registrations
//****************************************************************************
@ObjectType()
export class RunRegistrationViewResult {
    @Field(() => [Registration_])
    Results: Registration_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(Registration_)
export class RegistrationResolver extends ResolverBase {
    @Query(() => RunRegistrationViewResult)
    async RunRegistrationViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunRegistrationViewResult)
    async RunRegistrationViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunRegistrationViewResult)
    async RunRegistrationDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Registrations';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => Registration_, { nullable: true })
    async Registration(@Arg('RegistrationID', () => Int) RegistrationID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<Registration_ | null> {
        this.CheckUserReadPermissions('Registrations', userPayload);
        const sSQL = `SELECT * FROM [education].[vwRegistrations] WHERE [RegistrationID]=${RegistrationID} ` + this.getRowLevelSecurityWhereClause('Registrations', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Registrations', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }

    @Mutation(() => Registration_)
    async CreateRegistration(
        @Arg('input', () => CreateRegistrationInput) input: CreateRegistrationInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <RegistrationEntity>await new Metadata().GetEntityObject('Registrations', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateRegistrationInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateRegistrationInput) {
    }
    
    @Mutation(() => Registration_)
    async UpdateRegistration(
        @Arg('input', () => UpdateRegistrationInput) input: UpdateRegistrationInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <RegistrationEntity>await new Metadata().GetEntityObject('Registrations', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Registrations
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateRegistrationInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateRegistrationInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Companies__education
//****************************************************************************
@ObjectType()
export class Company__education_ {  
    @Field(() => Int) 
    CompanyID: number;
      
    @Field() 
    @MaxLength(510)
    CompanyName: string;
      
    @Field({nullable: true}) 
    @MaxLength(510)
    Website?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    Industry?: string;
      
    @Field({nullable: true}) 
    @MaxLength(100)
    Size?: string;
      
    @Field({nullable: true}) 
    @MaxLength(510)
    Address?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    City?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    State?: string;
      
    @Field({nullable: true}) 
    @MaxLength(40)
    ZipCode?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    Country?: string;
    
    @Field(() => [OrganizationLink_])
    OrganizationLinksArray: OrganizationLink_[]; // Link to OrganizationLinks

    @Field(() => [Student_])
    StudentsArray: Student_[]; // Link to Students

}
        
//****************************************************************************
// INPUT TYPE for Companies__education   
//****************************************************************************
@InputType()
export class CreateCompany__educationInput {
    @Field(() => Int, )
    CompanyID: number;

    @Field()
    CompanyName: string;

    @Field({ nullable: true })
    Website: string;

    @Field({ nullable: true })
    Industry: string;

    @Field({ nullable: true })
    Size: string;

    @Field({ nullable: true })
    Address: string;

    @Field({ nullable: true })
    City: string;

    @Field({ nullable: true })
    State: string;

    @Field({ nullable: true })
    ZipCode: string;

    @Field({ nullable: true })
    Country: string;
}

        
//****************************************************************************
// INPUT TYPE for Companies__education   
//****************************************************************************
@InputType()
export class UpdateCompany__educationInput {
    @Field(() => Int, )
    CompanyID: number;

    @Field()
    CompanyName: string;

    @Field({ nullable: true })
    Website: string;

    @Field({ nullable: true })
    Industry: string;

    @Field({ nullable: true })
    Size: string;

    @Field({ nullable: true })
    Address: string;

    @Field({ nullable: true })
    City: string;

    @Field({ nullable: true })
    State: string;

    @Field({ nullable: true })
    ZipCode: string;

    @Field({ nullable: true })
    Country: string;
}

//****************************************************************************
// RESOLVER for Companies__education
//****************************************************************************
@ObjectType()
export class RunCompany__educationViewResult {
    @Field(() => [Company__education_])
    Results: Company__education_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(Company__education_)
export class Company__educationResolver extends ResolverBase {
    @Query(() => RunCompany__educationViewResult)
    async RunCompany__educationViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunCompany__educationViewResult)
    async RunCompany__educationViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunCompany__educationViewResult)
    async RunCompany__educationDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Companies__education';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => Company__education_, { nullable: true })
    async Company__education(@Arg('CompanyID', () => Int) CompanyID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<Company__education_ | null> {
        this.CheckUserReadPermissions('Companies__education', userPayload);
        const sSQL = `SELECT * FROM [education].[vwCompanies__education] WHERE [CompanyID]=${CompanyID} ` + this.getRowLevelSecurityWhereClause('Companies__education', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Companies__education', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }
  
    @FieldResolver(() => [OrganizationLink_])
    async OrganizationLinksArray(@Root() company__education_: Company__education_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Organization Links', userPayload);
        const sSQL = `SELECT * FROM [common].[vwOrganizationLinks] WHERE [EducationCompanyID]=${company__education_.CompanyID} ` + this.getRowLevelSecurityWhereClause('Organization Links', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Organization Links', await dataSource.query(sSQL));
        return result;
    }
      
    @FieldResolver(() => [Student_])
    async StudentsArray(@Root() company__education_: Company__education_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Students', userPayload);
        const sSQL = `SELECT * FROM [education].[vwStudents] WHERE [CompanyID]=${company__education_.CompanyID} ` + this.getRowLevelSecurityWhereClause('Students', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Students', await dataSource.query(sSQL));
        return result;
    }
    
    @Mutation(() => Company__education_)
    async CreateCompany__education(
        @Arg('input', () => CreateCompany__educationInput) input: CreateCompany__educationInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <Company__educationEntity>await new Metadata().GetEntityObject('Companies__education', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateCompany__educationInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateCompany__educationInput) {
    }
    
    @Mutation(() => Company__education_)
    async UpdateCompany__education(
        @Arg('input', () => UpdateCompany__educationInput) input: UpdateCompany__educationInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <Company__educationEntity>await new Metadata().GetEntityObject('Companies__education', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Companies__education
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateCompany__educationInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateCompany__educationInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Courses
//****************************************************************************
@ObjectType()
export class Course_ {  
    @Field(() => Int) 
    CourseID: number;
      
    @Field() 
    @MaxLength(510)
    CourseName: string;
      
    @Field({nullable: true}) 
    Description?: string;
      
    @Field() 
    @MaxLength(3)
    StartDate: Date;
      
    @Field({nullable: true}) 
    @MaxLength(3)
    EndDate?: Date;
      
    @Field(() => Float, {nullable: true}) 
    MemberPrice?: number;
      
    @Field(() => Float, {nullable: true}) 
    NonMemberPrice?: number;
      
    @Field(() => Int, {nullable: true}) 
    InstructorID?: number;
    
    @Field(() => [Registration_])
    RegistrationsArray: Registration_[]; // Link to Registrations

}
        
//****************************************************************************
// INPUT TYPE for Courses   
//****************************************************************************
@InputType()
export class CreateCourseInput {
    @Field(() => Int, )
    CourseID: number;

    @Field()
    CourseName: string;

    @Field({ nullable: true })
    Description: string;

    @Field()
    StartDate: Date;

    @Field({ nullable: true })
    EndDate: Date;

    @Field(() => Float, { nullable: true })
    MemberPrice: number;

    @Field(() => Float, { nullable: true })
    NonMemberPrice: number;

    @Field(() => Int, { nullable: true })
    InstructorID: number;
}

        
//****************************************************************************
// INPUT TYPE for Courses   
//****************************************************************************
@InputType()
export class UpdateCourseInput {
    @Field(() => Int, )
    CourseID: number;

    @Field()
    CourseName: string;

    @Field({ nullable: true })
    Description: string;

    @Field()
    StartDate: Date;

    @Field({ nullable: true })
    EndDate: Date;

    @Field(() => Float, { nullable: true })
    MemberPrice: number;

    @Field(() => Float, { nullable: true })
    NonMemberPrice: number;

    @Field(() => Int, { nullable: true })
    InstructorID: number;
}

//****************************************************************************
// RESOLVER for Courses
//****************************************************************************
@ObjectType()
export class RunCourseViewResult {
    @Field(() => [Course_])
    Results: Course_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(Course_)
export class CourseResolver extends ResolverBase {
    @Query(() => RunCourseViewResult)
    async RunCourseViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunCourseViewResult)
    async RunCourseViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunCourseViewResult)
    async RunCourseDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Courses';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => Course_, { nullable: true })
    async Course(@Arg('CourseID', () => Int) CourseID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<Course_ | null> {
        this.CheckUserReadPermissions('Courses', userPayload);
        const sSQL = `SELECT * FROM [education].[vwCourses] WHERE [CourseID]=${CourseID} ` + this.getRowLevelSecurityWhereClause('Courses', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Courses', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }
  
    @FieldResolver(() => [Registration_])
    async RegistrationsArray(@Root() course_: Course_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Registrations', userPayload);
        const sSQL = `SELECT * FROM [education].[vwRegistrations] WHERE [CourseID]=${course_.CourseID} ` + this.getRowLevelSecurityWhereClause('Registrations', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Registrations', await dataSource.query(sSQL));
        return result;
    }
    
    @Mutation(() => Course_)
    async CreateCourse(
        @Arg('input', () => CreateCourseInput) input: CreateCourseInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <CourseEntity>await new Metadata().GetEntityObject('Courses', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateCourseInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateCourseInput) {
    }
    
    @Mutation(() => Course_)
    async UpdateCourse(
        @Arg('input', () => UpdateCourseInput) input: UpdateCourseInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <CourseEntity>await new Metadata().GetEntityObject('Courses', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Courses
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateCourseInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateCourseInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Instructors
//****************************************************************************
@ObjectType()
export class Instructor_ {  
    @Field(() => Int) 
    InstructorID: number;
      
    @Field({nullable: true}) 
    @MaxLength(100)
    FirstName?: string;
      
    @Field({nullable: true}) 
    @MaxLength(100)
    LastName?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    Email?: string;
      
    @Field({nullable: true}) 
    Bio?: string;
    
    @Field(() => [Course_])
    CoursesArray: Course_[]; // Link to Courses

}
        
//****************************************************************************
// INPUT TYPE for Instructors   
//****************************************************************************
@InputType()
export class CreateInstructorInput {
    @Field(() => Int, )
    InstructorID: number;

    @Field({ nullable: true })
    FirstName: string;

    @Field({ nullable: true })
    LastName: string;

    @Field({ nullable: true })
    Email: string;

    @Field({ nullable: true })
    Bio: string;
}

        
//****************************************************************************
// INPUT TYPE for Instructors   
//****************************************************************************
@InputType()
export class UpdateInstructorInput {
    @Field(() => Int, )
    InstructorID: number;

    @Field({ nullable: true })
    FirstName: string;

    @Field({ nullable: true })
    LastName: string;

    @Field({ nullable: true })
    Email: string;

    @Field({ nullable: true })
    Bio: string;
}

//****************************************************************************
// RESOLVER for Instructors
//****************************************************************************
@ObjectType()
export class RunInstructorViewResult {
    @Field(() => [Instructor_])
    Results: Instructor_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(Instructor_)
export class InstructorResolver extends ResolverBase {
    @Query(() => RunInstructorViewResult)
    async RunInstructorViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunInstructorViewResult)
    async RunInstructorViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunInstructorViewResult)
    async RunInstructorDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Instructors';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => Instructor_, { nullable: true })
    async Instructor(@Arg('InstructorID', () => Int) InstructorID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<Instructor_ | null> {
        this.CheckUserReadPermissions('Instructors', userPayload);
        const sSQL = `SELECT * FROM [education].[vwInstructors] WHERE [InstructorID]=${InstructorID} ` + this.getRowLevelSecurityWhereClause('Instructors', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Instructors', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }
  
    @FieldResolver(() => [Course_])
    async CoursesArray(@Root() instructor_: Instructor_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Courses', userPayload);
        const sSQL = `SELECT * FROM [education].[vwCourses] WHERE [InstructorID]=${instructor_.InstructorID} ` + this.getRowLevelSecurityWhereClause('Courses', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Courses', await dataSource.query(sSQL));
        return result;
    }
    
    @Mutation(() => Instructor_)
    async CreateInstructor(
        @Arg('input', () => CreateInstructorInput) input: CreateInstructorInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <InstructorEntity>await new Metadata().GetEntityObject('Instructors', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateInstructorInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateInstructorInput) {
    }
    
    @Mutation(() => Instructor_)
    async UpdateInstructor(
        @Arg('input', () => UpdateInstructorInput) input: UpdateInstructorInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <InstructorEntity>await new Metadata().GetEntityObject('Instructors', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Instructors
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateInstructorInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateInstructorInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Organization Links
//****************************************************************************
@ObjectType({ description: 'CompanyLink is used to connect data from across multiple schemas. These source schemas represent different source systems like membership, education, events, etc. The CompanyLink table has entries for "matches" between records that represent companies/organizations across the different source systems so that we have a structured way to unify this data in the CDP.' })
export class OrganizationLink_ {  
    @Field(() => Int) 
    OrganizationLinkID: number;
      
    @Field(() => Int, {nullable: true}) 
    MembershipCompanyID?: number;
      
    @Field(() => Int, {nullable: true}) 
    EventsOrganizationID?: number;
      
    @Field(() => Int, {nullable: true}) 
    EducationCompanyID?: number;
      
    @Field(() => Int, {nullable: true}) 
    CommunityCompanyID?: number;
      
    @Field() 
    @MaxLength(8)
    CreatedAt: Date;
      
    @Field() 
    @MaxLength(8)
    UpdatedAt: Date;
    
}
        
//****************************************************************************
// INPUT TYPE for Organization Links   
//****************************************************************************
@InputType()
export class CreateOrganizationLinkInput {
    @Field(() => Int, )
    OrganizationLinkID: number;

    @Field(() => Int, { nullable: true })
    MembershipCompanyID: number;

    @Field(() => Int, { nullable: true })
    EventsOrganizationID: number;

    @Field(() => Int, { nullable: true })
    EducationCompanyID: number;

    @Field(() => Int, { nullable: true })
    CommunityCompanyID: number;
}

        
//****************************************************************************
// INPUT TYPE for Organization Links   
//****************************************************************************
@InputType()
export class UpdateOrganizationLinkInput {
    @Field(() => Int, )
    OrganizationLinkID: number;

    @Field(() => Int, { nullable: true })
    MembershipCompanyID: number;

    @Field(() => Int, { nullable: true })
    EventsOrganizationID: number;

    @Field(() => Int, { nullable: true })
    EducationCompanyID: number;

    @Field(() => Int, { nullable: true })
    CommunityCompanyID: number;
}

//****************************************************************************
// RESOLVER for Organization Links
//****************************************************************************
@ObjectType()
export class RunOrganizationLinkViewResult {
    @Field(() => [OrganizationLink_])
    Results: OrganizationLink_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(OrganizationLink_)
export class OrganizationLinkResolver extends ResolverBase {
    @Query(() => RunOrganizationLinkViewResult)
    async RunOrganizationLinkViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunOrganizationLinkViewResult)
    async RunOrganizationLinkViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunOrganizationLinkViewResult)
    async RunOrganizationLinkDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Organization Links';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => OrganizationLink_, { nullable: true })
    async OrganizationLink(@Arg('OrganizationLinkID', () => Int) OrganizationLinkID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<OrganizationLink_ | null> {
        this.CheckUserReadPermissions('Organization Links', userPayload);
        const sSQL = `SELECT * FROM [common].[vwOrganizationLinks] WHERE [OrganizationLinkID]=${OrganizationLinkID} ` + this.getRowLevelSecurityWhereClause('Organization Links', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Organization Links', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }

    @Mutation(() => OrganizationLink_)
    async CreateOrganizationLink(
        @Arg('input', () => CreateOrganizationLinkInput) input: CreateOrganizationLinkInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <OrganizationLinkEntity>await new Metadata().GetEntityObject('Organization Links', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateOrganizationLinkInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateOrganizationLinkInput) {
    }
    
    @Mutation(() => OrganizationLink_)
    async UpdateOrganizationLink(
        @Arg('input', () => UpdateOrganizationLinkInput) input: UpdateOrganizationLinkInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <OrganizationLinkEntity>await new Metadata().GetEntityObject('Organization Links', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Organization Links
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateOrganizationLinkInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateOrganizationLinkInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Person Links
//****************************************************************************
@ObjectType({ description: 'PersonLink is used to connect data from across multiple schemas. These source schemas represent different source systems like membership, education, events, etc. The PersonLink table has entries for "matches" between records that represent people across the different source systems so that we have a structured way to unify this data in the CDP.' })
export class PersonLink_ {  
    @Field(() => Int) 
    PersonLinkID: number;
      
    @Field(() => Int, {nullable: true}) 
    MembershipMemberID?: number;
      
    @Field(() => Int, {nullable: true}) 
    EventsAttendeeID?: number;
      
    @Field(() => Int, {nullable: true}) 
    EducationStudentID?: number;
      
    @Field(() => Int, {nullable: true}) 
    CommunityAuthorID?: number;
      
    @Field() 
    @MaxLength(8)
    CreatedAt: Date;
      
    @Field() 
    @MaxLength(8)
    UpdatedAt: Date;
    
    @Field(() => [MembershipRenewal_])
    MembershipRenewalsArray: MembershipRenewal_[]; // Link to MembershipRenewals

    @Field(() => [Registration_])
    RegistrationsArray: Registration_[]; // Link to Registrations

    @Field(() => [Registration__events_])
    Registrations__eventsArray: Registration__events_[]; // Link to Registrations__events

    @Field(() => [Post_])
    PostsArray: Post_[]; // Link to Posts

    @Field(() => [Reply_])
    RepliesArray: Reply_[]; // Link to Replies

}
        
//****************************************************************************
// INPUT TYPE for Person Links   
//****************************************************************************
@InputType()
export class CreatePersonLinkInput {
    @Field(() => Int, )
    PersonLinkID: number;

    @Field(() => Int, { nullable: true })
    MembershipMemberID: number;

    @Field(() => Int, { nullable: true })
    EventsAttendeeID: number;

    @Field(() => Int, { nullable: true })
    EducationStudentID: number;

    @Field(() => Int, { nullable: true })
    CommunityAuthorID: number;
}

        
//****************************************************************************
// INPUT TYPE for Person Links   
//****************************************************************************
@InputType()
export class UpdatePersonLinkInput {
    @Field(() => Int, )
    PersonLinkID: number;

    @Field(() => Int, { nullable: true })
    MembershipMemberID: number;

    @Field(() => Int, { nullable: true })
    EventsAttendeeID: number;

    @Field(() => Int, { nullable: true })
    EducationStudentID: number;

    @Field(() => Int, { nullable: true })
    CommunityAuthorID: number;
}

//****************************************************************************
// RESOLVER for Person Links
//****************************************************************************
@ObjectType()
export class RunPersonLinkViewResult {
    @Field(() => [PersonLink_])
    Results: PersonLink_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(PersonLink_)
export class PersonLinkResolver extends ResolverBase {
    @Query(() => RunPersonLinkViewResult)
    async RunPersonLinkViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunPersonLinkViewResult)
    async RunPersonLinkViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunPersonLinkViewResult)
    async RunPersonLinkDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Person Links';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => PersonLink_, { nullable: true })
    async PersonLink(@Arg('PersonLinkID', () => Int) PersonLinkID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<PersonLink_ | null> {
        this.CheckUserReadPermissions('Person Links', userPayload);
        const sSQL = `SELECT * FROM [common].[vwPersonLinks] WHERE [PersonLinkID]=${PersonLinkID} ` + this.getRowLevelSecurityWhereClause('Person Links', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Person Links', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }
  
    @FieldResolver(() => [MembershipRenewal_])
    async MembershipRenewalsArray(@Root() personlink_: PersonLink_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Membership Renewals', userPayload);
        const sSQL = `SELECT * FROM [membership].[vwMembershipRenewals] WHERE [MemberID]=${personlink_.MembershipMemberID} ` + this.getRowLevelSecurityWhereClause('Membership Renewals', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Membership Renewals', await dataSource.query(sSQL));
        return result;
    }
      
    @FieldResolver(() => [Registration_])
    async RegistrationsArray(@Root() personlink_: PersonLink_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Registrations', userPayload);
        const sSQL = `SELECT * FROM [education].[vwRegistrations] WHERE [StudentID]=${personlink_.EducationStudentID} ` + this.getRowLevelSecurityWhereClause('Registrations', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Registrations', await dataSource.query(sSQL));
        return result;
    }
      
    @FieldResolver(() => [Registration__events_])
    async Registrations__eventsArray(@Root() personlink_: PersonLink_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Registrations__events', userPayload);
        const sSQL = `SELECT * FROM [events].[vwRegistrations__events] WHERE [AttendeeID]=${personlink_.EventsAttendeeID} ` + this.getRowLevelSecurityWhereClause('Registrations__events', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Registrations__events', await dataSource.query(sSQL));
        return result;
    }
      
    @FieldResolver(() => [Post_])
    async PostsArray(@Root() personlink_: PersonLink_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Posts', userPayload);
        const sSQL = `SELECT * FROM [community].[vwPosts] WHERE [AuthorID]=${personlink_.CommunityAuthorID} ` + this.getRowLevelSecurityWhereClause('Posts', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Posts', await dataSource.query(sSQL));
        return result;
    }
      
    @FieldResolver(() => [Reply_])
    async RepliesArray(@Root() personlink_: PersonLink_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Replies', userPayload);
        const sSQL = `SELECT * FROM [community].[vwReplies] WHERE [AuthorID]=${personlink_.CommunityAuthorID} ` + this.getRowLevelSecurityWhereClause('Replies', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Replies', await dataSource.query(sSQL));
        return result;
    }
    
    @Mutation(() => PersonLink_)
    async CreatePersonLink(
        @Arg('input', () => CreatePersonLinkInput) input: CreatePersonLinkInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <PersonLinkEntity>await new Metadata().GetEntityObject('Person Links', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreatePersonLinkInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreatePersonLinkInput) {
    }
    
    @Mutation(() => PersonLink_)
    async UpdatePersonLink(
        @Arg('input', () => UpdatePersonLinkInput) input: UpdatePersonLinkInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <PersonLinkEntity>await new Metadata().GetEntityObject('Person Links', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Person Links
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdatePersonLinkInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdatePersonLinkInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Membership Renewals
//****************************************************************************
@ObjectType()
export class MembershipRenewal_ {  
    @Field(() => Int) 
    RenewalID: number;
      
    @Field(() => Int) 
    MemberID: number;
      
    @Field() 
    @MaxLength(3)
    RenewalDate: Date;
      
    @Field(() => Float, {nullable: true}) 
    PaymentAmount?: number;
      
    @Field({nullable: true, description: 'Pending, Completed, Refunded'}) 
    @MaxLength(510)
    PaymentStatus?: string;
    
}
        
//****************************************************************************
// INPUT TYPE for Membership Renewals   
//****************************************************************************
@InputType()
export class CreateMembershipRenewalInput {
    @Field(() => Int, )
    RenewalID: number;

    @Field(() => Int, )
    MemberID: number;

    @Field()
    RenewalDate: Date;

    @Field(() => Float, { nullable: true })
    PaymentAmount: number;

    @Field({ nullable: true })
    PaymentStatus: string;
}

        
//****************************************************************************
// INPUT TYPE for Membership Renewals   
//****************************************************************************
@InputType()
export class UpdateMembershipRenewalInput {
    @Field(() => Int, )
    RenewalID: number;

    @Field(() => Int, )
    MemberID: number;

    @Field()
    RenewalDate: Date;

    @Field(() => Float, { nullable: true })
    PaymentAmount: number;

    @Field({ nullable: true })
    PaymentStatus: string;
}

//****************************************************************************
// RESOLVER for Membership Renewals
//****************************************************************************
@ObjectType()
export class RunMembershipRenewalViewResult {
    @Field(() => [MembershipRenewal_])
    Results: MembershipRenewal_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(MembershipRenewal_)
export class MembershipRenewalResolver extends ResolverBase {
    @Query(() => RunMembershipRenewalViewResult)
    async RunMembershipRenewalViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunMembershipRenewalViewResult)
    async RunMembershipRenewalViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunMembershipRenewalViewResult)
    async RunMembershipRenewalDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Membership Renewals';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => MembershipRenewal_, { nullable: true })
    async MembershipRenewal(@Arg('RenewalID', () => Int) RenewalID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<MembershipRenewal_ | null> {
        this.CheckUserReadPermissions('Membership Renewals', userPayload);
        const sSQL = `SELECT * FROM [membership].[vwMembershipRenewals] WHERE [RenewalID]=${RenewalID} ` + this.getRowLevelSecurityWhereClause('Membership Renewals', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Membership Renewals', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }

    @Mutation(() => MembershipRenewal_)
    async CreateMembershipRenewal(
        @Arg('input', () => CreateMembershipRenewalInput) input: CreateMembershipRenewalInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <MembershipRenewalEntity>await new Metadata().GetEntityObject('Membership Renewals', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateMembershipRenewalInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateMembershipRenewalInput) {
    }
    
    @Mutation(() => MembershipRenewal_)
    async UpdateMembershipRenewal(
        @Arg('input', () => UpdateMembershipRenewalInput) input: UpdateMembershipRenewalInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <MembershipRenewalEntity>await new Metadata().GetEntityObject('Membership Renewals', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Membership Renewals
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateMembershipRenewalInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateMembershipRenewalInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Member Types
//****************************************************************************
@ObjectType()
export class MemberType_ {  
    @Field(() => Int) 
    MemberTypeID: number;
      
    @Field() 
    @MaxLength(200)
    TypeName: string;
      
    @Field({nullable: true}) 
    Description?: string;
      
    @Field(() => Float, {nullable: true}) 
    AnnualDues?: number;
    
    @Field(() => [Member_])
    MembersArray: Member_[]; // Link to Members

}
        
//****************************************************************************
// INPUT TYPE for Member Types   
//****************************************************************************
@InputType()
export class CreateMemberTypeInput {
    @Field(() => Int, )
    MemberTypeID: number;

    @Field()
    TypeName: string;

    @Field({ nullable: true })
    Description: string;

    @Field(() => Float, { nullable: true })
    AnnualDues: number;
}

        
//****************************************************************************
// INPUT TYPE for Member Types   
//****************************************************************************
@InputType()
export class UpdateMemberTypeInput {
    @Field(() => Int, )
    MemberTypeID: number;

    @Field()
    TypeName: string;

    @Field({ nullable: true })
    Description: string;

    @Field(() => Float, { nullable: true })
    AnnualDues: number;
}

//****************************************************************************
// RESOLVER for Member Types
//****************************************************************************
@ObjectType()
export class RunMemberTypeViewResult {
    @Field(() => [MemberType_])
    Results: MemberType_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(MemberType_)
export class MemberTypeResolver extends ResolverBase {
    @Query(() => RunMemberTypeViewResult)
    async RunMemberTypeViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunMemberTypeViewResult)
    async RunMemberTypeViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunMemberTypeViewResult)
    async RunMemberTypeDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Member Types';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => MemberType_, { nullable: true })
    async MemberType(@Arg('MemberTypeID', () => Int) MemberTypeID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<MemberType_ | null> {
        this.CheckUserReadPermissions('Member Types', userPayload);
        const sSQL = `SELECT * FROM [membership].[vwMemberTypes] WHERE [MemberTypeID]=${MemberTypeID} ` + this.getRowLevelSecurityWhereClause('Member Types', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Member Types', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }
  
    @FieldResolver(() => [Member_])
    async MembersArray(@Root() membertype_: MemberType_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Members', userPayload);
        const sSQL = `SELECT * FROM [membership].[vwMembers] WHERE [MemberTypeID]=${membertype_.MemberTypeID} ` + this.getRowLevelSecurityWhereClause('Members', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Members', await dataSource.query(sSQL));
        return result;
    }
    
    @Mutation(() => MemberType_)
    async CreateMemberType(
        @Arg('input', () => CreateMemberTypeInput) input: CreateMemberTypeInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <MemberTypeEntity>await new Metadata().GetEntityObject('Member Types', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateMemberTypeInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateMemberTypeInput) {
    }
    
    @Mutation(() => MemberType_)
    async UpdateMemberType(
        @Arg('input', () => UpdateMemberTypeInput) input: UpdateMemberTypeInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <MemberTypeEntity>await new Metadata().GetEntityObject('Member Types', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Member Types
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateMemberTypeInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateMemberTypeInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Companies__membership
//****************************************************************************
@ObjectType()
export class Company__membership_ {  
    @Field(() => Int) 
    CompanyID: number;
      
    @Field() 
    @MaxLength(510)
    CompanyName: string;
      
    @Field({nullable: true}) 
    @MaxLength(510)
    Website?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    Industry?: string;
      
    @Field({nullable: true}) 
    @MaxLength(100)
    Size?: string;
      
    @Field({nullable: true}) 
    @MaxLength(510)
    Address?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    City?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    State?: string;
      
    @Field({nullable: true}) 
    @MaxLength(40)
    ZipCode?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    Country?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    TaxID?: string;
      
    @Field(() => Int, {nullable: true}) 
    Subsection?: number;
      
    @Field(() => Float, {nullable: true}) 
    TotalRevenue?: number;
      
    @Field(() => Float, {nullable: true}) 
    InformationTechnologyExpense?: number;
    
    @Field(() => [Member_])
    MembersArray: Member_[]; // Link to Members

    @Field(() => [OrganizationLink_])
    OrganizationLinksArray: OrganizationLink_[]; // Link to OrganizationLinks

}
        
//****************************************************************************
// INPUT TYPE for Companies__membership   
//****************************************************************************
@InputType()
export class CreateCompany__membershipInput {
    @Field(() => Int, )
    CompanyID: number;

    @Field()
    CompanyName: string;

    @Field({ nullable: true })
    Website: string;

    @Field({ nullable: true })
    Industry: string;

    @Field({ nullable: true })
    Size: string;

    @Field({ nullable: true })
    Address: string;

    @Field({ nullable: true })
    City: string;

    @Field({ nullable: true })
    State: string;

    @Field({ nullable: true })
    ZipCode: string;

    @Field({ nullable: true })
    Country: string;

    @Field({ nullable: true })
    TaxID: string;

    @Field(() => Int, { nullable: true })
    Subsection: number;

    @Field(() => Float, { nullable: true })
    TotalRevenue: number;

    @Field(() => Float, { nullable: true })
    InformationTechnologyExpense: number;
}

        
//****************************************************************************
// INPUT TYPE for Companies__membership   
//****************************************************************************
@InputType()
export class UpdateCompany__membershipInput {
    @Field(() => Int, )
    CompanyID: number;

    @Field()
    CompanyName: string;

    @Field({ nullable: true })
    Website: string;

    @Field({ nullable: true })
    Industry: string;

    @Field({ nullable: true })
    Size: string;

    @Field({ nullable: true })
    Address: string;

    @Field({ nullable: true })
    City: string;

    @Field({ nullable: true })
    State: string;

    @Field({ nullable: true })
    ZipCode: string;

    @Field({ nullable: true })
    Country: string;

    @Field({ nullable: true })
    TaxID: string;

    @Field(() => Int, { nullable: true })
    Subsection: number;

    @Field(() => Float, { nullable: true })
    TotalRevenue: number;

    @Field(() => Float, { nullable: true })
    InformationTechnologyExpense: number;
}

//****************************************************************************
// RESOLVER for Companies__membership
//****************************************************************************
@ObjectType()
export class RunCompany__membershipViewResult {
    @Field(() => [Company__membership_])
    Results: Company__membership_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(Company__membership_)
export class Company__membershipResolver extends ResolverBase {
    @Query(() => RunCompany__membershipViewResult)
    async RunCompany__membershipViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunCompany__membershipViewResult)
    async RunCompany__membershipViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunCompany__membershipViewResult)
    async RunCompany__membershipDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Companies__membership';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => Company__membership_, { nullable: true })
    async Company__membership(@Arg('CompanyID', () => Int) CompanyID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<Company__membership_ | null> {
        this.CheckUserReadPermissions('Companies__membership', userPayload);
        const sSQL = `SELECT * FROM [membership].[vwCompanies__membership] WHERE [CompanyID]=${CompanyID} ` + this.getRowLevelSecurityWhereClause('Companies__membership', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Companies__membership', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }
  
    @FieldResolver(() => [Member_])
    async MembersArray(@Root() company__membership_: Company__membership_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Members', userPayload);
        const sSQL = `SELECT * FROM [membership].[vwMembers] WHERE [CompanyID]=${company__membership_.CompanyID} ` + this.getRowLevelSecurityWhereClause('Members', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Members', await dataSource.query(sSQL));
        return result;
    }
      
    @FieldResolver(() => [OrganizationLink_])
    async OrganizationLinksArray(@Root() company__membership_: Company__membership_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Organization Links', userPayload);
        const sSQL = `SELECT * FROM [common].[vwOrganizationLinks] WHERE [MembershipCompanyID]=${company__membership_.CompanyID} ` + this.getRowLevelSecurityWhereClause('Organization Links', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Organization Links', await dataSource.query(sSQL));
        return result;
    }
    
    @Mutation(() => Company__membership_)
    async CreateCompany__membership(
        @Arg('input', () => CreateCompany__membershipInput) input: CreateCompany__membershipInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <Company__membershipEntity>await new Metadata().GetEntityObject('Companies__membership', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateCompany__membershipInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateCompany__membershipInput) {
    }
    
    @Mutation(() => Company__membership_)
    async UpdateCompany__membership(
        @Arg('input', () => UpdateCompany__membershipInput) input: UpdateCompany__membershipInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <Company__membershipEntity>await new Metadata().GetEntityObject('Companies__membership', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Companies__membership
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateCompany__membershipInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateCompany__membershipInput) {
        const i = input, d = dataSource; // prevent error
    }

}

//****************************************************************************
// ENTITY CLASS for Members
//****************************************************************************
@ObjectType()
export class Member_ {  
    @Field(() => Int) 
    MemberID: number;
      
    @Field(() => Int, {nullable: true}) 
    CompanyID?: number;
      
    @Field() 
    @MaxLength(510)
    Email: string;
      
    @Field({nullable: true}) 
    @MaxLength(100)
    FirstName?: string;
      
    @Field({nullable: true}) 
    @MaxLength(100)
    LastName?: string;
      
    @Field({nullable: true}) 
    @MaxLength(200)
    JobTitle?: string;
      
    @Field() 
    @MaxLength(3)
    JoinDate: Date;
      
    @Field(() => Int) 
    MemberTypeID: number;
    
    @Field(() => [PersonLink_])
    PersonLinksArray: PersonLink_[]; // Link to PersonLinks

    @Field(() => [MembershipRenewal_])
    MembershipRenewalsArray: MembershipRenewal_[]; // Link to MembershipRenewals

}
        
//****************************************************************************
// INPUT TYPE for Members   
//****************************************************************************
@InputType()
export class CreateMemberInput {
    @Field(() => Int, )
    MemberID: number;

    @Field(() => Int, { nullable: true })
    CompanyID: number;

    @Field()
    Email: string;

    @Field({ nullable: true })
    FirstName: string;

    @Field({ nullable: true })
    LastName: string;

    @Field({ nullable: true })
    JobTitle: string;

    @Field()
    JoinDate: Date;

    @Field(() => Int, )
    MemberTypeID: number;
}

        
//****************************************************************************
// INPUT TYPE for Members   
//****************************************************************************
@InputType()
export class UpdateMemberInput {
    @Field(() => Int, )
    MemberID: number;

    @Field(() => Int, { nullable: true })
    CompanyID: number;

    @Field()
    Email: string;

    @Field({ nullable: true })
    FirstName: string;

    @Field({ nullable: true })
    LastName: string;

    @Field({ nullable: true })
    JobTitle: string;

    @Field()
    JoinDate: Date;

    @Field(() => Int, )
    MemberTypeID: number;
}

//****************************************************************************
// RESOLVER for Members
//****************************************************************************
@ObjectType()
export class RunMemberViewResult {
    @Field(() => [Member_])
    Results: Member_[];

    @Field(() => Int, {nullable: true})
    UserViewRunID?: number;

    @Field(() => Int, {nullable: true})
    RowCount: number;

    @Field(() => Int, {nullable: true})
    TotalRowCount: number;

    @Field(() => Int, {nullable: true})
    ExecutionTime: number;

    @Field({nullable: true})
    ErrorMessage?: string;

    @Field(() => Boolean, {nullable: false})
    Success: boolean;
}

@Resolver(Member_)
export class MemberResolver extends ResolverBase {
    @Query(() => RunMemberViewResult)
    async RunMemberViewByID(@Arg('input', () => RunViewByIDInput) input: RunViewByIDInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByIDGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunMemberViewResult)
    async RunMemberViewByName(@Arg('input', () => RunViewByNameInput) input: RunViewByNameInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        return super.RunViewByNameGeneric(input, dataSource, userPayload, pubSub);
    }

    @Query(() => RunMemberViewResult)
    async RunMemberDynamicView(@Arg('input', () => RunDynamicViewInput) input: RunDynamicViewInput, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        input.EntityName = 'Members';
        return super.RunDynamicViewGeneric(input, dataSource, userPayload, pubSub);
    }
    @Query(() => Member_, { nullable: true })
    async Member(@Arg('MemberID', () => Int) MemberID: number, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine): Promise<Member_ | null> {
        this.CheckUserReadPermissions('Members', userPayload);
        const sSQL = `SELECT * FROM [membership].[vwMembers] WHERE [MemberID]=${MemberID} ` + this.getRowLevelSecurityWhereClause('Members', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.MapFieldNamesToCodeNames('Members', await dataSource.query(sSQL).then((r) => r && r.length > 0 ? r[0] : {}))
        return result;
    }
  
    @FieldResolver(() => [PersonLink_])
    async PersonLinksArray(@Root() member_: Member_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Person Links', userPayload);
        const sSQL = `SELECT * FROM [common].[vwPersonLinks] WHERE [MembershipMemberID]=${member_.MemberID} ` + this.getRowLevelSecurityWhereClause('Person Links', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Person Links', await dataSource.query(sSQL));
        return result;
    }
      
    @FieldResolver(() => [MembershipRenewal_])
    async MembershipRenewalsArray(@Root() member_: Member_, @Ctx() { dataSource, userPayload }: AppContext, @PubSub() pubSub: PubSubEngine) {
        this.CheckUserReadPermissions('Membership Renewals', userPayload);
        const sSQL = `SELECT * FROM [membership].[vwMembershipRenewals] WHERE [MemberID]=${member_.MemberID} ` + this.getRowLevelSecurityWhereClause('Membership Renewals', userPayload, EntityPermissionType.Read, 'AND');
        const result = this.ArrayMapFieldNamesToCodeNames('Membership Renewals', await dataSource.query(sSQL));
        return result;
    }
    
    @Mutation(() => Member_)
    async CreateMember(
        @Arg('input', () => CreateMemberInput) input: CreateMemberInput,
        @Ctx() { dataSource, userPayload }: AppContext, 
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeCreate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <MemberEntity>await new Metadata().GetEntityObject('Members', this.GetUserFromPayload(userPayload));
            await entityObject.NewRecord();
            entityObject.SetMany(input);
            if (await entityObject.Save()) {
                // save worked, fire the AfterCreate event and then return all the data
                await this.AfterCreate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else 
                // save failed, return null
                return null;
        }
        else    
            return null;
    }

    // Before/After CREATE Event Hooks for Sub-Classes to Override
    protected async BeforeCreate(dataSource: DataSource, input: CreateMemberInput): Promise<boolean> {
        return true;
    }
    protected async AfterCreate(dataSource: DataSource, input: CreateMemberInput) {
    }
    
    @Mutation(() => Member_)
    async UpdateMember(
        @Arg('input', () => UpdateMemberInput) input: UpdateMemberInput,
        @Ctx() { dataSource, userPayload }: AppContext,
        @PubSub() pubSub: PubSubEngine
    ) {
        if (await this.BeforeUpdate(dataSource, input)) { // fire event and proceed if it wasn't cancelled
            const entityObject = <MemberEntity>await new Metadata().GetEntityObject('Members', this.GetUserFromPayload(userPayload));
            entityObject.LoadFromData(input) // using the input instead of loading from DB because TrackChanges is turned off for Members
            
            if (await entityObject.Save({ IgnoreDirtyState: true /*flag used because of LoadFromData() call above*/ })) {
                // save worked, fire afterevent and return all the data
                await this.AfterUpdate(dataSource, input); // fire event
                return entityObject.GetAll();
            }
            else
                return null; // save failed, return null
        }
        else
            return null;
    }

    // Before/After UPDATE Event Hooks for Sub-Classes to Override
    protected async BeforeUpdate(dataSource: DataSource, input: UpdateMemberInput): Promise<boolean> {
        const i = input, d = dataSource; // prevent error
        return true;
    }
    protected async AfterUpdate(dataSource: DataSource, input: UpdateMemberInput) {
        const i = input, d = dataSource; // prevent error
    }

}