Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7BD112D7A
	for <lists+selinux@lfdr.de>; Wed,  4 Dec 2019 15:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbfLDOc4 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 4 Dec 2019 09:32:56 -0500
Received: from mailomta14-re.btinternet.com ([213.120.69.107]:14223 "EHLO
        re-prd-fep-044.btinternet.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727828AbfLDOc4 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 4 Dec 2019 09:32:56 -0500
Received: from re-prd-rgout-002.btmx-prd.synchronoss.net ([10.2.54.5])
          by re-prd-fep-044.btinternet.com with ESMTP
          id <20191204143252.MHJV18275.re-prd-fep-044.btinternet.com@re-prd-rgout-002.btmx-prd.synchronoss.net>;
          Wed, 4 Dec 2019 14:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btmx201904; t=1575469972; 
        bh=fY9o9RSZmRIu/n2CVADfv8pAAyLJMg8hiZEDDvPk8nQ=;
        h=From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version;
        b=fHh6wTaZBdYHKEa0jBfsRHvYIyCCloSd4Zp3DD3Nrox6DXYYG3B6/f10MwoFpzuQi3DC9lR3MY2c++yPYwYJu6oFSW7DTEsBiYi4YvLdcW8K8iJ75V2BcPC3mwztdkoepFsbwEOI4NBr+6wzf7AlzUYOLe5zzY5pPSGib4N7aRI+hffpwHF0URGUQVAvtdzRlAwqYiwP9vOeKpXvtIs+jKzMQyAsYDf/K6r6PucKM/24HhDvK2k/fUS/VARB/B3PpVbyAtA5XjY8qAL36Y2FwMscV+Eaj8TfgTMUyzBKv8PpAz23ujYA+E50yRf2qbf+qygJqQJ1OI1sYk7m9eYZKQ==
Authentication-Results: btinternet.com;
    auth=pass (PLAIN) smtp.auth=richard_c_haines@btinternet.com
X-Originating-IP: [86.134.3.29]
X-OWM-Source-IP: 86.134.3.29 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedufedrudejledgieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuueftkffvkffujffvgffngfevqffopdfqfgfvnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftihgthhgrrhguucfjrghinhgvshcuoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqeenucfkphepkeeirddufeegrdefrddvleenucfrrghrrghmpehhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpeekiedrudefgedrfedrvdelpdhmrghilhhfrhhomhepoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqedprhgtphhtthhopeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhequcfqtfevrffvpehrfhgtkedvvdenrhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhdprhgtphhtthhopeeoshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgheqnecuvehluhhsthgvrhfuihiivgeptd
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from localhost.localdomain (86.134.3.29) by re-prd-rgout-002.btmx-prd.synchronoss.net (5.8.337) (authenticated as richard_c_haines@btinternet.com)
        id 5DE2575E00B6AB3A; Wed, 4 Dec 2019 14:32:51 +0000
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     selinux@vger.kernel.org
Cc:     Richard Haines <richard_c_haines@btinternet.com>
Subject: [PATCH] selinux_testsuite: Add socketpair test
Date:   Wed,  4 Dec 2019 14:32:48 +0000
Message-Id: <20191204143248.17361-1-richard_c_haines@btinternet.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Test SO_PEERSEC for sockets created by socketpair(2) added in kernel 4.18

Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>
---
 policy/test_unix_socket.te     |   7 ++
 tests/unix_socket/.gitignore   |   1 +
 tests/unix_socket/Makefile     |   5 +
 tests/unix_socket/socketpair.c | 190 +++++++++++++++++++++++++++++++++
 tests/unix_socket/test         |  26 ++++-
 5 files changed, 226 insertions(+), 3 deletions(-)
 create mode 100644 tests/unix_socket/socketpair.c

diff --git a/policy/test_unix_socket.te b/policy/test_unix_socket.te
index 7dd3362..0ff790a 100644
--- a/policy/test_unix_socket.te
+++ b/policy/test_unix_socket.te
@@ -60,6 +60,13 @@ allow test_unix_dgram_client_t test_unix_server_t:unix_dgram_socket sendto;
 allow test_unix_server_t test_unix_client_sockfile_t:sock_file write;
 allow test_unix_server_t test_unix_dgram_client_t:unix_dgram_socket sendto;
 
+# Domain for socketpair(2) process.
+type test_socketpair_t;
+domain_type(test_socketpair_t)
+unconfined_runs_test(test_socketpair_t)
+typeattribute test_socketpair_t testdomain;
+typeattribute test_socketpair_t unixsocketdomain;
+
 # Allow all of these domains to be entered from the sysadm domain.
 miscfiles_domain_entry_test_files(unixsocketdomain)
 userdom_sysadm_entry_spec_domtrans_to(unixsocketdomain)
diff --git a/tests/unix_socket/.gitignore b/tests/unix_socket/.gitignore
index f2ad853..05ed268 100644
--- a/tests/unix_socket/.gitignore
+++ b/tests/unix_socket/.gitignore
@@ -1,2 +1,3 @@
 client
 server
+socketpair
diff --git a/tests/unix_socket/Makefile b/tests/unix_socket/Makefile
index 5266096..7770f0b 100644
--- a/tests/unix_socket/Makefile
+++ b/tests/unix_socket/Makefile
@@ -2,6 +2,11 @@ TARGETS=client server
 
 LDLIBS+= -lselinux
 
+# Test SO_PEERSEC for sockets created by socketpair(2).
+ifneq ($(shell ../kvercmp $$(uname -r) 4.18),-1)
+	TARGETS += socketpair
+endif
+
 all: $(TARGETS)
 clean:
 	rm -f $(TARGETS)
diff --git a/tests/unix_socket/socketpair.c b/tests/unix_socket/socketpair.c
new file mode 100644
index 0000000..50cd3fa
--- /dev/null
+++ b/tests/unix_socket/socketpair.c
@@ -0,0 +1,190 @@
+#include <stdlib.h>
+#include <stdio.h>
+#include <stddef.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <errno.h>
+#include <sys/types.h>
+#include <sys/socket.h>
+#include <selinux/selinux.h>
+
+#ifndef SO_PEERSEC
+#define SO_PEERSEC 31
+#endif
+
+#ifndef SCM_SECURITY
+#define SCM_SECURITY 0x03
+#endif
+
+void print_usage(char *progname)
+{
+	fprintf(stderr,
+		"usage:  %s stream|dgram\n"
+		"Where:\n\t"
+		"stream     Use TCP protocol or:\n\t"
+		"dgram      use UDP protocol.\n", progname);
+	exit(-1);
+}
+
+int run_parent(int sock, int type)
+{
+	int result, on = 1;
+	char byte, peerlabel[256];
+	socklen_t labellen = sizeof(peerlabel);
+
+	result = setsockopt(sock, SOL_SOCKET, SO_PASSSEC, &on, sizeof(on));
+	if (result < 0) {
+		perror("setsockopt: SO_PASSSEC");
+		goto err;
+	}
+
+	if (type == SOCK_STREAM) {
+		result = read(sock, &byte, 1);
+		if (result < 0) {
+			perror("read");
+			goto err;
+		}
+
+		result = getsockopt(sock, SOL_SOCKET, SO_PEERSEC, peerlabel,
+				    &labellen);
+		if (result < 0) {
+			perror("getsockopt: SO_PEERSEC");
+			goto err;
+		}
+		printf("Parent got peer label=%s\n", peerlabel);
+
+		result = write(sock, peerlabel, sizeof(peerlabel));
+		if (result < 0) {
+			perror("write");
+			goto err;
+		}
+	} else {
+		struct iovec iov;
+		struct msghdr msg;
+		struct cmsghdr *cmsg;
+		char msglabel[256];
+		union {
+			struct cmsghdr cmsghdr;
+			char buf[CMSG_SPACE(sizeof(msglabel))];
+		} control;
+
+		memset(&iov, 0, sizeof(iov));
+		iov.iov_base = &byte;
+		iov.iov_len = 1;
+		memset(&msg, 0, sizeof(msg));
+		msg.msg_iov = &iov;
+		msg.msg_iovlen = 1;
+		msg.msg_control = &control;
+		msg.msg_controllen = sizeof(control);
+		result = recvmsg(sock, &msg, 0);
+		if (result < 0) {
+			perror("recvmsg");
+			goto err;
+		}
+
+		for (cmsg = CMSG_FIRSTHDR(&msg); cmsg;
+		     cmsg = CMSG_NXTHDR(&msg, cmsg)) {
+			;
+			if (cmsg->cmsg_level == SOL_SOCKET &&
+			    cmsg->cmsg_type == SCM_SECURITY) {
+				size_t len = cmsg->cmsg_len - CMSG_LEN(0);
+
+				if (len > 0 && len < sizeof(msglabel)) {
+					memcpy(msglabel, CMSG_DATA(cmsg), len);
+					msglabel[len] = 0;
+					printf("Parent got SCM_SECURITY=%s\n",
+					       msglabel);
+				}
+			}
+		}
+
+		result = sendto(sock, msglabel, strlen(msglabel), 0,
+				msg.msg_name, msg.msg_namelen);
+		if (result < 0) {
+			perror("sendto");
+			goto err;
+		}
+	}
+
+	result = 0;
+err:
+	close(sock);
+	return result;
+}
+
+int run_child(int sock)
+{
+	int result;
+	char byte = 0, label[256], *mycon;
+
+	result = write(sock, &byte, 1);
+	if (result < 0) {
+		perror("write");
+		goto err;
+	}
+
+	result = read(sock, label, sizeof(label));
+	if (result < 0) {
+		perror("read");
+		goto err;
+	}
+	label[result] = 0;
+
+	result = getcon(&mycon);
+	if (result < 0) {
+		perror("getcon");
+		goto err1;
+	}
+
+	if (strcmp(mycon, label)) {
+		fprintf(stderr, "Child expected %s, got %s\n", mycon, label);
+		result = -1;
+		goto err1;
+	}
+
+	result = 0;
+err1:
+	free(mycon);
+err:
+	close(sock);
+	return result;
+}
+
+int main(int argc, char **argv)
+{
+	int type, result, sockets[2];
+
+	if (argc != 2)
+		print_usage(argv[0]);
+
+	if (!strcmp(argv[1], "stream"))
+		type = SOCK_STREAM;
+	else if (!strcmp(argv[1], "dgram"))
+		type = SOCK_DGRAM;
+	else
+		print_usage(argv[0]);
+
+	result = socketpair(AF_UNIX, type, 0, sockets);
+	if (result < 0) {
+		perror("socketpair");
+		return -1;
+	}
+
+	result = fork();
+	if (result < 0) {
+		perror("fork");
+		close(sockets[0]);
+		close(sockets[1]);
+		return -1;
+	} else if (result > 0) {
+		close(sockets[0]);
+		result = run_parent(sockets[1], type);
+		return result;
+
+	} else {
+		close(sockets[1]);
+		result = run_child(sockets[0]);
+		return result;
+	}
+}
diff --git a/tests/unix_socket/test b/tests/unix_socket/test
index f5f03e8..48dde29 100755
--- a/tests/unix_socket/test
+++ b/tests/unix_socket/test
@@ -1,10 +1,21 @@
 #!/usr/bin/perl
 
 use Test;
-BEGIN { plan tests => 8 }
 
-$basedir = $0;
-$basedir =~ s|(.*)/[^/]*|$1|;
+BEGIN {
+    $basedir = $0;
+    $basedir =~ s|(.*)/[^/]*|$1|;
+
+    $test_count = 8;
+    $socketpair = 0;
+
+    if ( -e "$basedir/socketpair" ) {
+        $test_count += 2;
+        $socketpair = 1;
+    }
+
+    plan tests => $test_count;
+}
 
 #
 # Tests for sockets in the abstract namespace.
@@ -106,4 +117,13 @@ server_end($pid);
 # Clean up.
 system "rm -f $basedir/test_client_sock $basedir/test_server_sock";
 
+if ($socketpair) {
+    #### Test SO_PEERSEC for sockets created by socketpair(2) #####
+    $result = system "runcon -t test_socketpair_t $basedir/socketpair stream";
+    ok( $result, 0 );
+
+    $result = system "runcon -t test_socketpair_t $basedir/socketpair dgram";
+    ok( $result, 0 );
+}
+
 exit;
-- 
2.23.0

