#!/usr/bin/env nextflow

/*Pipeline de prueba para  nextflow */

/* Activar modo DSL2*/
nextflow.enable.dsl=2


/*
 Load R fileS
*/

/* R_script_1 */
Channel
	.fromPath( "./nf_modules/Rscripts/test_dplyr.R" )
	.set{ R_script_1 }

/* R_script_w */
Channel
	.fromPath( "./nf_modules/Rscripts/test_ggplot.R" )
	.set{ R_script_2 }
  /* R_script_3 */
  Channel
  	.fromPath( "./nf_modules/Rscripts/test_pacman.R" )
  	.set{ R_script_3 }

/*
 * Import modules
 */
include {
  TEST_GGPLOT;
  TEST_DPLYR;
  TEST_PACMAN } from './nf_modules/modules.nf'

/*
 * main pipeline logic
 */

workflow  {
  TEST_GGPLOT(R_script_2)
  TEST_DPLYR(R_script_1)
  TEST_PACMAN(R_script_3)
}
