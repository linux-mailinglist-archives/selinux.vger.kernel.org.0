Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB8BB48D9D3
	for <lists+selinux@lfdr.de>; Thu, 13 Jan 2022 15:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235707AbiAMOjx (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 13 Jan 2022 09:39:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51676 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235712AbiAMOjw (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 13 Jan 2022 09:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642084791;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=osXpuYKejL2f9CRoJUegPCwBj2q8xXH+jBmHRSpA2xM=;
        b=Ekg61R1VHRNRieUWbnJFZe4NCCZTNan8lTIXfy352tt7C32EQMbnScbYkDbLbXsquPZhcR
        K+vl/Xt1tDKU7hy3i2IXidm3TOA97drmjjE1eW/KEcfWtiT8sIahtVPgTaVn6JzadUnmSv
        kyhui4rRU6ccvwuYBZ0rNN5ImOfWJI4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-Du9It-x1O4SdPZVIpHsnKg-1; Thu, 13 Jan 2022 09:39:50 -0500
X-MC-Unique: Du9It-x1O4SdPZVIpHsnKg-1
Received: by mail-ed1-f71.google.com with SMTP id m16-20020a056402431000b003fb60bbe0e2so5519537edc.3
        for <selinux@vger.kernel.org>; Thu, 13 Jan 2022 06:39:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=osXpuYKejL2f9CRoJUegPCwBj2q8xXH+jBmHRSpA2xM=;
        b=nI7KgShB9OENWY2xhwIiLmu/Xn6HvCnHVA/eA/Vzb0OjjzOieJNarshWcgaxvM19JZ
         gmf8IMwXhlO6+W6Cbe0GJJoC8XGFXTV/F3mBOtU4TmjtT+CafqAjLay39l/jm5D4CxD+
         u2I2yqzLRl5Ggt7Vzw580xSwzgWkDqpEvEX2d433sFfXF+OKOYAxOPbsbY5iFVMOrRIM
         ryAjLmbZXaY5aSJ5MGNBs6t2FxT7cQB+qtSdRLlvVM7eLBfeVU7+OmjomnV7Z4Tdn/N6
         fWvVxJmfn9ClnE/RQTNT1D05TuW+T0yxr7d6Zd47zrzb4XWkt0DkmmCzP8FbdRAL3kAe
         Zq3Q==
X-Gm-Message-State: AOAM530B3fD+ekkWaP6seMfQstK/WFfE0I5STCXckcoNWkFfVvcA7UvJ
        nVG60HAMsgJuRBVSUm+RsGr4QTZWTVCgNS0apSDsBDI/X27NqdM52vaZGrV5Cn5BudjEKo7uiQ0
        8Ajd9rxrSuQwIjoLFcxaF/dmaDOFDKCo4Fo3/n2rXyPHJ3FOYMpHt0xGEG7jrPGqVtkd0sg==
X-Received: by 2002:a17:906:a15a:: with SMTP id bu26mr3694563ejb.335.1642084788086;
        Thu, 13 Jan 2022 06:39:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0MBQbtvgT0mOn91mEOrsFcB5mDo0H8jFHesPMKebvsVTq7QcyS3WXPXeAaN13jLxFP8bIzA==
X-Received: by 2002:a17:906:a15a:: with SMTP id bu26mr3694520ejb.335.1642084787259;
        Thu, 13 Jan 2022 06:39:47 -0800 (PST)
Received: from localhost.localdomain ([2a02:8308:b106:e300:d5c1:b1da:9874:b302])
        by smtp.gmail.com with ESMTPSA id sc7sm964242ejc.87.2022.01.13.06.39.46
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 06:39:46 -0800 (PST)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     selinux@vger.kernel.org
Subject: [RFC PATCH userspace 4/5] libsemanage: optionally rebuild policy when modules are changed externally
Date:   Thu, 13 Jan 2022 15:39:34 +0100
Message-Id: <20220113143935.195125-5-omosnace@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113143935.195125-1-omosnace@redhat.com>
References: <20220113143935.195125-1-omosnace@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

In Fedora/RHEL's selinux-policy package we ship a pre-built SELinux
policy store in the RPMs. When updating the main policy RPM, care must
be taken to rebuild the policy using `semodule -B` if there are any
other SELinux modules installed (whether shipped via another RPM or
manually installed locally).

However, this way of shipping/managing the policy creates complications
on systems, where system files are managed by rpm-ostree (such as Fedora
CoreOS or Red Hat CoreOS), where the "package update" process is more
sophisticated.

(Disclaimer: The following is written according to my current limited
understanding of rpm-ostree and may not be entirely accurate, but the
gist of it should match the reality.)

Basically, one can think of rpm-ostree as a kind of Git for system
files. The package content is provided on a "branch", where each
"commit" represents a set of package updates layered on top of the
previous commit (i.e. it is a rolling release with some defined
package content snapshots). The user can then maintain their own branch
with additional package updates/installations/... and "rebase" it on top
of the main branch as needed. On top of that, the user can also have
additional configuration files (or modifications to existing files) in
/etc, which represent an additional layer on top of the package content.

When updating the system (i.e. rebasing on a new "commit" of the "main
branch"), the files on the running system are not touched and the new
system state is prepared under a new root directory, which is chrooted
into on the next reboot.

When an rpm-ostree system is updated, there are three moments when the
SELinux module store needs to be rebuilt to ensure that all modules are
included in the binary policy:
1. When the local RPM installations are applied on top of the base
   system snapshot.
2. When local user configuartion is applied on top of that.
3. On system shutdown, to ensure that any changes in local configuration
   performed since (2.) are reflected in the final new system image.

Forcing a full rebuild at each step is not optimal and in many cases is
not necessary, as the user may not have any custom modules installed.

Thus, this patch extends libsemanage to compute a checksum of the
content of all enabled modules, which is stored in the store, and adds a
flag to the libsemanage handle that instructs it to skip rebuilding the
policy when the module content cheksum matches the one from the last
successful transaction and no other explicit changes are being done to
modules in the transaction itself.

This will allow rpm-ostree systems to potentially reduce delays when
reconciling the module store when applying updates.

I wasn't able to measure any noticeable overhead of the added hash
computation for every transaction (both before and after this change a
full policy rebuild took about 7 seconds on my test x86 VM). With the
new option check_ext_changes enabled, rebuilding a policy store with
unchanged modules took only about 0.96 seconds.

Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 libsemanage/include/semanage/handle.h |   5 +
 libsemanage/src/direct_api.c          | 301 +++++++++++++++++++-------
 libsemanage/src/handle.c              |  11 +-
 libsemanage/src/handle.h              |   1 +
 libsemanage/src/libsemanage.map       |   1 +
 libsemanage/src/semanage_store.c      |   1 +
 libsemanage/src/semanage_store.h      |   1 +
 7 files changed, 235 insertions(+), 86 deletions(-)

diff --git a/libsemanage/include/semanage/handle.h b/libsemanage/include/semanage/handle.h
index 946d69bc..0157be4f 100644
--- a/libsemanage/include/semanage/handle.h
+++ b/libsemanage/include/semanage/handle.h
@@ -66,6 +66,11 @@ extern void semanage_set_reload(semanage_handle_t * handle, int do_reload);
  * 1 for yes, 0 for no (default) */
 extern void semanage_set_rebuild(semanage_handle_t * handle, int do_rebuild);
 
+/* set whether to rebuild the policy on commit when potential changes
+ * to module files since last rebuild are detected,
+ * 1 for yes (default), 0 for no */
+extern void semanage_set_check_ext_changes(semanage_handle_t * handle, int do_check);
+
 /* Fills *compiler_path with the location of the hll compiler sh->conf->compiler_directory_path
  * corresponding to lang_ext.
  * Upon success returns 0, -1 on error. */
diff --git a/libsemanage/src/direct_api.c b/libsemanage/src/direct_api.c
index 7eb6938b..ca55df07 100644
--- a/libsemanage/src/direct_api.c
+++ b/libsemanage/src/direct_api.c
@@ -33,6 +33,8 @@
 #include <unistd.h>
 #include <sys/stat.h>
 #include <sys/types.h>
+#include <sys/mman.h>
+#include <sys/wait.h>
 #include <limits.h>
 #include <errno.h>
 #include <dirent.h>
@@ -56,8 +58,7 @@
 #include "semanage_store.h"
 #include "database_policydb.h"
 #include "policy.h"
-#include <sys/mman.h>
-#include <sys/wait.h>
+#include "sha256.h"
 
 #define PIPE_READ 0
 #define PIPE_WRITE 1
@@ -450,7 +451,7 @@ static int parse_module_headers(semanage_handle_t * sh, char *module_data,
 /* Writes a block of data to a file.  Returns 0 on success, -1 on
  * error. */
 static int write_file(semanage_handle_t * sh,
-		      const char *filename, char *data, size_t num_bytes)
+		      const char *filename, const char *data, size_t num_bytes)
 {
 	int out;
 
@@ -850,8 +851,21 @@ cleanup:
 	return ret;
 }
 
+static void update_checksum_with_len(Sha256Context *context, size_t s)
+{
+	int i;
+	uint8_t buffer[8];
+
+	for (i = 0; i < 8; i++) {
+		buffer[i] = s & 0xff;
+		s >>= 8;
+	}
+	Sha256Update(context, buffer, 8);
+}
+
 static int semanage_compile_module(semanage_handle_t *sh,
-				semanage_module_info_t *modinfo)
+				   semanage_module_info_t *modinfo,
+				   Sha256Context *context)
 {
 	char cil_path[PATH_MAX];
 	char hll_path[PATH_MAX];
@@ -922,6 +936,11 @@ static int semanage_compile_module(semanage_handle_t *sh,
 		goto cleanup;
 	}
 
+	if (context) {
+		update_checksum_with_len(context, cil_data_len);
+		Sha256Update(context, cil_data, cil_data_len);
+	}
+
 	status = write_compressed_file(sh, cil_path, cil_data, cil_data_len);
 	if (status == -1) {
 		ERR(sh, "Failed to write %s\n", cil_path);
@@ -950,18 +969,43 @@ cleanup:
 	return status;
 }
 
+static int modinfo_cmp(const void *a, const void *b)
+{
+	const semanage_module_info_t *ma = a;
+	const semanage_module_info_t *mb = b;
+
+	return strcmp(ma->name, mb->name);
+}
+
+static const char CHECKSUM_TYPE[] = "sha256";
+static const size_t CHECKSUM_CONTENT_SIZE = sizeof(CHECKSUM_TYPE) + 1 + 2 * SHA256_HASH_SIZE;
+
 static int semanage_compile_hll_modules(semanage_handle_t *sh,
-				semanage_module_info_t *modinfos,
-				int num_modinfos)
+					semanage_module_info_t *modinfos,
+					int num_modinfos,
+					char *cil_checksum)
 {
-	int status = 0;
-	int i;
+	/* to be incremented when checksum input data format changes */
+	static const size_t CHECKSUM_EPOCH = 1;
+
+	int i, status = 0;
 	char cil_path[PATH_MAX];
 	struct stat sb;
+	Sha256Context context;
+	SHA256_HASH hash;
+	struct file_contents contents = {};
 
 	assert(sh);
 	assert(modinfos);
 
+	/* Sort modules by name to get consistent ordering. */
+	qsort(modinfos, num_modinfos, sizeof(*modinfos), &modinfo_cmp);
+
+	Sha256Initialise(&context);
+	update_checksum_with_len(&context, CHECKSUM_EPOCH);
+
+	/* prefix with module count to avoid collisions */
+	update_checksum_with_len(&context, num_modinfos);
 	for (i = 0; i < num_modinfos; i++) {
 		status = semanage_module_get_path(
 				sh,
@@ -969,31 +1013,107 @@ static int semanage_compile_hll_modules(semanage_handle_t *sh,
 				SEMANAGE_MODULE_PATH_CIL,
 				cil_path,
 				sizeof(cil_path));
-		if (status != 0) {
-			goto cleanup;
-		}
+		if (status != 0)
+			return -1;
 
-		if (semanage_get_ignore_module_cache(sh) == 0 &&
-				(status = stat(cil_path, &sb)) == 0) {
-			continue;
-		}
-		if (status != 0 && errno != ENOENT) {
-			ERR(sh, "Unable to access %s: %s\n", cil_path, strerror(errno));
-			goto cleanup; //an error in the "stat" call
+		if (!semanage_get_ignore_module_cache(sh)) {
+			status = stat(cil_path, &sb);
+			if (status == 0) {
+				status = map_compressed_file(sh, cil_path, &contents);
+				if (status < 0) {
+					ERR(sh, "Error mapping file: %s", cil_path);
+					return -1;
+				}
+
+				/* prefix with length to avoid collisions */
+				update_checksum_with_len(&context, contents.len);
+				Sha256Update(&context, contents.data, contents.len);
+
+				unmap_compressed_file(&contents);
+				continue;
+			} else if (errno != ENOENT) {
+				ERR(sh, "Unable to access %s: %s\n", cil_path,
+				    strerror(errno));
+				return -1; //an error in the "stat" call
+			}
 		}
 
-		status = semanage_compile_module(sh, &modinfos[i]);
-		if (status < 0) {
-			goto cleanup;
+		status = semanage_compile_module(sh, &modinfos[i], &context);
+		if (status < 0)
+			return -1;
+	}
+	Sha256Finalise(&context, &hash);
+
+	cil_checksum += sprintf(cil_checksum, "%s:", CHECKSUM_TYPE);
+	for (i = 0; i < SHA256_HASH_SIZE; i++) {
+		cil_checksum += sprintf(cil_checksum, "%02x",
+					(unsigned)hash.bytes[i]);
+	}
+	return 0;
+}
+
+static int semanage_compare_checksum(semanage_handle_t *sh, const char *reference)
+{
+	const char *path = semanage_path(SEMANAGE_TMP, SEMANAGE_MODULES_CHECKSUM);
+	struct stat sb;
+	int fd, retval;
+	char *data;
+
+	fd = open(path, O_RDONLY);
+	if (fd == -1) {
+		if (errno != ENOENT) {
+			ERR(sh, "Unable to open %s: %s\n", path, strerror(errno));
+			return -1;
 		}
+		/* Checksum file not present - force a rebuild. */
+		return 1;
+	}
+
+	if (fstat(fd, &sb) == -1) {
+		ERR(sh, "Unable to stat %s\n", path);
+		retval = -1;
+		goto out_close;
 	}
 
-	status = 0;
+	if (sb.st_size != CHECKSUM_CONTENT_SIZE) {
+		/* Incompatible/invalid hash type - just force a rebuild. */
+		WARN(sh, "Module checksum invalid - forcing a rebuild\n");
+		retval = 1;
+		goto out_close;
+	}
 
-cleanup:
-	return status;
+	data = mmap(NULL, CHECKSUM_CONTENT_SIZE, PROT_READ, MAP_PRIVATE, fd, 0);
+	if (data == MAP_FAILED) {
+		ERR(sh, "Unable to mmap %s\n", path);
+		retval = -1;
+		goto out_close;
+	}
+
+	retval = memcmp(data, reference, CHECKSUM_CONTENT_SIZE) != 0;
+	munmap(data, sb.st_size);
+out_close:
+	close(fd);
+	return retval;
 }
 
+static int semanage_write_modules_checksum(semanage_handle_t *sh,
+					   const char *checksum)
+{
+	const char *path = semanage_path(SEMANAGE_TMP, SEMANAGE_MODULES_CHECKSUM);
+
+	return write_file(sh, path, checksum, CHECKSUM_CONTENT_SIZE);
+}
+
+/* Files that must exist in order to skip policy rebuild. */
+static const int semanage_computed_files[] = {
+	SEMANAGE_STORE_KERNEL,
+	SEMANAGE_STORE_FC,
+	SEMANAGE_STORE_SEUSERS,
+	SEMANAGE_LINKED,
+	SEMANAGE_SEUSERS_LINKED,
+	SEMANAGE_USERS_EXTRA_LINKED
+};
+
 /* Copies a file from src to dst. If dst already exists then
  * overwrite it. If source doesn't exist then return success.
  * Returns 0 on success, -1 on error. */
@@ -1020,8 +1140,9 @@ static int semanage_direct_commit(semanage_handle_t * sh)
 	semanage_module_info_t *modinfos = NULL;
 	mode_t mask = umask(0077);
 	struct stat sb;
+	char modules_checksum[CHECKSUM_CONTENT_SIZE];
 
-	int do_rebuild, do_write_kernel, do_install;
+	int force_rebuild, do_rebuild, do_write_kernel, do_install;
 	int fcontexts_modified, ports_modified, seusers_modified,
 		disable_dontaudit, preserve_tunables, ibpkeys_modified,
 		ibendports_modified;
@@ -1053,16 +1174,24 @@ static int semanage_direct_commit(semanage_handle_t * sh)
 	seusers_modified = seusers->dtable->is_modified(seusers->dbase);
 	fcontexts_modified = fcontexts->dtable->is_modified(fcontexts->dbase);
 
+	/* Before we do anything else, flush the join to its component parts.
+	 * This *does not* flush to disk automatically */
+	if (users->dtable->is_modified(users->dbase)) {
+		retval = users->dtable->flush(sh, users->dbase);
+		if (retval < 0)
+			goto cleanup;
+	}
+
 	/* Rebuild if explicitly requested or any module changes occurred. */
-	do_rebuild = sh->do_rebuild | sh->modules_modified;
+	force_rebuild = sh->modules_modified;
 
 	/* Create or remove the disable_dontaudit flag file. */
 	path = semanage_path(SEMANAGE_TMP, SEMANAGE_DISABLE_DONTAUDIT);
 	if (stat(path, &sb) == 0)
-		do_rebuild |= !(sepol_get_disable_dontaudit(sh->sepolh) == 1);
+		force_rebuild |= !(sepol_get_disable_dontaudit(sh->sepolh) == 1);
 	else if (errno == ENOENT) {
 		/* The file does not exist */
-		do_rebuild |= (sepol_get_disable_dontaudit(sh->sepolh) == 1);
+		force_rebuild |= (sepol_get_disable_dontaudit(sh->sepolh) == 1);
 	} else {
 		ERR(sh, "Unable to access %s: %s\n", path, strerror(errno));
 		retval = -1;
@@ -1090,10 +1219,10 @@ static int semanage_direct_commit(semanage_handle_t * sh)
 	/* Create or remove the preserve_tunables flag file. */
 	path = semanage_path(SEMANAGE_TMP, SEMANAGE_PRESERVE_TUNABLES);
 	if (stat(path, &sb) == 0)
-		do_rebuild |= !(sepol_get_preserve_tunables(sh->sepolh) == 1);
+		force_rebuild |= !(sepol_get_preserve_tunables(sh->sepolh) == 1);
 	else if (errno == ENOENT) {
 		/* The file does not exist */
-		do_rebuild |= (sepol_get_preserve_tunables(sh->sepolh) == 1);
+		force_rebuild |= (sepol_get_preserve_tunables(sh->sepolh) == 1);
 	} else {
 		ERR(sh, "Unable to access %s: %s\n", path, strerror(errno));
 		retval = -1;
@@ -1119,13 +1248,8 @@ static int semanage_direct_commit(semanage_handle_t * sh)
 		}
 	}
 
-	/* Before we do anything else, flush the join to its component parts.
-	 * This *does not* flush to disk automatically */
-	if (users->dtable->is_modified(users->dbase)) {
-		retval = users->dtable->flush(sh, users->dbase);
-		if (retval < 0)
-			goto cleanup;
-	}
+	if (force_rebuild)
+		goto rebuild;
 
 	/*
 	 * This is for systems that have already migrated with an older version
@@ -1135,70 +1259,66 @@ static int semanage_direct_commit(semanage_handle_t * sh)
 	 * in order to skip re-linking are present; otherwise, we force
 	 * a rebuild.
 	 */
-	if (!do_rebuild) {
-		int files[] = {SEMANAGE_STORE_KERNEL,
-					   SEMANAGE_STORE_FC,
-					   SEMANAGE_STORE_SEUSERS,
-					   SEMANAGE_LINKED,
-					   SEMANAGE_SEUSERS_LINKED,
-					   SEMANAGE_USERS_EXTRA_LINKED};
-
-		for (i = 0; i < (int) ARRAY_SIZE(files); i++) {
-			path = semanage_path(SEMANAGE_TMP, files[i]);
-			if (stat(path, &sb) != 0) {
-				if (errno != ENOENT) {
-					ERR(sh, "Unable to access %s: %s\n", path, strerror(errno));
-					retval = -1;
-					goto cleanup;
-				}
-
-				do_rebuild = 1;
-				goto rebuild;
+	for (i = 0; i < (int) ARRAY_SIZE(semanage_computed_files); i++) {
+		path = semanage_path(SEMANAGE_TMP, semanage_computed_files[i]);
+		if (stat(path, &sb) != 0) {
+			if (errno != ENOENT) {
+				ERR(sh, "Unable to access %s: %s\n", path, strerror(errno));
+				retval = -1;
+				goto cleanup;
 			}
+
+			force_rebuild = 1;
+			goto rebuild;
 		}
 	}
 
 rebuild:
-	/*
-	 * Now that we know whether or not a rebuild is required,
-	 * we can determine what else needs to be done.
-	 * We need to write the kernel policy if we are rebuilding
-	 * or if any other policy component that lives in the kernel
-	 * policy has been modified.
-	 * We need to install the policy files if any of the managed files
-	 * that live under /etc/selinux (kernel policy, seusers, file contexts)
-	 * will be modified.
-	 */
-	do_write_kernel = do_rebuild | ports_modified | ibpkeys_modified |
-		ibendports_modified |
-		bools->dtable->is_modified(bools->dbase) |
-		ifaces->dtable->is_modified(ifaces->dbase) |
-		nodes->dtable->is_modified(nodes->dbase) |
-		users->dtable->is_modified(users_base->dbase);
-	do_install = do_write_kernel | seusers_modified | fcontexts_modified;
-
-	/*
-	 * If there were policy changes, or explicitly requested, or
-	 * any required files are missing, rebuild the policy.
-	 */
-	if (do_rebuild) {
-		/* =================== Module expansion =============== */
+	do_rebuild = 0;
 
+	if (force_rebuild || sh->do_rebuild || sh->check_ext_changes) {
 		retval = semanage_get_active_modules(sh, &modinfos, &num_modinfos);
 		if (retval < 0) {
 			goto cleanup;
 		}
 
+		/* No modules - nothing to rebuild. */
 		if (num_modinfos == 0) {
 			goto cleanup;
 		}
 
-		retval = semanage_compile_hll_modules(sh, modinfos, num_modinfos);
+		retval = semanage_compile_hll_modules(sh, modinfos, num_modinfos,
+						      modules_checksum);
 		if (retval < 0) {
 			ERR(sh, "Failed to compile hll files into cil files.\n");
 			goto cleanup;
 		}
 
+		if (force_rebuild) {
+			do_rebuild = 1;
+		} else if (sh->check_ext_changes) {
+			retval = semanage_compare_checksum(sh, modules_checksum);
+			if (retval < 0)
+				goto cleanup;
+			do_rebuild = retval;
+		} else if (sh->do_rebuild) {
+			do_rebuild = 1;
+		}
+
+		retval = semanage_write_modules_checksum(sh, modules_checksum);
+		if (retval < 0) {
+			ERR(sh, "Failed to write module checksum file.\n");
+			goto cleanup;
+		}
+	}
+
+	/*
+	 * If there were policy changes, or explicitly requested, or
+	 * any required files are missing, rebuild the policy.
+	 */
+	if (do_rebuild) {
+		/* =================== Module expansion =============== */
+
 		retval = semanage_get_cil_paths(sh, modinfos, num_modinfos, &mod_filenames);
 		if (retval < 0)
 			goto cleanup;
@@ -1330,6 +1450,23 @@ rebuild:
 		}
 	}
 
+	/*
+	 * Determine what else needs to be done.
+	 * We need to write the kernel policy if we are rebuilding
+	 * or if any other policy component that lives in the kernel
+	 * policy has been modified.
+	 * We need to install the policy files if any of the managed files
+	 * that live under /etc/selinux (kernel policy, seusers, file contexts)
+	 * will be modified.
+	 */
+	do_write_kernel = do_rebuild | ports_modified | ibpkeys_modified |
+		ibendports_modified |
+		bools->dtable->is_modified(bools->dbase) |
+		ifaces->dtable->is_modified(ifaces->dbase) |
+		nodes->dtable->is_modified(nodes->dbase) |
+		users->dtable->is_modified(users_base->dbase);
+	do_install = do_write_kernel | seusers_modified | fcontexts_modified;
+
 	/* Attach our databases to the policydb we just created or loaded. */
 	dbase_policydb_attach((dbase_policydb_t *) pusers_base->dbase, out);
 	dbase_policydb_attach((dbase_policydb_t *) pports->dbase, out);
@@ -1704,7 +1841,7 @@ static int semanage_direct_extract(semanage_handle_t * sh,
 			goto cleanup;
 		}
 
-		rc = semanage_compile_module(sh, _modinfo);
+		rc = semanage_compile_module(sh, _modinfo, NULL);
 		if (rc < 0) {
 			goto cleanup;
 		}
diff --git a/libsemanage/src/handle.c b/libsemanage/src/handle.c
index bb1e6140..b2201ee3 100644
--- a/libsemanage/src/handle.c
+++ b/libsemanage/src/handle.c
@@ -116,20 +116,23 @@ semanage_handle_t *semanage_handle_create(void)
 
 void semanage_set_rebuild(semanage_handle_t * sh, int do_rebuild)
 {
-
 	assert(sh != NULL);
 
 	sh->do_rebuild = do_rebuild;
-	return;
 }
 
 void semanage_set_reload(semanage_handle_t * sh, int do_reload)
 {
-
 	assert(sh != NULL);
 
 	sh->do_reload = do_reload;
-	return;
+}
+
+void semanage_set_check_ext_changes(semanage_handle_t * sh, int do_check)
+{
+	assert(sh != NULL);
+
+	sh->check_ext_changes = do_check;
 }
 
 int semanage_get_hll_compiler_path(semanage_handle_t *sh,
diff --git a/libsemanage/src/handle.h b/libsemanage/src/handle.h
index e1ce83ba..4d2aae8f 100644
--- a/libsemanage/src/handle.h
+++ b/libsemanage/src/handle.h
@@ -61,6 +61,7 @@ struct semanage_handle {
 	int is_in_transaction;
 	int do_reload;		/* whether to reload policy after commit */
 	int do_rebuild;		/* whether to rebuild policy if there were no changes */
+	int check_ext_changes;	/* whether to rebuild if external changes are detected via checksum */
 	int commit_err;		/* set by semanage_direct_commit() if there are
 				 * any errors when building or committing the
 				 * sandbox to kernel policy at /etc/selinux
diff --git a/libsemanage/src/libsemanage.map b/libsemanage/src/libsemanage.map
index 00259fc8..c8214b26 100644
--- a/libsemanage/src/libsemanage.map
+++ b/libsemanage/src/libsemanage.map
@@ -348,4 +348,5 @@ LIBSEMANAGE_1.1 {
 
 LIBSEMANAGE_3.4 {
     semanage_module_compute_checksum;
+    semanage_set_check_ext_changes;
 } LIBSEMANAGE_1.1;
diff --git a/libsemanage/src/semanage_store.c b/libsemanage/src/semanage_store.c
index 633ee731..767f05cb 100644
--- a/libsemanage/src/semanage_store.c
+++ b/libsemanage/src/semanage_store.c
@@ -115,6 +115,7 @@ static const char *semanage_sandbox_paths[SEMANAGE_STORE_NUM_PATHS] = {
 	"/disable_dontaudit",
 	"/preserve_tunables",
 	"/modules/disabled",
+	"/modules_checksum",
 	"/policy.kern",
 	"/file_contexts.local",
 	"/file_contexts.homedirs",
diff --git a/libsemanage/src/semanage_store.h b/libsemanage/src/semanage_store.h
index b9ec5664..1fc77da8 100644
--- a/libsemanage/src/semanage_store.h
+++ b/libsemanage/src/semanage_store.h
@@ -60,6 +60,7 @@ enum semanage_sandbox_defs {
 	SEMANAGE_DISABLE_DONTAUDIT,
 	SEMANAGE_PRESERVE_TUNABLES,
 	SEMANAGE_MODULES_DISABLED,
+	SEMANAGE_MODULES_CHECKSUM,
 	SEMANAGE_STORE_KERNEL,
 	SEMANAGE_STORE_FC_LOCAL,
 	SEMANAGE_STORE_FC_HOMEDIRS,
-- 
2.34.1

