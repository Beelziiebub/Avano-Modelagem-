$fn = 100;

// Parâmetros do chaveiro
largura = 60;
altura = 40;
espessura = 3;
raio_canto = 5;
raio_furo = 3.5;
margem_topo = 3;

// Base retangular com cantos arredondados
module base_chaveiro_retangular() {
    linear_extrude(height = espessura)
        offset(r = raio_canto)
            square([largura - 2*raio_canto, altura - 2*raio_canto], center = true);
}

// Furo para chaveiro
module furo_chaveiro() {
    translate([0, altura/2 - margem_topo, espessura/2])
        rotate([90, 0, 0])
            cylinder(h = espessura + 1, r = raio_furo, center = true);
}

// Logo em DXF - POSIÇÃO HIPER-REBAIXADA
module logo_dxf() {
    translate([-35, -33, 2])  // Y = -19.5 (MÁXIMO PRATICÁVEL)
        scale([0.2, 0.2, 1])
            linear_extrude(height = 2)
                import("logo.dxf", center = true);
}

// Resultado final
difference() {
    union() {
        base_chaveiro_retangular();
        logo_dxf();
    }
    furo_chaveiro();
}

