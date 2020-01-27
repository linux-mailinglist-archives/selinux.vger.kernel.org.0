Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4794A14A0E0
	for <lists+selinux@lfdr.de>; Mon, 27 Jan 2020 10:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729506AbgA0Jc7 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 27 Jan 2020 04:32:59 -0500
Received: from mailomta10-sa.btinternet.com ([213.120.69.16]:63326 "EHLO
        sa-prd-fep-049.btinternet.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729534AbgA0Jc7 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 27 Jan 2020 04:32:59 -0500
Received: from sa-prd-rgout-002.btmx-prd.synchronoss.net ([10.2.38.5])
          by sa-prd-fep-049.btinternet.com with ESMTP
          id <20200127093256.UNKC28776.sa-prd-fep-049.btinternet.com@sa-prd-rgout-002.btmx-prd.synchronoss.net>;
          Mon, 27 Jan 2020 09:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btmx201904; t=1580117576; 
        bh=KFayg8389dECKhPKXHxCAjOd1S7CahG6caKc075nlME=;
        h=From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version;
        b=Z99LXlzv19lAyVeYgDenmUskOty3mWSVNMr4XAJ9BpVVGf+8Oz/qBz++JztbUCeKO3JHj7bJGwfmjGoGe6wzNOaNnnFQDXm17+NDxb4KdHTCfMQ1VFUnF7DNATt1i11zzvEFO1OTvN1kOLtowQvy2P6W4JJdJD4m6RJOG7u2J02oTByLuMxmY5l/kWO/URdiM68LA/pMJF/yjn9YRlraQcHKBE9pT85y65CffoR/7z+ZyVIsoJ+dbTkzu3qeowH5IJo4qsPKQgojGWqhBqDgvLWDywGhzExtG4jFUQVSSobqKxrrddaeIEFTXVvYxb5yPfocfvCixTU31PpW6EjJpA==
Authentication-Results: btinternet.com; none
X-Originating-IP: [86.134.6.76]
X-OWM-Source-IP: 86.134.6.76 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedugedrfedvgddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhitghhrghrugcujfgrihhnvghsuceorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqnecukfhppeekiedrudefgedriedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpeekiedrudefgedriedrjeeipdhmrghilhhfrhhomhepoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqedprhgtphhtthhopeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhequcfqtfevrffvpehrfhgtkedvvdenrhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhdprhgtphhtthhopeeoshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgheq
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from localhost.localdomain (86.134.6.76) by sa-prd-rgout-002.btmx-prd.synchronoss.net (5.8.337) (authenticated as richard_c_haines@btinternet.com)
        id 5E2B15E00067336E; Mon, 27 Jan 2020 09:32:55 +0000
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     selinux@vger.kernel.org
Cc:     Richard Haines <richard_c_haines@btinternet.com>
Subject: [PATCH V2 1/2] selinux-testsuite: Prepare for adding fs*(2) API tests
Date:   Mon, 27 Jan 2020 09:32:48 +0000
Message-Id: <20200127093249.3143-2-richard_c_haines@btinternet.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200127093249.3143-1-richard_c_haines@btinternet.com>
References: <20200127093249.3143-1-richard_c_haines@btinternet.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Update the current tests/filesystem to share code and perl subroutines.
Also update tools/check-syntax to handle *.pm files.

Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>
---
 tests/filesystem/Filesystem.pm | 166 +++++++++++++++++++++++++
 tests/filesystem/test          | 219 ++++++---------------------------
 tools/check-syntax             |   2 +-
 3 files changed, 206 insertions(+), 181 deletions(-)
 create mode 100644 tests/filesystem/Filesystem.pm

diff --git a/tests/filesystem/Filesystem.pm b/tests/filesystem/Filesystem.pm
new file mode 100644
index 0000000..3d4194d
--- /dev/null
+++ b/tests/filesystem/Filesystem.pm
@@ -0,0 +1,166 @@
+package Filesystem;
+use Exporter qw(import);
+our @EXPORT_OK =
+  qw(check_config udisks2_stop udisks2_restart get_loop_dev attach_dev make_fs mk_mntpoint_1 mk_mntpoint_2 cleanup cleanup1 reaper);
+
+sub check_config {
+    my ( $base, $fanotify_fs ) = @_;
+
+    $tst_count = 0;
+
+    # From kernel 5.5 support for fanotify(7) with filesystem { watch }
+    $kvercur = `uname -r`;
+    chomp($kvercur);
+    $kverminstream = "5.5";
+    $watch         = 0;
+
+    $result = `$base/../kvercmp $kvercur $kverminstream`;
+    if ( $result > 0 && -e $fanotify_fs ) {
+        $watch = 1;
+        $tst_count += 4;
+    }
+
+    $name_trans        = 0;
+    $pol_vers          = `checkpolicy -V | cut -f 1 -d ' '`;
+    $mod_pol_vers      = `checkmodule -V | cut -f 2 -d '-'`;
+    $max_kernel_policy = `cat /sys/fs/selinux/policyvers`;
+
+    if ( $mod_pol_vers >= 11 and $pol_vers >= 25 and $max_kernel_policy >= 25 )
+    {
+        $name_trans = 1;
+        $tst_count += 2;
+    }
+    return ( $tst_count, $watch, $name_trans );
+}
+
+# Optionally stop the udisks(8) daemon, then restart on exit.
+sub udisks2_stop {
+    $status = 0;
+
+    if ( -e "/usr/bin/systemctl" ) {
+        $u_status_cmd = "/usr/bin/systemctl status udisks2 >& /dev/null";
+        $u_stop_cmd   = "/usr/bin/systemctl stop udisks2 >& /dev/null";
+    }
+    elsif ( -e "/usr/sbin/service" ) {
+        $u_status_cmd = "/usr/sbin/service udisks2 status >& /dev/null";
+        $u_stop_cmd   = "/usr/sbin/service udisks2 stop >& /dev/null";
+    }
+
+    if ($u_status_cmd) {
+        $result = system("$u_status_cmd");
+        $status = $result >> 8;
+        if ( $status eq 0 ) {
+            print "Stopping udisks2 service for these tests.\n";
+            system("$u_stop_cmd");
+            $status = 3;
+        }
+        else {
+            $status = 4;
+        }
+    }
+    return $status;
+}
+
+sub udisks2_restart {
+    my ($status) = @_;
+
+    if ( $status eq 3 ) {
+        print "Restarting udisks2 service.\n";
+        if ( -e "/usr/bin/systemctl" ) {
+            system("/usr/bin/systemctl start udisks2 >& /dev/null");
+        }
+        elsif ( -e "/usr/sbin/service" ) {
+            system("/usr/sbin/service udisks2 start >& /dev/null");
+        }
+    }
+}
+
+sub get_loop_dev {
+    my ( $dev_list, $dev_count ) = @_;
+
+    system("udevadm settle");
+    print "Finding free /dev/loop entry\n";
+    $new_dev = `losetup -f 2>/dev/null`;
+    chomp($new_dev);
+    if ( $new_dev eq "" ) {
+        print "losetup failed to obtain /dev/loop entry\n";
+    }
+
+    # Keep list of devices for cleanup later
+    if ( $dev_count eq 0 ) {
+        $dev_list[$dev_count] = $new_dev;
+        $dev_count += 1;
+    }
+    elsif ( $new_dev ne $dev_list[ $dev_count - 1 ] ) {
+        $dev_list[$dev_count] = $new_dev;
+        $dev_count += 1;
+    }
+    return ( $new_dev, $dev_count );
+}
+
+sub attach_dev {
+    my ( $att_dev, $base ) = @_;
+    system("udevadm settle");
+    print "Attaching $base/fstest to $att_dev\n";
+    $result = system("losetup $att_dev $base/fstest 2>/dev/null");
+    if ( $result != 0 ) {
+        print "Failed to attach $base/fstest to $att_dev\n";
+    }
+    system("udevadm settle");
+}
+
+sub make_fs {
+    my ( $mk_type, $mk_dev, $mk_dir ) = @_;
+    print "Create $mk_dir/fstest with dd\n";
+    $result = system(
+        "dd if=/dev/zero of=$mk_dir/fstest bs=1024 count=10240 2>/dev/null");
+    if ( $result != 0 ) {
+        print "dd failed to create $mk_dir/fstest\n";
+    }
+
+    attach_dev( $mk_dev, $mk_dir );
+
+    print "Make $mk_type filesystem on $mk_dev\n";
+    $result = system("mkfs.$mk_type -I 256 $mk_dev >& /dev/null");
+    if ( $result != 0 ) {
+        system("losetup -d $mk_dev 2>/dev/null");
+        print "mkfs.$mk_type failed to create filesystem on $mk_dev\n";
+    }
+}
+
+sub mk_mntpoint_1 {
+    my ($path) = @_;
+    system("rm -rf $path/mp1 2>/dev/null");
+    system("mkdir -p $path/mp1 2>/dev/null");
+}
+
+sub mk_mntpoint_2 {
+    my ($path) = @_;
+    system("rm -rf $path/mp2 2>/dev/null");
+    system("mkdir -p $path/mp2 2>/dev/null");
+}
+
+sub cleanup {
+    my ($base) = @_;
+    system("rm -rf $base/fstest 2>/dev/null");
+    system("rm -rf $base/mntpoint 2>/dev/null");
+}
+
+sub cleanup1 {
+    my ( $base, $d ) = @_;
+    system("udevadm settle");
+    system("losetup -d $d 2>/dev/null");
+    system("udevadm settle");
+    system("rm -rf $base/fstest 2>/dev/null");
+    system("rm -rf $base/mntpoint 2>/dev/null");
+}
+
+# Cleanup any attached /dev/loop entries
+sub reaper {
+    my ( $dev_list, $base, $v ) = @_;
+
+    foreach my $n (@dev_list) {
+        system("udevadm settle");
+        system("$base/grim_reaper -t $n $v 2>/dev/null");
+    }
+}
diff --git a/tests/filesystem/test b/tests/filesystem/test
index 1d90fdf..5bdd124 100755
--- a/tests/filesystem/test
+++ b/tests/filesystem/test
@@ -5,6 +5,13 @@ BEGIN {
     $basedir = $0;
     $basedir =~ s|(.*)/[^/]*|$1|;
 
+    # Load common subroutines.
+    use File::Basename qw(dirname);
+    use Cwd qw(abs_path);
+    use lib dirname( abs_path $0);
+    use Filesystem
+      qw(check_config udisks2_stop udisks2_restart get_loop_dev attach_dev make_fs mk_mntpoint_1 mk_mntpoint_2 cleanup cleanup1 reaper);
+
     $test_count = 68;
 
     # Options: -v = Verbose, -d disable udisks(8) daemon
@@ -20,29 +27,11 @@ BEGIN {
         }
     }
 
-    # From kernel 5.5 support for fanotify(7) with filesystem { watch }
-    $kvercur = `uname -r`;
-    chomp($kvercur);
-    $kverminstream = "5.5";
-
-    $result = `$basedir/../kvercmp $kvercur $kverminstream`;
-    if ( $result > 0 && -e "$basedir/fanotify_fs" ) {
-        $test_watch = 1;
-        $test_count += 4;
-    }
-
-    $test_name_trans   = 0;
-    $pol_vers          = `checkpolicy -V | cut -f 1 -d ' '`;
-    $mod_pol_vers      = `checkmodule -V | cut -f 2 -d '-'`;
-    $max_kernel_policy = `cat /sys/fs/selinux/policyvers`;
+    # Check if watch and/or named type_transition rules configured
+    ( $addit, $test_watch, $test_name_trans ) =
+      check_config( $basedir, "$basedir/fanotify_fs" );
 
-    if ( $mod_pol_vers >= 11 and $pol_vers >= 25 and $max_kernel_policy >= 25 )
-    {
-        $test_name_trans = 1;
-        $test_count += 2;
-    }
-
-    plan tests => $test_count;
+    plan tests => ( $test_count += $addit );
 }
 
 # mount(2) MS_BIND | MS_PRIVATE requires an absolute path to a private mount
@@ -60,139 +49,9 @@ else {
 # Set initial filesystem type
 $fs_type = "ext4";
 
-# For list of devices used
+# Keep a list of devices used for removal at end of test.
 $device_count = 0;
-
-# Optionally stop the udisks(8) daemon, then restart on exit.
-sub udisks2_stop {
-    $status = 0;
-
-    if ( -e "/usr/bin/systemctl" ) {
-        $u_status_cmd = "/usr/bin/systemctl status udisks2 >& /dev/null";
-        $u_stop_cmd   = "/usr/bin/systemctl stop udisks2 >& /dev/null";
-    }
-    elsif ( -e "/usr/sbin/service" ) {
-        $u_status_cmd = "/usr/sbin/service udisks2 status >& /dev/null";
-        $u_stop_cmd   = "/usr/sbin/service udisks2 stop >& /dev/null";
-    }
-
-    if ($u_status_cmd) {
-        $result = system("$u_status_cmd");
-        $status = $result >> 8;
-        if ( $status eq 0 ) {
-            print "Stopping udisks2 service for these tests.\n";
-            system("$u_stop_cmd");
-            $status = 3;
-        }
-        else {
-            $status = 4;
-        }
-    }
-    return $status;
-}
-
-sub udisks2_restart {
-    my ($status) = @_;
-
-    if ( $status eq 3 ) {
-        print "Restarting udisks2 service.\n";
-        if ( -e "/usr/bin/systemctl" ) {
-            system("/usr/bin/systemctl start udisks2 >& /dev/null");
-        }
-        elsif ( -e "/usr/sbin/service" ) {
-            system("/usr/sbin/service udisks2 start >& /dev/null");
-        }
-    }
-}
-
-sub get_loop_dev {
-    system("udevadm settle");
-    print "Finding free /dev/loop entry\n";
-    $get_dev = `losetup -f 2>/dev/null`;
-    chomp($get_dev);
-    if ( $get_dev eq "" ) {
-        print "losetup failed to obtain /dev/loop entry\n";
-    }
-
-    # Keep list of devices for cleanup later
-    if ( $device_count eq 0 ) {
-        $device_list[$device_count] = $get_dev;
-        $device_count += 1;
-    }
-    elsif ( $get_dev ne $device_list[ $device_count - 1 ] ) {
-        $device_list[$device_count] = $get_dev;
-        $device_count += 1;
-    }
-    return $get_dev;
-}
-
-sub attach_dev {
-    my ( $att_dev, $base ) = @_;
-    system("udevadm settle");
-    print "Attaching $base/fstest to $att_dev\n";
-    $result = system("losetup $att_dev $base/fstest 2>/dev/null");
-    if ( $result != 0 ) {
-        print "Failed to attach $base/fstest to $att_dev\n";
-    }
-    system("udevadm settle");
-}
-
-sub make_fs {
-    my ( $mk_type, $mk_dev, $mk_dir ) = @_;
-    print "Create $mk_dir/fstest with dd\n";
-    $result = system(
-        "dd if=/dev/zero of=$mk_dir/fstest bs=1024 count=10240 2>/dev/null");
-    if ( $result != 0 ) {
-        print "dd failed to create $mk_dir/fstest\n";
-    }
-
-    attach_dev( $mk_dev, $mk_dir );
-
-    print "Make $mk_type filesystem on $mk_dev\n";
-    $result = system("mkfs.$mk_type -I 256 $mk_dev >& /dev/null");
-    if ( $result != 0 ) {
-        system("losetup -d $mk_dev 2>/dev/null");
-        print "mkfs.$mk_type failed to create filesystem on $mk_dev\n";
-    }
-}
-
-sub mk_mntpoint_1 {
-    my ($path) = @_;
-    system("rm -rf $path/mp1 2>/dev/null");
-    system("mkdir -p $path/mp1 2>/dev/null");
-}
-
-sub mk_mntpoint_2 {
-    my ($path) = @_;
-    system("rm -rf $path/mp2 2>/dev/null");
-    system("mkdir -p $path/mp2 2>/dev/null");
-}
-
-sub cleanup {
-    my ($base) = @_;
-    system("rm -rf $base/fstest 2>/dev/null");
-    system("rm -rf $base/mntpoint 2>/dev/null");
-}
-
-sub cleanup1 {
-    my ( $base, $d ) = @_;
-    system("udevadm settle");
-    system("losetup -d $d 2>/dev/null");
-    system("udevadm settle");
-    system("rm -rf $base/fstest 2>/dev/null");
-    system("rm -rf $base/mntpoint 2>/dev/null");
-}
-
-# Cleanup any attached /dev/loop entries
-sub reaper {
-    my ( $base, $v ) = @_;
-
-    foreach my $n (@device_list) {
-        system("$base/grim_reaper -t $n $v 2>/dev/null");
-    }
-}
-
-# End subroutines
+my @device_list;
 
 if ($disable_udisks) {
     $udisks2_status = udisks2_stop();
@@ -216,7 +75,7 @@ system("rm -rf $basedir/mntpoint 2>/dev/null");
 
 ############### Test Basic Mount/Unmount ##########################
 mk_mntpoint_1($private_path);
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 make_fs( $fs_type, $dev, $basedir );
 $mount_opts1 =
 "quota,usrquota,grpquota,defcontext=system_u:object_r:test_filesystem_file_t:s0";
@@ -306,7 +165,7 @@ cleanup1( $basedir, $dev );
 
 ############### Test Move Mount ##########################
 mk_mntpoint_1($private_path);
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 make_fs( $fs_type, $dev, $basedir );
 $mount_opts2 =
 "quota,usrquota,grpquota,rootcontext=system_u:object_r:test_filesystem_file_t:s0";
@@ -353,7 +212,7 @@ cleanup1( $basedir, $dev );
 ############### Deny filesystem { relabelfrom } ##########################
 # hooks.c may_context_mount_sb_relabel() FILESYSTEM__RELABELFROM
 mk_mntpoint_1($private_path);
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 make_fs( $fs_type, $dev, $basedir );
 $opts_no_relabelfrom =
   "defcontext=system_u:object_r:test_filesystem_sb_relabel_no_relabelfrom_t:s0";
@@ -371,7 +230,7 @@ cleanup1( $basedir, $dev );
 ############### Deny filesystem { relabelto } ##########################
 # hooks.c may_context_mount_sb_relabel() FILESYSTEM__RELABELTO
 mk_mntpoint_1($private_path);
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 make_fs( $fs_type, $dev, $basedir );
 $opts_no_relabelto =
   "fscontext=system_u:object_r:test_filesystem_sb_relabel_no_relabelto_t:s0";
@@ -389,7 +248,7 @@ cleanup1( $basedir, $dev );
 ############### Deny filesystem { relabelfrom } ##########################
 # hooks.c may_context_mount_inode_relabel() FILESYSTEM__RELABELFROM
 mk_mntpoint_1($private_path);
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 make_fs( $fs_type, $dev, $basedir );
 $opts_no_relabelfrom =
   "rootcontext=system_u:object_r:test_filesystem_no_inode_no_relabelfrom_t:s0";
@@ -407,7 +266,7 @@ cleanup1( $basedir, $dev );
 ############### Deny filesystem { associate } ##########################
 # hooks.c may_context_mount_inode_relabel() FILESYSTEM__ASSOCIATE
 mk_mntpoint_1($private_path);
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 make_fs( $fs_type, $dev, $basedir );
 
 # This defcontext will trigger denial.
@@ -427,7 +286,7 @@ cleanup1( $basedir, $dev );
 ############### Deny filesystem { associate } ##########################
 # hooks.c may_create() FILESYSTEM__ASSOCIATE
 mk_mntpoint_1($private_path);
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 make_fs( $fs_type, $dev, $basedir );
 
 # Use this fscontext= to get sensible audit log entry of:
@@ -462,7 +321,7 @@ cleanup1( $basedir, $dev );
 ############### Deny filesystem { quotamod } ##########################
 # hooks.c selinux_quotactl() FILESYSTEM__QUOTAMOD
 mk_mntpoint_1($private_path);
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 make_fs( $fs_type, $dev, $basedir );
 $opts_no_quotamod =
 "quota,usrquota,grpquota,fscontext=system_u:object_r:test_filesystem_no_quotamod_t:s0";
@@ -475,7 +334,7 @@ $result = system(
 ok( $result eq 0 );
 
 # No need to run quotacheck(8) as never gets far enough to read quota file
-print "Toggle User & Group quotas on/off\n";    # Must have full path
+print "Toggle User & Group quotas on/off\n";
 $result = system(
 "runcon -t test_filesystem_no_quotamod_t $basedir/quotas_test -s $dev -t $private_path/mp1/aquota.user $v 2>&1"
 );
@@ -493,7 +352,7 @@ cleanup1( $basedir, $dev );
 ############### Deny filesystem { quotaget } ##########################
 # hooks.c selinux_quotactl() FILESYSTEM__QUOTAGET
 mk_mntpoint_1($private_path);
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 make_fs( $fs_type, $dev, $basedir );
 $opts_no_quotaget =
 "quota,usrquota,grpquota,context=system_u:object_r:test_filesystem_no_quotaget_t:s0";
@@ -509,7 +368,7 @@ print "Running quotacheck(8) to init user/group quota files\n";
 $result = system("runcon `id -Z` quotacheck -ugF vfsv0 $private_path/mp1");
 ok( $result eq 0 );
 
-print "Toggle User & Group quotas on/off\n";    # Must have full path
+print "Toggle User & Group quotas on/off\n";
 $result = system(
 "runcon -t test_filesystem_no_quotaget_t $basedir/quotas_test -s $dev -t $private_path/mp1/aquota.user $v 2>&1"
 );
@@ -527,7 +386,7 @@ cleanup1( $basedir, $dev );
 ############### Deny file { quotaon } ##########################
 # hooks.c selinux_quota_on() FILE__QUOTAON
 mk_mntpoint_1($private_path);
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 make_fs( $fs_type, $dev, $basedir );
 $opts_no_quotaon =
   "quota,usrquota,grpquota,context=system_u:object_r:test_file_no_quotaon_t:s0";
@@ -543,7 +402,7 @@ print "Running quotacheck(8) to init user/group quota files\n";
 $result = system("runcon `id -Z` quotacheck -ugF vfsv0 $private_path/mp1");
 ok( $result eq 0 );
 
-print "Toggle User quotas on/off\n";    # Must have full path
+print "Toggle User quotas on/off\n";
 $result = system(
 "runcon -t test_file_no_quotaon_t $basedir/quotas_test -s $dev -t $private_path/mp1/aquota.user $v 2>&1"
 );
@@ -561,7 +420,7 @@ cleanup1( $basedir, $dev );
 ############### Deny filesystem { mount } ##########################
 # hooks.c selinux_sb_kern_mount() FILESYSTEM__MOUNT
 mk_mntpoint_1($private_path);
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 make_fs( $fs_type, $dev, $basedir );
 $opts_no_mount = "rootcontext=system_u:object_r:test_filesystem_no_mount_t:s0";
 
@@ -578,7 +437,7 @@ cleanup1( $basedir, $dev );
 ############### Deny filesystem { getattr } ##########################
 # hooks.c selinux_sb_statfs() FILESYSTEM__GETATTR
 mk_mntpoint_1($private_path);
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 make_fs( $fs_type, $dev, $basedir );
 $opts_no_getattr =
   "rootcontext=system_u:object_r:test_filesystem_no_getattr_t:s0";
@@ -607,7 +466,7 @@ cleanup1( $basedir, $dev );
 ############### Deny filesystem { remount } ##########################
 # hooks.c selinux_mount() FILESYSTEM__REMOUNT
 mk_mntpoint_1($private_path);
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 make_fs( $fs_type, $dev, $basedir );
 $opts_no_remount =
   "rootcontext=system_u:object_r:test_filesystem_no_remount_t:s0";
@@ -637,7 +496,7 @@ cleanup1( $basedir, $dev );
 ############### Deny filesystem { unmount } ##########################
 # hooks.c selinux_umount() FILESYSTEM__UNMOUNT
 mk_mntpoint_1($private_path);
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 make_fs( $fs_type, $dev, $basedir );
 $opts_no_unmount =
   "rootcontext=system_u:object_r:test_filesystem_no_unmount_t:s0";
@@ -668,7 +527,7 @@ cleanup1( $basedir, $dev );
 ############### Deny filesystem { associate }  ##########################
 # hooks.c selinux_inode_setxattr() FILESYSTEM__ASSOCIATE
 mk_mntpoint_1($private_path);
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 make_fs( $fs_type, $dev, $basedir );
 $opts_no_associate_xattr =
 "defcontext=system_u:object_r:test_filesystem_inode_setxattr_no_associate_t:s0,fscontext=system_u:object_r:test_filesystem_inode_setxattr_no_associate_t:s0";
@@ -701,7 +560,7 @@ cleanup1( $basedir, $dev );
 # hooks.c selinux_path_notify() FILESYSTEM__WATCH
 if ($test_watch) {
     mk_mntpoint_1($private_path);
-    $dev = get_loop_dev();
+    ( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
     make_fs( $fs_type, $dev, $basedir );
     $opts_no_watch = "context=system_u:object_r:test_filesystem_no_watch_t:s0";
 
@@ -738,7 +597,7 @@ if ($test_watch) {
 #               files within the mount fails with errno EOPNOTSUPP.
 ##########################################################################
 mk_mntpoint_1($private_path);
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 make_fs( $fs_type, $dev, $basedir );
 
 # Mount with xttrs to create a file with specific context.
@@ -769,7 +628,7 @@ ok( $result eq 0 );
 
 # Need to free the loop device, then get new one and attach
 system("losetup -d $dev 2>/dev/null");
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 attach_dev( $dev, $basedir );
 
 # Mount again with no xttr support
@@ -816,7 +675,7 @@ cleanup1( $basedir, $dev );
 #               the mount operation.
 ##########################################################################
 mk_mntpoint_1($private_path);
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 make_fs( $fs_type, $dev, $basedir );
 $root_opts = "rootcontext=system_u:object_r:test_filesystem_context_file_t:s0";
 
@@ -863,7 +722,7 @@ cleanup1( $basedir, $dev );
 #               where defcontext differs from the policy default.
 ##########################################################################
 mk_mntpoint_1($private_path);
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 make_fs( $fs_type, $dev, $basedir );
 $test_opts = "context=system_u:object_r:test_filesystem_context_file_t:s0";
 
@@ -891,7 +750,7 @@ ok( $result eq 0 );
 
 # Need to free the loop device, then get new dev one and attach
 system("losetup -d $dev 2>/dev/null");
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 attach_dev( $dev, $basedir );
 
 # Mount again with defcontext=
@@ -930,7 +789,7 @@ cleanup1( $basedir, $dev );
 ##########################################################################
 $fs_type = "tmpfs";
 mk_mntpoint_1($private_path);
-$dev = get_loop_dev();
+( $dev, $device_count ) = get_loop_dev( \@device_list, $device_count );
 $fscontext_opts =
 "fscontext=system_u:object_r:test_filesystem_fscontext_fs_t:s0,size=10M,mode=0770";
 
@@ -959,7 +818,7 @@ ok( $result eq 0 );
 print "Removing: $dev $basedir/mntpoint $basedir/fstest\n";
 cleanup1( $basedir, $dev );
 
-reaper( $basedir, $v );
+reaper( \@device_list, $basedir, $v );
 
 if ($disable_udisks) {
     udisks2_restart($udisks2_status);
diff --git a/tools/check-syntax b/tools/check-syntax
index 7f9768d..0ca79e2 100755
--- a/tools/check-syntax
+++ b/tools/check-syntax
@@ -13,7 +13,7 @@
 CHK_C_LIST="$(find tests/ -name "*.c") $(find tests/ -name "*.h")"
 CHK_C_EXCLUDE=""
 
-CHK_PERL_LIST="$(find tests/ -name "*.pl") $(find tests/ -name "test")"
+CHK_PERL_LIST="$(find tests/ -name "*.pl") $(find tests/ -name "test") $(find tests/ -name "*.pm")"
 CHK_PERL_EXCLUDE=""
 
 ####
-- 
2.24.1

