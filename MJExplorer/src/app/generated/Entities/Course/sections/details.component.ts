import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-base-forms';
import { CourseEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Courses.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-course-form-details',
    styleUrls: ['../../../../../shared/form-styles.css'],
    template: `<div *ngIf="this.record">
    <div *ngIf="this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Course ID</label>
            <span >{{FormatValue('CourseID', 0)}}</span>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Course Name</label>
            <kendo-textarea [(ngModel)]="record.CourseName" ></kendo-textarea>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Description</label>
            <kendo-textbox [(ngModel)]="record.Description"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Start Date</label>
            <kendo-datepicker [(value)]="record.StartDate" ></kendo-datepicker>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">End Date</label>
            <kendo-datepicker [(value)]="record.EndDate!" ></kendo-datepicker>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Member Price</label>
            <kendo-numerictextbox [(value)]="record.MemberPrice!" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Non Member Price</label>
            <kendo-numerictextbox [(value)]="record.NonMemberPrice!" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Instructor ID</label>
            <kendo-numerictextbox [(value)]="record.InstructorID!" ></kendo-numerictextbox>   
        </div> 
    </div>
    <div *ngIf="!this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Course ID</label>
            <span >{{FormatValue('CourseID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Course Name</label>
            <span >{{FormatValue('CourseName', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Description</label>
            <span >{{FormatValue('Description', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Start Date</label>
            <span >{{FormatValue('StartDate', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">End Date</label>
            <span >{{FormatValue('EndDate', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Member Price</label>
            <span >{{FormatValue('MemberPrice', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Non Member Price</label>
            <span >{{FormatValue('NonMemberPrice', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Instructor ID</label>
            <span mjFieldLink [record]="record" fieldName="InstructorID" >{{FormatValue('InstructorID', 0)}}</span>
        </div>
    </div>
</div>
    `
})
export class CourseDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: CourseEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadCourseDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
