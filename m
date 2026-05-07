Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DE23E6DE6
	for <spacemit@lists.linux.dev>; Thu,  7 May 2026 10:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149964; cv=none; b=uLWAo56WzTbFdNbvxtPanpnzqEF2pKFowQdNSbdONpWOiDoJ93ncTDGRi1wwTFywNeyfTLAmzWfVRdySXq//XTivYuJQriB1U/1FdFji20z5If7gohvdxyKNYepKJN/HidqNX1I4cZDY5pHlYsYXOt4LuzHaZvcYLW8bhbU3Z5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149964; c=relaxed/simple;
	bh=HevkQyYoy3kiO1VrBKioDTilzos+sth9T5xZNgNnIUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ch6hjakkA0X0lWoPcPs2Y28YvyBrYsVHnHoyX6PfzQmrU9zgDvbFKEy+6S0Tc6pdNkSRbXWv6FIZ+qCjCdL9G4Iv/U+0klBPz8751NEZP3C5swJh0HOFhkFDVVcL42LpaVMZDzsvfWZyz0QXRllL1T+X5sRc8aUIA+UmuYmcchc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=PNhSn0Ee; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="PNhSn0Ee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1778149922;
	bh=AA/l8RpNRgQWhJKMhQO6AtegRn3p6g7Rx5XU5wAB/G8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=PNhSn0Ee31tJ3uJ/xa6TiwTCkPGpFg1kxVZBxGr6sKsRaOzX5h755muva1OxuKJBc
	 qUaF6LLUldXE+PH8cip1ZVI3OCjvKiNv2xPYaKRLla9nh8H5LcdJ3PJ6aeytKJy8Vp
	 uriFXz/aVuEkTduVipO9Y7DiTWyOTalZcEc0gMYc=
X-QQ-mid: zesmtpgz1t1778149914t5eb95826
X-QQ-Originating-IP: q0iU5z36pYpAszH2oFPO8xEGSgQLaSK2gKm4e5W7naI=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 18:31:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5667795704540246135
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 07 May 2026 18:31:42 +0800
Subject: [PATCH v2 1/3] ASoC: soc-dai: add shared BCLK clock for cross-DAI
 rate constraints
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-i2s-same-blk-v2-1-ede05a22f732@linux.spacemit.com>
References: <20260507-i2s-same-blk-v2-0-ede05a22f732@linux.spacemit.com>
In-Reply-To: <20260507-i2s-same-blk-v2-0-ede05a22f732@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 jinmei.wei@spacemit.com, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778149908; l=3103;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=HevkQyYoy3kiO1VrBKioDTilzos+sth9T5xZNgNnIUQ=;
 b=1wBfk5r93og4rl4TtfoXHWvQGYLKZnrhFvSIKzGC1ey5HGqMKcv7LK7VfR0vrHYQZCaGTkoyK
 Wbc0o53lQPQDdzDPTZEDHUk3FMXDaSVGgmHrvxWQmT9XMc4oMxyeXgU
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N8edJDk+W1P1jwgUkHjUR7MXieo7dbpv+jDa6x/5xwbZRxnYW8c+lYNb
	A3Wx8VDtlm/v2J3fX3BXY3NLMJ5DybEIAaWO+66Lobw26SaczMqXBS5y00MKxzas9/34+qb
	D0V9jJJj5vfiiQr0G/r/c3Aj/mjzoD1KkcUxR2+x7nZFr5q1iixaWyOr1JufH8xoegTixh1
	XwyXEvav1u3tL/x74ooP5poxpvROkO9akfYGg89vno8MUz6aRavqaPbJ/FLTGTE8eSEFvO8
	XcHrCx1BSC6nnmIVSiXLoeLcv8AV9KO001qjRR7a2GGiGyQx3u2Zw68BWedMovmva6FFQqr
	YzielhbjmmRIlx44rKWWtR/eelVKXrCNlb6SlXZyLUFBagTSonvFc5570czfzv1JWsYDVOD
	OYyeHiBGqFo1avhXCyWfUSo/H3o0SntHzW4zC7ElgZ9xwdKoZuESuhSuT6ZrD4C/mq+504n
	4eoLIDKubW8dEAOa7PzixULGP+vkXEfUDXdm+QGaztx9FKIV+oG53ZC8gYCRzeFVpfEn7iB
	fsPvOJ2cPYGVUzEWVuZTZy4G0bZiXB0EoeLGEbH5zKC0U3n7OqKtueCORb2YebV2joHc0kj
	R/QJ1xRRy+G5R6YJEqMasrB+UvPSFIDfLJd+T9YjlOQYtlxSkVPAaQFnTrDbUoa6KHnMoGl
	oVNAwfNVfAT2rBsbmvmfcXnsgaGeB/uvtY6czzrRDQtvZelNSHjEUisNgEI/wQA3Hx5xMnq
	BEgDBPOsZyPDtPo3mdf/EDIeteFOeyWCN6iRfrVN1S4O6BQX+86I1tcntn+1L1UUJGFT72e
	4P+gWWNySM9lKh9oQ6Jp3sDIr0Li1p8uKmJweNt5sZALJpEd6q3aWxyv1QxkjiN22OXf/p7
	XCe5vJf6sF2PkFN/FxWHLojalAlEisjKlLx2FJBeElHvCsyOsrYj08NRcJpxLhQEEOM0FqI
	7yqZYyLqepnfJTMEAESHphV0Gk0zlaPqOjELAN/RG8UtJpAPUcf5PccMl3Qu+1uWeqbISt7
	P3ZBle8K8EguA3pJg0KcSWFtG1HYOYwqhNnaQ57mWBF8qcGo6tVbzDNIE/DSTBtsVeLfKjG
	UeAC4Be6GkB09+sanx5R+919zWXTOzgpfpaMkD6bZ87Uj9SHdPgSWCpF5Iwtmmk4FoRpLQJ
	CN7C
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Add a bclk field to struct snd_soc_dai and a helper function
snd_soc_dai_set_bclk_clk() that platform drivers can use to declare
which clock is their BCLK.

Also cache the bclk_ratio in snd_soc_dai_set_bclk_ratio() so that
the framework can use it later in hw_rule evaluation for TDM
configurations where BCLK = rate * slots * slot_width.

When multiple DAIs on the same card share the same physical BCLK
(detected via clk_is_match()), the ASoC core can automatically
constrain their hw_params so that the resulting BCLK rates are
compatible. This commit adds the data structure support; the actual
constraint logic follows in the next patch.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 include/sound/soc-dai.h |  7 +++++++
 sound/soc/soc-dai.c     | 18 ++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 6a42812bba8c..df010a91b350 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -17,6 +17,7 @@
 struct snd_pcm_substream;
 struct snd_soc_dapm_widget;
 struct snd_compr_stream;
+struct clk;
 
 /*
  * DAI hardware audio formats.
@@ -188,6 +189,8 @@ int snd_soc_dai_set_pll(struct snd_soc_dai *dai,
 
 int snd_soc_dai_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio);
 
+void snd_soc_dai_set_bclk_clk(struct snd_soc_dai *dai, struct clk *bclk);
+
 /* Digital Audio interface formatting */
 int snd_soc_dai_get_fmt_max_priority(const struct snd_soc_pcm_runtime *rtd);
 u64 snd_soc_dai_get_fmt(const struct snd_soc_dai *dai, int priority);
@@ -473,6 +476,10 @@ struct snd_soc_dai {
 	unsigned int symmetric_channels;
 	unsigned int symmetric_sample_bits;
 
+	/* shared BCLK clock for cross-DAI rate constraints */
+	struct clk *bclk;
+	unsigned int bclk_ratio; /* BCLK = rate * bclk_ratio (0 = use channels * sample_bits) */
+
 	/* parent platform/codec */
 	struct snd_soc_component *component;
 
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 2f370fda1266..1719ddcefa4b 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -116,10 +116,28 @@ int snd_soc_dai_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 	    dai->driver->ops->set_bclk_ratio)
 		ret = dai->driver->ops->set_bclk_ratio(dai, ratio);
 
+	if (!ret)
+		dai->bclk_ratio = ratio;
+
 	return soc_dai_ret(dai, ret);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_bclk_ratio);
 
+/**
+ * snd_soc_dai_set_bclk_clk - set the BCLK clock for shared clock detection
+ * @dai: DAI
+ * @bclk: BCLK clock pointer (or NULL to clear)
+ *
+ * When multiple DAIs share the same physical BCLK (detected via
+ * clk_is_match()), the ASoC core will automatically constrain their
+ * hw_params so that the resulting BCLK rates are compatible.
+ */
+void snd_soc_dai_set_bclk_clk(struct snd_soc_dai *dai, struct clk *bclk)
+{
+	dai->bclk = bclk;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_set_bclk_clk);
+
 int snd_soc_dai_get_fmt_max_priority(const struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *dai;

-- 
2.54.0

