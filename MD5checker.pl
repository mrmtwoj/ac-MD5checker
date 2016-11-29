# programing : mr.mtwoj
# github.com/mrmtwoj
print "\n";
print "##########################################################\n";
print "#                                                        #\n";
print "#               Script MD5 Check File acyber             #\n";
print "#                     [ac-MD5checker]                    #\n";
print "#--------------------------------------------------------#\n";
print "##########################################################\n";
print "#                                                        #\n";
print "#               Usage: MD5checker.pl <file>              #\n";
print "#                   programing:mr.mtwoj                  #\n";
print "#                      www.acyber.ir                     #\n";
print "##########################################################\n";
print "\n";
     
    use warnings;
    use strict;
    use Digest::MD5;
    sub md5sum{
      my $acyber = shift;
      my $digest = "";
      eval{
        open(FILE, $acyber) or die "Can't find file $acyber\n";
        my $ctx = Digest::MD5->new;
        $ctx->addfile(*FILE);
        $digest = $ctx->hexdigest;
        close(FILE);
      };
      if($@){
        print $@;
        return "";
      }
      return $digest;
    }
    sub usage{
      print "Please Type Name File ex: perl MD5checker.pl <name file>\n";
      exit 1;
    }
    if($#ARGV + 1 != 1){
      usage();
     }
    my $fname = $ARGV[0];
    my $md5 =  md5sum($fname);
    if($md5 ne ""){
      print $md5." ".$fname."\n";
    }else{
      exit 1;
    }
     
    exit 0;
