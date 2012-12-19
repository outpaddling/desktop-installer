amd-setup(1)                                                      amd-setup(1)



NNAAMMEE
       amd-setup - quickly configure an NFS mount on a client




SSYYNNOOPPSSIISS
       amd-setup



DDEESSCCRRIIPPTTIIOONN
       aammdd--sseettuupp  is an interactive setup utility for creating NFS mounts on a
       client machine.  It asks the user for necessary information  about  the
       mount,  enables  AMD  if necessary, updates the necessary configuration
       files, and (re)starts the automount daemon.

       Once configured, mount points are automatically mounted when the  asso-
       ciated directory (a subdirectory of /net by default) is accessed.

       Automounting  NFS servers is particularly useful where some servers are
       not always available, such as on laptop clients used at multiple  loca-
       tions.


EEXXAAMMPPLLEE
       Configure a client to access /share1 on a server named sculpin:

       <<<ROOT@manta>>> /home/bacon 1005 # amd-setup
       Mount point under /net? sculpin
       Server hostname or IP? sculpin
       Exported directory on server? /share1
       Stopping amd.
       Waiting for PIDS: 68421, 68421.
       Starting amd.

       <<<ROOT@manta>>> /home/bacon 1006 # cd /net/sculpin

       <<<ROOT@manta>>> /net/sculpin 1007 # ls
       Shared/     User1/      User2/


FFIILLEESS
       /etc/rc.conf, /etc/amd.map


SSEEEE AALLSSOO
       desktop-installer


AAUUTTHHOORR
       Jason W. Bacon
       Acadix Consulting, LLC




                                                                  amd-setup(1)
