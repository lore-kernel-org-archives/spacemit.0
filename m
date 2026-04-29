Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FECF381AE4
	for <spacemit@lists.linux.dev>; Wed, 29 Apr 2026 09:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453306; cv=none; b=SYNLpYYUuTDHArQKVxOovHSibhw8PgEV0oU6t0R1hlMgzEZQisdfj4z/WjCZcJHTybCKrSJc2wfU+F+uiRvFqiQxhvCE0fVO4+BNUSi8LZxNJWmAChFoxt2yTtwb1rulGbyDwJ8I+uPJDbhlI7w+HeETa+aHp5PFqBI0/hSK+9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453306; c=relaxed/simple;
	bh=eAOCn8t3y4a8isApCxHiYqSR+fK5XKtYspJVmy3GquQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VuVhm5Lzf5MTcMpXmliayz8rH7u2YeB12I0/VqFL8TqUdCPVfk+T0r0NucjeVtwfpTmBQ/nc0Ij5kpCQjKuV2Lgc67UE+k9YEZRt6+5XiJK53xJDqECzxIQFMGzLu7Vnc7AdU2EzRPt3vQTS8w+gqGQMqq9Pal1epjf2SutOXgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=wr0V2bdQ; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="wr0V2bdQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777453258;
	bh=5hbBNXyz3ix3md8y0mu38ycuDHtRftKDniRKPAgPjQM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=wr0V2bdQ7/FLVeEedcVrhpus1iz9j8DSJR3P2AZLSeCrFAaFO43u7mGySj7ZOPWsd
	 Bn9jmrzH4a1Xt0rAdsedHIEl0EJZtf0KzCmaPXCcUjniB9sMU6gqpuKikdtPI+8IFT
	 9ESpoF8dBbRLyRu5EUGWRkzrJo0t8hmk7K3uSLuQ=
X-QQ-mid: zesmtpgz4t1777453249t984e47fe
X-QQ-Originating-IP: pEucucTvef8aPDvCE3KgxZBoR3hZDvm5CXh2YLLOWiE=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 17:00:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 926023287553214828
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 29 Apr 2026 17:00:50 +0800
Subject: [PATCH v2] ASoC: spacemit: fix RX DMA params not set when TX is
 running
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-k1-i2s-fix-v2-1-8d67835aaddc@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDEyNL3WxD3UyjYt20zArdlFQzg2QTM0PDZEMTJaCGgqJUoDDYsOhYCL+
 4NCkrNbkEZIJSbS0Ah468wW4AAAA=
X-Change-ID: 20260429-k1-i2s-fix-de60c4611c14
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777453250; l=1903;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=eAOCn8t3y4a8isApCxHiYqSR+fK5XKtYspJVmy3GquQ=;
 b=Vy6WZiz8bJMUqd9rKM5833CQlzF4sjRVemwqtDjhX3FbrYl+XOadkfNGqMERooDo1ivNhEk6R
 Ekl/ipCmWgLAbLbtn4q2IERKMwupOKPQ3k183KBUFNM41tAtX9y2vvS
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N1R/fLSnwNqMSix5Xgm6xjiJEFClwHohdjmLZyLAsUeaY29o3eJ0R+vl
	dWDn1a6BjFnER20QFsXFOs9n4N0Q1ssPvxebzlRJlV6tf1j2ZLgqLiaoke0/iQVd9vg4N4D
	gQElG7LlIds5mVIxwcu4vFDxpdriet6BbsLXVgqXRSmWtwN4nTrnU2K/DjihG2NB33qbZ3Z
	kBM9fAR+Lclg7CQYKkIlQAnPxmdI5Dj3IUz1p9CpQ71zy0ILRy5mPzPbvoP2sHaYZc4tU6r
	aHYhUM9ZltEup1SZk9YHtR53mh/tXydGUxz6bcHxzJUNpUbry+vUN9AdNS1vZJopQZ3k8d7
	k3Ndej2F6nCbOxHwXwXlpORnwIzPDYYmxexyfUc7C1jF0ZaMf+Dbpf/wY3LYgaGQQqPrWg2
	dE6MNPx8f7GEzPrMSaGf3tRLrMpqxfr4KMa2CLAQqhYh+MPUiNYZZKSS/4UaFxwqiEZyEyy
	H0qt7em4DVAOmyyno/DUflpxLKuiV6GVNNt1EP91NsRvU9RkOjzovVXkV+xRpOP/ahMJ/bs
	vMUubZUqWu7LpMPO12Tm08PM9SarxEGLfyqSZ3gAcBgWiqSOYEKh28c3dZh3hlTf7nu8Pbq
	a/OD83VSXWRaW3ThxnTjwaMDPe8YDGxGqvVVwQ2o555Nd9qVkgduQoHhsXTv3u8C8PdC6x1
	QcMypWipbsYrz7zR2zKhjxn9Ll2gHeRCQhF/INFD6cFwThEW1v1NAHhv1AwehSy6lkkK/gI
	ot75RxbLe1CUHVAtEVlwEP14P6hBol/icck1lqTmAyVgz1jpyUSR7xwwGHFXWCj45Ud5NMu
	RoESge66h0gXBfFT/gu5xB8J8P6YxDhPyCVE+aijFYqN7x6aAs6Sh+8acxD2xoo9vW4OgLL
	uddZ5i70AYJQFWPGYeC7Tt9fBLI2zwN1WgCxTUzSNQ5IbbRsF6saezJsHCjOn+rwn/SVGd3
	4VLCOrXDMGle6TQGwzVf4AH9EWVxS5uAd8kjd6HyRBk0l0nam4mbakBN7iWY/hOUDb9oRLR
	l7GGnYHGiEG6DI77hSVT2C2ueqAYyakuc70oXYGNkXF09BfGqSv7zxEy87+HM5xDMS5HAon
	/I0ncaVfqB9QgAlX1k9Ya0dOPWz8CrL7rxkyMDOLcxoP7QqW0s00fRpNsWH3J09f3v/fLu9
	CJSQ8xZf6g9AXpk=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

When TX is already running (SSCR_SSE is set), the hw_params callback
returns early before setting up DMA parameters for the RX stream. This
prevents the capture path from configuring its DMA data properly.

Move the SSCR_SSE check after DMA parameter setup and format
constraints, so both TX and RX streams get their DMA configuration
regardless of whether the hardware is already enabled. The early return
now only skips the register writes that would disrupt an active stream.

Fixes: fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changes in v2:
- Combine two consecutive SSCR reads into one
- Fix Fixes tag SHA1 to match the upstream commit
- Split from the original 7-patch series into a standalone fix
Link: https://lore.kernel.org/all/20260429-k3-i2s-v1-1-2fe99db11ecb@linux.spacemit.com/
---
 sound/soc/spacemit/k1_i2s.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 1cb99f1abc7c..dccf6dcb72b1 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -117,10 +117,6 @@ static int spacemit_i2s_hw_params(struct snd_pcm_substream *substream,
 	u32 val;
 	int ret;
 
-	val = readl(i2s->base + SSCR);
-	if (val & SSCR_SSE)
-		return 0;
-
 	dma_data = &i2s->playback_dma_data;
 
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
@@ -181,6 +177,9 @@ static int spacemit_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	val = readl(i2s->base + SSCR);
+	if (val & SSCR_SSE)
+		return 0;
+
 	val &= ~SSCR_DW_32BYTE;
 	val |= data_width;
 	writel(val, i2s->base + SSCR);

---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260429-k1-i2s-fix-de60c4611c14

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

