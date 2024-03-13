import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-explorer-core';
import { RegistrationEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Registrations.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-registration-form-details',
    styleUrls: ['../../../../../shared/form-styles.css'],
    template: `<div *ngIf="this.record">
    <div *ngIf="this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Registration ID</label>
            <span >{{FormatValue('RegistrationID', 0)}}</span>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Course ID</label>
            <kendo-numerictextbox [(value)]="record.CourseID" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Student ID</label>
            <kendo-numerictextbox [(value)]="record.StudentID" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Registration Date</label>
            <kendo-datepicker [(value)]="record.RegistrationDate" ></kendo-datepicker>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Registration Fee</label>
            <kendo-numerictextbox [(value)]="record.RegistrationFee" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Payment Status</label>
            <kendo-textarea [(ngModel)]="record.PaymentStatus" ></kendo-textarea>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Completion Status</label>
            <kendo-textarea [(ngModel)]="record.CompletionStatus" ></kendo-textarea>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Certification Awarded</label>
            <input type="checkbox" [(ngModel)]="record.CertificationAwarded" kendoCheckBox />   
        </div> 
    </div>
    <div *ngIf="!this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Registration ID</label>
            <span >{{FormatValue('RegistrationID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Course ID</label>
            <span mjFieldLink [record]="record" fieldName="CourseID" >{{FormatValue('CourseID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Student ID</label>
            <span mjFieldLink [record]="record" fieldName="StudentID" >{{FormatValue('StudentID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Registration Date</label>
            <span >{{FormatValue('RegistrationDate', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Registration Fee</label>
            <span >{{FormatValue('RegistrationFee', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Payment Status</label>
            <span >{{FormatValue('PaymentStatus', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Completion Status</label>
            <span >{{FormatValue('CompletionStatus', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Certification Awarded</label>
            <span >{{FormatValue('CertificationAwarded', 0)}}</span>
        </div>
    </div>
</div>
    `
})
export class RegistrationDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: RegistrationEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadRegistrationDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
