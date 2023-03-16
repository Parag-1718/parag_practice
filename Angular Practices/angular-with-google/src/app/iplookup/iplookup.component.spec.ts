import { ComponentFixture, TestBed } from '@angular/core/testing';

import { IplookupComponent } from './iplookup.component';

describe('IplookupComponent', () => {
  let component: IplookupComponent;
  let fixture: ComponentFixture<IplookupComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ IplookupComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(IplookupComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
