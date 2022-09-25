#!/usr/bin/env nextflow

/*Modulos de prueba para  nextflow */

process TEST_GGPLOT {
  conda 'r-ggplot2'
    input:
    file R_script_2

    output:
    stdout
    """
    Rscript --vanilla ${R_script_2}
    """
}



process TEST_DPLYR {
    input:
    file R_script_1

    output:
    stdout

    """
    Rscript --vanilla ${R_script_1}
    """
}

process TEST_PACMAN {
    input:
    file R_script_3

    output:
    stdout

    """
    Rscript --vanilla ${R_script_3}
    """
}
