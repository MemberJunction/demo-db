import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-base-forms';
import { PostEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Posts.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-post-form-details',
    styleUrls: ['../../../../../shared/form-styles.css'],
    template: `<div *ngIf="this.record">
    <div *ngIf="this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Post ID</label>
            <span >{{FormatValue('PostID', 0)}}</span>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Forum ID</label>
            <kendo-numerictextbox [(value)]="record.ForumID" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Author ID</label>
            <kendo-numerictextbox [(value)]="record.AuthorID" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Post Content</label>
            <kendo-textbox [(ngModel)]="record.PostContent"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Post Date</label>
            <kendo-datepicker [(value)]="record.PostDate" ></kendo-datepicker>   
        </div> 
    </div>
    <div *ngIf="!this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Post ID</label>
            <span >{{FormatValue('PostID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Forum ID</label>
            <span mjFieldLink [record]="record" fieldName="ForumID" >{{FormatValue('ForumID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Author ID</label>
            <span mjFieldLink [record]="record" fieldName="AuthorID" >{{FormatValue('AuthorID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Post Content</label>
            <span >{{FormatValue('PostContent', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Post Date</label>
            <span >{{FormatValue('PostDate', 0)}}</span>
        </div>
    </div>
</div>
    `
})
export class PostDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: PostEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadPostDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
