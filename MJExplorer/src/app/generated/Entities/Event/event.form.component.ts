import { Component } from '@angular/core';
import { EventEntity } from 'mj_generatedentities';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormComponent } from '@memberjunction/ng-explorer-core';
import { LoadEventDetailsComponent } from "./sections/details.component"
@RegisterClass(BaseFormComponent, 'Events') // Tell MemberJunction about this class
@Component({
    selector: 'gen-event-form',
    templateUrl: './event.form.component.html',
    styleUrls: ['../../../../shared/form-styles.css']
})
export class EventFormComponent extends BaseFormComponent {
    public record!: EventEntity;
} 

export function LoadEventFormComponent() {
    LoadEventDetailsComponent();
}
