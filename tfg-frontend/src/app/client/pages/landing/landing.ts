import { Component } from '@angular/core';
import  { Header } from '../../shared/components/header/header'
import  { Navbar } from '../../shared/components/navbar/navbar'

@Component({
  selector: 'app-landing',
  imports: [Header, Navbar],
  templateUrl: './landing.html',

})
export class Landing {

}
