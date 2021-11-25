Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D50D45D69C
	for <lists+selinux@lfdr.de>; Thu, 25 Nov 2021 10:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349083AbhKYJDU (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 25 Nov 2021 04:03:20 -0500
Received: from mailomta29-sa.btinternet.com ([213.120.69.35]:53801 "EHLO
        sa-prd-fep-041.btinternet.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1349337AbhKYJBU (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 25 Nov 2021 04:01:20 -0500
Received: from sa-prd-rgout-004.btmx-prd.synchronoss.net ([10.2.38.7])
          by sa-prd-fep-041.btinternet.com with ESMTP
          id <20211125085807.YRIB30965.sa-prd-fep-041.btinternet.com@sa-prd-rgout-004.btmx-prd.synchronoss.net>;
          Thu, 25 Nov 2021 08:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btmx201904; t=1637830687; 
        bh=++9mfLCHNzF8gSbhVvbeCE8Aaj/wOcSUnI7O/7mZfd8=;
        h=From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version;
        b=JMEduA8qLt2UbaQrgNUjSmBD7YQfqq3POHxXzIGsil9i5lm1wWqNzDn+bTgcYpQEkGb9GKUOFJczi+hzobcDyQi4YTJYQK0+r4eTifSlzFDcHL9azKpMVMi2cNGdoG0OPnI4gvqMXaMyitYehj2vTh4GPb7yBUAUN8UkDuOzHBqa0ZVSrR6vrCWv46uoYoz6k6rgvrvOnfrubOucYo86BqmUn5PvCeZ3H0KD0lT+Nq7Oe/h6QCHU1nGsCSzssRtFswPK3ZxzlqpXhmhiVp2/lS3S+b1jqrhnpFvrRU3UJWkJN0RkNW1bcZo7AhgCD1Ci0Jpq1QD786Qyyfdb99nMig==
Authentication-Results: btinternet.com;
    auth=pass (PLAIN) smtp.auth=richard_c_haines@btinternet.com;
    bimi=skipped
X-SNCR-Rigid: 613943C60B68E3C0
X-Originating-IP: [86.184.99.113]
X-OWM-Source-IP: 86.184.99.113 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvuddrgeelgdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuueftkffvkffujffvgffngfevqffopdfqfgfvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftihgthhgrrhguucfjrghinhgvshcuoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqeenucggtffrrghtthgvrhhnpeeuudekheeiheekieegkeeiieeuhfelgeeuledvfedtheekfedvgeeggeekvdfhvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeekiedrudekgedrleelrdduudefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpeekiedrudekgedrleelrdduudefpdhmrghilhhfrhhomheprhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhdprhgtphhtthhopehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmpdhrtghpthhtohepshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-SNCR-hdrdom: btinternet.com
Received: from localhost.localdomain (86.184.99.113) by sa-prd-rgout-004.btmx-prd.synchronoss.net (5.8.716.04) (authenticated as richard_c_haines@btinternet.com)
        id 613943C60B68E3C0; Thu, 25 Nov 2021 08:58:07 +0000
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     selinux@vger.kernel.org
Cc:     Richard Haines <richard_c_haines@btinternet.com>
Subject: [PATCH V2 testsuite] tests/inet_socket: Add socket transition tests
Date:   Thu, 25 Nov 2021 08:57:55 +0000
Message-Id: <20211125085755.3230-1-richard_c_haines@btinternet.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Add setsockcreatecon(3) and type_transition tests. Also test cipso
netlabelctl(8) domain:<domain> and label translation services, netlabel
fallback for ipv4 & ipv6 plus calipso domain:<domain>.

Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>
---
V2 Changes: Add additional tests for Netlabel Fallback IPv4 & IPv6 plus
CALIPSO domain:<domain> service.

 policy/test_inet_socket.te             |  81 ++++++++
 tests/inet_socket/calipso-domain-flush |   8 +
 tests/inet_socket/calipso-domain-load  |  10 +
 tests/inet_socket/cipso-domain-flush   |   8 +
 tests/inet_socket/cipso-domain-load    |  10 +
 tests/inet_socket/cipso-trans-flush    |   6 +
 tests/inet_socket/cipso-trans-load     |  10 +
 tests/inet_socket/client.c             | 226 ++++++++++++++++++++-
 tests/inet_socket/fb-deny-label-flush  |   6 +
 tests/inet_socket/fb-deny-label-load   |   8 +
 tests/inet_socket/fb-label-flush       |   6 +
 tests/inet_socket/fb-label-load        |   8 +
 tests/inet_socket/test                 | 262 ++++++++++++++++++++++++-
 13 files changed, 640 insertions(+), 9 deletions(-)
 create mode 100644 tests/inet_socket/calipso-domain-flush
 create mode 100644 tests/inet_socket/calipso-domain-load
 create mode 100644 tests/inet_socket/cipso-domain-flush
 create mode 100644 tests/inet_socket/cipso-domain-load
 create mode 100644 tests/inet_socket/cipso-trans-flush
 create mode 100644 tests/inet_socket/cipso-trans-load
 create mode 100644 tests/inet_socket/fb-deny-label-flush
 create mode 100644 tests/inet_socket/fb-deny-label-load
 create mode 100644 tests/inet_socket/fb-label-flush
 create mode 100644 tests/inet_socket/fb-label-load

diff --git a/policy/test_inet_socket.te b/policy/test_inet_socket.te
index 0fff2da..f65464e 100644
--- a/policy/test_inet_socket.te
+++ b/policy/test_inet_socket.te
@@ -15,9 +15,23 @@ corenet_inout_generic_node(netlabel_peer_t)
 # Do not break NFS when we load NetLabel configuration.
 gen_require(`
 	type kernel_t;
+	type nfsd_t;
 ')
+allow kernel_t netlabel_inet_peer_t:peer recv;
+allow kernel_t netlabel_deny_inet_peer_t:peer recv;
+allow nfsd_t netlabel_inet_peer_t:peer recv;
+allow nfsd_t netlabel_deny_inet_peer_t:peer recv;
 corenet_all_recvfrom_unlabeled(kernel_t)
 
+# Fallback labeling:
+type netlabel_inet_peer_t;
+corenet_in_generic_node(netlabel_inet_peer_t)
+corenet_in_generic_if(netlabel_inet_peer_t)
+# Deny Fallback:
+type netlabel_deny_inet_peer_t;
+corenet_inout_generic_node(netlabel_deny_inet_peer_t)
+corenet_inout_generic_if(netlabel_deny_inet_peer_t)
+
 # Domain for server process.
 type test_inet_server_t;
 domain_type(test_inet_server_t)
@@ -32,6 +46,8 @@ corenet_tcp_bind_all_nodes(test_inet_server_t)
 corenet_udp_bind_all_nodes(test_inet_server_t)
 corenet_inout_generic_if(test_inet_server_t)
 corenet_inout_generic_node(test_inet_server_t)
+#
+allow test_inet_server_t netlabel_inet_peer_t:peer recv;
 
 # For writing to flag file:
 allow test_inet_server_t test_file_t:fifo_file rw_file_perms;
@@ -57,6 +73,8 @@ allow test_inet_client_t self:udp_socket create_socket_perms;
 corenet_tcp_connect_all_unreserved_ports(test_inet_client_t)
 corenet_inout_generic_if(test_inet_client_t)
 corenet_inout_generic_node(test_inet_client_t)
+#
+allow test_inet_client_t netlabel_inet_peer_t:peer recv;
 
 # The server can receive labeled packets from the client.
 allow test_inet_server_t test_inet_client_t:peer recv;
@@ -167,6 +185,69 @@ allow unconfined_t test_server_packet_t:packet relabelto;
 allow test_inet_server_t test_server_packet_t:packet { send recv };
 allow test_inet_client_t test_server_packet_t:packet { send recv };
 
+#
+# Test client setting new socket context using setsockcreatecon(3) and
+# type_transition rules.
+#
+
+# Set new client socket context using setsockcreatecon(3):
+type inet_client_setsockcreatecon_t;
+domain_type(inet_client_setsockcreatecon_t)
+unconfined_runs_test(inet_client_setsockcreatecon_t)
+typeattribute inet_client_setsockcreatecon_t testdomain;
+typeattribute inet_client_setsockcreatecon_t inetsocketdomain;
+allow test_inet_client_t inet_client_setsockcreatecon_t:tcp_socket create_stream_socket_perms;
+allow test_inet_client_t inet_client_setsockcreatecon_t:udp_socket create_stream_socket_perms;
+corenet_tcp_connect_all_unreserved_ports(inet_client_setsockcreatecon_t)
+corenet_inout_generic_if(inet_client_setsockcreatecon_t)
+corenet_inout_generic_node(inet_client_setsockcreatecon_t)
+# The server can receive labeled packets from the client.
+allow test_inet_server_t inet_client_setsockcreatecon_t:peer recv;
+# And vice versa.
+allow inet_client_setsockcreatecon_t test_inet_server_t:peer recv;
+allow inet_client_setsockcreatecon_t netlabel_inet_peer_t:peer recv;
+
+# Set new client socket context using a type_transition rule:
+type test_inet_new_type_client_t;
+domain_type(test_inet_new_type_client_t)
+unconfined_runs_test(test_inet_new_type_client_t)
+typeattribute test_inet_new_type_client_t testdomain;
+typeattribute test_inet_new_type_client_t inetsocketdomain;
+
+type inet_client_type_transition_t;
+type_transition test_inet_new_type_client_t test_inet_new_type_client_t:tcp_socket inet_client_type_transition_t;
+type_transition test_inet_new_type_client_t test_inet_new_type_client_t:udp_socket inet_client_type_transition_t;
+unconfined_runs_test(inet_client_type_transition_t)
+typeattribute inet_client_type_transition_t inetsocketdomain;
+
+allow test_inet_new_type_client_t inet_client_type_transition_t:tcp_socket create_stream_socket_perms;
+allow test_inet_new_type_client_t inet_client_type_transition_t:udp_socket create_stream_socket_perms;
+corenet_tcp_connect_all_unreserved_ports(inet_client_type_transition_t)
+corenet_inout_generic_if(inet_client_type_transition_t)
+corenet_inout_generic_node(inet_client_type_transition_t)
+# The server can receive labeled packets from the client.
+allow test_inet_server_t inet_client_type_transition_t:peer recv;
+# And vice versa.
+allow inet_client_type_transition_t test_inet_server_t:peer recv;
+allow inet_client_type_transition_t netlabel_peer_t:peer recv;
+allow inet_client_type_transition_t netlabel_inet_peer_t:peer recv;
+
+# Test deny socket { create } after setsockcreatecon(3):
+type test_inet_deny_setsockcreatecon_t;
+domain_type(test_inet_deny_setsockcreatecon_t)
+unconfined_runs_test(test_inet_deny_setsockcreatecon_t)
+typeattribute test_inet_deny_setsockcreatecon_t testdomain;
+typeattribute test_inet_deny_setsockcreatecon_t inetsocketdomain;
+
+# Test deny socket { create } after type_transition rule:
+type test_inet_deny_type_transition_t;
+domain_type(test_inet_deny_type_transition_t)
+unconfined_runs_test(test_inet_deny_type_transition_t)
+typeattribute test_inet_deny_type_transition_t testdomain;
+typeattribute test_inet_deny_type_transition_t inetsocketdomain;
+type_transition test_inet_deny_type_transition_t test_inet_deny_type_transition_t:tcp_socket inet_client_type_transition_t;
+type_transition test_inet_deny_type_transition_t test_inet_deny_type_transition_t:udp_socket inet_client_type_transition_t;
+
 #
 # Common rules for all inet socket test domains.
 #
diff --git a/tests/inet_socket/calipso-domain-flush b/tests/inet_socket/calipso-domain-flush
new file mode 100644
index 0000000..1ef5969
--- /dev/null
+++ b/tests/inet_socket/calipso-domain-flush
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+netlabelctl map del default
+netlabelctl calipso del doi:1
+netlabelctl map del domain:test_inet_client_t
+netlabelctl map del domain:inet_client_setsockcreatecon_t
+netlabelctl map del domain:inet_client_type_transition_t
+netlabelctl map add default protocol:unlbl
diff --git a/tests/inet_socket/calipso-domain-load b/tests/inet_socket/calipso-domain-load
new file mode 100644
index 0000000..2eab65e
--- /dev/null
+++ b/tests/inet_socket/calipso-domain-load
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+netlabelctl calipso add pass doi:1
+netlabelctl map del default
+netlabelctl map add default address:0.0.0.0/0 protocol:unlbl
+netlabelctl map add default address:::/0 protocol:unlbl
+netlabelctl map add domain:test_inet_client_t address:::1 protocol:calipso,1
+# Note that it is the socket context that matters here not process context:
+netlabelctl map add domain:inet_client_setsockcreatecon_t address:::1 protocol:calipso,1
+netlabelctl map add domain:inet_client_type_transition_t address:::1 protocol:calipso,1
diff --git a/tests/inet_socket/cipso-domain-flush b/tests/inet_socket/cipso-domain-flush
new file mode 100644
index 0000000..f391c08
--- /dev/null
+++ b/tests/inet_socket/cipso-domain-flush
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+netlabelctl map del default
+netlabelctl cipso del doi:65535
+netlabelctl map del domain:test_inet_client_t
+netlabelctl map del domain:inet_client_setsockcreatecon_t
+netlabelctl map del domain:inet_client_type_transition_t
+netlabelctl map add default protocol:unlbl
diff --git a/tests/inet_socket/cipso-domain-load b/tests/inet_socket/cipso-domain-load
new file mode 100644
index 0000000..81575c7
--- /dev/null
+++ b/tests/inet_socket/cipso-domain-load
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+netlabelctl cipso add pass doi:65535 tags:1
+netlabelctl map del default
+netlabelctl map add default address:0.0.0.0/0 protocol:unlbl
+netlabelctl map add default address:::/0 protocol:unlbl
+netlabelctl map add domain:test_inet_client_t address:127.0.0.1 protocol:cipso,65535
+# Note that it is the socket context that matters here not process context:
+netlabelctl map add domain:inet_client_setsockcreatecon_t address:127.0.0.1 protocol:cipso,65535
+netlabelctl map add domain:inet_client_type_transition_t address:127.0.0.1 protocol:cipso,65535
diff --git a/tests/inet_socket/cipso-trans-flush b/tests/inet_socket/cipso-trans-flush
new file mode 100644
index 0000000..6b517df
--- /dev/null
+++ b/tests/inet_socket/cipso-trans-flush
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+netlabelctl map del default
+netlabelctl cipso del doi:16
+netlabelctl cipso del doi:4294967295
+netlabelctl map add default protocol:unlbl
diff --git a/tests/inet_socket/cipso-trans-load b/tests/inet_socket/cipso-trans-load
new file mode 100644
index 0000000..964c178
--- /dev/null
+++ b/tests/inet_socket/cipso-trans-load
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+netlabelctl cipso add trans doi:16 tags:1 levels:0=0 categories:0=1,2=3
+# Use the largest DOI possible:
+netlabelctl cipso add pass doi:4294967295 tags:1
+netlabelctl map del default
+netlabelctl map add default address:0.0.0.0/0 protocol:unlbl
+netlabelctl map add default address:::/0 protocol:unlbl
+netlabelctl map add default address:127.0.0.1 protocol:cipso,16
+netlabelctl map add default address:10.123.123.123 protocol:cipso,4294967295
diff --git a/tests/inet_socket/client.c b/tests/inet_socket/client.c
index f8780d9..b10db38 100644
--- a/tests/inet_socket/client.c
+++ b/tests/inet_socket/client.c
@@ -15,15 +15,22 @@
 #include <poll.h>
 #include <stdbool.h>
 #include <selinux/selinux.h>
+#include <selinux/context.h>
 
 void usage(char *progname)
 {
 	fprintf(stderr,
-		"usage:  %s [-e expected_msg] [stream|dgram] addr port\n"
+		"usage:  %s [-e expected_msg] [-s] [-o ip_option] [-t type] [-c type] [stream|dgram] addr port\n"
 		"\nWhere:\n\t"
 		"-e      Optional expected message from server e.g. \"nopeer\".\n\t"
 		"        If not present the client context will be used as a\n\t"
 		"        comparison with the servers reply.\n\t"
+		"-s      If -e is not set the client process context is used\n\t"
+		"        for comparison, however if setsockcreatecon(3) or a\n\t"
+		"        type_transition rule are enabled, use the socket context.\n\t"
+		"-o      Expected IP option string.\n\t"
+		"-t      New type for setsockcreatecon(3) test.\n\t"
+		"-c      Compare type expected on socket.\n\t"
 		"stream  Use TCP protocol or:\n\t"
 		"dgram   use UDP protocol.\n\t"
 		"addr    IPv4 or IPv6 address (e.g. 127.0.0.1 or ::1)\n\t"
@@ -31,18 +38,199 @@ void usage(char *progname)
 	exit(1);
 }
 
+char *get_ip_option(int fd, bool ipv4, socklen_t *opt_len)
+{
+	int result, i;
+	unsigned char ip_options[1024];
+	socklen_t len = sizeof(ip_options);
+	char *ip_optbuf;
+
+	if (ipv4)
+		result = getsockopt(fd, IPPROTO_IP, IP_OPTIONS,
+				    ip_options, &len);
+	else
+		result = getsockopt(fd, IPPROTO_IPV6, IPV6_HOPOPTS,
+				    ip_options, &len);
+
+	if (result < 0) {
+		perror("get ip options error");
+		return NULL;
+	}
+
+	ip_optbuf = calloc(1, len * 2 + 1);
+	if (!ip_optbuf) {
+		perror("get ip options malloc error");
+		return NULL;
+	}
+
+	if (len > 0) {
+		for (i = 0; i < len; i++)
+			sprintf(&ip_optbuf[i * 2], "%02x", ip_options[i]);
+
+		*opt_len = len;
+		return ip_optbuf;
+	}
+
+	return NULL;
+}
+
+void check_ip_option(int fd, bool ipv4, char *text, char *expected)
+{
+	char *ip_options;
+	socklen_t len;
+
+	ip_options = get_ip_option(fd, ipv4, &len);
+
+	if (ip_options) {
+		printf("%s IP Options Family: %s Length: %d\n\tEntry: %s\n",
+		       text, ipv4 ? "IPv4" : "IPv6", len, ip_options);
+		if (expected) {
+			if (strcmp(expected, ip_options)) {
+				fprintf(stderr, "Expected options: %s, got: %s\n",
+					expected, ip_options);
+				exit(20);
+			}
+		}
+		free(ip_options);
+	} else {
+		printf("%s No IP Options set\n", text);
+	}
+}
+
+/* Build new context for socket and set using setsockcreatecon(3) */
+static void set_newsock_con(char *type)
+{
+	int result;
+	char *context, *newcon = NULL;
+	context_t con_t;
+
+	result = getcon(&context);
+	if (result < 0) {
+		fprintf(stderr, "Failed to get process context\n");
+		exit(30);
+	}
+
+	con_t = context_new(context);
+	if (!con_t) {
+		fprintf(stderr, "Unable to create context structure\n");
+		result = -1;
+		goto err2;
+	}
+
+	result = context_type_set(con_t, type);
+	if (result < 0) {
+		fprintf(stderr, "Unable to set new socket type\n");
+		goto err1;
+	}
+
+	newcon = context_str(con_t);
+	if (!newcon) {
+		fprintf(stderr, "Unable to set new socket context string\n");
+		result = -1;
+		goto err1;
+	}
+
+	result = setsockcreatecon_raw(newcon);
+	if (result < 0) {
+		fprintf(stderr, "Failed setsockcreatecon(3) context: %s\n", newcon);
+		goto err;
+	}
+
+	result = getsockcreatecon_raw(&context);
+	if (result < 0) {
+		fprintf(stderr, "Failed getsockcreatecon(3)\n");
+		goto err;
+	}
+	printf("New socket context: %s\n", context);
+
+err:
+	free(newcon);
+err1:
+	free(con_t);
+err2:
+	free(context);
+
+	if (result < 0)
+		exit(31);
+}
+
+static void check_sock_type(int fd, char *expected)
+{
+	char *context;
+	const char *type;
+	context_t con_t;
+	int result;
+
+	result = getcon(&context);
+	if (result < 0) {
+		fprintf(stderr, "Failed to get process context\n");
+		exit(40);
+	}
+	printf("Client process context: %s\n", context);
+	free(context);
+
+	result = fgetfilecon(fd, &context);
+	if (result < 0) {
+		fprintf(stderr, "Failed to get socket context\n");
+		exit(41);
+	}
+	printf("Client socket context: %s\n", context);
+
+	if (expected) {
+		result = -1;
+		con_t = context_new(context);
+		if (!con_t) {
+			fprintf(stderr, "Unable to create context structure\n");
+			goto err;
+		}
+
+		type = context_type_get(con_t);
+		if (!type) {
+			fprintf(stderr, "Unable to get socket type\n");
+			free(con_t);
+			goto err;
+		}
+
+		result = 0;
+		if (strcmp(expected, type)) {
+			fprintf(stderr, "Expected socket type: %s, got: %s\n",
+				expected, type);
+			result = -1;
+		}
+	}
+err:
+	free(context);
+
+	if (result < 0)
+		exit(42);
+}
+
 int main(int argc, char **argv)
 {
 	char byte, label[256], *expected = NULL;
+	char *sock_type = NULL, *chk_type = NULL, *chk_option = NULL;
 	int sock, result, opt;
+	bool ipv4 = false, get_sock_ctx = false;
 	struct addrinfo hints, *serverinfo;
 	struct timeval tm;
 
-	while ((opt = getopt(argc, argv, "e:")) != -1) {
+	while ((opt = getopt(argc, argv, "e:so:t:c:")) != -1) {
 		switch (opt) {
 		case 'e':
 			expected = optarg;
 			break;
+		case 's':
+			get_sock_ctx = true;
+			break;
+		case 'o':
+			chk_option = optarg;
+			break;
+		case 't':
+			sock_type = optarg;
+			break;
+		case 'c':
+			chk_type = optarg;
+			break;
 		default:
 			usage(argv[0]);
 		}
@@ -70,6 +258,13 @@ int main(int argc, char **argv)
 		exit(2);
 	}
 
+	if (serverinfo->ai_family == AF_INET)
+		ipv4 = true;
+
+	/* If -t option - setsockcreatecon(3) */
+	if (sock_type)
+		set_newsock_con(sock_type);
+
 	sock = socket(serverinfo->ai_family, serverinfo->ai_socktype,
 		      serverinfo->ai_protocol);
 	if (sock < 0) {
@@ -77,6 +272,11 @@ int main(int argc, char **argv)
 		exit(3);
 	}
 
+	/* Check context if type_transition rule (-c), also if test run local,
+	 * display both contexts
+	 */
+	check_sock_type(sock, chk_type);
+
 	tm.tv_sec = 5;
 	tm.tv_usec = 0;
 	result = setsockopt(sock, SOL_SOCKET, SO_SNDTIMEO, &tm, sizeof(tm));
@@ -124,12 +324,24 @@ int main(int argc, char **argv)
 	}
 	label[result] = 0;
 
+	if (chk_option)
+		check_ip_option(sock, ipv4, "Client read", chk_option);
+
 	if (!expected) {
-		result = getcon(&expected);
-		if (result < 0) {
-			perror("getcon");
-			close(sock);
-			exit(10);
+		if (get_sock_ctx) {
+			result = fgetfilecon(sock, &expected);
+			if (result < 0) {
+				perror("fgetfilecon");
+				close(sock);
+				exit(10);
+			}
+		} else {
+			result = getcon(&expected);
+			if (result < 0) {
+				perror("getcon");
+				close(sock);
+				exit(10);
+			}
 		}
 	}
 
diff --git a/tests/inet_socket/fb-deny-label-flush b/tests/inet_socket/fb-deny-label-flush
new file mode 100644
index 0000000..b769c63
--- /dev/null
+++ b/tests/inet_socket/fb-deny-label-flush
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+netlabelctl map del default
+netlabelctl map add default protocol:unlbl
+netlabelctl unlbl del interface:lo address:127.0.0.0/8 label:system_u:object_r:netlabel_inet_peer_t:s0
+netlabelctl unlbl del interface:lo address:::1/128 label:system_u:object_r:netlabel_deny_inet_peer_t:s0
diff --git a/tests/inet_socket/fb-deny-label-load b/tests/inet_socket/fb-deny-label-load
new file mode 100644
index 0000000..486022a
--- /dev/null
+++ b/tests/inet_socket/fb-deny-label-load
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+# Fallback labeling
+netlabelctl map del default
+netlabelctl map add default address:0.0.0.0/0 protocol:unlbl
+netlabelctl map add default address:::/0 protocol:unlbl
+netlabelctl unlbl add interface:lo address:127.0.0.0/8 label:system_u:object_r:netlabel_inet_peer_t:s0
+netlabelctl unlbl add interface:lo address:::1/128 label:system_u:object_r:netlabel_deny_inet_peer_t:s0
diff --git a/tests/inet_socket/fb-label-flush b/tests/inet_socket/fb-label-flush
new file mode 100644
index 0000000..ca069c0
--- /dev/null
+++ b/tests/inet_socket/fb-label-flush
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+netlabelctl map del default
+netlabelctl map add default protocol:unlbl
+netlabelctl unlbl del interface:lo address:127.0.0.0/8 label:system_u:object_r:netlabel_inet_peer_t:s0
+netlabelctl unlbl del interface:lo address:::1/128 label:system_u:object_r:netlabel_inet_peer_t:s0
diff --git a/tests/inet_socket/fb-label-load b/tests/inet_socket/fb-label-load
new file mode 100644
index 0000000..6523099
--- /dev/null
+++ b/tests/inet_socket/fb-label-load
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+# Fallback labeling
+netlabelctl map del default
+netlabelctl map add default address:0.0.0.0/0 protocol:unlbl
+netlabelctl map add default address:::/0 protocol:unlbl
+netlabelctl unlbl add interface:lo address:127.0.0.0/8 label:system_u:object_r:netlabel_inet_peer_t:s0
+netlabelctl unlbl add interface:lo address:::1/128 label:system_u:object_r:netlabel_inet_peer_t:s0
diff --git a/tests/inet_socket/test b/tests/inet_socket/test
index f09b4e3..4a49323 100755
--- a/tests/inet_socket/test
+++ b/tests/inet_socket/test
@@ -5,7 +5,7 @@ BEGIN {
     $basedir = $0;
     $basedir =~ s|(.*)/[^/]*|$1|;
 
-    $test_count = 30;
+    $test_count = 56;
 
     $test_ipsec = 0;
     if ( system("ip xfrm policy help 2>&1 | grep -q ctx") eq 0 ) {
@@ -23,7 +23,7 @@ BEGIN {
 
     $rc = `$basedir/../kvercmp $kvercur $kverminstream`;
     if ( $netlabelctl gt "021" and $rc > 0 ) {
-        $test_count += 3;
+        $test_count += 9;
         $test_calipso_stream = 1;
     }
 
@@ -45,6 +45,11 @@ BEGIN {
         $test_nft = 1;
     }
 
+    # Set up a GRE tunnel over loopback for testing cipso translate.
+    system "ip link add mygre type gretap local 127.0.0.1 remote 127.0.0.1";
+    system "ip addr add 10.123.123.123 dev mygre";
+    system "ip link set mygre up";
+
     plan tests => $test_count;
 }
 
@@ -71,6 +76,65 @@ sub server_end {
     system("rm -f $basedir/flag");
 }
 
+#
+# Test setting new socket contexts using setsockcreatecon(3) and
+# type_transition rules. Note that deny rules for these are only tested
+# once for each socket type (as for example they would never get as far
+# as testing cipso/calipso etc.).
+#
+# Test basics on stream
+$pid = server_start( "-t test_inet_server_t", "-n stream 65535" );
+
+# Set a new context on the socket using setsockcreatecon(3):
+$result = system
+"runcon -t test_inet_client_t -- $basedir/client -e nopeer -t inet_client_setsockcreatecon_t stream 127.0.0.1 65535";
+ok( $result eq 0 );
+
+# Deny socket { create } using setsockcreatecon(3):
+$result = system
+"runcon -t test_inet_deny_setsockcreatecon_t -- $basedir/client -e nopeer -t inet_client_setsockcreatecon_t stream 127.0.0.1 65535 2>&1";
+ok( $result >> 8 eq 3 );
+
+# Set a new context on the socket using type_transition rule, the -c option
+# checks and prints the new socket context:
+$result = system
+"runcon -t test_inet_new_type_client_t -- $basedir/client -e nopeer -c inet_client_type_transition_t stream 127.0.0.1 65535";
+ok( $result eq 0 );
+
+# Deny socket { create } using type_transition rule:
+$result = system
+"runcon -t test_inet_deny_type_transition_t -- $basedir/client -e nopeer stream 127.0.0.1 65535 2>&1";
+ok( $result >> 8 eq 3 );
+
+# Kill the server.
+server_end($pid);
+
+# Test basics on datagram
+$pid = server_start( "-t test_inet_server_t", "-n dgram 65535" );
+
+# Set a new context on the socket using setsockcreatecon(3):
+$result = system
+"runcon -t test_inet_client_t -- $basedir/client -e nopeer -t inet_client_setsockcreatecon_t dgram 127.0.0.1 65535";
+ok( $result eq 0 );
+
+# Deny socket { create } using setsockcreatecon(3):
+$result = system
+"runcon -t test_inet_deny_setsockcreatecon_t -- $basedir/client -e nopeer -t inet_client_setsockcreatecon_t dgram 127.0.0.1 65535 2>&1";
+ok( $result >> 8 eq 3 );
+
+# Set a new context on the socket using type_transition rule:
+$result = system
+"runcon -t test_inet_new_type_client_t -- $basedir/client -e nopeer -c inet_client_type_transition_t dgram 127.0.0.1 65535";
+ok( $result eq 0 );
+
+# Deny socket { create } using type_transition rule:
+$result = system
+"runcon -t test_inet_deny_type_transition_t -- $basedir/client -e nopeer dgram 127.0.0.1 65535 2>&1";
+ok( $result >> 8 eq 3 );
+
+# Kill the server.
+server_end($pid);
+
 # Load NetLabel configuration for full CIPSO/IPv4 labeling over loopback.
 system "/bin/sh $basedir/cipso-fl-load";
 
@@ -87,6 +151,18 @@ $result = system
 "runcon -t test_inet_bad_client_t -- $basedir/client stream 127.0.0.1 65535 2>&1";
 ok( $result >> 8 eq 5 );
 
+# Set a new context on socket using setsockcreatecon(3). Set -s to compare
+# client socket context, not the client process context.
+$result =
+  system
+"runcon -t test_inet_client_t -- $basedir/client -t inet_client_setsockcreatecon_t -s stream 127.0.0.1 65535";
+ok( $result eq 0 );
+
+# Set a new context on socket using type_transition rule.
+$result = system
+"runcon -t test_inet_new_type_client_t -- $basedir/client -s stream 127.0.0.1 65535";
+ok( $result eq 0 );
+
 # Kill the server.
 server_end($pid);
 
@@ -103,12 +179,148 @@ $result = system
 "runcon -t test_inet_bad_client_t -- $basedir/client dgram 127.0.0.1 65535 2>&1";
 ok( $result >> 8 eq 9 );
 
+# Set a new context on socket using setsockcreatecon(3).
+$result =
+  system
+"runcon -t test_inet_client_t -- $basedir/client -t inet_client_setsockcreatecon_t -s dgram 127.0.0.1 65535";
+ok( $result eq 0 );
+
+# Set a new context on socket using type_transition rule.
+$result = system
+"runcon -t test_inet_new_type_client_t -- $basedir/client -s dgram 127.0.0.1 65535";
+ok( $result eq 0 );
+
 # Kill the server.
 server_end($pid);
 
 # Flush NetLabel configuration.
 system "/bin/sh $basedir/cipso-fl-flush";
 
+# Load NetLabel configuration for CIPSO/IPv4 testing label translation.
+system "/bin/sh $basedir/cipso-trans-load";
+
+# Start the stream server with a defined level.
+$pid = server_start( "-t test_inet_server_t -l s0:c0,c2", "stream 65535" );
+
+# This is a translate over-the-wire of two cats:
+# trans doi:16 tags:1 levels:0=0 categories:0=1,2=3
+# The getsockopt(IP_OPTIONS) should be:
+# Type Len DOI          Tag Len Filler Sens Cats               cat:0123456..
+# 86   0b  00 00 00 10  01  05  00     00   5000 - This equates to 0101
+# The [-o option] compares with known string.
+$result = system
+"runcon -t test_inet_client_t -l s0:c0,c2 $basedir/client -e system_u:object_r:netlabel_peer_t:s0:c0,c2 -o 860b00000010010500005000 stream 127.0.0.1 65535";
+ok( $result eq 0 );
+
+# This does not use the translate option and therefore getsockopt(IP_OPTIONS):
+# Type Len DOI          Tag Len Filler Sens Cats               cat:0123456..
+# 86   0b  ff ff ff ff  01  05  00     00   a000 - This equates to 1010
+$result = system
+"runcon -t test_inet_client_t -l s0:c0,c2 $basedir/client -e system_u:object_r:netlabel_peer_t:s0:c0,c2 -o 860bffffffff01050000a000 stream 10.123.123.123 65535";
+ok( $result eq 0 );
+
+# Kill the server.
+server_end($pid);
+
+# Flush NetLabel configuration.
+system "/bin/sh $basedir/cipso-trans-flush";
+
+# Load NetLabel configuration for CIPSO/IPv4 testing domain:<domain> service
+system "/bin/sh $basedir/cipso-domain-load";
+
+# Start the stream server with a defined level.
+$pid = server_start( "-t test_inet_server_t -l s0:c20.c250", "stream 65535" );
+
+$result = system
+"runcon -t test_inet_client_t -l s0:c21.c31 $basedir/client -e system_u:object_r:netlabel_peer_t:s0:c21.c31 stream 127.0.0.1 65535";
+ok( $result eq 0 );
+
+# Set a new context on the socket using setsockcreatecon(3):
+$result = system
+"runcon -t test_inet_client_t -l s0:c21.c31 $basedir/client -e system_u:object_r:netlabel_peer_t:s0:c21.c31 -t inet_client_setsockcreatecon_t stream 127.0.0.1 65535";
+ok( $result eq 0 );
+
+# Set a new context on socket using type_transition rule:
+$result = system
+"runcon -t test_inet_new_type_client_t -l s0:c21.c31 $basedir/client -e system_u:object_r:netlabel_peer_t:s0:c21.c31 stream 127.0.0.1 65535";
+ok( $result eq 0 );
+
+# This fails with ENOENT on connect as no netlabel domain entry for this address:
+$result = system
+"runcon -t test_inet_client_t -l s0:c21.c31 $basedir/client -e system_u:object_r:netlabel_peer_t:s0:c21.c31 stream 10.123.123.123 65535 2>&1";
+ok( $result >> 8 eq 5 );
+
+# Kill the server.
+server_end($pid);
+
+# Flush NetLabel configuration.
+system "/bin/sh $basedir/cipso-domain-flush";
+
+# Test Netlabel Fallback IPv4 & IPv6. Note IPv6 datagram sockets are not yet
+# supported (see https://github.com/SELinuxProject/selinux-kernel/issues/24).
+system "/bin/sh $basedir/fb-label-load";
+$pid = server_start( "-t test_inet_server_t", "stream 65535" );
+
+# Verify that authorized client can communicate with the server.
+$result = system
+"runcon -t test_inet_client_t $basedir/client -e system_u:object_r:netlabel_inet_peer_t:s0 stream ::1 65535";
+ok( $result eq 0 );
+
+# Set a new context on the socket using setsockcreatecon(3):
+$result = system
+"runcon -t test_inet_client_t -- $basedir/client -e system_u:object_r:netlabel_inet_peer_t:s0 -t inet_client_setsockcreatecon_t stream 127.0.0.1 65535";
+ok( $result eq 0 );
+
+# Set a new context on the socket using type_transition rule, the -c option
+# checks and prints the new socket context:
+$result = system
+"runcon -t test_inet_new_type_client_t -- $basedir/client -e system_u:object_r:netlabel_inet_peer_t:s0 -c inet_client_type_transition_t stream 127.0.0.1 65535";
+ok( $result eq 0 );
+
+# Kill the server.
+server_end($pid);
+
+# Test fallback labeling on datagram
+$pid = server_start( "-t test_inet_server_t", "dgram 65535" );
+
+# Verify that authorized client can communicate with the server.
+$result = system
+"runcon -t test_inet_client_t $basedir/client -e system_u:object_r:netlabel_inet_peer_t:s0 dgram 127.0.0.1 65535";
+ok( $result eq 0 );
+
+# Set a new context on the socket using setsockcreatecon(3):
+$result = system
+"runcon -t test_inet_client_t -- $basedir/client -e system_u:object_r:netlabel_inet_peer_t:s0 -t inet_client_setsockcreatecon_t dgram 127.0.0.1 65535";
+ok( $result eq 0 );
+
+# Set a new context on the socket using type_transition rule:
+$result = system
+"runcon -t test_inet_new_type_client_t -- $basedir/client -e system_u:object_r:netlabel_inet_peer_t:s0 -c inet_client_type_transition_t dgram 127.0.0.1 65535";
+ok( $result eq 0 );
+
+# Kill the server.
+server_end($pid);
+
+system "/bin/sh $basedir/fb-label-flush";
+
+system "/bin/sh $basedir/fb-deny-label-load";
+$pid = server_start( "-t test_inet_server_t", "stream 65535" );
+
+# Verify that authorized client can communicate with the server.
+$result = system
+"runcon -t test_inet_client_t $basedir/client -e system_u:object_r:netlabel_inet_peer_t:s0 stream 127.0.0.1 65535";
+ok( $result eq 0 );
+
+# Deny server netlabel_deny_inet_peer_t, client times out.
+$result = system
+"runcon -t test_inet_client_t $basedir/client -e system_u:object_r:netlabel_deny_inet_peer_t:s0 stream ::1 65535 2>&1";
+ok( $result >> 8 eq 5 );
+
+# Kill the server.
+server_end($pid);
+
+system "/bin/sh $basedir/fb-deny-label-flush";
+
 # Load NetLabel configuration for CIPSO/IPv4 using TAG 1 over loopback.
 system "/bin/sh $basedir/cipso-load-t1";
 
@@ -461,10 +673,56 @@ if ($test_calipso_stream) {
 "runcon -t test_inet_client_t -l s0:c8.c12 -- $basedir/client stream ::1 65535 2>&1";
     ok( $result >> 8 eq 5 );
 
+    # Set a new context on the socket using setsockcreatecon(3):
+    $result = system
+"runcon -t test_inet_client_t -l s0:c0.c10 $basedir/client -e system_u:object_r:netlabel_peer_t:s0:c0.c10 -t inet_client_setsockcreatecon_t stream ::1 65535";
+    ok( $result eq 0 );
+
+    # Set a new context on the socket using type_transition rule, the -c option
+    # checks and prints the new socket context:
+    $result = system
+"runcon -t test_inet_new_type_client_t -l s0:c0.c10 $basedir/client -e system_u:object_r:netlabel_peer_t:s0:c0.c10 -c inet_client_type_transition_t stream ::1 65535";
+    ok( $result eq 0 );
+
     # Kill the stream server.
     server_end($pid);
 
     system "/bin/sh $basedir/calipso-flush";
+
+  # Load NetLabel configuration for CALIPSO/IPv6 testing domain:<domain> service
+    system "/bin/sh $basedir/calipso-domain-load";
+
+    # Start the stream server with a defined level.
+    $pid =
+      server_start( "-t test_inet_server_t -l s0:c20.c250", "stream 65535" );
+
+    $result = system
+"runcon -t test_inet_client_t -l s0:c21.c31 $basedir/client -e system_u:object_r:netlabel_peer_t:s0:c21.c31 stream ::1 65535";
+    ok( $result eq 0 );
+
+    # Set a new context on the socket using setsockcreatecon(3):
+    $result = system
+"runcon -t test_inet_client_t -l s0:c21.c31 $basedir/client -e system_u:object_r:netlabel_peer_t:s0:c21.c31 -t inet_client_setsockcreatecon_t stream ::1 65535";
+    ok( $result eq 0 );
+
+    # Set a new context on socket using type_transition rule:
+    $result = system
+"runcon -t test_inet_new_type_client_t -l s0:c21.c31 $basedir/client -e system_u:object_r:netlabel_peer_t:s0:c21.c31 stream ::1 65535";
+    ok( $result eq 0 );
+
+    # This fails with ENOENT on connect as no netlabel domain entry
+    # for this address:
+    $result = system
+"runcon -t test_inet_client_t -l s0:c21.c31 $basedir/client -e system_u:object_r:netlabel_peer_t:s0:c21.c31 stream 2000::1 65535 2>&1";
+    ok( $result >> 8 eq 5 );
+
+    # Kill the server.
+    server_end($pid);
+
+    # Flush NetLabel configuration.
+    system "/bin/sh $basedir/calipso-domain-flush";
 }
 
+system "ip link del mygre";
+
 exit;
-- 
2.33.1

