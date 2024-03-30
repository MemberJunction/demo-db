import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-base-forms';
import { ForumEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Forums.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-forum-form-details',
    styleUrls: ['../../../../../shared/form-styles.css'],
    template: `<div *ngIf="this.record">
    <div *ngIf="this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Forum ID</label>
            <span >{{FormatValue('ForumID', 0)}}</span>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Title</label>
            <kendo-textarea [(ngModel)]="record.Title" ></kendo-textarea>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Description</label>
            <kendo-textbox [(ngModel)]="record.Description"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Creation Date</label>
            <kendo-datepicker [(value)]="record.CreationDate" ></kendo-datepicker>   
        </div> 
    </div>
    <div *ngIf="!this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Forum ID</label>
            <span >{{FormatValue('ForumID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Title</label>
            <span >{{FormatValue('Title', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Description</label>
            <span >{{FormatValue('Description', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Creation Date</label>
            <span >{{FormatValue('CreationDate', 0)}}</span>
        </div>
    </div>
</div>
    `
})
export class ForumDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: ForumEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadForumDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
