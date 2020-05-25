Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77A3C1E0F35
	for <lists+selinux@lfdr.de>; Mon, 25 May 2020 15:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390645AbgEYNPG (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 25 May 2020 09:15:06 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44384 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390626AbgEYNPG (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 25 May 2020 09:15:06 -0400
Received: from localhost (unknown [IPv6:2a01:c846:1:3b00:2cbe:34d2:771b:a46b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: andrewsh)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1E1EC2A10C1;
        Mon, 25 May 2020 14:15:04 +0100 (BST)
From:   Andrej Shadura <andrew.shadura@collabora.co.uk>
To:     selinux@vger.kernel.org
Subject: [PATCH] checkpolicy: Minor tweaks to the names of the contributors to the manpages
Date:   Mon, 25 May 2020 15:14:55 +0200
Message-Id: <20200525131455.634532-1-andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Spell Árpád’s name with the correct diacritics, put Olesya’s first name
in front of her last name.

Signed-off-by: Andrej Shadura <andrew.shadura@collabora.co.uk>
---
 checkpolicy/checkmodule.8    | 2 +-
 checkpolicy/checkpolicy.8    | 2 +-
 checkpolicy/ru/checkmodule.8 | 4 ++--
 checkpolicy/ru/checkpolicy.8 | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/checkpolicy/checkmodule.8 b/checkpolicy/checkmodule.8
index 70e67f1e..25801df0 100644
--- a/checkpolicy/checkmodule.8
+++ b/checkpolicy/checkmodule.8
@@ -67,6 +67,6 @@ SELinux Reference Policy documentation at https://github.com/SELinuxProject/refp
 
 .SH AUTHOR
 This manual page was copied from the checkpolicy man page 
-written by Arpad Magosanyi <mag@bunuel.tii.matav.hu>, 
+written by Árpád Magosányi <mag@bunuel.tii.matav.hu>, 
 and edited by Dan Walsh <dwalsh@redhat.com>.
 The program was written by Stephen Smalley <sds@tycho.nsa.gov>.
diff --git a/checkpolicy/checkpolicy.8 b/checkpolicy/checkpolicy.8
index 3d7c7539..f4e6fb24 100644
--- a/checkpolicy/checkpolicy.8
+++ b/checkpolicy/checkpolicy.8
@@ -67,6 +67,6 @@ SELinux Reference Policy documentation at https://github.com/SELinuxProject/refp
 
 
 .SH AUTHOR
-This manual page was written by Arpad Magosanyi <mag@bunuel.tii.matav.hu>,
+This manual page was written by Árpád Magosányi <mag@bunuel.tii.matav.hu>,
 and edited by Stephen Smalley <sds@tycho.nsa.gov>.
 The program was written by Stephen Smalley <sds@tycho.nsa.gov>.
diff --git a/checkpolicy/ru/checkmodule.8 b/checkpolicy/ru/checkmodule.8
index a1d687e3..7c279732 100644
--- a/checkpolicy/ru/checkmodule.8
+++ b/checkpolicy/ru/checkmodule.8
@@ -50,7 +50,7 @@ $ checkmodule \-M \-m httpd.te \-o httpd.mod
 
 
 .SH АВТОРЫ
-Эта страница руководства была скопирована со страницы руководства checkpolicy, написанной Arpad Magosanyi <mag@bunuel.tii.matav.hu>, 
+Эта страница руководства была скопирована со страницы руководства checkpolicy, написанной Árpád Magosányi <mag@bunuel.tii.matav.hu>, 
 и отредактирована Dan Walsh <dwalsh@redhat.com>.
 Программа была написана Stephen Smalley <sds@tycho.nsa.gov>.
-Перевод на русский язык выполнила Герасименко Олеся <gammaray@basealt.ru>.
+Перевод на русский язык выполнила Олеся Герасименко <gammaray@basealt.ru>.
diff --git a/checkpolicy/ru/checkpolicy.8 b/checkpolicy/ru/checkpolicy.8
index 25b0e555..f08d1dc9 100644
--- a/checkpolicy/ru/checkpolicy.8
+++ b/checkpolicy/ru/checkpolicy.8
@@ -54,7 +54,7 @@ checkpolicy \- компилятор политики SELinux
 Документация SELinux Reference Policy по адресу https://github.com/SELinuxProject/refpolicy/wiki
 
 .SH АВТОРЫ
-Эта страница руководства была написана Arpad Magosanyi <mag@bunuel.tii.matav.hu>,
+Эта страница руководства была написана Árpád Magosányi <mag@bunuel.tii.matav.hu>,
 и отредактирована Stephen Smalley <sds@tycho.nsa.gov>.
 Программа была написана Stephen Smalley <sds@tycho.nsa.gov>.
-Перевод на русский язык выполнила Герасименко Олеся <gammaray@basealt.ru>.
+Перевод на русский язык выполнила Олеся Герасименко <gammaray@basealt.ru>.
-- 
2.25.1

