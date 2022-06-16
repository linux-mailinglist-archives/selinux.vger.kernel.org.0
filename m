Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5A3E54D997
	for <lists+selinux@lfdr.de>; Thu, 16 Jun 2022 07:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242913AbiFPFNg (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 16 Jun 2022 01:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiFPFNg (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 16 Jun 2022 01:13:36 -0400
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com [136.143.188.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6252B13DDF
        for <selinux@vger.kernel.org>; Wed, 15 Jun 2022 22:13:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655356412; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=D//SoCs10Kqc4b0CeaSN4CBbWxo1njtKFqExX6gHIPcwJHN42rAKK53ExldHihbpE4G9iLI3DG036eZiOOs415CdGDLBeUZ96DoJolWTjDn7Sb+tJRvwMUiZ15NP2VnrRkxOmbxbIWruBieENhNCpoNsQEVbJDbRlxuzzvii3Sg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1655356412; h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=7qyltt/G0cj1E1Qt0QZtftCNr3XBT+Glqm3YSsYdA74=; 
        b=dTGc7DvYSUjJoiowZ98gwXwdPVpoXKyAJ5GPGjtEpWZu3tNswrtaVg5XiBJx85w7WZAO4/rNzVgqTn/0HkBHkaofjyU1YExFc6lEZZZdu/P4nh4zcIdrRxZVShnLdBPncrBe/3I39KiOsDi3uwTIMAoLN0opVHNH1df2n5A9l2c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        spf=pass  smtp.mailfrom=business@elijahpepe.com;
        dmarc=pass header.from=<business@elijahpepe.com>
Received: from mail.zoho.com by mx.zohomail.com
        with SMTP id 1655356411806606.0242182896188; Wed, 15 Jun 2022 22:13:31 -0700 (PDT)
Date:   Wed, 15 Jun 2022 22:13:31 -0700
From:   Elijah Conners <business@elijahpepe.com>
To:     "selinux" <selinux@vger.kernel.org>
Message-ID: <1816aee4f80.1026d4b311254470.8507588530121880177@elijahpepe.com>
Subject: [PATCH] python: remove IOError in certain cases
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

In certain cases, IOError caused the much more general exception OSError
to be unreachable.

Signed-off-by: Elijah Conners <business@elijahpepe.com>
---
 python/semanage/semanage | 7 ++-----
 sandbox/sandbox          | 2 --
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/python/semanage/semanage b/python/semanage/semanage
index 1d828128..c7a35fe4 100644
--- a/python/semanage/semanage
+++ b/python/semanage/semanage
@@ -970,8 +970,8 @@ def do_parser():
         devnull = os.open(os.devnull, os.O_WRONLY)
         os.dup2(devnull, sys.stdout.fileno())
         sys.exit(1)
-    except IOError as e:
-        sys.stderr.write("%s: %s\n" % (e.__class__.__name__, str(e)))
+    except OSError as e:
+        sys.stderr.write("%s: %s\n" % (e.__class__.__name__, e.args[1]))
         sys.exit(1)
     except KeyboardInterrupt:
         sys.exit(0)
@@ -981,9 +981,6 @@ def do_parser():
     except KeyError as e:
         sys.stderr.write("%s: %s\n" % (e.__class__.__name__, e.args[0]))
         sys.exit(1)
-    except OSError as e:
-        sys.stderr.write("%s: %s\n" % (e.__class__.__name__, e.args[1]))
-        sys.exit(1)
     except RuntimeError as e:
         sys.stderr.write("%s: %s\n" % (e.__class__.__name__, e.args[0]))
         sys.exit(1)
diff --git a/sandbox/sandbox b/sandbox/sandbox
index cd5709fb..1c9379ef 100644
--- a/sandbox/sandbox
+++ b/sandbox/sandbox
@@ -533,8 +533,6 @@ if __name__ == '__main__':
         error_exit(error.args[0])
     except KeyError as error:
         error_exit(_("Invalid value %s") % error.args[0])
-    except IOError as error:
-        error_exit(error)
     except KeyboardInterrupt:
         rc = 0
 
-- 
2.29.2.windows.2
