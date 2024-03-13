import { Component } from '@angular/core';
import { Company__educationEntity } from 'mj_generatedentities';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormComponent } from '@memberjunction/ng-explorer-core';
import { LoadCompany__educationDetailsComponent } from "./sections/details.component"
@RegisterClass(BaseFormComponent, 'Companies__education') // Tell MemberJunction about this class
@Component({
    selector: 'gen-company__education-form',
    templateUrl: './company__education.form.component.html',
    styleUrls: ['../../../../shared/form-styles.css']
})
export class Company__educationFormComponent extends BaseFormComponent {
    public record!: Company__educationEntity;
} 

export function LoadCompany__educationFormComponent() {
    LoadCompany__educationDetailsComponent();
}
