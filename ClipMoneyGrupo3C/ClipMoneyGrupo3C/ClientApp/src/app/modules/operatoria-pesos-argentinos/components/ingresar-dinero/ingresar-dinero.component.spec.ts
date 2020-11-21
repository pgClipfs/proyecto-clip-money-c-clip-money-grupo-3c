import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { IngresarDineroComponent } from './ingresar-dinero.component';

describe('IngresarDineroComponent', () => {
  let component: IngresarDineroComponent;
  let fixture: ComponentFixture<IngresarDineroComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ IngresarDineroComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(IngresarDineroComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
