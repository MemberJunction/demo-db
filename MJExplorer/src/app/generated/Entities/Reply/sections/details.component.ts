import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-base-forms';
import { ReplyEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Replies.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-reply-form-details',
    styleUrls: ['../../../../../shared/form-styles.css'],
    template: `<div *ngIf="this.record">
    <div *ngIf="this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Reply ID</label>
            <span >{{FormatValue('ReplyID', 0)}}</span>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Post ID</label>
            <kendo-numerictextbox [(value)]="record.PostID" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Author ID</label>
            <kendo-numerictextbox [(value)]="record.AuthorID" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Reply Content</label>
            <kendo-textbox [(ngModel)]="record.ReplyContent"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Reply Date</label>
            <kendo-datepicker [(value)]="record.ReplyDate" ></kendo-datepicker>   
        </div> 
    </div>
    <div *ngIf="!this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Reply ID</label>
            <span >{{FormatValue('ReplyID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Post ID</label>
            <span mjFieldLink [record]="record" fieldName="PostID" >{{FormatValue('PostID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Author ID</label>
            <span mjFieldLink [record]="record" fieldName="AuthorID" >{{FormatValue('AuthorID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Reply Content</label>
            <span >{{FormatValue('ReplyContent', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Reply Date</label>
            <span >{{FormatValue('ReplyDate', 0)}}</span>
        </div>
    </div>
</div>
    `
})
export class ReplyDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: ReplyEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadReplyDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
