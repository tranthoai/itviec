import {Component, OnInit} from '@angular/core';
import { Product } from './domain/product';
import { ProductService } from './service/productservice';
import {PrimeNGConfig} from "primeng/api";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {

  products: Product[] = [];

  title = 'frontend';

  constructor(
    private productService: ProductService,
    private primengConfig: PrimeNGConfig
  ) {

  }

  ngOnInit() {

    this.primengConfig.ripple = true;

    this.productService.getProducts().then(
      (data) => {

        this.products = data;

      });
  }
}
