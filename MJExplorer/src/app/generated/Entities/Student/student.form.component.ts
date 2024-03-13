import { Component } from '@angular/core';
import { StudentEntity } from 'mj_generatedentities';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormComponent } from '@memberjunction/ng-explorer-core';
import { LoadStudentDetailsComponent } from "./sections/details.component"
@RegisterClass(BaseFormComponent, 'Students') // Tell MemberJunction about this class
@Component({
    selector: 'gen-student-form',
    templateUrl: './student.form.component.html',
    styleUrls: ['../../../../shared/form-styles.css']
})
export class StudentFormComponent extends BaseFormComponent {
    public record!: StudentEntity;
} 

export function LoadStudentFormComponent() {
    LoadStudentDetailsComponent();
}
