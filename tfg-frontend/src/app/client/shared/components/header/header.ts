import {Component} from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-header',
  imports: [CommonModule, FormsModule],
  standalone: true,
  templateUrl: './header.html',
})
export class Header {


  query: string = "";
  mostrarBuscador: boolean = true;
  mostrarFiltros: boolean = false;
  sesionIniciada: boolean = false;
  nombreUsuario: string = "";
  tallas: string[] = ['XS', 'S', 'M', 'L', 'XL'];
  categorias: string[] = [];
  divisas = [
    { code: "USD", value: "US/$" },
    { code: "EUR", value: "EU/€" },
    { code: "GBP", value: "GB/£" },
    { code: "JPY", value: "JP/¥" },
    { code: "CNY", value: "CN/¥" },
    { code: "KRW", value: "KR/₩" },
    { code: "INR", value: "IN/₹" },
    { code: "CAD", value: "CA/$" },
    { code: "AUD", value: "AU/$" },
    { code: "NZD", value: "NZ/$" },
    { code: "CHF", value: "CH/CHF" },
    { code: "SEK", value: "SE/kr" },
    { code: "NOK", value: "NO/kr" },
    { code: "DKK", value: "DK/kr" },
    { code: "PLN", value: "PL/zł" },
    { code: "CZK", value: "CZ/Kč" },
    { code: "HUF", value: "HU/Ft" },
    { code: "TRY", value: "TR/₺" },
    { code: "AED", value: "AE/د.إ" },
    { code: "SAR", value: "SA/﷼" }
  ];
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
