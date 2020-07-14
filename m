Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C2C21F139
	for <lists+selinux@lfdr.de>; Tue, 14 Jul 2020 14:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgGNMaH (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 14 Jul 2020 08:30:07 -0400
Received: from agnus.defensec.nl ([80.100.19.56]:49282 "EHLO agnus.defensec.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726041AbgGNMaG (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 14 Jul 2020 08:30:06 -0400
Received: from localhost.localdomain (brutus.lan [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id 7E6922A0FFA;
        Tue, 14 Jul 2020 14:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 agnus.defensec.nl 7E6922A0FFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defensec.nl;
        s=default; t=1594729800;
        bh=XMw8bLZjmWN24KXJ/aJMPkCETbg9Dij+2JEAGY6O31Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=czRCgHPcn+59/T5+o9SGPZkdBrtb3M6btCiXKB0NZ6ws6eqXMRz7t/lC+oYoFJ+pW
         Uv+vCl6iJJLz080sbzZNveDVfWr4hbhGiIHD5apChP3h4by0j7w+pacU3NOq5sqITZ
         qrajp8ehgrZHe40yUZM+eRhfJbhsFLwA3PEfgmCM=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     selinux@vger.kernel.org
Cc:     Dominick Grift <dominick.grift@defensec.nl>
Subject: [SELinux-notebook RFC v2] mypolicy is a simple CIL policy with Makefile to get started with
Date:   Tue, 14 Jul 2020 14:29:31 +0200
Message-Id: <20200714122931.577823-1-dominick.grift@defensec.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713173702.426543-1-dominick.grift@defensec.nl>
References: <20200713173702.426543-1-dominick.grift@defensec.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

This leverages some of the more modern features to make creating
a policy from scratch a bit more friendly, like the lifting of the
classorder requirement and the lifting of the used sidcontext
requirement.

It is also omitting various aspects that are not strictly needed to
get started and that might actually vary in various environments.

The policy is installed using semodule and this provides easy and full
access to the full sources installed to the module store. Once
mypolicy is installed you can, with the help of the CIL documentation,
dive right in an start addressing your access control requirements
using semodule and your favorite editor.

v2: added forgotten defaultrole rules, a filecon for /, and fixed typos/grammar/spelling

Signed-off-by: Dominick Grift <dominick.grift@defensec.nl>
---
 src/cil_overview.md                         |  11 +
 src/notebook-examples/README.md             |   2 +
 src/notebook-examples/mypolicy/Makefile     |  46 ++
 src/notebook-examples/mypolicy/README.md    |  49 +++
 src/notebook-examples/mypolicy/mypolicy.cil | 445 ++++++++++++++++++++
 5 files changed, 553 insertions(+)
 create mode 100644 src/notebook-examples/mypolicy/Makefile
 create mode 100644 src/notebook-examples/mypolicy/README.md
 create mode 100644 src/notebook-examples/mypolicy/mypolicy.cil

diff --git a/src/cil_overview.md b/src/cil_overview.md
index a05aad5..83a5e5f 100644
--- a/src/cil_overview.md
+++ b/src/cil_overview.md
@@ -135,6 +135,17 @@ Usage: build-sepolicy [-k] [-M] [-c|-p|-s] -d flask_directory -o output_file
 -d    Directory containing the initial_sids, security_classes and access_vectors Flask files.
 -o    The output file that will contain the policy source or header file.
 ```
+There is another CIL policy in the notebook examples called "mypolicy"
+that takes a slightly different approach where the goal is to keep the
+policy as simple as possible. It requires `semodule`, Linux 5.7 and
+SELinux 3.1 and can be installed by executing `make install`. It
+leverages some modern SELinux features, most notably where the
+requirement for ordered security classes is lifted. With this you are
+no longer expected to be aware of all the access vectors managed by
+Linux in order to align your security class declarations with to order
+in which they are declared in the kernel. A module store is created
+by `semodule` that gives easy access to the source and that allows for
+full control over the policy.
 
 <br>
 
diff --git a/src/notebook-examples/README.md b/src/notebook-examples/README.md
index 488ec6e..32d679f 100644
--- a/src/notebook-examples/README.md
+++ b/src/notebook-examples/README.md
@@ -8,5 +8,7 @@ This area contains the following directories:
 
 ***sepgsql*** - Contains SE-PostgreSQL database example.
 
+***mypolicy*** - Contains info to build and install simple CIL policy.
+
 **NOTE:** To run the majority of these examples requires root privilege,
 therefore need to su etc. (or just log on as root and be damned)
diff --git a/src/notebook-examples/mypolicy/Makefile b/src/notebook-examples/mypolicy/Makefile
new file mode 100644
index 0000000..d4048fe
--- /dev/null
+++ b/src/notebook-examples/mypolicy/Makefile
@@ -0,0 +1,46 @@
+# -*- Mode: makefile; indent-tabs-mode: t -*-
+# SPDX-License-Identifier: Unlicense
+
+.PHONY: clean install test
+
+all: clean test
+
+clean:
+	\rm -f policy.* file_contexts
+
+test:
+	secilc -vvv mypolicy.cil
+
+install:
+	mkdir -p /etc/selinux/mypolicy/{contexts,logins,policy,contexts/files,contexts/users}
+	touch /etc/selinux/mypolicy/contexts/customizable_types
+	touch /etc/selinux/mypolicy/contexts/file_contexts.subs_dist
+	echo -e """<!DOCTYPE busconfig PUBLIC \
+\"-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN\" \
+\n\"http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd\"> \
+\n<busconfig> \
+\n<selinux> \
+\n</selinux> \
+\n</busconfig>""" > /etc/selinux/mypolicy/contexts/dbus_contexts
+	echo "sys.role:sys.isid sys.role:sys.isid" > /etc/selinux/mypolicy/contexts/default_contexts
+	echo "sys.role:sys.isid" > /etc/selinux/mypolicy/contexts/default_type
+	echo "sys.role:sys.isid" > /etc/selinux/mypolicy/contexts/failsafe_context
+	echo -e """cdrom sys.id:sys.role:sys.isid \
+\nfloppy sys.id:sys.role:sys.isid \
+\ndisk sys.id:sys.role:sys.isid""" > /etc/selinux/mypolicy/contexts/files/media
+	echo "privsep_preauth=sys.isid" > /etc/selinux/mypolicy/contexts/openssh_contexts
+	echo "sys.id:sys.role:sys.isid" > /etc/selinux/mypolicy/contexts/removable_context
+	echo "sys.isid" > /etc/selinux/mypolicy/contexts/securetty_types
+	echo "sys.id:sys.role:sys.isid" > /etc/selinux/mypolicy/contexts/virtual_domain_context
+	echo -e """sys.id:sys.role:sys.isid \
+\nsys.id:sys.role:sys.isid""" > /etc/selinux/mypolicy/contexts/virtual_image_context
+	echo -e """Section \"Module\" \
+\nSubSection \"extmod\" \
+\nOption \"SELinux mode disabled\" \
+\nEndSubSection \
+\nEndSection""" > /etc/selinux/mypolicy/contexts/x_contexts
+	semodule --priority=100 -N -s mypolicy -i mypolicy.cil
+	echo "Installation done!"
+	echo "Enable:	sed -i 's/SELINUXTYPE.*/SELINUXTYPE=mypolicy/' /etc/selinux/config"
+	echo "		semodule -B"
+	echo "No point relabeling since no persistent filesystems are set up for labeling yet"
diff --git a/src/notebook-examples/mypolicy/README.md b/src/notebook-examples/mypolicy/README.md
new file mode 100644
index 0000000..591994c
--- /dev/null
+++ b/src/notebook-examples/mypolicy/README.md
@@ -0,0 +1,49 @@
+# CIL policy from scratch: A different approach
+
+This example demonstrates an alternative approach to implementing a
+first iteration of a CIL policy from scratch. The main idea is to
+create a policy that is as small as reasonably possible, and to
+install that using `semodule`. This will provide you with bare
+miminums to get you started in enforcing mode.
+
+To achieve this there are two key features leveraged. The
+`handleunknown` statement and the `unlabeled` and `file` initial
+security identifiers. By allowing unknown access vectors by default we
+can reduce the amount of classes and access vector permission
+declarations needed to get started. This was only recently made
+possible by lifting the requirement to order classes. Requiring
+classes to be ordered implies that the classes are declared, thus it
+requires that you know what classes are managed by Linux. Now we only
+have to be aware of, and declare a small set of classes and a few
+permissions to get started. All the remaining unknown access vectors
+will be reported to us by SELinux via the kernel ring buffer, it is
+just a matter of looking at `dmesg` to see which access vectors are
+managed by Linux but are unknown to the policy, and then to address
+those in the policy as we go along.
+
+The `unlabeled` initial security identifier is used to associate a
+specified context with entities that have their existing context
+invalidated. The `file` initial security identifier is used to
+associate a context with objects that have no labels. This
+functionality can be taken advantage of to reduce the work needed to
+get a working first iteration of the policy that we can then build
+upon. Initial security identifier associated contexts are associated
+with entities in memory. This means that effectively we do not have
+to worry about persistent labels in our first iteration. We can
+address labeling requirements as we go along.
+
+By using `semodule` we create a module store that we can use to
+manage additional modules and that all the source policy is readily
+accessible through the store. Everything is accessible and mutable at
+runtime, although some changes might require reboot in some scenarios.
+The awesome thing about this example is that you can effectively
+switch to your new policy at runtime in enforcing mode if your system
+was already enforcing a policy before. Otherwise you might have
+to reboot to load initial policy.
+
+This repository comes with a heavily commented CIL module and a make
+file that addresses installation. The make file does make some
+assumptions that are relatively safe but if something breaks, you get
+to keep the pieces. This example requires Linux 5.7 and SELinux 3.1
+because it omits initial sid context specifications for unused
+security identifiers.
diff --git a/src/notebook-examples/mypolicy/mypolicy.cil b/src/notebook-examples/mypolicy/mypolicy.cil
new file mode 100644
index 0000000..a554853
--- /dev/null
+++ b/src/notebook-examples/mypolicy/mypolicy.cil
@@ -0,0 +1,445 @@
+;; -*- mode: CIL; fill-column: 79; indent-tabs-mode: nil; -*-
+;; SPDX-License-Identifier: Unlicense
+
+;;
+;; Policy configuration:
+;;
+;; By allowing unknown access vectors we can start with a reduced number
+;; of declared classes and access vectors. Use `dmesg | grep -i selinux` to
+;; see which kernel classes and access vectors should be addressed in the
+;; policy as you go along.
+;;
+
+(handleunknown allow)
+
+;;
+;; Policy configuration:
+;;
+;; We'll disable the MLS security model support for simplicity, but CIL still
+;; requires us to write our policy with minimal MLS-awareness. Remember, we can
+;; alway's add full or partial MLS support later. This is just to get started.
+;;
+
+(mls false)
+
+;;
+;; Access vector declarations and (un)ordering:
+;;
+;; SELinux requires that the process security class, transition and
+;; dyntransition access vector permissions are declared. CIL requires at least
+;; one declared access vector and avc rule as well so this is a good starting
+;; point. All security classes can be "unordered" with Linux 5.7/SELinux 3.1.
+;;
+
+(class process (dyntransition transition))
+(classorder (unordered process))
+
+;;
+;; Access vector declarations and (un)ordering:
+;;
+;; To be able to associate roles with files, we need defaultrole rules that
+;; require file classes to be declared. For now we'll omit their associated
+;; access vector permissions for simplicity (get them from `dmesg | grep -i selinux`)
+;;
+
+(class blk_file ())
+(classorder (unordered blk_file))
+
+(class chr_file ())
+(classorder (unordered chr_file))
+
+(class dir ())
+(classorder (unordered dir))
+
+(class fifo_file ())
+(classorder (unordered fifo_file))
+
+(class file ())
+(classorder (unordered file))
+
+(class lnk_file ())
+(classorder (unordered lnk_file))
+
+(class sock_file ())
+(classorder (unordered sock_file))
+
+;;
+;; Initial security identifier declarations:
+;;
+;; The kernel isid is used to associate a specified context with processes
+;; that were initialized before SELinux was initialized (mainly kernel threads).
+;;
+
+(sid kernel)
+
+;;
+;; Initial security identifier declarations:
+;;
+;; The security isid is used to associate a specified context with "fixed"
+;; SELinux "objects" used to enforce access control on SELinux operations
+;; (for example setenforce, setbool etc).
+;;
+
+(sid security)
+
+;;
+;; Initial security identifier declarations:
+;;
+;; The port isid is used to associate a specified context with "fixed"
+;; network port "objects" used to enforce access control on network
+;; operations (for example name_connect, name_bind etc).
+;;
+
+(sid port)
+
+;;
+;; Initial security identifier declarations:
+;;
+;; The netif isid is used to associate a specified context with "fixed"
+;; network interface "objects" used to enforce access control on network
+;; operations (for example egress, ingress etc).
+;;
+
+(sid netif)
+
+;;
+;; Initial security identifier declarations:
+;;
+;; The netmsg isid is used to associate a specified context with "fixed"
+;; network peer "objects" used to enforce access control on network
+;; operations (for example recv).
+;;
+
+(sid netmsg)
+
+;;
+;; Initial security identifier declarations:
+;;
+;; The node isid is used to associate a specified context with "fixed"
+;; network node "objects" used to enforce access control on network
+;; operations (for example node_bind etc).
+;;
+
+(sid node)
+
+;;
+;; Initial security identifier declarations:
+;;
+;; The devnull isid is used to associate a specified context with "fixed"
+;; null device "objects" used to enforce access control on file
+;; operations (for example read, write etc).
+;;
+
+(sid devnull)
+
+;;
+;; Initial security identifier declarations:
+;;
+;; The file isid is used to associate a specified context with objects
+;; that have no label (for example formatted filesystems that are not labeled).
+;;
+
+(sid file)
+
+;;
+;; Initial security identifier declarations:
+;;
+;; The unlabeled isid is used to associate a specified context with entities
+;; that had their security context invalidated (mainly due to modifications to
+;; policy at runtime).
+;;
+
+(sid unlabeled)
+
+;;
+;; Initial security identifier declarations:
+;;
+;; The following initial security identifiers are unused but are required
+;; for "sid ordering"
+;;
+
+(sid any_socket)
+(sid file_labels)
+(sid fs)
+(sid icmp_socket)
+(sid igmp_packet)
+(sid init)
+(sid kmod)
+(sid policy)
+(sid scmp_packet)
+(sid sysctl)
+(sid sysctl_dev)
+(sid sysctl_fs)
+(sid sysctl_kernel)
+(sid sysctl_modprobe)
+(sid sysctl_net)
+(sid sysctl_net_unix)
+(sid sysctl_vm)
+(sid tcp_socket)
+
+;;
+;; Initial security identifier ordering:
+;;
+;; Even though most initial security identifiers we declared are no longer in
+;; use, we still have to retain a very specific order to stay compatible with
+;; the kernel. This is certainly one of those things that make policy writing
+;; seem like some sort of black magic and hopefully some day we can lift the
+;; requirement to order initial sids in a specific way.
+;;
+
+(sidorder
+ (kernel security unlabeled fs file file_labels init any_socket port
+         netif netmsg node igmp_packet icmp_socket tcp_socket sysctl_modprobe
+         sysctl sysctl_fs sysctl_kernel sysctl_net sysctl_net_unix
+         sysctl_vm sysctl_dev kmod policy scmp_packet devnull))
+
+;;
+;; Security identifier declarations
+;;
+;; Security contexts are identifiers that are combinations of security
+;; attribute and security identifier key value pairs corresponding to security
+;; models.
+;;
+;; The s0 security identifier is associated with sensitivity attribute in a
+;; security context used to enforce confidentiality with the Multi level
+;; security model. (we only declare one sensitivity for simplicity and to
+;; satisfy CIL.
+;;
+
+(sensitivity s0)
+
+;;
+;; Security identifier declarations
+;;
+;; Security contexts are identifiers that are combinations of security
+;; attribute and security identifier key value pairs corresponding to security
+;; models.
+;;
+;; The c0 security identifier is associated with category attribute in a
+;; security context used to enforce compartmentalization with the Multi level
+;; security model. (we only declare one compartment for simplicity and to
+;; satisfy CIL.
+;;
+
+(category c0)
+
+;;
+;; Security identifier declarations
+;;
+;; Security contexts are identifiers that are combinations of security
+;; attribute and security identifier key value pairs corresponding to security
+;; models.
+;;
+;; The sys.id security identifier is associated with user attribute in a
+;; security context used to associate with Linux DAC and role and level security
+;; identifiers with the Identity-based access control security model.
+;;
+;; Note that we leverage a simple CIL "sys" "container" here
+;;
+
+(block sys (user id))
+
+;;
+;; Security identifier declarations
+;;
+;; Security contexts are identifiers that are combinations of security
+;; attribute and security identifier key value pairs corresponding to security
+;; models.
+;;
+;; The sys.role security identifier is associated with role attribute in a
+;; security context used to associate with types with the Role-based
+;; access control security model.
+;;
+;; Note that we insert into the previously defined CIL "sys" "container" here
+;;
+
+(in sys (role role))
+
+;;
+;; Security identifier declarations
+;;
+;; Security contexts are identifiers that are combinations of security
+;; attribute and security identifier key value pairs corresponding to security
+;; models.
+;;
+;; The sys.isid security identifier is associated with type attribute in a
+;; security context used to enforce integrity with the Type-enforcement
+;; security model.
+;;
+;; Note that we insert into the previously defined CIL "sys" "container" here
+;;
+
+(in sys (type isid))
+
+;;
+;; Sensitivity ordering:
+;;
+;; Usually there are multiple sensitivities declared. Sensitivities represent
+;; a hierarchy. Since we only have one sensitivity our sensitivity order is
+;; simple.
+;;
+
+(sensitivityorder (s0))
+
+;;
+;; Category ordering:
+;;
+;; Usually there are multiple categories declared. Categories represent
+;; a hierarchy. Since we only have one category our category order is
+;; simple.
+;;
+
+(categoryorder (c0))
+
+;;
+;; Security identifier authorisations
+;;
+;; The individually declared security identifiers need to be authorized to
+;; associate to be able to define valid security contexts.
+;;
+;; Authorize the s0 sensitivity with c0 category association
+;;
+
+(sensitivitycategory s0 (range c0 c0))
+
+;;
+;; Security identifier authorisations
+;;
+;; The individually declared security identifiers need to be authorized to
+;; associate to be able to define valid security contexts.
+;;
+;; Authorize the sys.id user with sys.role role association
+;;
+
+(userrole sys.id sys.role)
+
+;;
+;; Security identifier authorisations
+;;
+;; The individually declared security identifiers need to be authorized to
+;; associate to be able to define valid security contexts.
+;;
+;; Authorize the sys.role role with sys.isid type association
+;;
+
+(roletype sys.role sys.isid)
+
+;;
+;; Security identifier authorisations
+;;
+;; The individually declared security identifiers need to be authorized to
+;; associate to be able to define valid security contexts.
+;;
+;; Authorize the sys.id user with s0 lavel association
+;;
+
+(userlevel sys.id (s0))
+
+;;
+;; Security identifier authorisations
+;;
+;; The individually declared security identifiers need to be authorized to
+;; associate to be able to define valid security contexts.
+;;
+;; Authorize the sys.id user with s0-s0:c0.c0 range association
+;;
+
+(userrange sys.id ((s0)(s0 (range c0 c0))))
+
+;;
+;; Security context specifications:
+;;
+;; We will change the default role behavior to inherit the role from the source
+;; instead of the target, as this allows us to leverage roles associated with
+;; files.
+;;
+
+(defaultrole blk_file source)
+(defaultrole chr_file source)
+(defaultrole dir source)
+(defaultrole fifo_file source)
+(defaultrole file source)
+(defaultrole lnk_file source)
+(defaultrole sock_file source)
+
+;;
+;; Security context specifications
+;;
+;; Now that we have a valid security context: sys.id:sys.role:sys.isid:s0-s0,
+;; associate it with the used initial sids.
+;;
+
+(sidcontext kernel (sys.id sys.role sys.isid ((s0)(s0))))
+(sidcontext security (sys.id sys.role sys.isid ((s0)(s0))))
+(sidcontext port (sys.id sys.role sys.isid ((s0)(s0))))
+(sidcontext netif (sys.id sys.role sys.isid ((s0)(s0))))
+(sidcontext netmsg (sys.id sys.role sys.isid ((s0)(s0))))
+(sidcontext node (sys.id sys.role sys.isid ((s0)(s0))))
+(sidcontext devnull (sys.id sys.role sys.isid ((s0)(s0))))
+(sidcontext file (sys.id sys.role sys.isid ((s0)(s0))))
+(sidcontext unlabeled (sys.id sys.role sys.isid ((s0)(s0))))
+
+;;
+;; Security context specifications
+;;
+;; Now that we have a valid security context: sys.id:sys.role:sys.isid:s0-s0,
+;; associate it with locations on the filesystems so that they can be
+;; associated with inodes on filesystems that support extended security
+;; attributes.
+;;
+
+(filecon "/" dir (sys.id sys.role sys.isid ((s0)(s0))))
+(filecon "/.*" any (sys.id sys.role sys.isid ((s0)(s0))))
+
+;;
+;; AVC rule
+;;
+;; CIL requires us to specify at least one AVC rule Since we were required
+;; to at least declare the process security class and its dyntransition and
+;; transition access vector permissions. lets just add a AVC rule allowing
+;; entities associated with our sys.isid type identifier access to all process
+;; access vectors.
+;;
+
+(allow sys.isid self (process (all)))
+
+;;
+;; Tieing some loose ends
+;;
+;; Addressing a hard coded reference to a rpm_script_t type identifier in RPM
+;; using typealiases to our sys.isid type so that RPM does not get confused.
+
+(typealias rpm_script_t)
+(typealiasactual rpm_script_t sys.isid)
+
+(typealias dpkg_script_t)
+(typealiasactual dpkg_script_t sys.isid)
+
+;;
+;; Tieing some loose ends
+;;
+;; Generate a /etc/selinux/mypolicy/seusers file with a __default__ fall back
+;; entry so that Linux users with be associated with the sys.id SELinux
+;; identity and s0-s0 level.
+;;
+
+(selinuxuserdefault sys.id ((s0)(s0)))
+
+;;
+;; Tieing some loose ends
+;;
+;; We are associating valid roles with files. The userprefix statement was
+;; recycled to allow us to tell genhomedircon what roles to associate with
+;; SELinux identities associated with custmizable files (mainly /home/user)
+;;
+
+(userprefix sys.id sys.role)
+
+;;
+;; Tieing some loose ends
+;;
+;; At the least /dev and /dev/pts need to be set up for labeling for sudo
+;;
+
+(fsuse trans "devtmpfs" (sys.id sys.role sys.isid ((s0)(s0))))
+(fsuse trans "devpts" (sys.id sys.role sys.isid ((s0)(s0))))
-- 
2.27.0

