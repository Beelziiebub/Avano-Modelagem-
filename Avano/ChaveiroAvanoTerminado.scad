$fn = 100;

extrude_thickness = 3.0;
lift_height = 3.5;
coroa_lift = 2.9; // Afundada 0.1 mm na base para grudar bem

// Base do chaveiro
module base_chaveiro() {
    color("pink") 
    cylinder(h = 3, r = 50);

    translate([0, 0, 2.98])  // ligeiramente abaixo para evitar sobreposição
    color("white")
    cylinder(h = 1.52, r = 48);
}

// Importando silhueta feminina do arquivo DXF (logo mais afundada ainda)
module silhueta_feminina() {
    color("black")
    translate([-57, -50, 3.6])  // Afundada mais 0.2 mm
    scale([0.33, 0.33, 1])
    linear_extrude(height = extrude_thickness)
    offset(r = 0.2)
    import("logo.dxf", convexity = 12);
}

// Importando coroa do arquivo DXF
module coroa() {
    translate([-70, -34, coroa_lift])
    color("gold")
    linear_extrude(height = extrude_thickness)
    import("coroa.dxf");
}

// Furo para chaveiro
module furo_chaveiro() {
    translate([0, 40, -1]) // Ajuste da posição do furo
    cylinder(h = 8, r = 6);  // Furo ajustado
}

// Resultado final
difference() {
    union() {
        base_chaveiro();
        silhueta_feminina();
        coroa();
    }

    furo_chaveiro();  // Inserir o furo na peça final
}

