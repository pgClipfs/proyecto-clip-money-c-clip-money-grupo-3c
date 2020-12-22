import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OperatoriaPesosComponent } from './operatoria-pesos.component';

describe('OperatoriaPesosComponent', () => {
  let component: OperatoriaPesosComponent;
  let fixture: ComponentFixture<OperatoriaPesosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OperatoriaPesosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OperatoriaPesosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
