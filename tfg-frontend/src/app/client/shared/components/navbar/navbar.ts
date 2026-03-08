import { Component, signal, output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';

interface MenuItem {
  label: string;
  route?: string;
  children?: { label: string; route: string }[];
}

@Component({
  selector: 'app-navbar',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './navbar.html',
  styles: [`
    :host {
      display: contents;
    }
  `]
})
export class Navbar {
  isOpen = signal(true);

  /** Signal para controlar qué submenús están expandidos */
  expandedItems = signal<Record<string, boolean>>({});

  /** Evento que se emite cuando se cierra el sidebar */
  closed = output<void>();

  /** Estructura del menú de navegación */
  menuItems: MenuItem[] = [
    {
      label: 'Mujer',
      children: [
        { label: 'Tops', route: '/mujer/tops' },
        { label: 'Camisas', route: '/mujer/camisas' },
        { label: 'Sudaderas', route: '/mujer/sudaderas' },
        { label: 'Jerséis', route: '/mujer/jerseis' },
        { label: 'Chaquetas', route: '/mujer/chaquetas' },
        { label: 'Abrigos', route: '/mujer/abrigos' },
        { label: 'Pantalones', route: '/mujer/pantalones' },
        { label: 'Faldas', route: '/mujer/faldas' },
        { label: 'Shorts', route: '/mujer/shorts' },
        { label: 'Vestidos', route: '/mujer/vestidos' },
        { label: 'Mono', route: '/mujer/mono' },
        { label: 'Ropa interior', route: '/mujer/ropa-interior' },
        { label: 'Trajes de baño', route: '/mujer/trajes-de-bano' }
      ]
    },
    {
      label: 'Hombre',
      children: [
        { label: 'Tops', route: '/hombre/tops' },
        { label: 'Camisas', route: '/hombre/camisas' },
        { label: 'Sudaderas', route: '/hombre/sudaderas' },
        { label: 'Jerséis', route: '/hombre/jerseis' },
        { label: 'Chaquetas', route: '/hombre/chaquetas' },
        { label: 'Abrigos', route: '/hombre/abrigos' },
        { label: 'Pantalones', route: '/hombre/pantalones' },
        { label: 'Shorts', route: '/hombre/shorts' },
        { label: 'Ropa interior', route: '/hombre/ropa-interior' },
        { label: 'Trajes de baño', route: '/hombre/trajes-de-bano' }
      ]
    },
    {
      label: 'Crea tu diseño',
      route: '/crear-diseno'
    }
  ];

  /** Abre el sidebar */
  open(): void {
    this.isOpen.set(true);
    // Prevenir scroll del body cuando el menú está abierto
    document.body.style.overflow = 'hidden';
  }

  /** Cierra el sidebar */
  close(): void {
    this.isOpen.set(false);
    document.body.style.overflow = '';
    this.closed.emit();
  }

  /** Alterna la visibilidad de un submenú */
  toggleSubmenu(label: string): void {
    this.expandedItems.update(items => ({
      ...items,
      [label]: !items[label]
    }));
  }
}
