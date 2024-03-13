import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-explorer-core';
import { InstructorEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Instructors.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-instructor-form-details',
    styleUrls: ['../../../../../shared/form-styles.css'],
    template: `<div *ngIf="this.record">
    <div *ngIf="this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Instructor ID</label>
            <span >{{FormatValue('InstructorID', 0)}}</span>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">First Name</label>
            <kendo-textbox [(ngModel)]="record.FirstName"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Last Name</label>
            <kendo-textbox [(ngModel)]="record.LastName"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Email</label>
            <kendo-textbox [(ngModel)]="record.Email"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Bio</label>
            <kendo-textbox [(ngModel)]="record.Bio"  />   
        </div> 
    </div>
    <div *ngIf="!this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Instructor ID</label>
            <span >{{FormatValue('InstructorID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">First Name</label>
            <span >{{FormatValue('FirstName', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Last Name</label>
            <span >{{FormatValue('LastName', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Email</label>
            <span >{{FormatValue('Email', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Bio</label>
            <span >{{FormatValue('Bio', 0)}}</span>
        </div>
    </div>
</div>
    `
})
export class InstructorDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: InstructorEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadInstructorDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
