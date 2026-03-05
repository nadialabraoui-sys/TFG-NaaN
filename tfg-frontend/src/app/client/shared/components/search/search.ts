import {Component} from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-search',
  imports: [CommonModule, FormsModule],
  standalone: true,
  templateUrl: './search.html',
})
export class Search {


  query: string = "";
  mostrarBuscador: boolean = true;
  mostrarFiltros: boolean = false;
  tallas: string[] = ['XS', 'S', 'M', 'L', 'XL'];
  categorias: string[] = [];
  minPrecio: number = 0;
  maxPrecio: number = Infinity;


  toggleFiltros():void {
  this.mostrarFiltros = !this.mostrarFiltros;
  }
  buscar():void {

  }
  pulsarEnter() {
    //if(//event.key==="enter")
    this.buscar();
  }

}
