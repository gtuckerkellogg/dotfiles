# -*-Perl-*-

## generate pdf not dvi
$pdf_mode = 1;

$aux_dir = ".auxdir";

$pdflatex = "pdflatex --shell-escape %O %S";

@generated_exts = (@generated_exts, 'loab', 'maf', 'los', 'mtc', 'mtc0', 'bbl', 'vrb', 'nav', 'run.xml', 'snm');
