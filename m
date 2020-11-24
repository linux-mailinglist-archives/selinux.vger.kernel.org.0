Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 520162C1F9E
	for <lists+selinux@lfdr.de>; Tue, 24 Nov 2020 09:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730301AbgKXIJx (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 24 Nov 2020 03:09:53 -0500
Received: from mx1.polytechnique.org ([129.104.30.34]:60218 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730266AbgKXIJx (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 24 Nov 2020 03:09:53 -0500
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 973BF5600AF
        for <selinux@vger.kernel.org>; Tue, 24 Nov 2020 09:09:50 +0100 (CET)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 1/1] scripts/ci: add configuration for a Vagrant virtual machine
Date:   Tue, 24 Nov 2020 09:09:45 +0100
Message-Id: <20201124080945.80488-1-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Tue Nov 24 09:09:50 2020 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000000, queueID=D7AFB5600B6
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Using Vagrant makes reproducing and debugging CI issues easier: after
"vagrant up", a test virtual machine is up and running, and ready to run
"fedora-test-runner.sh". In order to make using this VM even easier, a
helper script, "run-selinux-test.sh" is created inside and instructions
on how to use it are documented at the beginning of Vagrantfile.

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 scripts/ci/.gitignore  |  1 +
 scripts/ci/Vagrantfile | 55 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 scripts/ci/.gitignore
 create mode 100644 scripts/ci/Vagrantfile

diff --git a/scripts/ci/.gitignore b/scripts/ci/.gitignore
new file mode 100644
index 000000000000..a977916f6583
--- /dev/null
+++ b/scripts/ci/.gitignore
@@ -0,0 +1 @@
+.vagrant/
diff --git a/scripts/ci/Vagrantfile b/scripts/ci/Vagrantfile
new file mode 100644
index 000000000000..68a2414a8429
--- /dev/null
+++ b/scripts/ci/Vagrantfile
@@ -0,0 +1,55 @@
+# -*- mode: ruby -*-
+# vi: set ft=ruby :
+# Vagrant configuration file which creates a virtual machine that can run the
+# test suite using fedora-test-runner.sh, in an environment similar to the one
+# used for automated continuous integration tests (Travis-CI)
+#
+# To create a new virtual machine:
+#
+#    vagrant up --provision
+#
+# To launch tests (for example after modifications to libsepol, libselinux... are made):
+#
+#    vagrant rsync && echo ./run-selinux-test.sh | vagrant ssh
+#
+# To destroy the virtual machine (for example to start again from a clean environment):
+#
+#    vagrant destroy
+
+# Create a helper script in the VM to run the testsuite as root from a clean environment
+$script = <<SCRIPT
+cat > /home/vagrant/run-selinux-test.sh << EOF
+#/bin/sh
+set -e -v
+
+# Clean-up a previous run.
+# "make" is not installed when the machine is first bootstrapped
+if command -v make > /dev/null 2>&1 ; then
+    sudo make -C /root/selinux clean distclean
+fi
+sudo rm -rf /root/selinux-testsuite
+
+# Run the tests
+sudo /root/selinux/scripts/ci/fedora-test-runner.sh
+echo 'All tests passed :)'
+EOF
+chmod +x /home/vagrant/run-selinux-test.sh
+SCRIPT
+
+# All Vagrant configuration is done below. The "2" in Vagrant.configure
+# configures the configuration version (we support older styles for
+# backwards compatibility). Please don't change it unless you know what
+# you're doing.
+Vagrant.configure("2") do |config|
+  config.vm.box = "fedora/33-cloud-base"
+  config.vm.synced_folder "../..", "/root/selinux"
+
+  config.vm.provider "virtualbox" do |v|
+     v.memory = 4096
+  end
+  config.vm.provider "libvirt" do |v|
+     v.memory = 4096
+  end
+
+  config.vm.provision :shell, inline: $script
+end
-- 
2.29.2

