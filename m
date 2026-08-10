Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F311B39A060
	for <spacemit@lists.linux.dev>; Mon, 10 Aug 2026 08:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786351675; cv=none; b=gr+hQMRAoFErz/NMVtCBZOQIdwxm1olMUwe8MxzmbnqwCZylEsv++s4VRRxBSz85hWMHA56fWCH28J4V3J9UzIhr+q9lnVX52WdMLrHenxOUCaLVOdEyiBK4+d3QVBZUvic5LIW1b6FFBEaiFCVDkLG5WbXoyjwo2HKGOAuk9bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786351675; c=relaxed/simple;
	bh=PS4d3vonY5cnWvEJCbFrwS8DUvEWQjBP1Nlfw0ZPQwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sqR6RGcqhg58X8Hf9UfmZ4ThcesLZswhSVKakCoJ+mAB1JsMBCjolF2jO8W9pCTd6uvxgtUOMaj8+OnqEeXQocIz+9mqFXDkCpCAAhoG6rYQ1CepddysdezJOjuGAJnsE9QO1/s7+7L+fKmR9UmdgMReVaGmi3/68qYH8f+xaX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=GKGbohTv; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="GKGbohTv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786351597;
	bh=M29CFWqH2OirKKpE7HnEh81ikMXn50dgrCAc8pjdIf4=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=GKGbohTv9NKy4H7Rx7yiYZ7CkI8c9XF6R7+iJgAEIotkViD/FCo0c6ttvsB5hZ8tJ
	 n7GhBRNasQgSmhKfssG4syLk1a4K2uMCsFjmxfgG0HjGdRwkX8Su03wtaFUwo31XOi
	 1uK/qvMekFLdLW0AXgVJDZAdA7nfGNBw93XxT0eM=
X-QQ-mid: zesmtpgz4t1786351589t253fc5a6
X-QQ-Originating-IP: 5bw4/46W/vAFFmQLjlD9b2QFb7W2rG/uBYflbHBWBgo=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 10 Aug 2026 16:46:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10674885904044503331
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 10 Aug 2026 16:46:24 +0800
Subject: [PATCH v2] clk: spacemit: k3: add 1.8 GHz PLL5 and PLL8 rates
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-k3-pll5-pll8-1800mhz-v2-1-aabff510a797@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf8XM2iFteVVX/odhUesoo7zSAkEJ/
 y7FuHNzk5Pce88MnhyTh+NuBkcje26bFdR+B7Y0zZ2QryuDEioTWih8xthVVRpCo9RC1OUbrZY
 6T40whySBddo5uvG03Z6LL/vh8iDbh6/QKNn3rXtt3lGG3k+R/FeMEgWa2OSpzjJLsTpV3AxT5
 DtjqeY+sm0NxbIsH03CIcvTAAAA
X-Change-ID: 20260802-k3-pll5-pll8-1800mhz-c81875a0a944
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2487;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=PS4d3vonY5cnWvEJCbFrwS8DUvEWQjBP1Nlfw0ZPQwA=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmV/Q85y7xOz+g7eSPiS8DlyZ5Nd5dWKvDzNTmdujw1X
 6Z+648rHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABNJ82VkeMTFomN41t6I9+Pl
 +ElMS+xvNKg9izw7u4H/yPVTzx6sDGNk+PA3niP5h6LiAq6qLXFTqp8+113q3bwx5dhHOdOb69Z
 WMAEA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MeYHCqcqpzbjRStQUqduFrKEn72gnnjlQ9EFROImFdlLFiLSSSH/vWq/
	jfYr7TwQOzWCQi4wE04Xm/z+aasCJziMwwUpeZ15txdbkcHy6nhYYHxnSwhdT+GqBx6xUzi
	IYyyR28pVhZqlIhxVBrI/fkW3vFWES8/0TQx5aphRe8zyA6h+r5X0ZNdGZ0mbUkkILq3R7L
	n4te9u7bBprpC7HScBNlVmZCumnzJPlX8unCSxh9rWLCBqouJLhnpsPwcIUE23bPW3rtYQO
	W670lgzKu8FfXA9eNE8y8ixeCh/sqQljlrLrsyPp07wPl9J3lBrYQtTrcVhPv6KYcVZcQeP
	X3nrMfQoObLlbSMUGiqQPYVzilJLT2qmOLvah30bcDCG0y2kNxjM/j7PYLHpi5t37odl7bd
	nVw9b/4N24VwpEjQ3Sv1oknzBdXJE8hWuahd/h0ynTtSFLPO4iBTY/HUgOeHc6sSIUQns2f
	y8XKE0WCTeGsZOevquegbHAn50hH1XnL012SeJP/pHp3v4HFAStdbOupPw/H8L5QyuQmuJe
	cagy8GH8eLGXxoHvMPfee1QihNnJ27CMJCzpZJM8GK9pXUQL7kKE1utmJ3Ajoc4FI2rKGXD
	+dIJWFxI+m3XbM74LjAYCiYTnlkX47WqfkiZcrUPLJn/prI4Iz5pHVSd4E5CU8lnrosAnpB
	F5eQxC2NPtv3b9EYqhUcenV6GHSUp4YJPT3rhdB0fk5oj3TLhLmcQPqeN6RseSnlb++ZK4l
	5yF9ZSpX5rNTAJSeFtg4IgB4lcxbH1bkQS7KeA3pzNfg/1k0r2MTZXmqDQFGf5H/QnzX5Ee
	sIzmP+G/OUg479ROyOmYWvxIcrSGUQAWxW67ghmdPMGlMpx+1Oq2R5GRAUARAav7ZcLGLUX
	qzrLlQqodpAhS6L7GjY8uaikymMuC/EEgtjkVKcrtUTnFmkj7AiULU10v2Gv63phnO2q1Yx
	LcUxVZjtLiutO3HWOSG+VaWnZ/o+4ZOdTQaP9vzqHL+GgBs4eMQivpMD9w3CCxQEJ6dOkjc
	ugFltk9d3jm3CGxL2OjNgmNtxbmHLl0wVTMnfZBO+EY5DKpTQPstAJLcnBT73SMML5B82yI
	sewpidQzqZqtjqkuhM2K0BOknjMe1ocjaWDPCjY6TMuu01PNhxAutr022GPN/Rfcbb1A/KQ
	dqJSyRGmW4HZtro=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

K3 boot firmware configures the C2 and C3 CPU clock domains at
1.8 GHz. PLL5 feeds C2 and PLL8 feeds C3, but their rate tables
currently contain only the 2 GHz overclocking operating point.

Add the nominal 1.8 GHz configuration as the first entry in both
tables. This lets determine_rate() and set_rate() select the firmware
operating point while retaining 2 GHz as a supported overclocking rate.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
The related U-Boot change is available at:
https://github.com/spacemit-com/uboot-2022.10/commit/fb95cf3d848b771c61b5a1b3e5cbbee223faf352
---
Changes in v2:
- Drop "clk: spacemit: re-enable PLLs after init"; the PLL init issue
  will be handled in a separate series.
- Send the K3 PLL5 and PLL8 1.8 GHz rate-table update as a standalone
  patch.
- Clarify that 1.8 GHz is nominal and 2 GHz is an overclocking rate.
- Link to v1: https://patch.msgid.link/20260804-k3-pll5-pll8-1800mhz-v1-0-a3a75866ce32@linux.spacemit.com

To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
To: Yixun Lan <dlan@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/spacemit/ccu-k3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index cb0c4277f72a..e8b7ce89c2cb 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -38,6 +38,7 @@ static const struct ccu_pll_rate_tbl pll4_rate_tbl[] = {
 };
 
 static const struct ccu_pll_rate_tbl pll5_rate_tbl[] = {
+	CCU_PLLA_RATE(1800000000UL, 0x0b4b0000, 0x00000000, 0xa0458585),
 	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
 };
 
@@ -50,6 +51,7 @@ static const struct ccu_pll_rate_tbl pll7_rate_tbl[] = {
 };
 
 static const struct ccu_pll_rate_tbl pll8_rate_tbl[] = {
+	CCU_PLLA_RATE(1800000000UL, 0x0b4b0000, 0x00000000, 0xa0458585),
 	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
 };
 

---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260802-k3-pll5-pll8-1800mhz-c81875a0a944

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

